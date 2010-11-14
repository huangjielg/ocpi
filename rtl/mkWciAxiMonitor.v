//
// Generated by Bluespec Compiler, version 2010.10.beta1 (build 22431, 2010-10-28)
//
// On Sun Nov 14 13:38:26 EST 2010
//
//
// Ports:
// Name                         I/O  size props
// wciO0_Clk                      I     1 unused
// wciO0_MReset_n                 I     1 unused
// wciO0_AWADDR                   I    32 unused
// wciO0_AWPROT                   I     3 unused
// wciO0_WDATA                    I    32 unused
// wciO0_WSTRB                    I     4 unused
// wciO0_BRESP                    I     2 unused
// wciO0_ARADDR                   I    32 unused
// wciO0_ARPROT                   I     3 unused
// wciO0_RDATA                    I    32 unused
// wciO0_RRESP                    I     2 unused
// wciO0_AWVALID                  I     1 unused
// wciO0_AWREADY                  I     1 unused
// wciO0_WVALID                   I     1 unused
// wciO0_WREADY                   I     1 unused
// wciO0_BVALID                   I     1 unused
// wciO0_BREADY                   I     1 unused
// wciO0_ARVALID                  I     1 unused
// wciO0_ARREADY                  I     1 unused
// EN_wciO0_sRVALID               I     1 unused
// wciO0_RREADY                   I     1 unused
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkWciAxiMonitor(wciO0_Clk,
		       wciO0_MReset_n,

		       wciO0_AWVALID,

		       wciO0_AWREADY,

		       wciO0_AWADDR,

		       wciO0_AWPROT,

		       wciO0_WVALID,

		       wciO0_WREADY,

		       wciO0_WDATA,

		       wciO0_WSTRB,

		       wciO0_BVALID,

		       wciO0_BREADY,

		       wciO0_BRESP,

		       wciO0_ARVALID,

		       wciO0_ARREADY,

		       wciO0_ARADDR,

		       wciO0_ARPROT,

		       EN_wciO0_sRVALID,

		       wciO0_RREADY,

		       wciO0_RDATA,

		       wciO0_RRESP);
  input  wciO0_Clk;
  input  wciO0_MReset_n;

  // action method wciO0_mAWVALID
  input  wciO0_AWVALID;

  // action method wciO0_sAWREADY
  input  wciO0_AWREADY;

  // action method wciO0_mAWADDR
  input  [31 : 0] wciO0_AWADDR;

  // action method wciO0_mAWPROT
  input  [2 : 0] wciO0_AWPROT;

  // action method wciO0_mWVALID
  input  wciO0_WVALID;

  // action method wciO0_sWREADY
  input  wciO0_WREADY;

  // action method wciO0_mWDATA
  input  [31 : 0] wciO0_WDATA;

  // action method wciO0_mWSTRB
  input  [3 : 0] wciO0_WSTRB;

  // action method wciO0_sBVALID
  input  wciO0_BVALID;

  // action method wciO0_mBREADY
  input  wciO0_BREADY;

  // action method wciO0_sBRESP
  input  [1 : 0] wciO0_BRESP;

  // action method wciO0_mARVALID
  input  wciO0_ARVALID;

  // action method wciO0_sARREADY
  input  wciO0_ARREADY;

  // action method wciO0_mARADDR
  input  [31 : 0] wciO0_ARADDR;

  // action method wciO0_mARPROT
  input  [2 : 0] wciO0_ARPROT;

  // action method wciO0_sRVALID
  input  EN_wciO0_sRVALID;

  // action method wciO0_mRREADY
  input  wciO0_RREADY;

  // action method wciO0_sRDATA
  input  [31 : 0] wciO0_RDATA;

  // action method wciO0_sRRESP
  input  [1 : 0] wciO0_RRESP;

  // rule scheduling signals
  wire CAN_FIRE_wciO0_mARADDR,
       CAN_FIRE_wciO0_mARPROT,
       CAN_FIRE_wciO0_mARVALID,
       CAN_FIRE_wciO0_mAWADDR,
       CAN_FIRE_wciO0_mAWPROT,
       CAN_FIRE_wciO0_mAWVALID,
       CAN_FIRE_wciO0_mBREADY,
       CAN_FIRE_wciO0_mRREADY,
       CAN_FIRE_wciO0_mWDATA,
       CAN_FIRE_wciO0_mWSTRB,
       CAN_FIRE_wciO0_mWVALID,
       CAN_FIRE_wciO0_sARREADY,
       CAN_FIRE_wciO0_sAWREADY,
       CAN_FIRE_wciO0_sBRESP,
       CAN_FIRE_wciO0_sBVALID,
       CAN_FIRE_wciO0_sRDATA,
       CAN_FIRE_wciO0_sRRESP,
       CAN_FIRE_wciO0_sRVALID,
       CAN_FIRE_wciO0_sWREADY,
       WILL_FIRE_wciO0_mARADDR,
       WILL_FIRE_wciO0_mARPROT,
       WILL_FIRE_wciO0_mARVALID,
       WILL_FIRE_wciO0_mAWADDR,
       WILL_FIRE_wciO0_mAWPROT,
       WILL_FIRE_wciO0_mAWVALID,
       WILL_FIRE_wciO0_mBREADY,
       WILL_FIRE_wciO0_mRREADY,
       WILL_FIRE_wciO0_mWDATA,
       WILL_FIRE_wciO0_mWSTRB,
       WILL_FIRE_wciO0_mWVALID,
       WILL_FIRE_wciO0_sARREADY,
       WILL_FIRE_wciO0_sAWREADY,
       WILL_FIRE_wciO0_sBRESP,
       WILL_FIRE_wciO0_sBVALID,
       WILL_FIRE_wciO0_sRDATA,
       WILL_FIRE_wciO0_sRRESP,
       WILL_FIRE_wciO0_sRVALID,
       WILL_FIRE_wciO0_sWREADY;

  // action method wciO0_mAWVALID
  assign CAN_FIRE_wciO0_mAWVALID = 1'd1 ;
  assign WILL_FIRE_wciO0_mAWVALID = wciO0_AWVALID ;

  // action method wciO0_sAWREADY
  assign CAN_FIRE_wciO0_sAWREADY = 1'd1 ;
  assign WILL_FIRE_wciO0_sAWREADY = wciO0_AWREADY ;

  // action method wciO0_mAWADDR
  assign CAN_FIRE_wciO0_mAWADDR = 1'd1 ;
  assign WILL_FIRE_wciO0_mAWADDR = 1'd1 ;

  // action method wciO0_mAWPROT
  assign CAN_FIRE_wciO0_mAWPROT = 1'd1 ;
  assign WILL_FIRE_wciO0_mAWPROT = 1'd1 ;

  // action method wciO0_mWVALID
  assign CAN_FIRE_wciO0_mWVALID = 1'd1 ;
  assign WILL_FIRE_wciO0_mWVALID = wciO0_WVALID ;

  // action method wciO0_sWREADY
  assign CAN_FIRE_wciO0_sWREADY = 1'd1 ;
  assign WILL_FIRE_wciO0_sWREADY = wciO0_WREADY ;

  // action method wciO0_mWDATA
  assign CAN_FIRE_wciO0_mWDATA = 1'd1 ;
  assign WILL_FIRE_wciO0_mWDATA = 1'd1 ;

  // action method wciO0_mWSTRB
  assign CAN_FIRE_wciO0_mWSTRB = 1'd1 ;
  assign WILL_FIRE_wciO0_mWSTRB = 1'd1 ;

  // action method wciO0_sBVALID
  assign CAN_FIRE_wciO0_sBVALID = 1'd1 ;
  assign WILL_FIRE_wciO0_sBVALID = wciO0_BVALID ;

  // action method wciO0_mBREADY
  assign CAN_FIRE_wciO0_mBREADY = 1'd1 ;
  assign WILL_FIRE_wciO0_mBREADY = wciO0_BREADY ;

  // action method wciO0_sBRESP
  assign CAN_FIRE_wciO0_sBRESP = 1'd1 ;
  assign WILL_FIRE_wciO0_sBRESP = 1'd1 ;

  // action method wciO0_mARVALID
  assign CAN_FIRE_wciO0_mARVALID = 1'd1 ;
  assign WILL_FIRE_wciO0_mARVALID = wciO0_ARVALID ;

  // action method wciO0_sARREADY
  assign CAN_FIRE_wciO0_sARREADY = 1'd1 ;
  assign WILL_FIRE_wciO0_sARREADY = wciO0_ARREADY ;

  // action method wciO0_mARADDR
  assign CAN_FIRE_wciO0_mARADDR = 1'd1 ;
  assign WILL_FIRE_wciO0_mARADDR = 1'd1 ;

  // action method wciO0_mARPROT
  assign CAN_FIRE_wciO0_mARPROT = 1'd1 ;
  assign WILL_FIRE_wciO0_mARPROT = 1'd1 ;

  // action method wciO0_sRVALID
  assign CAN_FIRE_wciO0_sRVALID = 1'd1 ;
  assign WILL_FIRE_wciO0_sRVALID = EN_wciO0_sRVALID ;

  // action method wciO0_mRREADY
  assign CAN_FIRE_wciO0_mRREADY = 1'd1 ;
  assign WILL_FIRE_wciO0_mRREADY = wciO0_RREADY ;

  // action method wciO0_sRDATA
  assign CAN_FIRE_wciO0_sRDATA = 1'd1 ;
  assign WILL_FIRE_wciO0_sRDATA = 1'd1 ;

  // action method wciO0_sRRESP
  assign CAN_FIRE_wciO0_sRRESP = 1'd1 ;
  assign WILL_FIRE_wciO0_sRRESP = 1'd1 ;
endmodule  // mkWciAxiMonitor

