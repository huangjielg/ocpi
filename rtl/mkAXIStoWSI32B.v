//
// Generated by Bluespec Compiler, version 2010.10.beta1 (build 22431, 2010-10-28)
//
// On Mon Feb  7 14:58:11 EST 2011
//
//
// Ports:
// Name                         I/O  size props
// axi_dat_TREADY                 O     1
// axi_len_TREADY                 O     1
// axi_spt_TREADY                 O     1
// axi_dpt_TREADY                 O     1
// axi_err_TREADY                 O     1
// wsi_MCmd                       O     3
// wsi_MReqLast                   O     1
// wsi_MBurstPrecise              O     1
// wsi_MBurstLength               O    12
// wsi_MData                      O   256 reg
// wsi_MByteEn                    O    32 reg
// wsi_MReqInfo                   O     8
// wsi_MReset_n                   O     1
// CLK                            I     1 clock
// RST_N                          I     1 reset
// axi_dat_TDATA                  I   256 reg
// axi_dat_TSTRB                  I    32 reg
// axi_len_TDATA                  I    16 reg
// axi_len_TSTRB                  I     2 reg
// axi_spt_TDATA                  I     8 reg
// axi_spt_TSTRB                  I     1 reg
// axi_dpt_TDATA                  I     8 reg
// axi_dpt_TSTRB                  I     1 reg
// axi_err_TDATA                  I     1 reg
// axi_dat_TVALID                 I     1
// axi_dat_TLAST                  I     1 reg
// axi_len_TVALID                 I     1
// axi_len_TLAST                  I     1 reg
// axi_spt_TVALID                 I     1
// axi_spt_TLAST                  I     1 reg
// axi_dpt_TVALID                 I     1
// axi_dpt_TLAST                  I     1 reg
// axi_err_TVALID                 I     1
// axi_err_TLAST                  I     1 reg
// wsi_SThreadBusy                I     1 reg
// wsi_SReset_n                   I     1 reg
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkAXIStoWSI32B(CLK,
		      RST_N,

		      axi_dat_TVALID,

		      axi_dat_TREADY,

		      axi_dat_TDATA,

		      axi_dat_TSTRB,

		      axi_dat_TLAST,

		      axi_len_TVALID,

		      axi_len_TREADY,

		      axi_len_TDATA,

		      axi_len_TSTRB,

		      axi_len_TLAST,

		      axi_spt_TVALID,

		      axi_spt_TREADY,

		      axi_spt_TDATA,

		      axi_spt_TSTRB,

		      axi_spt_TLAST,

		      axi_dpt_TVALID,

		      axi_dpt_TREADY,

		      axi_dpt_TDATA,

		      axi_dpt_TSTRB,

		      axi_dpt_TLAST,

		      axi_err_TVALID,

		      axi_err_TREADY,

		      axi_err_TDATA,

		      axi_err_TLAST,

		      wsi_MCmd,

		      wsi_MReqLast,

		      wsi_MBurstPrecise,

		      wsi_MBurstLength,

		      wsi_MData,

		      wsi_MByteEn,

		      wsi_MReqInfo,

		      wsi_SThreadBusy,

		      wsi_MReset_n,

		      wsi_SReset_n);
  input  CLK;
  input  RST_N;

  // action method axi_dat_mTVALID
  input  axi_dat_TVALID;

  // value method axi_dat_sTREADY
  output axi_dat_TREADY;

  // action method axi_dat_mTDATA
  input  [255 : 0] axi_dat_TDATA;

  // action method axi_dat_mTSTRB
  input  [31 : 0] axi_dat_TSTRB;

  // action method axi_dat_mTKEEP

  // action method axi_dat_mTLAST
  input  axi_dat_TLAST;

  // action method axi_len_mTVALID
  input  axi_len_TVALID;

  // value method axi_len_sTREADY
  output axi_len_TREADY;

  // action method axi_len_mTDATA
  input  [15 : 0] axi_len_TDATA;

  // action method axi_len_mTSTRB
  input  [1 : 0] axi_len_TSTRB;

  // action method axi_len_mTKEEP

  // action method axi_len_mTLAST
  input  axi_len_TLAST;

  // action method axi_spt_mTVALID
  input  axi_spt_TVALID;

  // value method axi_spt_sTREADY
  output axi_spt_TREADY;

  // action method axi_spt_mTDATA
  input  [7 : 0] axi_spt_TDATA;

  // action method axi_spt_mTSTRB
  input  axi_spt_TSTRB;

  // action method axi_spt_mTKEEP

  // action method axi_spt_mTLAST
  input  axi_spt_TLAST;

  // action method axi_dpt_mTVALID
  input  axi_dpt_TVALID;

  // value method axi_dpt_sTREADY
  output axi_dpt_TREADY;

  // action method axi_dpt_mTDATA
  input  [7 : 0] axi_dpt_TDATA;

  // action method axi_dpt_mTSTRB
  input  axi_dpt_TSTRB;

  // action method axi_dpt_mTKEEP

  // action method axi_dpt_mTLAST
  input  axi_dpt_TLAST;

  // action method axi_err_mTVALID
  input  axi_err_TVALID;

  // value method axi_err_sTREADY
  output axi_err_TREADY;

  // action method axi_err_mTDATA
  input  axi_err_TDATA;

  // action method axi_err_mTSTRB

  // action method axi_err_mTKEEP

  // action method axi_err_mTLAST
  input  axi_err_TLAST;

  // value method wsi_mCmd
  output [2 : 0] wsi_MCmd;

  // value method wsi_mReqLast
  output wsi_MReqLast;

  // value method wsi_mBurstPrecise
  output wsi_MBurstPrecise;

  // value method wsi_mBurstLength
  output [11 : 0] wsi_MBurstLength;

  // value method wsi_mData
  output [255 : 0] wsi_MData;

  // value method wsi_mByteEn
  output [31 : 0] wsi_MByteEn;

  // value method wsi_mReqInfo
  output [7 : 0] wsi_MReqInfo;

  // value method wsi_mDataInfo

  // action method wsi_sThreadBusy
  input  wsi_SThreadBusy;

  // value method wsi_mReset_n
  output wsi_MReset_n;

  // action method wsi_sReset_n
  input  wsi_SReset_n;

  // signals for module outputs
  wire [255 : 0] wsi_MData;
  wire [31 : 0] wsi_MByteEn;
  wire [11 : 0] wsi_MBurstLength;
  wire [7 : 0] wsi_MReqInfo;
  wire [2 : 0] wsi_MCmd;
  wire axi_dat_TREADY,
       axi_dpt_TREADY,
       axi_err_TREADY,
       axi_len_TREADY,
       axi_spt_TREADY,
       wsi_MBurstPrecise,
       wsi_MReqLast,
       wsi_MReset_n;

  // inlined wires
  wire [312 : 0] wsiM_reqFifo_x_wire$wget;
  wire [288 : 0] dat_data_wire$wget;
  wire [255 : 0] axiDat_Es_mTData_w$wget;
  wire [95 : 0] wsiM_extStatusW$wget;
  wire [31 : 0] axiDat_Es_mTStrb_w$wget;
  wire [18 : 0] len_data_wire$wget;
  wire [15 : 0] axiLen_Es_mTData_w$wget;
  wire [9 : 0] dpt_data_wire$wget, spt_data_wire$wget;
  wire [7 : 0] axiDpt_Es_mTData_w$wget, axiSpt_Es_mTData_w$wget;
  wire [1 : 0] axiLen_Es_mTStrb_w$wget, err_data_wire$wget;
  wire axiDat_Es_mTData_w$whas,
       axiDat_Es_mTKeep_w$whas,
       axiDat_Es_mTLast_w$wget,
       axiDat_Es_mTLast_w$whas,
       axiDat_Es_mTStrb_w$whas,
       axiDat_Es_mTVal_w$wget,
       axiDat_Es_mTVal_w$whas,
       axiDpt_Es_mTData_w$whas,
       axiDpt_Es_mTKeep_w$whas,
       axiDpt_Es_mTLast_w$wget,
       axiDpt_Es_mTLast_w$whas,
       axiDpt_Es_mTStrb_w$wget,
       axiDpt_Es_mTStrb_w$whas,
       axiDpt_Es_mTVal_w$wget,
       axiDpt_Es_mTVal_w$whas,
       axiErr_Es_mTData_w$wget,
       axiErr_Es_mTData_w$whas,
       axiErr_Es_mTKeep_w$whas,
       axiErr_Es_mTLast_w$wget,
       axiErr_Es_mTLast_w$whas,
       axiErr_Es_mTStrb_w$whas,
       axiErr_Es_mTVal_w$wget,
       axiErr_Es_mTVal_w$whas,
       axiLen_Es_mTData_w$whas,
       axiLen_Es_mTKeep_w$whas,
       axiLen_Es_mTLast_w$wget,
       axiLen_Es_mTLast_w$whas,
       axiLen_Es_mTStrb_w$whas,
       axiLen_Es_mTVal_w$wget,
       axiLen_Es_mTVal_w$whas,
       axiSpt_Es_mTData_w$whas,
       axiSpt_Es_mTKeep_w$whas,
       axiSpt_Es_mTLast_w$wget,
       axiSpt_Es_mTLast_w$whas,
       axiSpt_Es_mTStrb_w$wget,
       axiSpt_Es_mTStrb_w$whas,
       axiSpt_Es_mTVal_w$wget,
       axiSpt_Es_mTVal_w$whas,
       dat_enq_enq$whas,
       dat_enq_valid$whas,
       dpt_enq_enq$whas,
       dpt_enq_valid$whas,
       err_enq_enq$whas,
       err_enq_valid$whas,
       len_enq_enq$whas,
       len_enq_valid$whas,
       spt_enq_enq$whas,
       spt_enq_valid$whas,
       wsiM_operateD_1$wget,
       wsiM_operateD_1$whas,
       wsiM_peerIsReady_1$wget,
       wsiM_peerIsReady_1$whas,
       wsiM_reqFifo_dequeueing$whas,
       wsiM_reqFifo_enqueueing$whas,
       wsiM_reqFifo_x_wire$whas,
       wsiM_sThreadBusy_pw$whas;

  // register firstWord
  reg firstWord;
  wire firstWord$D_IN, firstWord$EN;

  // register wsiM_burstKind
  reg [1 : 0] wsiM_burstKind;
  wire [1 : 0] wsiM_burstKind$D_IN;
  wire wsiM_burstKind$EN;

  // register wsiM_errorSticky
  reg wsiM_errorSticky;
  wire wsiM_errorSticky$D_IN, wsiM_errorSticky$EN;

  // register wsiM_iMesgCount
  reg [31 : 0] wsiM_iMesgCount;
  wire [31 : 0] wsiM_iMesgCount$D_IN;
  wire wsiM_iMesgCount$EN;

  // register wsiM_operateD
  reg wsiM_operateD;
  wire wsiM_operateD$D_IN, wsiM_operateD$EN;

  // register wsiM_pMesgCount
  reg [31 : 0] wsiM_pMesgCount;
  wire [31 : 0] wsiM_pMesgCount$D_IN;
  wire wsiM_pMesgCount$EN;

  // register wsiM_peerIsReady
  reg wsiM_peerIsReady;
  wire wsiM_peerIsReady$D_IN, wsiM_peerIsReady$EN;

  // register wsiM_reqFifo_c_r
  reg [1 : 0] wsiM_reqFifo_c_r;
  wire [1 : 0] wsiM_reqFifo_c_r$D_IN;
  wire wsiM_reqFifo_c_r$EN;

  // register wsiM_reqFifo_q_0
  reg [312 : 0] wsiM_reqFifo_q_0;
  reg [312 : 0] wsiM_reqFifo_q_0$D_IN;
  wire wsiM_reqFifo_q_0$EN;

  // register wsiM_reqFifo_q_1
  reg [312 : 0] wsiM_reqFifo_q_1;
  reg [312 : 0] wsiM_reqFifo_q_1$D_IN;
  wire wsiM_reqFifo_q_1$EN;

  // register wsiM_sThreadBusy_d
  reg wsiM_sThreadBusy_d;
  wire wsiM_sThreadBusy_d$D_IN, wsiM_sThreadBusy_d$EN;

  // register wsiM_statusR
  reg [7 : 0] wsiM_statusR;
  wire [7 : 0] wsiM_statusR$D_IN;
  wire wsiM_statusR$EN;

  // register wsiM_tBusyCount
  reg [31 : 0] wsiM_tBusyCount;
  wire [31 : 0] wsiM_tBusyCount$D_IN;
  wire wsiM_tBusyCount$EN;

  // register wsiM_trafficSticky
  reg wsiM_trafficSticky;
  wire wsiM_trafficSticky$D_IN, wsiM_trafficSticky$EN;

  // ports of submodule dat_fifof
  wire [288 : 0] dat_fifof$D_IN, dat_fifof$D_OUT;
  wire dat_fifof$CLR,
       dat_fifof$DEQ,
       dat_fifof$EMPTY_N,
       dat_fifof$ENQ,
       dat_fifof$FULL_N;

  // ports of submodule dpt_fifof
  wire [9 : 0] dpt_fifof$D_IN;
  wire dpt_fifof$CLR,
       dpt_fifof$DEQ,
       dpt_fifof$EMPTY_N,
       dpt_fifof$ENQ,
       dpt_fifof$FULL_N;

  // ports of submodule err_fifof
  wire [1 : 0] err_fifof$D_IN;
  wire err_fifof$CLR, err_fifof$DEQ, err_fifof$ENQ, err_fifof$FULL_N;

  // ports of submodule len_fifof
  wire [18 : 0] len_fifof$D_IN;
  wire len_fifof$CLR,
       len_fifof$DEQ,
       len_fifof$EMPTY_N,
       len_fifof$ENQ,
       len_fifof$FULL_N;

  // ports of submodule spt_fifof
  wire [9 : 0] spt_fifof$D_IN, spt_fifof$D_OUT;
  wire spt_fifof$CLR,
       spt_fifof$DEQ,
       spt_fifof$EMPTY_N,
       spt_fifof$ENQ,
       spt_fifof$FULL_N;

  // ports of submodule wsiM_isReset
  wire wsiM_isReset$VAL;

  // rule scheduling signals
  wire WILL_FIRE_RL_advance_data,
       WILL_FIRE_RL_wsiM_reqFifo_both,
       WILL_FIRE_RL_wsiM_reqFifo_decCtr,
       WILL_FIRE_RL_wsiM_reqFifo_deq,
       WILL_FIRE_RL_wsiM_reqFifo_incCtr;

  // inputs to muxes for submodule ports
  wire [312 : 0] MUX_wsiM_reqFifo_q_0$write_1__VAL_1,
		 MUX_wsiM_reqFifo_q_0$write_1__VAL_2,
		 MUX_wsiM_reqFifo_q_1$write_1__VAL_1;
  wire [1 : 0] MUX_wsiM_reqFifo_c_r$write_1__VAL_1,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_2;
  wire MUX_wsiM_reqFifo_q_0$write_1__SEL_2,
       MUX_wsiM_reqFifo_q_1$write_1__SEL_2;

  // remaining internal signals
  wire [308 : 0] _0_CONCAT_IF_dat_fifof_first__19_BIT_0_20_THEN__ETC___d127;
  wire [11 : 0] x_burstLength__h4623;

  // value method axi_dat_sTREADY
  assign axi_dat_TREADY = dat_fifof$FULL_N ;

  // value method axi_len_sTREADY
  assign axi_len_TREADY = len_fifof$FULL_N ;

  // value method axi_spt_sTREADY
  assign axi_spt_TREADY = spt_fifof$FULL_N ;

  // value method axi_dpt_sTREADY
  assign axi_dpt_TREADY = dpt_fifof$FULL_N ;

  // value method axi_err_sTREADY
  assign axi_err_TREADY = err_fifof$FULL_N ;

  // value method wsi_mCmd
  assign wsi_MCmd = wsiM_sThreadBusy_d ? 3'd0 : wsiM_reqFifo_q_0[312:310] ;

  // value method wsi_mReqLast
  assign wsi_MReqLast = !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[309] ;

  // value method wsi_mBurstPrecise
  assign wsi_MBurstPrecise = !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[308] ;

  // value method wsi_mBurstLength
  assign wsi_MBurstLength =
	     wsiM_sThreadBusy_d ? 12'd0 : wsiM_reqFifo_q_0[307:296] ;

  // value method wsi_mData
  assign wsi_MData = wsiM_reqFifo_q_0[295:40] ;

  // value method wsi_mByteEn
  assign wsi_MByteEn = wsiM_reqFifo_q_0[39:8] ;

  // value method wsi_mReqInfo
  assign wsi_MReqInfo = wsiM_sThreadBusy_d ? 8'd0 : wsiM_reqFifo_q_0[7:0] ;

  // value method wsi_mReset_n
  assign wsi_MReset_n = !wsiM_isReset$VAL && wsiM_operateD ;

  // submodule dat_fifof
  FIFO2 #(.width(32'd289), .guarded(32'd1)) dat_fifof(.RST_N(RST_N),
						      .CLK(CLK),
						      .D_IN(dat_fifof$D_IN),
						      .ENQ(dat_fifof$ENQ),
						      .DEQ(dat_fifof$DEQ),
						      .CLR(dat_fifof$CLR),
						      .D_OUT(dat_fifof$D_OUT),
						      .FULL_N(dat_fifof$FULL_N),
						      .EMPTY_N(dat_fifof$EMPTY_N));

  // submodule dpt_fifof
  FIFO2 #(.width(32'd10), .guarded(32'd1)) dpt_fifof(.RST_N(RST_N),
						     .CLK(CLK),
						     .D_IN(dpt_fifof$D_IN),
						     .ENQ(dpt_fifof$ENQ),
						     .DEQ(dpt_fifof$DEQ),
						     .CLR(dpt_fifof$CLR),
						     .D_OUT(),
						     .FULL_N(dpt_fifof$FULL_N),
						     .EMPTY_N(dpt_fifof$EMPTY_N));

  // submodule err_fifof
  FIFO2 #(.width(32'd2), .guarded(32'd1)) err_fifof(.RST_N(RST_N),
						    .CLK(CLK),
						    .D_IN(err_fifof$D_IN),
						    .ENQ(err_fifof$ENQ),
						    .DEQ(err_fifof$DEQ),
						    .CLR(err_fifof$CLR),
						    .D_OUT(),
						    .FULL_N(err_fifof$FULL_N),
						    .EMPTY_N());

  // submodule len_fifof
  FIFO2 #(.width(32'd19), .guarded(32'd1)) len_fifof(.RST_N(RST_N),
						     .CLK(CLK),
						     .D_IN(len_fifof$D_IN),
						     .ENQ(len_fifof$ENQ),
						     .DEQ(len_fifof$DEQ),
						     .CLR(len_fifof$CLR),
						     .D_OUT(),
						     .FULL_N(len_fifof$FULL_N),
						     .EMPTY_N(len_fifof$EMPTY_N));

  // submodule spt_fifof
  FIFO2 #(.width(32'd10), .guarded(32'd1)) spt_fifof(.RST_N(RST_N),
						     .CLK(CLK),
						     .D_IN(spt_fifof$D_IN),
						     .ENQ(spt_fifof$ENQ),
						     .DEQ(spt_fifof$DEQ),
						     .CLR(spt_fifof$CLR),
						     .D_OUT(spt_fifof$D_OUT),
						     .FULL_N(spt_fifof$FULL_N),
						     .EMPTY_N(spt_fifof$EMPTY_N));

  // submodule wsiM_isReset
  ResetToBool wsiM_isReset(.RST(RST_N), .VAL(wsiM_isReset$VAL));

  // rule RL_advance_data
  assign WILL_FIRE_RL_advance_data =
	     wsiM_reqFifo_c_r != 2'd2 && dat_fifof$EMPTY_N &&
	     (!firstWord ||
	      len_fifof$EMPTY_N && spt_fifof$EMPTY_N && dpt_fifof$EMPTY_N) ;

  // rule RL_wsiM_reqFifo_deq
  assign WILL_FIRE_RL_wsiM_reqFifo_deq =
	     wsiM_reqFifo_c_r != 2'd0 && !wsiM_sThreadBusy_d ;

  // rule RL_wsiM_reqFifo_incCtr
  assign WILL_FIRE_RL_wsiM_reqFifo_incCtr =
	     ((wsiM_reqFifo_c_r == 2'd0) ?
		WILL_FIRE_RL_advance_data :
		wsiM_reqFifo_c_r != 2'd1 || WILL_FIRE_RL_advance_data) &&
	     WILL_FIRE_RL_advance_data &&
	     !WILL_FIRE_RL_wsiM_reqFifo_deq ;

  // rule RL_wsiM_reqFifo_decCtr
  assign WILL_FIRE_RL_wsiM_reqFifo_decCtr =
	     WILL_FIRE_RL_wsiM_reqFifo_deq && !WILL_FIRE_RL_advance_data ;

  // rule RL_wsiM_reqFifo_both
  assign WILL_FIRE_RL_wsiM_reqFifo_both =
	     ((wsiM_reqFifo_c_r == 2'd1) ?
		WILL_FIRE_RL_advance_data :
		wsiM_reqFifo_c_r != 2'd2 || WILL_FIRE_RL_advance_data) &&
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     WILL_FIRE_RL_advance_data ;

  // inputs to muxes for submodule ports
  assign MUX_wsiM_reqFifo_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_1 = wsiM_reqFifo_c_r + 2'd1 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_2 = wsiM_reqFifo_c_r - 2'd1 ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_1 =
	     (wsiM_reqFifo_c_r == 2'd1) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_2 :
	       wsiM_reqFifo_q_1 ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_2 =
	     { 3'd1,
	       dat_fifof$D_OUT[0],
	       _0_CONCAT_IF_dat_fifof_first__19_BIT_0_20_THEN__ETC___d127 } ;
  assign MUX_wsiM_reqFifo_q_1$write_1__VAL_1 =
	     (wsiM_reqFifo_c_r == 2'd2) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_2 :
	       313'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00 ;

  // inlined wires
  assign wsiM_reqFifo_x_wire$wget = MUX_wsiM_reqFifo_q_0$write_1__VAL_2 ;
  assign wsiM_reqFifo_x_wire$whas = WILL_FIRE_RL_advance_data ;
  assign wsiM_operateD_1$wget = 1'd1 ;
  assign wsiM_operateD_1$whas = 1'd1 ;
  assign wsiM_peerIsReady_1$wget = 1'd1 ;
  assign wsiM_peerIsReady_1$whas = wsi_SReset_n ;
  assign axiDat_Es_mTVal_w$wget = 1'd1 ;
  assign axiDat_Es_mTVal_w$whas = axi_dat_TVALID ;
  assign axiDat_Es_mTLast_w$wget = 1'd1 ;
  assign axiDat_Es_mTLast_w$whas = axi_dat_TLAST ;
  assign axiDat_Es_mTData_w$wget = axi_dat_TDATA ;
  assign axiDat_Es_mTData_w$whas = 1'd1 ;
  assign axiDat_Es_mTStrb_w$wget = axi_dat_TSTRB ;
  assign axiDat_Es_mTStrb_w$whas = 1'd1 ;
  assign axiLen_Es_mTVal_w$wget = 1'd1 ;
  assign axiLen_Es_mTVal_w$whas = axi_len_TVALID ;
  assign axiLen_Es_mTLast_w$wget = 1'd1 ;
  assign axiLen_Es_mTLast_w$whas = axi_len_TLAST ;
  assign axiLen_Es_mTData_w$wget = axi_len_TDATA ;
  assign axiLen_Es_mTData_w$whas = 1'd1 ;
  assign axiLen_Es_mTStrb_w$wget = axi_len_TSTRB ;
  assign axiLen_Es_mTStrb_w$whas = 1'd1 ;
  assign axiSpt_Es_mTVal_w$wget = 1'd1 ;
  assign axiSpt_Es_mTVal_w$whas = axi_spt_TVALID ;
  assign axiSpt_Es_mTLast_w$wget = 1'd1 ;
  assign axiSpt_Es_mTLast_w$whas = axi_spt_TLAST ;
  assign axiSpt_Es_mTData_w$wget = axi_spt_TDATA ;
  assign axiSpt_Es_mTData_w$whas = 1'd1 ;
  assign axiSpt_Es_mTStrb_w$wget = axi_spt_TSTRB ;
  assign axiSpt_Es_mTStrb_w$whas = 1'd1 ;
  assign axiDpt_Es_mTVal_w$wget = 1'd1 ;
  assign axiDpt_Es_mTVal_w$whas = axi_dpt_TVALID ;
  assign axiDpt_Es_mTLast_w$wget = 1'd1 ;
  assign axiDpt_Es_mTLast_w$whas = axi_dpt_TLAST ;
  assign axiDpt_Es_mTData_w$wget = axi_dpt_TDATA ;
  assign axiDpt_Es_mTData_w$whas = 1'd1 ;
  assign axiDpt_Es_mTStrb_w$wget = axi_dpt_TSTRB ;
  assign axiDpt_Es_mTStrb_w$whas = 1'd1 ;
  assign axiErr_Es_mTVal_w$wget = 1'd1 ;
  assign axiErr_Es_mTVal_w$whas = axi_err_TVALID ;
  assign axiErr_Es_mTLast_w$wget = 1'd1 ;
  assign axiErr_Es_mTLast_w$whas = axi_err_TLAST ;
  assign axiErr_Es_mTData_w$wget = axi_err_TDATA ;
  assign axiErr_Es_mTData_w$whas = 1'd1 ;
  assign dat_enq_valid$whas = axi_dat_TVALID ;
  assign dat_enq_enq$whas = 1'b0 ;
  assign len_enq_valid$whas = axi_len_TVALID ;
  assign len_enq_enq$whas = 1'b0 ;
  assign spt_enq_valid$whas = axi_spt_TVALID ;
  assign spt_enq_enq$whas = 1'b0 ;
  assign dpt_enq_valid$whas = axi_dpt_TVALID ;
  assign dpt_enq_enq$whas = 1'b0 ;
  assign err_enq_valid$whas = axi_err_TVALID ;
  assign err_enq_enq$whas = 1'b0 ;
  assign wsiM_reqFifo_enqueueing$whas = WILL_FIRE_RL_advance_data ;
  assign wsiM_reqFifo_dequeueing$whas = WILL_FIRE_RL_wsiM_reqFifo_deq ;
  assign wsiM_sThreadBusy_pw$whas = wsi_SThreadBusy ;
  assign axiDat_Es_mTKeep_w$whas = 1'd1 ;
  assign axiLen_Es_mTKeep_w$whas = 1'd1 ;
  assign axiSpt_Es_mTKeep_w$whas = 1'd1 ;
  assign axiDpt_Es_mTKeep_w$whas = 1'd1 ;
  assign axiErr_Es_mTStrb_w$whas = 1'd1 ;
  assign axiErr_Es_mTKeep_w$whas = 1'd1 ;
  assign dat_data_wire$wget =
	     { axi_dat_TDATA, axi_dat_TSTRB, axi_dat_TLAST } ;
  assign len_data_wire$wget =
	     { axi_len_TDATA, axi_len_TSTRB, axi_len_TLAST } ;
  assign spt_data_wire$wget =
	     { axi_spt_TDATA, axi_spt_TSTRB, axi_spt_TLAST } ;
  assign dpt_data_wire$wget =
	     { axi_dpt_TDATA, axi_dpt_TSTRB, axi_dpt_TLAST } ;
  assign err_data_wire$wget = { axi_err_TDATA, axi_err_TLAST } ;
  assign wsiM_extStatusW$wget =
	     { wsiM_pMesgCount, wsiM_iMesgCount, wsiM_tBusyCount } ;

  // register firstWord
  assign firstWord$D_IN = dat_fifof$D_OUT[0] ;
  assign firstWord$EN = WILL_FIRE_RL_advance_data ;

  // register wsiM_burstKind
  assign wsiM_burstKind$D_IN =
	     (wsiM_burstKind == 2'd0) ?
	       (wsiM_reqFifo_q_0[308] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsiM_burstKind$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[312:310] == 3'd1 &&
	     (wsiM_burstKind == 2'd0 ||
	      (wsiM_burstKind == 2'd1 || wsiM_burstKind == 2'd2) &&
	      wsiM_reqFifo_q_0[309]) ;

  // register wsiM_errorSticky
  assign wsiM_errorSticky$D_IN = 1'b0 ;
  assign wsiM_errorSticky$EN = 1'b0 ;

  // register wsiM_iMesgCount
  assign wsiM_iMesgCount$D_IN = wsiM_iMesgCount + 32'd1 ;
  assign wsiM_iMesgCount$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[312:310] == 3'd1 &&
	     wsiM_burstKind == 2'd2 &&
	     wsiM_reqFifo_q_0[309] ;

  // register wsiM_operateD
  assign wsiM_operateD$D_IN = 1'b1 ;
  assign wsiM_operateD$EN = 1'd1 ;

  // register wsiM_pMesgCount
  assign wsiM_pMesgCount$D_IN = wsiM_pMesgCount + 32'd1 ;
  assign wsiM_pMesgCount$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[312:310] == 3'd1 &&
	     wsiM_burstKind == 2'd1 &&
	     wsiM_reqFifo_q_0[309] ;

  // register wsiM_peerIsReady
  assign wsiM_peerIsReady$D_IN = wsi_SReset_n ;
  assign wsiM_peerIsReady$EN = 1'd1 ;

  // register wsiM_reqFifo_c_r
  assign wsiM_reqFifo_c_r$D_IN =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr ?
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_1 :
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_2 ;
  assign wsiM_reqFifo_c_r$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;

  // register wsiM_reqFifo_q_0
  always@(WILL_FIRE_RL_wsiM_reqFifo_both or
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_1 or
	  MUX_wsiM_reqFifo_q_0$write_1__SEL_2 or
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wsiM_reqFifo_decCtr or wsiM_reqFifo_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wsiM_reqFifo_both:
	  wsiM_reqFifo_q_0$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_1;
      MUX_wsiM_reqFifo_q_0$write_1__SEL_2:
	  wsiM_reqFifo_q_0$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wsiM_reqFifo_decCtr:
	  wsiM_reqFifo_q_0$D_IN = wsiM_reqFifo_q_1;
      default: wsiM_reqFifo_q_0$D_IN =
		   313'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsiM_reqFifo_q_0$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_both ||
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;

  // register wsiM_reqFifo_q_1
  always@(WILL_FIRE_RL_wsiM_reqFifo_both or
	  MUX_wsiM_reqFifo_q_1$write_1__VAL_1 or
	  MUX_wsiM_reqFifo_q_1$write_1__SEL_2 or
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wsiM_reqFifo_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wsiM_reqFifo_both:
	  wsiM_reqFifo_q_1$D_IN = MUX_wsiM_reqFifo_q_1$write_1__VAL_1;
      MUX_wsiM_reqFifo_q_1$write_1__SEL_2:
	  wsiM_reqFifo_q_1$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wsiM_reqFifo_decCtr:
	  wsiM_reqFifo_q_1$D_IN =
	      313'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00;
      default: wsiM_reqFifo_q_1$D_IN =
		   313'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsiM_reqFifo_q_1$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_both ||
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;

  // register wsiM_sThreadBusy_d
  assign wsiM_sThreadBusy_d$D_IN = wsi_SThreadBusy ;
  assign wsiM_sThreadBusy_d$EN = 1'd1 ;

  // register wsiM_statusR
  assign wsiM_statusR$D_IN =
	     { wsiM_isReset$VAL,
	       !wsiM_peerIsReady,
	       !wsiM_operateD,
	       wsiM_errorSticky,
	       wsiM_burstKind != 2'd0,
	       wsiM_sThreadBusy_d,
	       1'd0,
	       wsiM_trafficSticky } ;
  assign wsiM_statusR$EN = 1'd1 ;

  // register wsiM_tBusyCount
  assign wsiM_tBusyCount$D_IN = wsiM_tBusyCount + 32'd1 ;
  assign wsiM_tBusyCount$EN =
	     wsiM_operateD && wsiM_peerIsReady && wsiM_sThreadBusy_d ;

  // register wsiM_trafficSticky
  assign wsiM_trafficSticky$D_IN = 1'd1 ;
  assign wsiM_trafficSticky$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[312:310] == 3'd1 ;

  // submodule dat_fifof
  assign dat_fifof$D_IN = dat_data_wire$wget ;
  assign dat_fifof$ENQ = dat_fifof$FULL_N && axi_dat_TVALID ;
  assign dat_fifof$DEQ = WILL_FIRE_RL_advance_data ;
  assign dat_fifof$CLR = 1'b0 ;

  // submodule dpt_fifof
  assign dpt_fifof$D_IN = dpt_data_wire$wget ;
  assign dpt_fifof$ENQ = dpt_fifof$FULL_N && axi_dpt_TVALID ;
  assign dpt_fifof$DEQ = WILL_FIRE_RL_advance_data && firstWord ;
  assign dpt_fifof$CLR = 1'b0 ;

  // submodule err_fifof
  assign err_fifof$D_IN = err_data_wire$wget ;
  assign err_fifof$ENQ = err_fifof$FULL_N && axi_err_TVALID ;
  assign err_fifof$DEQ = 1'b0 ;
  assign err_fifof$CLR = 1'b0 ;

  // submodule len_fifof
  assign len_fifof$D_IN = len_data_wire$wget ;
  assign len_fifof$ENQ = len_fifof$FULL_N && axi_len_TVALID ;
  assign len_fifof$DEQ = WILL_FIRE_RL_advance_data && firstWord ;
  assign len_fifof$CLR = 1'b0 ;

  // submodule spt_fifof
  assign spt_fifof$D_IN = spt_data_wire$wget ;
  assign spt_fifof$ENQ = spt_fifof$FULL_N && axi_spt_TVALID ;
  assign spt_fifof$DEQ = WILL_FIRE_RL_advance_data && firstWord ;
  assign spt_fifof$CLR = 1'b0 ;

  // remaining internal signals
  assign _0_CONCAT_IF_dat_fifof_first__19_BIT_0_20_THEN__ETC___d127 =
	     { 1'd0,
	       x_burstLength__h4623,
	       dat_fifof$D_OUT[288:1],
	       firstWord ? spt_fifof$D_OUT[9:2] : 8'd0 } ;
  assign x_burstLength__h4623 = dat_fifof$D_OUT[0] ? 12'd1 : 12'd4095 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        firstWord <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wsiM_burstKind <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsiM_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiM_iMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiM_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiM_pMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiM_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiM_reqFifo_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsiM_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY
	    313'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00;
	wsiM_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY
	    313'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00;
	wsiM_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wsiM_tBusyCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiM_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (firstWord$EN) firstWord <= `BSV_ASSIGNMENT_DELAY firstWord$D_IN;
	if (wsiM_burstKind$EN)
	  wsiM_burstKind <= `BSV_ASSIGNMENT_DELAY wsiM_burstKind$D_IN;
	if (wsiM_errorSticky$EN)
	  wsiM_errorSticky <= `BSV_ASSIGNMENT_DELAY wsiM_errorSticky$D_IN;
	if (wsiM_iMesgCount$EN)
	  wsiM_iMesgCount <= `BSV_ASSIGNMENT_DELAY wsiM_iMesgCount$D_IN;
	if (wsiM_operateD$EN)
	  wsiM_operateD <= `BSV_ASSIGNMENT_DELAY wsiM_operateD$D_IN;
	if (wsiM_pMesgCount$EN)
	  wsiM_pMesgCount <= `BSV_ASSIGNMENT_DELAY wsiM_pMesgCount$D_IN;
	if (wsiM_peerIsReady$EN)
	  wsiM_peerIsReady <= `BSV_ASSIGNMENT_DELAY wsiM_peerIsReady$D_IN;
	if (wsiM_reqFifo_c_r$EN)
	  wsiM_reqFifo_c_r <= `BSV_ASSIGNMENT_DELAY wsiM_reqFifo_c_r$D_IN;
	if (wsiM_reqFifo_q_0$EN)
	  wsiM_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY wsiM_reqFifo_q_0$D_IN;
	if (wsiM_reqFifo_q_1$EN)
	  wsiM_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY wsiM_reqFifo_q_1$D_IN;
	if (wsiM_sThreadBusy_d$EN)
	  wsiM_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY wsiM_sThreadBusy_d$D_IN;
	if (wsiM_tBusyCount$EN)
	  wsiM_tBusyCount <= `BSV_ASSIGNMENT_DELAY wsiM_tBusyCount$D_IN;
	if (wsiM_trafficSticky$EN)
	  wsiM_trafficSticky <= `BSV_ASSIGNMENT_DELAY wsiM_trafficSticky$D_IN;
      end
    if (wsiM_statusR$EN)
      wsiM_statusR <= `BSV_ASSIGNMENT_DELAY wsiM_statusR$D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    firstWord = 1'h0;
    wsiM_burstKind = 2'h2;
    wsiM_errorSticky = 1'h0;
    wsiM_iMesgCount = 32'hAAAAAAAA;
    wsiM_operateD = 1'h0;
    wsiM_pMesgCount = 32'hAAAAAAAA;
    wsiM_peerIsReady = 1'h0;
    wsiM_reqFifo_c_r = 2'h2;
    wsiM_reqFifo_q_0 =
	313'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wsiM_reqFifo_q_1 =
	313'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wsiM_sThreadBusy_d = 1'h0;
    wsiM_statusR = 8'hAA;
    wsiM_tBusyCount = 32'hAAAAAAAA;
    wsiM_trafficSticky = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkAXIStoWSI32B

