// tb200.v - A WCI::OCP test bench with BFM, DUT, and Monitor/Observer
// Copyright (c) 2010 Atomic Rules LLC - ALL RIGHTS RESERVED
//
// This testbench instances three components, and provides them with a common clock and reset
// These three components are connected together with the WCI0_ signal group
// 1. A BFM "Initiator" which initiates WCI cycles
// 2. A DUT "Taget" which completes WCI cycles
// 3. A Monitor/Observer which watches ober the WCI cycles

`timescale 1ns/1ps

module tb200 ();

  reg CLK;    // System Clock
  reg RST_N;  // System Reset (active-low)

  always begin  // Clock generation...
    #5; CLK = 1'b0;
    #5; CLK = 1'b1;
  end

  initial begin: initblock
    integer i;
    localparam resetCycles = 16; 
    #0 RST_N = 1'b0; $display("[%0d] %m: System Reset Asserted, RST_N=0", $time);
    for (i=0;i<resetCycles;i=i+1) @(posedge CLK);
    #0 RST_N = 1'b1; $display("[%0d] %m: System Reset Released, RST_N=1", $time);
  end

  // WCI0_ WCI::OCP Wires to interconnect the BFM, DUT and Monitor...
  wire        WCI0_Clk = CLK;  // Connect system clock to be the clock of the WCI0 M/S/O link
  wire        WCI0_MReset_n;
  wire [2:0]  WCI0_MCmd;
  wire        WCI0_MAddrSpace;
  wire [3:0]  WCI0_MByteEn;
  wire [19:0] WCI0_MAddr;
  wire [31:0] WCI0_MData;
  wire [1:0]  WCI0_SResp;
  wire [31:0] WCI0_SData;
  wire        WCI0_SThreadBusy;
  wire [1:0]  WCI0_SFlag;
  wire [1:0]  WCI0_MFlag;


  mkWciOcpInitiator bfm (                     // Instance the BFM Initiator...
    .CLK                  (CLK),
    .RST_N                (RST_N),
//  .wciM0_Clk            (WCI0_Clk),
    .RST_N_wciM0          (WCI0_MReset_n),    // WCI0_MReset_n is the reset source for this WCI0 link
    .wciM0_MCmd           (WCI0_MCmd),
    .wciM0_MAddrSpace     (WCI0_MAddrSpace),
    .wciM0_MByteEn        (WCI0_MByteEn),
    .wciM0_MAddr          (WCI0_MAddr),
    .wciM0_MData          (WCI0_MData),
    .wciM0_SResp          (WCI0_SResp),
    .wciM0_SData          (WCI0_SData),
    .wciM0_SThreadBusy    (WCI0_SThreadBusy),
    .wciM0_SFlag          (WCI0_SFlag),
    .wciM0_MFlag          (WCI0_MFlag)
  );

  mkWciOcpTarget wut (                        // Instance the "Worker Under Test" (WUT) target
    .wciS0_Clk            (WCI0_Clk),
    .wciS0_MReset_n       (WCI0_MReset_n),
    .wciS0_MCmd           (WCI0_MCmd),
    .wciS0_MAddrSpace     (WCI0_MAddrSpace),
    .wciS0_MByteEn        (WCI0_MByteEn),
    .wciS0_MAddr          (WCI0_MAddr),
    .wciS0_MData          (WCI0_MData),
    .wciS0_SResp          (WCI0_SResp),
    .wciS0_SData          (WCI0_SData),
    .wciS0_SThreadBusy    (WCI0_SThreadBusy),
    .wciS0_SFlag          (WCI0_SFlag),
    .wciS0_MFlag          (WCI0_MFlag)
  );

  mkWciOcpMonitor mon (                      // Instance the Monitor/Observer...
    .CLK                  (CLK),
    .RST_N                (RST_N),
    .CLK_wci_clk          (WCI0_Clk),
    .RST_N_wci_rstn       (WCI0_MReset_n),
    .wciO0_MCmd           (WCI0_MCmd),
    .wciO0_MAddrSpace     (WCI0_MAddrSpace),
    .wciO0_MByteEn        (WCI0_MByteEn),
    .wciO0_MAddr          (WCI0_MAddr),
    .wciO0_MData          (WCI0_MData),
    .wciO0_SResp          (WCI0_SResp),
    .wciO0_SData          (WCI0_SData),
    .wciO0_SThreadBusy    (WCI0_SThreadBusy),
    .wciO0_SFlag          (WCI0_SFlag),
    .wciO0_MFlag          (WCI0_MFlag)
  );

endmodule
