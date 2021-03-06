// PSD.bsv - Power Spectral Density 
// Copyright (c) 2010 Atomic Rules LLC - ALL RIGHTS RESERVED

/*

This Module-Worker implements a Power Spectal Density (PSD) function.
Assumptions:
 A1. Input Samples presented two 16b samples per cycle at nominally 125 MHz (250 MSPS)
 A2. Fixed 4K (2^12) Transform Buffer Size
 A3. FPGA Vendor supplied Forward FFT Core Wrapped, pipelined, streaming, nominally 125MHz*2 = 250 MHz Core Clock
 A4: Fixed Power Vector Frame Averaging of N=4

Cascade of Operations:

1. Precise Frame Formatting, WsiToPrecise (4K sample 2-buffer)
  Format an imprecise-burst of time-domain samples from a prior stage into a precisely-sized message buffer.
  This is done as a processing convienience using a 2-buffered BRAM. One buffer may be written while the other
  is read. The utility is that the read side logic can be sure all 4K samples may be read at once, without interruption.

2. Windowing of Time-Domain Data 
  Prior to the forward FFT, the real input data is windowed with a raised-cosine (Hamming) function to balance spectral
  leakage against sensitivity in the finite length transform to follow. The windowing implementation typically is
  multiplying two adjacent time samples per clock cycle. 2 x 125 = 250 MSPS

3. Gear Shift 125MHz to 250 MHz
  Two samples per cycle at 125 MHz are converted to One sample per cycle at 250 MHz

4. 4K Streaming, Pipelined, Forward FFT, Natural Ordered Output
  Implemented by wrapping a FPGA Vendor Core (eg fft-v5-4k-stream-natural) Core operates at 250 MHz nominal.
  The output of the FFT core is a naturally ordered (F-bin 0, 1, 2, ..., 4095) vector of fixed-point complex numbers.

5. Magnitude Approximation
  The magnitude of each complex number is approximated by folding all data into the first-quadrant |i|+|q| and then using 
  a technique described by Lyons to estimate magnitude to within 1 dB. The input to this stage are 250 MSPS complex numbers; 
  the output are 250 MSPS unsigned magnitudes. Each vector of 4096 magnitudes is termed a "Power Vector Frame".

6. Power Vector Frame Averaging
  Each Power Vector Frame is added into a power vector frame accumulator until the four frames have been accumulated. Then
  the result is shifted down by two to yield a N=4 Power Vector Frame Average. This is implemented at 250 MHz.

7. Output Formating
  The PSD Output is then a 8KB message containing the 4096 16b unsigned entries of the N=4 averaged power vector frame.
  This step includes the Gear Shift from 16b 250 MHz (250 MSPS) to 32b 125 MHz (250 MSPS).

*/

import OCWip::*;
import FFT::*;
import WsiToPrecise::*;

import Alias::*;
import Complex::*;
import Connectable::*;
import FIFO::*;
import FIFOF::*;
import GetPut::*;


// Magnitude Approximations (as in Lyons)...

function UInt#(16) magApprox1(Complex#(UInt#(16)) c);   // |V| = Max + Min/2
  if (c.rel > c.img) return( c.rel   +  c.img/2);
  else               return( c.rel/2 +  c.img);
endfunction

function UInt#(16) magApprox2(Complex#(UInt#(16)) c);   // |V| = 15(Max + Min/2)/16
  let v = magApprox1(c);
  return( v - v/16);
endfunction


typedef enum {PsdPass, PsdPrecise, PsdFFT, PsdSpare} PSDMode deriving (Bits, Eq);  // PSD mode bits in psdCtrl[1:0]

interface PSDIfc;
  interface WciES                    wciS0;    // Worker Control and Configuration 
  interface Wsi_Es#(12,32,4,8,0)     wsiS0;    // WSI-S Stream Input
  interface Wsi_Em#(12,32,4,8,0)     wsiM0;    // WSI-M Stream Output
endinterface 

(* synthesize, default_clock_osc="wciS0_Clk", default_reset="wciS0_MReset_n" *)
module mkPSD#(parameter Bit#(32) psdCtrlInit, parameter Bool hasDebugLogic) (PSDIfc);

  WciESlaveIfc                       wci         <- mkWciESlave;
  WsiSlaveIfc #(12,32,4,8,0)         wsiS        <- mkWsiSlave;
  WsiToPreciseGPIfc#(1)              w2p         <- mkWsiToPreciseGP;
  WsiMasterIfc#(12,32,4,8,0)         wsiM        <- mkWsiMaster;
  Reg#(Bit#(32))                     psdCtrl     <- mkReg(psdCtrlInit);
  FFTIfc                             fft         <- mkFFT;
  Reg#(UInt#(16))                    unloadCnt   <- mkReg(0);
  FIFOF#(Bit#(32))                   xnF         <- mkFIFOF;
  Reg#(Bool)                         takeEven    <- mkReg(True); // start with 0
  Reg#(Bool)                         sendEven    <- mkReg(True); // start with 0
  Reg#(UInt#(16))                    evenMag     <- mkRegU;

  PSDMode pmod = unpack(psdCtrl[1:0]);
  Bool fromOffsetBin = unpack(psdCtrl[4]);

(* fire_when_enabled, no_implicit_conditions *)
rule operating_actions (wci.isOperating);
  wsiS.operate(); wsiM.operate(); w2p.operate();
endrule

//////////////////////////////////////////////////////// Pass
rule psdPass_bypass (wci.isOperating && pmod==PsdPass);
  WsiReq#(12,32,4,8,0) r <- wsiS.reqGet.get;
  wsiM.reqPut.put(r);
endrule

//////////////////////////////////////////////////////// Precise || FFT
rule psdPrecise_input (wci.isOperating && (pmod==PsdPrecise||pmod==PsdFFT));
  WsiReq#(12,32,4,8,0) r <- wsiS.reqGet.get;
  w2p.putWsi.put(r);
endrule

rule psdPrecise_output_bypassFFT (wci.isOperating && pmod==PsdPrecise);
  WsiReq#(12,32,4,8,0) r <- w2p.getWsi.get;
  wsiM.reqPut.put(r); // bypass the FFT
endrule

rule psdPrecise_output_feedFFT (wci.isOperating && pmod==PsdFFT);
  WsiReq#(12,32,4,8,0) r <- w2p.getWsi.get;
  xnF.enq(r.data);    // feed the FFT xnF
endrule

//////////////////////////////////////////////////////// FFT
rule psdFFT_doIngress (wci.isOperating && pmod==PsdFFT); // rule will fire 4K times per frame
  Bit#(32) d32   = xnF.first;
  Bit#(16) dReal = (takeEven) ? d32[15:0] : d32[31:16]; // little-endian: first, even sample at LS word
  if (fromOffsetBin) dReal[15] = ~dReal[15];            // If converting from Offset Binary, flip MSP to get 2's comp
  fft.putXn.put(Complex{rel:dReal, img:0});             // put 4K real time-domain samples
  if (!takeEven) xnF.deq;                               // only 2K DEQs per frame
  takeEven <= !takeEven;
endrule

rule psdFFT_doEgress (wci.isOperating && pmod==PsdFFT);
  Cmp16 xk  = fft.fifoXk.first;
  Int#(16) xkRel = unpack(xk.rel);                                 // Signed 16b I FFT Outout
  Int#(16) xkImg = unpack(xk.img);                                 // Signed 16b Q FFT Outout
  UInt#(16) absXkRel =  unpack(pack(abs(xkRel)));                  // take |i| and convert to UInt
  UInt#(16) absXkImg =  unpack(pack(abs(xkImg)));                  // take |q| and convert to UInt
  UInt#(16) mag = magApprox2(Complex{rel:absXkRel,img:absXkImg});  // pass the 1st quadrant to magApprox1
  Bool lastWord = (unloadCnt == 4095);                             // Hardcoded to 4K Transform
  if (sendEven) evenMag <= mag;                                    // stage and store for the next firing
  else begin
    wsiM.reqPut.put (WsiReq    {cmd  : WR ,
                             reqLast : lastWord,
                             reqInfo : 0,
                        burstPrecise : True,
                         burstLength : 2048, // 4B words =  8KB      Hardcoded to 4K Transform
                               data  : {pack(mag), pack(evenMag)},
                             byteEn  : '1,
                           dataInfo  : '0 });
  end
  fft.fifoXk.deq;                                                  // 4K FFT unloads
  sendEven <= !sendEven;
  unloadCnt <= (lastWord) ? 0 : unloadCnt + 1;
endrule



//
// WCI...
//

Bit#(32) psdStatus = extend({pack(hasDebugLogic)});

(* descending_urgency = "wci_wslv_ctl_op_complete, wci_wslv_ctl_op_start, wci_cfwr, wci_cfrd" *)
(* mutually_exclusive = "wci_cfwr, wci_cfrd, wci_ctrl_EiI, wci_ctrl_IsO, wci_ctrl_OrE" *)

rule wci_cfwr (wci.configWrite); // WCI Configuration Property Writes...
 let wciReq <- wci.reqGet.get;
   case (wciReq.addr) matches
     'h04 : psdCtrl <= unpack(wciReq.data);
   endcase
   //$display("[%0d]: %m: WCI CONFIG WRITE Addr:%0x BE:%0x Data:%0x", //$time, wciReq.addr, wciReq.byteEn, wciReq.data);
   wci.respPut.put(wciOKResponse); // write response
endrule

rule wci_cfrd (wci.configRead);  // WCI Configuration Property Reads...
 let wciReq <- wci.reqGet.get; Bit#(32) rdat = '0;
   case (wciReq.addr) matches
     'h00 : rdat = pack(psdStatus);
     'h04 : rdat = pack(psdCtrl);
     'h10 : rdat = !hasDebugLogic ? 0 : extend({pack(wsiS.status),pack(wsiM.status)});
     'h14 : rdat = !hasDebugLogic ? 0 : pack(wsiS.extStatus.pMesgCount);
     'h18 : rdat = !hasDebugLogic ? 0 : pack(wsiS.extStatus.iMesgCount);
     'h1C : rdat = !hasDebugLogic ? 0 : pack(wsiS.extStatus.tBusyCount);
     'h20 : rdat = !hasDebugLogic ? 0 : pack(wsiM.extStatus.pMesgCount);
     'h24 : rdat = !hasDebugLogic ? 0 : pack(wsiM.extStatus.iMesgCount);
     'h28 : rdat = !hasDebugLogic ? 0 : pack(wsiM.extStatus.tBusyCount);
     'h2C : rdat = !hasDebugLogic ? 0 : fft.fftFrameCounts;
   endcase
   //$display("[%0d]: %m: WCI CONFIG READ Addr:%0x BE:%0x Data:%0x", //$time, wciReq.addr, wciReq.byteEn, rdat);
   wci.respPut.put(WciResp{resp:DVA, data:rdat}); // read response
endrule

rule wci_ctrl_IsO (wci.ctlState==Initialized && wci.ctlOp==Start);
  wci.ctlAck;
  $display("[%0d]: %m: Starting PSD psdCtrl:%0x", $time, psdCtrl);
endrule

rule wci_ctrl_EiI (wci.ctlState==Exists && wci.ctlOp==Initialize); wci.ctlAck; endrule
rule wci_ctrl_OrE (wci.isOperating && wci.ctlOp==Release); wci.ctlAck; endrule

  Wsi_Es#(12,32,4,8,0)     wsi_Es    <- mkWsiStoES(wsiS.slv);

  interface wciS0  = wci.slv;
  interface wsiS0  = wsi_Es;
  interface wsiM0 = toWsiEM(wsiM.mas); 
endmodule

