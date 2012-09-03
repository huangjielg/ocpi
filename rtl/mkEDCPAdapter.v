//
// Generated by Bluespec Compiler, version 2012.01.A (build 26572, 2012-01-17)
//
// On Mon Sep  3 14:32:26 EDT 2012
//
//
// Ports:
// Name                         I/O  size props
// RDY_server_request_put         O     1 reg
// server_response_get            O    40
// RDY_server_response_get        O     1 reg
// client_request_get             O    59 reg
// RDY_client_request_get         O     1 reg
// RDY_client_response_put        O     1 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// server_request_put             I    40
// client_response_put            I    40 reg
// EN_server_request_put          I     1
// EN_client_response_put         I     1
// EN_server_response_get         I     1
// EN_client_request_get          I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkEDCPAdapter(CLK,
		     RST_N,

		     server_request_put,
		     EN_server_request_put,
		     RDY_server_request_put,

		     EN_server_response_get,
		     server_response_get,
		     RDY_server_response_get,

		     EN_client_request_get,
		     client_request_get,
		     RDY_client_request_get,

		     client_response_put,
		     EN_client_response_put,
		     RDY_client_response_put);
  input  CLK;
  input  RST_N;

  // action method server_request_put
  input  [39 : 0] server_request_put;
  input  EN_server_request_put;
  output RDY_server_request_put;

  // actionvalue method server_response_get
  input  EN_server_response_get;
  output [39 : 0] server_response_get;
  output RDY_server_response_get;

  // actionvalue method client_request_get
  input  EN_client_request_get;
  output [58 : 0] client_request_get;
  output RDY_client_request_get;

  // action method client_response_put
  input  [39 : 0] client_response_put;
  input  EN_client_response_put;
  output RDY_client_response_put;

  // signals for module outputs
  wire [58 : 0] client_request_get;
  wire [39 : 0] server_response_get;
  wire RDY_client_request_get,
       RDY_client_response_put,
       RDY_server_request_put,
       RDY_server_response_get;

  // register doInFlight
  reg doInFlight;
  wire doInFlight$D_IN, doInFlight$EN;

  // register lastResp
  reg [44 : 0] lastResp;
  wire [44 : 0] lastResp$D_IN;
  wire lastResp$EN;

  // register lastTag
  reg [8 : 0] lastTag;
  wire [8 : 0] lastTag$D_IN;
  wire lastTag$EN;

  // ports of submodule cpReqF
  wire [58 : 0] cpReqF$D_IN, cpReqF$D_OUT;
  wire cpReqF$CLR, cpReqF$DEQ, cpReqF$EMPTY_N, cpReqF$ENQ, cpReqF$FULL_N;

  // ports of submodule cpRespF
  wire [39 : 0] cpRespF$D_IN, cpRespF$D_OUT;
  wire cpRespF$CLR, cpRespF$DEQ, cpRespF$EMPTY_N, cpRespF$ENQ, cpRespF$FULL_N;

  // ports of submodule dcpReqF
  wire [78 : 0] dcpReqF$D_IN, dcpReqF$D_OUT;
  wire dcpReqF$CLR, dcpReqF$DEQ, dcpReqF$EMPTY_N, dcpReqF$ENQ;

  // ports of submodule dcpRespF
  wire [44 : 0] dcpRespF$D_IN;
  wire dcpRespF$CLR, dcpRespF$DEQ, dcpRespF$ENQ, dcpRespF$FULL_N;

  // ports of submodule ecpReqF
  wire [39 : 0] ecpReqF$D_IN, ecpReqF$D_OUT;
  wire ecpReqF$CLR, ecpReqF$DEQ, ecpReqF$EMPTY_N, ecpReqF$ENQ, ecpReqF$FULL_N;

  // ports of submodule ecpRespF
  wire [39 : 0] ecpRespF$D_IN, ecpRespF$D_OUT;
  wire ecpRespF$CLR,
       ecpRespF$DEQ,
       ecpRespF$EMPTY_N,
       ecpRespF$ENQ,
       ecpRespF$FULL_N;

  // rule scheduling signals
  wire WILL_FIRE_RL_cp_response, WILL_FIRE_RL_dcp_request;

  // inputs to muxes for submodule ports
  reg [44 : 0] MUX_dcpRespF$enq_1__VAL_1;
  wire [44 : 0] MUX_dcpRespF$enq_1__VAL_2;
  wire MUX_dcpRespF$enq_1__SEL_1, MUX_doInFlight$write_1__SEL_1;

  // remaining internal signals
  reg [1 : 0] CASE_ecpReqFD_OUT_BITS_19_TO_18_3_0_ecpReqFD_ETC__q11,
	      CASE_ecpReqFD_OUT_BITS_29_TO_28_3_0_ecpReqFD_ETC__q10,
	      CASE_ecpReqFD_OUT_BITS_39_TO_38_3_0_ecpReqFD_ETC__q9,
	      CASE_ecpReqFD_OUT_BITS_9_TO_8_3_0_ecpReqFD_O_ETC__q12,
	      CASE_ecpRespFD_OUT_BITS_19_TO_18_3_0_ecpRespF_ETC__q3,
	      CASE_ecpRespFD_OUT_BITS_29_TO_28_3_0_ecpRespF_ETC__q2,
	      CASE_ecpRespFD_OUT_BITS_39_TO_38_3_0_ecpRespF_ETC__q1,
	      CASE_ecpRespFD_OUT_BITS_9_TO_8_3_0_ecpRespFD_ETC__q4,
	      CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q7,
	      CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q6,
	      CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q5,
	      CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q8;
  wire IF_dcpReqF_first_BITS_78_TO_77_EQ_0_THEN_dcpRe_ETC___d35,
       IF_dcpReqF_first_BITS_78_TO_77_EQ_1_THEN_dcpRe_ETC___d33,
       dcpReqF_first_BITS_39_TO_32_EQ_IF_lastTag_BIT__ETC___d291,
       dcpReqF_first_BITS_71_TO_64_0_EQ_IF_lastTag_BI_ETC___d292,
       dcpReqF_first_BITS_78_TO_77_EQ_0_OR_dcpReqF_fi_ETC___d38,
       dcpReqF_first_BITS_78_TO_77_EQ_1_AND_NOT_dcpRe_ETC___d79;

  // action method server_request_put
  assign RDY_server_request_put = ecpReqF$FULL_N ;

  // actionvalue method server_response_get
  assign server_response_get =
	     { CASE_ecpRespFD_OUT_BITS_39_TO_38_3_0_ecpRespF_ETC__q1,
	       ecpRespF$D_OUT[37:30],
	       CASE_ecpRespFD_OUT_BITS_29_TO_28_3_0_ecpRespF_ETC__q2,
	       ecpRespF$D_OUT[27:20],
	       CASE_ecpRespFD_OUT_BITS_19_TO_18_3_0_ecpRespF_ETC__q3,
	       ecpRespF$D_OUT[17:10],
	       CASE_ecpRespFD_OUT_BITS_9_TO_8_3_0_ecpRespFD_ETC__q4,
	       ecpRespF$D_OUT[7:0] } ;
  assign RDY_server_response_get = ecpRespF$EMPTY_N ;

  // actionvalue method client_request_get
  assign client_request_get = cpReqF$D_OUT ;
  assign RDY_client_request_get = cpReqF$EMPTY_N ;

  // action method client_response_put
  assign RDY_client_response_put = cpRespF$FULL_N ;

  // submodule cpReqF
  FIFO2 #(.width(32'd59), .guarded(32'd1)) cpReqF(.RST_N(RST_N),
						  .CLK(CLK),
						  .D_IN(cpReqF$D_IN),
						  .ENQ(cpReqF$ENQ),
						  .DEQ(cpReqF$DEQ),
						  .CLR(cpReqF$CLR),
						  .D_OUT(cpReqF$D_OUT),
						  .FULL_N(cpReqF$FULL_N),
						  .EMPTY_N(cpReqF$EMPTY_N));

  // submodule cpRespF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) cpRespF(.RST_N(RST_N),
						   .CLK(CLK),
						   .D_IN(cpRespF$D_IN),
						   .ENQ(cpRespF$ENQ),
						   .DEQ(cpRespF$DEQ),
						   .CLR(cpRespF$CLR),
						   .D_OUT(cpRespF$D_OUT),
						   .FULL_N(cpRespF$FULL_N),
						   .EMPTY_N(cpRespF$EMPTY_N));

  // submodule dcpReqF
  FIFO2 #(.width(32'd79), .guarded(32'd1)) dcpReqF(.RST_N(RST_N),
						   .CLK(CLK),
						   .D_IN(dcpReqF$D_IN),
						   .ENQ(dcpReqF$ENQ),
						   .DEQ(dcpReqF$DEQ),
						   .CLR(dcpReqF$CLR),
						   .D_OUT(dcpReqF$D_OUT),
						   .FULL_N(),
						   .EMPTY_N(dcpReqF$EMPTY_N));

  // submodule dcpRespF
  FIFO2 #(.width(32'd45), .guarded(32'd1)) dcpRespF(.RST_N(RST_N),
						    .CLK(CLK),
						    .D_IN(dcpRespF$D_IN),
						    .ENQ(dcpRespF$ENQ),
						    .DEQ(dcpRespF$DEQ),
						    .CLR(dcpRespF$CLR),
						    .D_OUT(),
						    .FULL_N(dcpRespF$FULL_N),
						    .EMPTY_N());

  // submodule ecpReqF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) ecpReqF(.RST_N(RST_N),
						   .CLK(CLK),
						   .D_IN(ecpReqF$D_IN),
						   .ENQ(ecpReqF$ENQ),
						   .DEQ(ecpReqF$DEQ),
						   .CLR(ecpReqF$CLR),
						   .D_OUT(ecpReqF$D_OUT),
						   .FULL_N(ecpReqF$FULL_N),
						   .EMPTY_N(ecpReqF$EMPTY_N));

  // submodule ecpRespF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) ecpRespF(.RST_N(RST_N),
						    .CLK(CLK),
						    .D_IN(ecpRespF$D_IN),
						    .ENQ(ecpRespF$ENQ),
						    .DEQ(ecpRespF$DEQ),
						    .CLR(ecpRespF$CLR),
						    .D_OUT(ecpRespF$D_OUT),
						    .FULL_N(ecpRespF$FULL_N),
						    .EMPTY_N(ecpRespF$EMPTY_N));

  // rule RL_dcp_request
  assign WILL_FIRE_RL_dcp_request =
	     dcpReqF$EMPTY_N &&
	     IF_dcpReqF_first_BITS_78_TO_77_EQ_0_THEN_dcpRe_ETC___d35 ;

  // rule RL_cp_response
  assign WILL_FIRE_RL_cp_response =
	     dcpRespF$FULL_N && cpRespF$EMPTY_N && !WILL_FIRE_RL_dcp_request ;

  // inputs to muxes for submodule ports
  assign MUX_dcpRespF$enq_1__SEL_1 =
	     WILL_FIRE_RL_dcp_request &&
	     dcpReqF_first_BITS_78_TO_77_EQ_0_OR_dcpReqF_fi_ETC___d38 ;
  assign MUX_doInFlight$write_1__SEL_1 =
	     WILL_FIRE_RL_dcp_request &&
	     (dcpReqF$D_OUT[78:77] == 2'd0 && dcpReqF$D_OUT[40] ||
	      dcpReqF$D_OUT[78:77] != 2'd0 &&
	      (dcpReqF$D_OUT[78:77] == 2'd1 && dcpReqF$D_OUT[76] ||
	       dcpReqF$D_OUT[78:77] != 2'd1 && dcpReqF$D_OUT[44])) ;
  always@(dcpReqF$D_OUT or lastResp)
  begin
    case (dcpReqF$D_OUT[78:77])
      2'd0:
	  MUX_dcpRespF$enq_1__VAL_1 =
	      { 2'd0,
		dcpReqF$D_OUT[40],
		32'h40000001,
		dcpReqF$D_OUT[39:32],
		2'd0 };
      2'd1:
	  MUX_dcpRespF$enq_1__VAL_1 =
	      { dcpReqF$D_OUT[78:77],
		32'hAAAAAAAA,
		dcpReqF$D_OUT[76],
		dcpReqF$D_OUT[71:64],
		2'd0 };
      default: MUX_dcpRespF$enq_1__VAL_1 =
		   { (lastResp[44:43] == 2'd0 || lastResp[44:43] == 2'd1) ?
		       lastResp[44:43] :
		       2'd2,
		     lastResp[42:0] };
    endcase
  end
  assign MUX_dcpRespF$enq_1__VAL_2 =
	     { 2'd2,
	       doInFlight,
	       cpRespF$D_OUT[31:0],
	       cpRespF$D_OUT[39:32],
	       2'd0 } ;

  // register doInFlight
  assign doInFlight$D_IN = MUX_doInFlight$write_1__SEL_1 ;
  assign doInFlight$EN =
	     WILL_FIRE_RL_dcp_request &&
	     (dcpReqF$D_OUT[78:77] == 2'd0 && dcpReqF$D_OUT[40] ||
	      dcpReqF$D_OUT[78:77] != 2'd0 &&
	      (dcpReqF$D_OUT[78:77] == 2'd1 && dcpReqF$D_OUT[76] ||
	       dcpReqF$D_OUT[78:77] != 2'd1 && dcpReqF$D_OUT[44])) ||
	     WILL_FIRE_RL_cp_response ;

  // register lastResp
  assign lastResp$D_IN = MUX_dcpRespF$enq_1__VAL_2 ;
  assign lastResp$EN = WILL_FIRE_RL_cp_response && !doInFlight ;

  // register lastTag
  assign lastTag$D_IN =
	     { dcpReqF$D_OUT[78:77] != 2'd0,
	       (dcpReqF$D_OUT[78:77] == 2'd1) ?
		 dcpReqF$D_OUT[71:64] :
		 dcpReqF$D_OUT[39:32] } ;
  assign lastTag$EN =
	     WILL_FIRE_RL_dcp_request &&
	     (dcpReqF$D_OUT[78:77] == 2'd0 && !dcpReqF$D_OUT[40] ||
	      dcpReqF$D_OUT[78:77] != 2'd0 &&
	      (dcpReqF$D_OUT[78:77] == 2'd1 &&
	       (!dcpReqF_first_BITS_71_TO_64_0_EQ_IF_lastTag_BI_ETC___d292 ||
		!lastTag[8]) &&
	       !dcpReqF$D_OUT[76] ||
	       dcpReqF$D_OUT[78:77] != 2'd1 &&
	       (!dcpReqF_first_BITS_39_TO_32_EQ_IF_lastTag_BIT__ETC___d291 ||
		!lastTag[8]) &&
	       !dcpReqF$D_OUT[44])) ;

  // submodule cpReqF
  assign cpReqF$D_IN =
	     { dcpReqF$D_OUT[78:77] != 2'd1,
	       (dcpReqF$D_OUT[78:77] == 2'd1) ?
		 { dcpReqF$D_OUT[23:2],
		   dcpReqF$D_OUT[75:72],
		   dcpReqF$D_OUT[63:32] } :
		 { 24'hAAAAAA,
		   dcpReqF$D_OUT[39:32],
		   dcpReqF$D_OUT[23:2],
		   dcpReqF$D_OUT[43:40] } } ;
  assign cpReqF$ENQ =
	     WILL_FIRE_RL_dcp_request && dcpReqF$D_OUT[78:77] != 2'd0 &&
	     dcpReqF_first_BITS_78_TO_77_EQ_1_AND_NOT_dcpRe_ETC___d79 ;
  assign cpReqF$DEQ = EN_client_request_get ;
  assign cpReqF$CLR = 1'b0 ;

  // submodule cpRespF
  assign cpRespF$D_IN = client_response_put ;
  assign cpRespF$ENQ = EN_client_response_put ;
  assign cpRespF$DEQ = WILL_FIRE_RL_cp_response ;
  assign cpRespF$CLR = 1'b0 ;

  // submodule dcpReqF
  assign dcpReqF$D_IN = 79'h0 ;
  assign dcpReqF$ENQ = 1'b0 ;
  assign dcpReqF$DEQ = WILL_FIRE_RL_dcp_request ;
  assign dcpReqF$CLR = 1'b0 ;

  // submodule dcpRespF
  assign dcpRespF$D_IN =
	     MUX_dcpRespF$enq_1__SEL_1 ?
	       MUX_dcpRespF$enq_1__VAL_1 :
	       MUX_dcpRespF$enq_1__VAL_2 ;
  assign dcpRespF$ENQ =
	     WILL_FIRE_RL_dcp_request &&
	     dcpReqF_first_BITS_78_TO_77_EQ_0_OR_dcpReqF_fi_ETC___d38 ||
	     WILL_FIRE_RL_cp_response ;
  assign dcpRespF$DEQ = 1'b0 ;
  assign dcpRespF$CLR = 1'b0 ;

  // submodule ecpReqF
  assign ecpReqF$D_IN =
	     { CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q5,
	       server_request_put[37:30],
	       CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q6,
	       server_request_put[27:20],
	       CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q7,
	       server_request_put[17:10],
	       CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q8,
	       server_request_put[7:0] } ;
  assign ecpReqF$ENQ = EN_server_request_put ;
  assign ecpReqF$DEQ = ecpReqF$EMPTY_N && ecpRespF$FULL_N ;
  assign ecpReqF$CLR = 1'b0 ;

  // submodule ecpRespF
  assign ecpRespF$D_IN =
	     { CASE_ecpReqFD_OUT_BITS_39_TO_38_3_0_ecpReqFD_ETC__q9,
	       ecpReqF$D_OUT[37:30],
	       CASE_ecpReqFD_OUT_BITS_29_TO_28_3_0_ecpReqFD_ETC__q10,
	       ecpReqF$D_OUT[27:20],
	       CASE_ecpReqFD_OUT_BITS_19_TO_18_3_0_ecpReqFD_ETC__q11,
	       ecpReqF$D_OUT[17:10],
	       CASE_ecpReqFD_OUT_BITS_9_TO_8_3_0_ecpReqFD_O_ETC__q12,
	       ecpReqF$D_OUT[7:0] } ;
  assign ecpRespF$ENQ = ecpReqF$EMPTY_N && ecpRespF$FULL_N ;
  assign ecpRespF$DEQ = EN_server_response_get ;
  assign ecpRespF$CLR = 1'b0 ;

  // remaining internal signals
  assign IF_dcpReqF_first_BITS_78_TO_77_EQ_0_THEN_dcpRe_ETC___d35 =
	     (dcpReqF$D_OUT[78:77] == 2'd0) ?
	       dcpRespF$FULL_N :
	       (dcpReqF$D_OUT[78:77] == 2'd1 ||
		!dcpReqF_first_BITS_39_TO_32_EQ_IF_lastTag_BIT__ETC___d291 ||
		!lastTag[8] ||
		dcpReqF$D_OUT[44] ||
		dcpRespF$FULL_N) &&
	       IF_dcpReqF_first_BITS_78_TO_77_EQ_1_THEN_dcpRe_ETC___d33 ;
  assign IF_dcpReqF_first_BITS_78_TO_77_EQ_1_THEN_dcpRe_ETC___d33 =
	     (dcpReqF$D_OUT[78:77] == 2'd1) ?
	       dcpRespF$FULL_N &&
	       (dcpReqF_first_BITS_71_TO_64_0_EQ_IF_lastTag_BI_ETC___d292 &&
		lastTag[8] &&
		!dcpReqF$D_OUT[76] ||
		cpReqF$FULL_N) :
	       dcpReqF_first_BITS_39_TO_32_EQ_IF_lastTag_BIT__ETC___d291 &&
	       lastTag[8] &&
	       !dcpReqF$D_OUT[44] ||
	       cpReqF$FULL_N ;
  assign dcpReqF_first_BITS_39_TO_32_EQ_IF_lastTag_BIT__ETC___d291 =
	     dcpReqF$D_OUT[39:32] == lastTag[7:0] ;
  assign dcpReqF_first_BITS_71_TO_64_0_EQ_IF_lastTag_BI_ETC___d292 =
	     dcpReqF$D_OUT[71:64] == lastTag[7:0] ;
  assign dcpReqF_first_BITS_78_TO_77_EQ_0_OR_dcpReqF_fi_ETC___d38 =
	     dcpReqF$D_OUT[78:77] == 2'd0 || dcpReqF$D_OUT[78:77] == 2'd1 ||
	     dcpReqF_first_BITS_39_TO_32_EQ_IF_lastTag_BIT__ETC___d291 &&
	     lastTag[8] &&
	     !dcpReqF$D_OUT[44] ;
  assign dcpReqF_first_BITS_78_TO_77_EQ_1_AND_NOT_dcpRe_ETC___d79 =
	     dcpReqF$D_OUT[78:77] == 2'd1 &&
	     (!dcpReqF_first_BITS_71_TO_64_0_EQ_IF_lastTag_BI_ETC___d292 ||
	      !lastTag[8] ||
	      dcpReqF$D_OUT[76]) ||
	     dcpReqF$D_OUT[78:77] != 2'd1 &&
	     (!dcpReqF_first_BITS_39_TO_32_EQ_IF_lastTag_BIT__ETC___d291 ||
	      !lastTag[8] ||
	      dcpReqF$D_OUT[44]) ;
  always@(ecpRespF$D_OUT)
  begin
    case (ecpRespF$D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_ecpRespFD_OUT_BITS_39_TO_38_3_0_ecpRespF_ETC__q1 =
	      ecpRespF$D_OUT[39:38];
      2'd3: CASE_ecpRespFD_OUT_BITS_39_TO_38_3_0_ecpRespF_ETC__q1 = 2'd3;
    endcase
  end
  always@(ecpRespF$D_OUT)
  begin
    case (ecpRespF$D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_ecpRespFD_OUT_BITS_29_TO_28_3_0_ecpRespF_ETC__q2 =
	      ecpRespF$D_OUT[29:28];
      2'd3: CASE_ecpRespFD_OUT_BITS_29_TO_28_3_0_ecpRespF_ETC__q2 = 2'd3;
    endcase
  end
  always@(ecpRespF$D_OUT)
  begin
    case (ecpRespF$D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_ecpRespFD_OUT_BITS_19_TO_18_3_0_ecpRespF_ETC__q3 =
	      ecpRespF$D_OUT[19:18];
      2'd3: CASE_ecpRespFD_OUT_BITS_19_TO_18_3_0_ecpRespF_ETC__q3 = 2'd3;
    endcase
  end
  always@(ecpRespF$D_OUT)
  begin
    case (ecpRespF$D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_ecpRespFD_OUT_BITS_9_TO_8_3_0_ecpRespFD_ETC__q4 =
	      ecpRespF$D_OUT[9:8];
      2'd3: CASE_ecpRespFD_OUT_BITS_9_TO_8_3_0_ecpRespFD_ETC__q4 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q5 =
	      server_request_put[39:38];
      2'd3: CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q5 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q6 =
	      server_request_put[29:28];
      2'd3: CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q6 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q7 =
	      server_request_put[19:18];
      2'd3: CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q7 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q8 =
	      server_request_put[9:8];
      2'd3: CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q8 = 2'd3;
    endcase
  end
  always@(ecpReqF$D_OUT)
  begin
    case (ecpReqF$D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_ecpReqFD_OUT_BITS_39_TO_38_3_0_ecpReqFD_ETC__q9 =
	      ecpReqF$D_OUT[39:38];
      2'd3: CASE_ecpReqFD_OUT_BITS_39_TO_38_3_0_ecpReqFD_ETC__q9 = 2'd3;
    endcase
  end
  always@(ecpReqF$D_OUT)
  begin
    case (ecpReqF$D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_ecpReqFD_OUT_BITS_29_TO_28_3_0_ecpReqFD_ETC__q10 =
	      ecpReqF$D_OUT[29:28];
      2'd3: CASE_ecpReqFD_OUT_BITS_29_TO_28_3_0_ecpReqFD_ETC__q10 = 2'd3;
    endcase
  end
  always@(ecpReqF$D_OUT)
  begin
    case (ecpReqF$D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_ecpReqFD_OUT_BITS_19_TO_18_3_0_ecpReqFD_ETC__q11 =
	      ecpReqF$D_OUT[19:18];
      2'd3: CASE_ecpReqFD_OUT_BITS_19_TO_18_3_0_ecpReqFD_ETC__q11 = 2'd3;
    endcase
  end
  always@(ecpReqF$D_OUT)
  begin
    case (ecpReqF$D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_ecpReqFD_OUT_BITS_9_TO_8_3_0_ecpReqFD_O_ETC__q12 =
	      ecpReqF$D_OUT[9:8];
      2'd3: CASE_ecpReqFD_OUT_BITS_9_TO_8_3_0_ecpReqFD_O_ETC__q12 = 2'd3;
    endcase
  end

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        doInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lastTag <= `BSV_ASSIGNMENT_DELAY 9'd170;
      end
    else
      begin
        if (doInFlight$EN)
	  doInFlight <= `BSV_ASSIGNMENT_DELAY doInFlight$D_IN;
	if (lastTag$EN) lastTag <= `BSV_ASSIGNMENT_DELAY lastTag$D_IN;
      end
    if (lastResp$EN) lastResp <= `BSV_ASSIGNMENT_DELAY lastResp$D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    doInFlight = 1'h0;
    lastResp = 45'h0AAAAAAAAAAA;
    lastTag = 9'h0AA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkEDCPAdapter

