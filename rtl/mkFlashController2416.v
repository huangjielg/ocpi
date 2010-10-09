//
// Generated by Bluespec Compiler, version 2009.11.beta2 (build 18693, 2009-11-24)
//
// On Sat Oct  9 10:24:11 EDT 2010
//
//
// Ports:
// Name                         I/O  size props
// flash_addr                     O    24 reg
// flash_ce_n                     O     1
// flash_oe_n                     O     1
// flash_we_n                     O     1
// flash_wp_n                     O     1 const
// flash_rst_n                    O     1 const
// flash_adv_n                    O     1 const
// RDY_user_request_put           O     1
// user_response_get              O    16 reg
// RDY_user_response_get          O     1 reg
// user_waitBit                   O     1 reg
// RDY_user_waitBit               O     1 const
// CLK                            I     1 clock
// RST_N                          I     1 reset
// flash_fwait_i                  I     1 reg
// user_request_put               I    41 reg
// EN_user_request_put            I     1
// EN_user_response_get           I     1
// flash_io_dq                   IO    16 unused
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkFlashController2416(CLK,
			     RST_N,

			     .flash_io_dq(tsd$IO),

			     flash_addr,

			     flash_ce_n,

			     flash_oe_n,

			     flash_we_n,

			     flash_wp_n,

			     flash_rst_n,

			     flash_adv_n,

			     flash_fwait_i,

			     user_request_put,
			     EN_user_request_put,
			     RDY_user_request_put,

			     EN_user_response_get,
			     user_response_get,
			     RDY_user_response_get,

			     user_waitBit,
			     RDY_user_waitBit);
  input  CLK;
  input  RST_N;

  inout  [15 : 0] tsd$IO;

  // value method flash_addr
  output [23 : 0] flash_addr;

  // value method flash_ce_n
  output flash_ce_n;

  // value method flash_oe_n
  output flash_oe_n;

  // value method flash_we_n
  output flash_we_n;

  // value method flash_wp_n
  output flash_wp_n;

  // value method flash_rst_n
  output flash_rst_n;

  // value method flash_adv_n
  output flash_adv_n;

  // action method flash_fwait
  input  flash_fwait_i;

  // action method user_request_put
  input  [40 : 0] user_request_put;
  input  EN_user_request_put;
  output RDY_user_request_put;

  // actionvalue method user_response_get
  input  EN_user_response_get;
  output [15 : 0] user_response_get;
  output RDY_user_response_get;

  // value method user_waitBit
  output user_waitBit;
  output RDY_user_waitBit;

  // signals for module outputs
  wire [23 : 0] flash_addr;
  wire [15 : 0] user_response_get;
  wire RDY_user_request_put,
       RDY_user_response_get,
       RDY_user_waitBit,
       flash_adv_n,
       flash_ce_n,
       flash_oe_n,
       flash_rst_n,
       flash_we_n,
       flash_wp_n,
       user_waitBit;

  // inlined wires
  wire rseqFsm_abort$wget,
       rseqFsm_abort$whas,
       rseqFsm_pw_list$whas,
       rseqFsm_pw_list_1$whas,
       rseqFsm_pw_list_2$whas,
       rseqFsm_pw_list_3$whas,
       rseqFsm_pw_list_4$whas,
       rseqFsm_pw_list_5$whas,
       rseqFsm_pw_list_6$whas,
       rseqFsm_pw_list_7$whas,
       rseqFsm_pw_list_8$whas,
       rseqFsm_start_reg_1$wget,
       rseqFsm_start_reg_1$whas,
       rseqFsm_start_wire$wget,
       rseqFsm_start_wire$whas,
       rseqFsm_state_run_pw$whas,
       rseqFsm_state_start_pw$whas,
       wseqFsm_abort$wget,
       wseqFsm_abort$whas,
       wseqFsm_pw_list$whas,
       wseqFsm_pw_list_1$whas,
       wseqFsm_pw_list_2$whas,
       wseqFsm_pw_list_3$whas,
       wseqFsm_pw_list_4$whas,
       wseqFsm_pw_list_5$whas,
       wseqFsm_pw_list_6$whas,
       wseqFsm_pw_list_7$whas,
       wseqFsm_pw_list_8$whas,
       wseqFsm_pw_list_9$whas,
       wseqFsm_start_reg_1$wget,
       wseqFsm_start_reg_1$whas,
       wseqFsm_start_wire$wget,
       wseqFsm_start_wire$whas,
       wseqFsm_state_run_pw$whas,
       wseqFsm_state_start_pw$whas;

  // register aReg
  reg [23 : 0] aReg;
  wire [23 : 0] aReg$D_IN;
  wire aReg$EN;

  // register ceReg
  reg ceReg;
  wire ceReg$D_IN, ceReg$EN;

  // register isRead
  reg isRead;
  wire isRead$D_IN, isRead$EN;

  // register oeReg
  reg oeReg;
  wire oeReg$D_IN, oeReg$EN;

  // register rseqFsm_repeat_count
  reg [3 : 0] rseqFsm_repeat_count;
  wire [3 : 0] rseqFsm_repeat_count$D_IN;
  wire rseqFsm_repeat_count$EN;

  // register rseqFsm_start_reg
  reg rseqFsm_start_reg;
  wire rseqFsm_start_reg$D_IN, rseqFsm_start_reg$EN;

  // register rseqFsm_state_mkFSMstate
  reg [3 : 0] rseqFsm_state_mkFSMstate;
  reg [3 : 0] rseqFsm_state_mkFSMstate$D_IN;
  wire rseqFsm_state_mkFSMstate$EN;

  // register rseqFsm_state_standby
  reg rseqFsm_state_standby;
  wire rseqFsm_state_standby$D_IN, rseqFsm_state_standby$EN;

  // register tsOE
  reg tsOE;
  wire tsOE$D_IN, tsOE$EN;

  // register tsWD
  reg [15 : 0] tsWD;
  wire [15 : 0] tsWD$D_IN;
  wire tsWD$EN;

  // register waitReg
  reg waitReg;
  wire waitReg$D_IN, waitReg$EN;

  // register wdReg
  reg [15 : 0] wdReg;
  wire [15 : 0] wdReg$D_IN;
  wire wdReg$EN;

  // register weReg
  reg weReg;
  wire weReg$D_IN, weReg$EN;

  // register wseqFsm_repeat_count
  reg [3 : 0] wseqFsm_repeat_count;
  wire [3 : 0] wseqFsm_repeat_count$D_IN;
  wire wseqFsm_repeat_count$EN;

  // register wseqFsm_start_reg
  reg wseqFsm_start_reg;
  wire wseqFsm_start_reg$D_IN, wseqFsm_start_reg$EN;

  // register wseqFsm_state_mkFSMstate
  reg [3 : 0] wseqFsm_state_mkFSMstate;
  reg [3 : 0] wseqFsm_state_mkFSMstate$D_IN;
  wire wseqFsm_state_mkFSMstate$EN;

  // register wseqFsm_state_standby
  reg wseqFsm_state_standby;
  wire wseqFsm_state_standby$D_IN, wseqFsm_state_standby$EN;

  // ports of submodule reqF
  wire [40 : 0] reqF$D_IN, reqF$D_OUT;
  wire reqF$CLR, reqF$DEQ, reqF$EMPTY_N, reqF$ENQ, reqF$FULL_N;

  // ports of submodule respF
  wire [15 : 0] respF$D_IN, respF$D_OUT;
  wire respF$CLR, respF$DEQ, respF$EMPTY_N, respF$ENQ, respF$FULL_N;

  // ports of submodule tsd
  wire [15 : 0] tsd$IO, tsd$O;

  // rule scheduling signals
  wire CAN_FIRE_RL_nextRequest,
       CAN_FIRE_RL_rseqFsm_action_l56c15,
       CAN_FIRE_RL_rseqFsm_action_l57c12,
       CAN_FIRE_RL_rseqFsm_action_l58c12,
       CAN_FIRE_RL_rseqFsm_action_l60c10,
       CAN_FIRE_RL_rseqFsm_action_l61c12,
       CAN_FIRE_RL_rseqFsm_action_l62c12,
       CAN_FIRE_RL_rseqFsm_action_np,
       CAN_FIRE_RL_rseqFsm_actionof_l56c15,
       CAN_FIRE_RL_rseqFsm_actionof_l56c15_1,
       CAN_FIRE_RL_rseqFsm_actionof_l56c15_2,
       CAN_FIRE_RL_rseqFsm_actionof_l56c15_3,
       CAN_FIRE_RL_rseqFsm_actionof_l56c15_4,
       CAN_FIRE_RL_rseqFsm_actionof_l56c15_5,
       CAN_FIRE_RL_rseqFsm_actionof_l56c15_6,
       CAN_FIRE_RL_rseqFsm_actionof_l57c12,
       CAN_FIRE_RL_rseqFsm_actionof_l58c12,
       CAN_FIRE_RL_rseqFsm_actionof_l60c10,
       CAN_FIRE_RL_rseqFsm_actionof_l61c12,
       CAN_FIRE_RL_rseqFsm_actionof_l62c12,
       CAN_FIRE_RL_rseqFsm_actionof_np,
       CAN_FIRE_RL_rseqFsm_actionof_np_1,
       CAN_FIRE_RL_rseqFsm_fsm_start,
       CAN_FIRE_RL_rseqFsm_start_reg__dreg_update,
       CAN_FIRE_RL_rseqFsm_state_update_standby,
       CAN_FIRE_RL_wseqFsm_action_l66c15,
       CAN_FIRE_RL_wseqFsm_action_l67c12,
       CAN_FIRE_RL_wseqFsm_action_l68c12,
       CAN_FIRE_RL_wseqFsm_action_l69c12,
       CAN_FIRE_RL_wseqFsm_action_l71c12,
       CAN_FIRE_RL_wseqFsm_action_l72c12,
       CAN_FIRE_RL_wseqFsm_action_l73c12,
       CAN_FIRE_RL_wseqFsm_action_np,
       CAN_FIRE_RL_wseqFsm_actionof_l66c15,
       CAN_FIRE_RL_wseqFsm_actionof_l66c15_1,
       CAN_FIRE_RL_wseqFsm_actionof_l66c15_2,
       CAN_FIRE_RL_wseqFsm_actionof_l66c15_3,
       CAN_FIRE_RL_wseqFsm_actionof_l66c15_4,
       CAN_FIRE_RL_wseqFsm_actionof_l66c15_5,
       CAN_FIRE_RL_wseqFsm_actionof_l66c15_6,
       CAN_FIRE_RL_wseqFsm_actionof_l66c15_7,
       CAN_FIRE_RL_wseqFsm_actionof_l67c12,
       CAN_FIRE_RL_wseqFsm_actionof_l68c12,
       CAN_FIRE_RL_wseqFsm_actionof_l69c12,
       CAN_FIRE_RL_wseqFsm_actionof_l71c12,
       CAN_FIRE_RL_wseqFsm_actionof_l72c12,
       CAN_FIRE_RL_wseqFsm_actionof_l73c12,
       CAN_FIRE_RL_wseqFsm_actionof_np,
       CAN_FIRE_RL_wseqFsm_actionof_np_1,
       CAN_FIRE_RL_wseqFsm_fsm_start,
       CAN_FIRE_RL_wseqFsm_start_reg__dreg_update,
       CAN_FIRE_RL_wseqFsm_state_update_standby,
       CAN_FIRE_flash_fwait,
       CAN_FIRE_user_request_put,
       CAN_FIRE_user_response_get,
       WILL_FIRE_RL_nextRequest,
       WILL_FIRE_RL_rseqFsm_action_l56c15,
       WILL_FIRE_RL_rseqFsm_action_l57c12,
       WILL_FIRE_RL_rseqFsm_action_l58c12,
       WILL_FIRE_RL_rseqFsm_action_l60c10,
       WILL_FIRE_RL_rseqFsm_action_l61c12,
       WILL_FIRE_RL_rseqFsm_action_l62c12,
       WILL_FIRE_RL_rseqFsm_action_np,
       WILL_FIRE_RL_rseqFsm_actionof_l56c15,
       WILL_FIRE_RL_rseqFsm_actionof_l56c15_1,
       WILL_FIRE_RL_rseqFsm_actionof_l56c15_2,
       WILL_FIRE_RL_rseqFsm_actionof_l56c15_3,
       WILL_FIRE_RL_rseqFsm_actionof_l56c15_4,
       WILL_FIRE_RL_rseqFsm_actionof_l56c15_5,
       WILL_FIRE_RL_rseqFsm_actionof_l56c15_6,
       WILL_FIRE_RL_rseqFsm_actionof_l57c12,
       WILL_FIRE_RL_rseqFsm_actionof_l58c12,
       WILL_FIRE_RL_rseqFsm_actionof_l60c10,
       WILL_FIRE_RL_rseqFsm_actionof_l61c12,
       WILL_FIRE_RL_rseqFsm_actionof_l62c12,
       WILL_FIRE_RL_rseqFsm_actionof_np,
       WILL_FIRE_RL_rseqFsm_actionof_np_1,
       WILL_FIRE_RL_rseqFsm_fsm_start,
       WILL_FIRE_RL_rseqFsm_start_reg__dreg_update,
       WILL_FIRE_RL_rseqFsm_state_update_standby,
       WILL_FIRE_RL_wseqFsm_action_l66c15,
       WILL_FIRE_RL_wseqFsm_action_l67c12,
       WILL_FIRE_RL_wseqFsm_action_l68c12,
       WILL_FIRE_RL_wseqFsm_action_l69c12,
       WILL_FIRE_RL_wseqFsm_action_l71c12,
       WILL_FIRE_RL_wseqFsm_action_l72c12,
       WILL_FIRE_RL_wseqFsm_action_l73c12,
       WILL_FIRE_RL_wseqFsm_action_np,
       WILL_FIRE_RL_wseqFsm_actionof_l66c15,
       WILL_FIRE_RL_wseqFsm_actionof_l66c15_1,
       WILL_FIRE_RL_wseqFsm_actionof_l66c15_2,
       WILL_FIRE_RL_wseqFsm_actionof_l66c15_3,
       WILL_FIRE_RL_wseqFsm_actionof_l66c15_4,
       WILL_FIRE_RL_wseqFsm_actionof_l66c15_5,
       WILL_FIRE_RL_wseqFsm_actionof_l66c15_6,
       WILL_FIRE_RL_wseqFsm_actionof_l66c15_7,
       WILL_FIRE_RL_wseqFsm_actionof_l67c12,
       WILL_FIRE_RL_wseqFsm_actionof_l68c12,
       WILL_FIRE_RL_wseqFsm_actionof_l69c12,
       WILL_FIRE_RL_wseqFsm_actionof_l71c12,
       WILL_FIRE_RL_wseqFsm_actionof_l72c12,
       WILL_FIRE_RL_wseqFsm_actionof_l73c12,
       WILL_FIRE_RL_wseqFsm_actionof_np,
       WILL_FIRE_RL_wseqFsm_actionof_np_1,
       WILL_FIRE_RL_wseqFsm_fsm_start,
       WILL_FIRE_RL_wseqFsm_start_reg__dreg_update,
       WILL_FIRE_RL_wseqFsm_state_update_standby,
       WILL_FIRE_flash_fwait,
       WILL_FIRE_user_request_put,
       WILL_FIRE_user_response_get;

  // inputs to muxes for submodule ports
  wire MUX_ceReg$write_1__SEL_1;

  // remaining internal signals
  wire [3 : 0] x__h11712, x__h24832;
  wire reqF_i_notEmpty_AND_IF_reqF_first_BIT_40_THEN__ETC___d68;

  // value method flash_addr
  assign flash_addr = aReg ;

  // value method flash_ce_n
  assign flash_ce_n = !ceReg ;

  // value method flash_oe_n
  assign flash_oe_n = !oeReg ;

  // value method flash_we_n
  assign flash_we_n = !weReg ;

  // value method flash_wp_n
  assign flash_wp_n = 1'b1 ;

  // value method flash_rst_n
  assign flash_rst_n = 1'b1 ;

  // value method flash_adv_n
  assign flash_adv_n = 1'b1 ;

  // action method flash_fwait
  assign CAN_FIRE_flash_fwait = 1'd1 ;
  assign WILL_FIRE_flash_fwait = 1'd1 ;

  // action method user_request_put
  assign RDY_user_request_put = reqF$FULL_N ;
  assign CAN_FIRE_user_request_put = reqF$FULL_N ;
  assign WILL_FIRE_user_request_put = EN_user_request_put ;

  // actionvalue method user_response_get
  assign user_response_get = respF$D_OUT ;
  assign RDY_user_response_get = respF$EMPTY_N ;
  assign CAN_FIRE_user_response_get = respF$EMPTY_N ;
  assign WILL_FIRE_user_response_get = EN_user_response_get ;

  // value method user_waitBit
  assign user_waitBit = waitReg ;
  assign RDY_user_waitBit = 1'd1 ;

  // submodule reqF
  FIFO2 #(.width(32'd41), .guarded(32'd1)) reqF(.RST_N(RST_N),
						.CLK(CLK),
						.D_IN(reqF$D_IN),
						.ENQ(reqF$ENQ),
						.DEQ(reqF$DEQ),
						.CLR(reqF$CLR),
						.D_OUT(reqF$D_OUT),
						.FULL_N(reqF$FULL_N),
						.EMPTY_N(reqF$EMPTY_N));

  // submodule respF
  FIFO2 #(.width(32'd16), .guarded(32'd1)) respF(.RST_N(RST_N),
						 .CLK(CLK),
						 .D_IN(respF$D_IN),
						 .ENQ(respF$ENQ),
						 .DEQ(respF$DEQ),
						 .CLR(respF$CLR),
						 .D_OUT(respF$D_OUT),
						 .FULL_N(respF$FULL_N),
						 .EMPTY_N(respF$EMPTY_N));

  // submodule tsd
  TriState #(.width(32'd16)) tsd(.I(tsWD), .OE(tsOE), .O(tsd$O), .IO(tsd$IO));

  // rule RL_nextRequest
  assign CAN_FIRE_RL_nextRequest =
	     reqF_i_notEmpty_AND_IF_reqF_first_BIT_40_THEN__ETC___d68 &&
	     (rseqFsm_state_mkFSMstate == 4'd7 ||
	      rseqFsm_state_mkFSMstate == 4'd1 && !rseqFsm_state_standby) &&
	     !rseqFsm_start_reg &&
	     (wseqFsm_state_mkFSMstate == 4'd8 ||
	      wseqFsm_state_mkFSMstate == 4'd1 && !wseqFsm_state_standby) &&
	     !wseqFsm_start_reg ;
  assign WILL_FIRE_RL_nextRequest = CAN_FIRE_RL_nextRequest ;

  // rule RL_wseqFsm_fsm_start
  assign CAN_FIRE_RL_wseqFsm_fsm_start =
	     (wseqFsm_state_mkFSMstate == 4'd8 ||
	      wseqFsm_state_mkFSMstate == 4'd1 && !wseqFsm_state_standby) &&
	     wseqFsm_start_reg ;
  assign WILL_FIRE_RL_wseqFsm_fsm_start = CAN_FIRE_RL_wseqFsm_fsm_start ;

  // rule RL_wseqFsm_actionof_l67c12
  assign CAN_FIRE_RL_wseqFsm_actionof_l67c12 =
	     wseqFsm_state_mkFSMstate == 4'd1 &&
	     (CAN_FIRE_RL_wseqFsm_fsm_start || wseqFsm_state_standby) &&
	     !isRead ;
  assign WILL_FIRE_RL_wseqFsm_actionof_l67c12 =
	     CAN_FIRE_RL_wseqFsm_action_l67c12 ;

  // rule RL_wseqFsm_action_l67c12
  assign CAN_FIRE_RL_wseqFsm_action_l67c12 =
	     CAN_FIRE_RL_wseqFsm_actionof_l67c12 &&
	     !WILL_FIRE_RL_nextRequest ;
  assign WILL_FIRE_RL_wseqFsm_action_l67c12 =
	     CAN_FIRE_RL_wseqFsm_action_l67c12 ;

  // rule RL_wseqFsm_actionof_l68c12
  assign CAN_FIRE_RL_wseqFsm_actionof_l68c12 =
	     CAN_FIRE_RL_wseqFsm_action_l68c12 ;
  assign WILL_FIRE_RL_wseqFsm_actionof_l68c12 =
	     CAN_FIRE_RL_wseqFsm_action_l68c12 ;

  // rule RL_wseqFsm_action_l68c12
  assign CAN_FIRE_RL_wseqFsm_action_l68c12 =
	     wseqFsm_state_mkFSMstate == 4'd2 && !isRead ;
  assign WILL_FIRE_RL_wseqFsm_action_l68c12 =
	     CAN_FIRE_RL_wseqFsm_action_l68c12 ;

  // rule RL_wseqFsm_actionof_l69c12
  assign CAN_FIRE_RL_wseqFsm_actionof_l69c12 =
	     CAN_FIRE_RL_wseqFsm_action_l69c12 ;
  assign WILL_FIRE_RL_wseqFsm_actionof_l69c12 =
	     CAN_FIRE_RL_wseqFsm_action_l69c12 ;

  // rule RL_wseqFsm_action_l69c12
  assign CAN_FIRE_RL_wseqFsm_action_l69c12 =
	     wseqFsm_state_mkFSMstate == 4'd3 && !isRead ;
  assign WILL_FIRE_RL_wseqFsm_action_l69c12 =
	     CAN_FIRE_RL_wseqFsm_action_l69c12 ;

  // rule RL_wseqFsm_actionof_np
  assign CAN_FIRE_RL_wseqFsm_actionof_np =
	     wseqFsm_state_mkFSMstate == 4'd4 && !isRead ;
  assign WILL_FIRE_RL_wseqFsm_actionof_np = CAN_FIRE_RL_wseqFsm_actionof_np ;

  // rule RL_wseqFsm_actionof_np_1
  assign CAN_FIRE_RL_wseqFsm_actionof_np_1 =
	     wseqFsm_state_mkFSMstate == 4'd5 &&
	     wseqFsm_repeat_count != 4'd0 &&
	     !isRead ;
  assign WILL_FIRE_RL_wseqFsm_actionof_np_1 =
	     CAN_FIRE_RL_wseqFsm_actionof_np_1 ;

  // rule RL_wseqFsm_action_np
  assign CAN_FIRE_RL_wseqFsm_action_np =
	     WILL_FIRE_RL_wseqFsm_actionof_np_1 ||
	     WILL_FIRE_RL_wseqFsm_actionof_np ;
  assign WILL_FIRE_RL_wseqFsm_action_np = CAN_FIRE_RL_wseqFsm_action_np ;

  // rule RL_wseqFsm_actionof_l72c12
  assign CAN_FIRE_RL_wseqFsm_actionof_l72c12 =
	     CAN_FIRE_RL_wseqFsm_action_l72c12 ;
  assign WILL_FIRE_RL_wseqFsm_actionof_l72c12 =
	     CAN_FIRE_RL_wseqFsm_action_l72c12 ;

  // rule RL_wseqFsm_actionof_l71c12
  assign CAN_FIRE_RL_wseqFsm_actionof_l71c12 =
	     CAN_FIRE_RL_wseqFsm_action_l71c12 ;
  assign WILL_FIRE_RL_wseqFsm_actionof_l71c12 =
	     CAN_FIRE_RL_wseqFsm_action_l71c12 ;

  // rule RL_wseqFsm_action_l71c12
  assign CAN_FIRE_RL_wseqFsm_action_l71c12 =
	     wseqFsm_state_mkFSMstate == 4'd5 &&
	     wseqFsm_repeat_count == 4'd0 &&
	     !isRead ;
  assign WILL_FIRE_RL_wseqFsm_action_l71c12 =
	     CAN_FIRE_RL_wseqFsm_action_l71c12 ;

  // rule RL_wseqFsm_action_l72c12
  assign CAN_FIRE_RL_wseqFsm_action_l72c12 =
	     wseqFsm_state_mkFSMstate == 4'd6 && !isRead ;
  assign WILL_FIRE_RL_wseqFsm_action_l72c12 =
	     CAN_FIRE_RL_wseqFsm_action_l72c12 ;

  // rule RL_wseqFsm_actionof_l73c12
  assign CAN_FIRE_RL_wseqFsm_actionof_l73c12 =
	     CAN_FIRE_RL_wseqFsm_action_l73c12 ;
  assign WILL_FIRE_RL_wseqFsm_actionof_l73c12 =
	     CAN_FIRE_RL_wseqFsm_action_l73c12 ;

  // rule RL_wseqFsm_action_l73c12
  assign CAN_FIRE_RL_wseqFsm_action_l73c12 =
	     wseqFsm_state_mkFSMstate == 4'd7 && !isRead ;
  assign WILL_FIRE_RL_wseqFsm_action_l73c12 =
	     CAN_FIRE_RL_wseqFsm_action_l73c12 ;

  // rule RL_wseqFsm_actionof_l66c15
  assign CAN_FIRE_RL_wseqFsm_actionof_l66c15 = 1'b0 ;
  assign WILL_FIRE_RL_wseqFsm_actionof_l66c15 = 1'b0 ;

  // rule RL_wseqFsm_actionof_l66c15_1
  assign CAN_FIRE_RL_wseqFsm_actionof_l66c15_1 = 1'b0 ;
  assign WILL_FIRE_RL_wseqFsm_actionof_l66c15_1 = 1'b0 ;

  // rule RL_wseqFsm_actionof_l66c15_2
  assign CAN_FIRE_RL_wseqFsm_actionof_l66c15_2 = 1'b0 ;
  assign WILL_FIRE_RL_wseqFsm_actionof_l66c15_2 = 1'b0 ;

  // rule RL_wseqFsm_actionof_l66c15_3
  assign CAN_FIRE_RL_wseqFsm_actionof_l66c15_3 = 1'b0 ;
  assign WILL_FIRE_RL_wseqFsm_actionof_l66c15_3 = 1'b0 ;

  // rule RL_wseqFsm_actionof_l66c15_4
  assign CAN_FIRE_RL_wseqFsm_actionof_l66c15_4 = 1'b0 ;
  assign WILL_FIRE_RL_wseqFsm_actionof_l66c15_4 = 1'b0 ;

  // rule RL_wseqFsm_actionof_l66c15_5
  assign CAN_FIRE_RL_wseqFsm_actionof_l66c15_5 = 1'b0 ;
  assign WILL_FIRE_RL_wseqFsm_actionof_l66c15_5 = 1'b0 ;

  // rule RL_wseqFsm_actionof_l66c15_6
  assign CAN_FIRE_RL_wseqFsm_actionof_l66c15_6 =
	     wseqFsm_state_mkFSMstate == 4'd8 ;
  assign WILL_FIRE_RL_wseqFsm_actionof_l66c15_6 =
	     CAN_FIRE_RL_wseqFsm_actionof_l66c15_6 ;

  // rule RL_wseqFsm_start_reg__dreg_update
  assign CAN_FIRE_RL_wseqFsm_start_reg__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wseqFsm_start_reg__dreg_update = 1'd1 ;

  // rule RL_wseqFsm_actionof_l66c15_7
  assign CAN_FIRE_RL_wseqFsm_actionof_l66c15_7 =
	     wseqFsm_state_mkFSMstate == 4'd1 &&
	     !CAN_FIRE_RL_wseqFsm_fsm_start &&
	     !wseqFsm_state_standby ;
  assign WILL_FIRE_RL_wseqFsm_actionof_l66c15_7 =
	     CAN_FIRE_RL_wseqFsm_actionof_l66c15_7 ;

  // rule RL_wseqFsm_action_l66c15
  assign CAN_FIRE_RL_wseqFsm_action_l66c15 =
	     WILL_FIRE_RL_wseqFsm_actionof_l66c15_7 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l66c15_6 ;
  assign WILL_FIRE_RL_wseqFsm_action_l66c15 =
	     CAN_FIRE_RL_wseqFsm_action_l66c15 ;

  // rule RL_wseqFsm_state_update_standby
  assign CAN_FIRE_RL_wseqFsm_state_update_standby =
	     wseqFsm_state_run_pw$whas || CAN_FIRE_RL_wseqFsm_fsm_start ;
  assign WILL_FIRE_RL_wseqFsm_state_update_standby =
	     CAN_FIRE_RL_wseqFsm_state_update_standby ;

  // rule RL_rseqFsm_fsm_start
  assign CAN_FIRE_RL_rseqFsm_fsm_start =
	     (rseqFsm_state_mkFSMstate == 4'd7 ||
	      rseqFsm_state_mkFSMstate == 4'd1 && !rseqFsm_state_standby) &&
	     rseqFsm_start_reg ;
  assign WILL_FIRE_RL_rseqFsm_fsm_start = CAN_FIRE_RL_rseqFsm_fsm_start ;

  // rule RL_rseqFsm_actionof_l57c12
  assign CAN_FIRE_RL_rseqFsm_actionof_l57c12 =
	     rseqFsm_state_mkFSMstate == 4'd1 &&
	     (CAN_FIRE_RL_rseqFsm_fsm_start || rseqFsm_state_standby) &&
	     isRead ;
  assign WILL_FIRE_RL_rseqFsm_actionof_l57c12 =
	     CAN_FIRE_RL_rseqFsm_action_l57c12 ;

  // rule RL_rseqFsm_action_l57c12
  assign CAN_FIRE_RL_rseqFsm_action_l57c12 =
	     CAN_FIRE_RL_rseqFsm_actionof_l57c12 &&
	     !WILL_FIRE_RL_nextRequest ;
  assign WILL_FIRE_RL_rseqFsm_action_l57c12 =
	     CAN_FIRE_RL_rseqFsm_action_l57c12 ;

  // rule RL_rseqFsm_actionof_l58c12
  assign CAN_FIRE_RL_rseqFsm_actionof_l58c12 =
	     rseqFsm_state_mkFSMstate == 4'd2 && isRead ;
  assign WILL_FIRE_RL_rseqFsm_actionof_l58c12 =
	     CAN_FIRE_RL_rseqFsm_actionof_l58c12 ;

  // rule RL_rseqFsm_action_l58c12
  assign CAN_FIRE_RL_rseqFsm_action_l58c12 =
	     CAN_FIRE_RL_rseqFsm_actionof_l58c12 ;
  assign WILL_FIRE_RL_rseqFsm_action_l58c12 =
	     CAN_FIRE_RL_rseqFsm_actionof_l58c12 ;

  // rule RL_rseqFsm_actionof_np
  assign CAN_FIRE_RL_rseqFsm_actionof_np =
	     rseqFsm_state_mkFSMstate == 4'd3 && isRead ;
  assign WILL_FIRE_RL_rseqFsm_actionof_np = CAN_FIRE_RL_rseqFsm_actionof_np ;

  // rule RL_rseqFsm_actionof_np_1
  assign CAN_FIRE_RL_rseqFsm_actionof_np_1 =
	     rseqFsm_state_mkFSMstate == 4'd4 &&
	     rseqFsm_repeat_count != 4'd0 &&
	     isRead ;
  assign WILL_FIRE_RL_rseqFsm_actionof_np_1 =
	     CAN_FIRE_RL_rseqFsm_actionof_np_1 ;

  // rule RL_rseqFsm_action_np
  assign CAN_FIRE_RL_rseqFsm_action_np =
	     WILL_FIRE_RL_rseqFsm_actionof_np_1 ||
	     WILL_FIRE_RL_rseqFsm_actionof_np ;
  assign WILL_FIRE_RL_rseqFsm_action_np = CAN_FIRE_RL_rseqFsm_action_np ;

  // rule RL_rseqFsm_actionof_l60c10
  assign CAN_FIRE_RL_rseqFsm_actionof_l60c10 =
	     CAN_FIRE_RL_rseqFsm_action_l60c10 ;
  assign WILL_FIRE_RL_rseqFsm_actionof_l60c10 =
	     CAN_FIRE_RL_rseqFsm_action_l60c10 ;

  // rule RL_rseqFsm_action_l60c10
  assign CAN_FIRE_RL_rseqFsm_action_l60c10 =
	     respF$FULL_N && rseqFsm_state_mkFSMstate == 4'd4 &&
	     rseqFsm_repeat_count == 4'd0 &&
	     isRead ;
  assign WILL_FIRE_RL_rseqFsm_action_l60c10 =
	     CAN_FIRE_RL_rseqFsm_action_l60c10 ;

  // rule RL_rseqFsm_actionof_l61c12
  assign CAN_FIRE_RL_rseqFsm_actionof_l61c12 =
	     CAN_FIRE_RL_rseqFsm_action_l61c12 ;
  assign WILL_FIRE_RL_rseqFsm_actionof_l61c12 =
	     CAN_FIRE_RL_rseqFsm_action_l61c12 ;

  // rule RL_rseqFsm_action_l61c12
  assign CAN_FIRE_RL_rseqFsm_action_l61c12 =
	     rseqFsm_state_mkFSMstate == 4'd5 && isRead ;
  assign WILL_FIRE_RL_rseqFsm_action_l61c12 =
	     CAN_FIRE_RL_rseqFsm_action_l61c12 ;

  // rule RL_rseqFsm_actionof_l62c12
  assign CAN_FIRE_RL_rseqFsm_actionof_l62c12 =
	     CAN_FIRE_RL_rseqFsm_action_l62c12 ;
  assign WILL_FIRE_RL_rseqFsm_actionof_l62c12 =
	     CAN_FIRE_RL_rseqFsm_action_l62c12 ;

  // rule RL_rseqFsm_action_l62c12
  assign CAN_FIRE_RL_rseqFsm_action_l62c12 =
	     rseqFsm_state_mkFSMstate == 4'd6 && isRead ;
  assign WILL_FIRE_RL_rseqFsm_action_l62c12 =
	     CAN_FIRE_RL_rseqFsm_action_l62c12 ;

  // rule RL_rseqFsm_actionof_l56c15
  assign CAN_FIRE_RL_rseqFsm_actionof_l56c15 = 1'b0 ;
  assign WILL_FIRE_RL_rseqFsm_actionof_l56c15 = 1'b0 ;

  // rule RL_rseqFsm_actionof_l56c15_1
  assign CAN_FIRE_RL_rseqFsm_actionof_l56c15_1 = 1'b0 ;
  assign WILL_FIRE_RL_rseqFsm_actionof_l56c15_1 = 1'b0 ;

  // rule RL_rseqFsm_actionof_l56c15_2
  assign CAN_FIRE_RL_rseqFsm_actionof_l56c15_2 = 1'b0 ;
  assign WILL_FIRE_RL_rseqFsm_actionof_l56c15_2 = 1'b0 ;

  // rule RL_rseqFsm_actionof_l56c15_3
  assign CAN_FIRE_RL_rseqFsm_actionof_l56c15_3 = 1'b0 ;
  assign WILL_FIRE_RL_rseqFsm_actionof_l56c15_3 = 1'b0 ;

  // rule RL_rseqFsm_actionof_l56c15_4
  assign CAN_FIRE_RL_rseqFsm_actionof_l56c15_4 = 1'b0 ;
  assign WILL_FIRE_RL_rseqFsm_actionof_l56c15_4 = 1'b0 ;

  // rule RL_rseqFsm_actionof_l56c15_5
  assign CAN_FIRE_RL_rseqFsm_actionof_l56c15_5 =
	     rseqFsm_state_mkFSMstate == 4'd7 ;
  assign WILL_FIRE_RL_rseqFsm_actionof_l56c15_5 =
	     CAN_FIRE_RL_rseqFsm_actionof_l56c15_5 ;

  // rule RL_rseqFsm_actionof_l56c15_6
  assign CAN_FIRE_RL_rseqFsm_actionof_l56c15_6 =
	     rseqFsm_state_mkFSMstate == 4'd1 &&
	     !CAN_FIRE_RL_rseqFsm_fsm_start &&
	     !rseqFsm_state_standby ;
  assign WILL_FIRE_RL_rseqFsm_actionof_l56c15_6 =
	     CAN_FIRE_RL_rseqFsm_actionof_l56c15_6 ;

  // rule RL_rseqFsm_action_l56c15
  assign CAN_FIRE_RL_rseqFsm_action_l56c15 =
	     WILL_FIRE_RL_rseqFsm_actionof_l56c15_6 ||
	     WILL_FIRE_RL_rseqFsm_actionof_l56c15_5 ;
  assign WILL_FIRE_RL_rseqFsm_action_l56c15 =
	     CAN_FIRE_RL_rseqFsm_action_l56c15 ;

  // rule RL_rseqFsm_state_update_standby
  assign CAN_FIRE_RL_rseqFsm_state_update_standby =
	     rseqFsm_state_run_pw$whas || CAN_FIRE_RL_rseqFsm_fsm_start ;
  assign WILL_FIRE_RL_rseqFsm_state_update_standby =
	     CAN_FIRE_RL_rseqFsm_state_update_standby ;

  // rule RL_rseqFsm_start_reg__dreg_update
  assign CAN_FIRE_RL_rseqFsm_start_reg__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_rseqFsm_start_reg__dreg_update = 1'd1 ;

  // inputs to muxes for submodule ports
  assign MUX_ceReg$write_1__SEL_1 =
	     WILL_FIRE_RL_rseqFsm_actionof_l62c12 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l73c12 ;

  // inlined wires
  assign rseqFsm_start_reg_1$whas =
	     WILL_FIRE_RL_nextRequest && reqF$D_OUT[40] ;
  assign rseqFsm_start_reg_1$wget = 1'd1 ;
  assign rseqFsm_start_wire$wget = 1'd1 ;
  assign rseqFsm_abort$whas = 1'b0 ;
  assign rseqFsm_start_wire$whas = CAN_FIRE_RL_rseqFsm_fsm_start ;
  assign rseqFsm_abort$wget = 1'b0 ;
  assign rseqFsm_state_run_pw$whas =
	     WILL_FIRE_RL_rseqFsm_actionof_l62c12 ||
	     WILL_FIRE_RL_rseqFsm_actionof_l61c12 ||
	     WILL_FIRE_RL_rseqFsm_actionof_l60c10 ||
	     WILL_FIRE_RL_rseqFsm_actionof_np_1 ||
	     WILL_FIRE_RL_rseqFsm_actionof_np ||
	     WILL_FIRE_RL_rseqFsm_actionof_l58c12 ||
	     WILL_FIRE_RL_rseqFsm_actionof_l57c12 ;
  assign rseqFsm_pw_list$whas = 1'b0 ;
  assign rseqFsm_state_start_pw$whas = CAN_FIRE_RL_rseqFsm_fsm_start ;
  assign rseqFsm_pw_list_1$whas = CAN_FIRE_RL_rseqFsm_action_l56c15 ;
  assign rseqFsm_pw_list_2$whas = CAN_FIRE_RL_rseqFsm_action_l57c12 ;
  assign rseqFsm_pw_list_3$whas = CAN_FIRE_RL_rseqFsm_actionof_l58c12 ;
  assign rseqFsm_pw_list_4$whas = CAN_FIRE_RL_rseqFsm_action_np ;
  assign rseqFsm_pw_list_5$whas = CAN_FIRE_RL_rseqFsm_action_l60c10 ;
  assign rseqFsm_pw_list_7$whas = CAN_FIRE_RL_rseqFsm_action_l62c12 ;
  assign rseqFsm_pw_list_6$whas = CAN_FIRE_RL_rseqFsm_action_l61c12 ;
  assign rseqFsm_pw_list_8$whas = 1'b0 ;
  assign wseqFsm_start_reg_1$wget = 1'd1 ;
  assign wseqFsm_start_reg_1$whas =
	     WILL_FIRE_RL_nextRequest && !reqF$D_OUT[40] ;
  assign wseqFsm_abort$wget = 1'b0 ;
  assign wseqFsm_start_wire$wget = 1'd1 ;
  assign wseqFsm_start_wire$whas = CAN_FIRE_RL_wseqFsm_fsm_start ;
  assign wseqFsm_abort$whas = 1'b0 ;
  assign wseqFsm_state_run_pw$whas =
	     WILL_FIRE_RL_wseqFsm_actionof_l73c12 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l72c12 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l71c12 ||
	     WILL_FIRE_RL_wseqFsm_actionof_np_1 ||
	     WILL_FIRE_RL_wseqFsm_actionof_np ||
	     WILL_FIRE_RL_wseqFsm_actionof_l69c12 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l68c12 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l67c12 ;
  assign wseqFsm_state_start_pw$whas = CAN_FIRE_RL_wseqFsm_fsm_start ;
  assign wseqFsm_pw_list$whas = 1'b0 ;
  assign wseqFsm_pw_list_1$whas = CAN_FIRE_RL_wseqFsm_action_l66c15 ;
  assign wseqFsm_pw_list_2$whas = CAN_FIRE_RL_wseqFsm_action_l67c12 ;
  assign wseqFsm_pw_list_3$whas = CAN_FIRE_RL_wseqFsm_action_l68c12 ;
  assign wseqFsm_pw_list_4$whas = CAN_FIRE_RL_wseqFsm_action_l69c12 ;
  assign wseqFsm_pw_list_5$whas = CAN_FIRE_RL_wseqFsm_action_np ;
  assign wseqFsm_pw_list_6$whas = CAN_FIRE_RL_wseqFsm_action_l71c12 ;
  assign wseqFsm_pw_list_7$whas = CAN_FIRE_RL_wseqFsm_action_l72c12 ;
  assign wseqFsm_pw_list_8$whas = CAN_FIRE_RL_wseqFsm_action_l73c12 ;
  assign wseqFsm_pw_list_9$whas = 1'b0 ;

  // register aReg
  assign aReg$D_IN = reqF$D_OUT[39:16] ;
  assign aReg$EN = CAN_FIRE_RL_nextRequest ;

  // register ceReg
  assign ceReg$D_IN = !MUX_ceReg$write_1__SEL_1 ;
  assign ceReg$EN =
	     WILL_FIRE_RL_rseqFsm_actionof_l62c12 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l73c12 ||
	     WILL_FIRE_RL_rseqFsm_actionof_l57c12 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l67c12 ;

  // register isRead
  assign isRead$D_IN = reqF$D_OUT[40] ;
  assign isRead$EN = CAN_FIRE_RL_nextRequest ;

  // register oeReg
  assign oeReg$D_IN = !WILL_FIRE_RL_rseqFsm_actionof_l61c12 ;
  assign oeReg$EN =
	     WILL_FIRE_RL_rseqFsm_actionof_l61c12 ||
	     WILL_FIRE_RL_rseqFsm_actionof_l58c12 ;

  // register rseqFsm_repeat_count
  assign rseqFsm_repeat_count$D_IN =
	     (rseqFsm_repeat_count == 4'd14) ? 4'd0 : x__h11712 ;
  assign rseqFsm_repeat_count$EN = CAN_FIRE_RL_rseqFsm_action_np ;

  // register rseqFsm_start_reg
  assign rseqFsm_start_reg$D_IN = rseqFsm_start_reg_1$whas ;
  assign rseqFsm_start_reg$EN = 1'd1 ;

  // register rseqFsm_state_mkFSMstate
  always@(CAN_FIRE_RL_rseqFsm_action_l56c15 or
	  WILL_FIRE_RL_rseqFsm_actionof_l57c12 or
	  WILL_FIRE_RL_rseqFsm_actionof_l58c12 or
	  CAN_FIRE_RL_rseqFsm_action_np or
	  WILL_FIRE_RL_rseqFsm_actionof_l60c10 or
	  WILL_FIRE_RL_rseqFsm_actionof_l61c12 or
	  WILL_FIRE_RL_rseqFsm_actionof_l62c12)
  begin
    case (1'b1) // synopsys parallel_case
      CAN_FIRE_RL_rseqFsm_action_l56c15: rseqFsm_state_mkFSMstate$D_IN = 4'd1;
      WILL_FIRE_RL_rseqFsm_actionof_l57c12:
	  rseqFsm_state_mkFSMstate$D_IN = 4'd2;
      WILL_FIRE_RL_rseqFsm_actionof_l58c12:
	  rseqFsm_state_mkFSMstate$D_IN = 4'd3;
      CAN_FIRE_RL_rseqFsm_action_np: rseqFsm_state_mkFSMstate$D_IN = 4'd4;
      WILL_FIRE_RL_rseqFsm_actionof_l60c10:
	  rseqFsm_state_mkFSMstate$D_IN = 4'd5;
      WILL_FIRE_RL_rseqFsm_actionof_l61c12:
	  rseqFsm_state_mkFSMstate$D_IN = 4'd6;
      WILL_FIRE_RL_rseqFsm_actionof_l62c12:
	  rseqFsm_state_mkFSMstate$D_IN = 4'd7;
      default: rseqFsm_state_mkFSMstate$D_IN =
		   4'b1010 /* unspecified value */ ;
    endcase
  end
  assign rseqFsm_state_mkFSMstate$EN =
	     WILL_FIRE_RL_rseqFsm_actionof_l56c15_6 ||
	     WILL_FIRE_RL_rseqFsm_actionof_l56c15_5 ||
	     WILL_FIRE_RL_rseqFsm_actionof_l57c12 ||
	     WILL_FIRE_RL_rseqFsm_actionof_l58c12 ||
	     WILL_FIRE_RL_rseqFsm_actionof_np_1 ||
	     WILL_FIRE_RL_rseqFsm_actionof_np ||
	     WILL_FIRE_RL_rseqFsm_actionof_l60c10 ||
	     WILL_FIRE_RL_rseqFsm_actionof_l61c12 ||
	     WILL_FIRE_RL_rseqFsm_actionof_l62c12 ;

  // register rseqFsm_state_standby
  assign rseqFsm_state_standby$D_IN = !rseqFsm_state_run_pw$whas ;
  assign rseqFsm_state_standby$EN = CAN_FIRE_RL_rseqFsm_state_update_standby ;

  // register tsOE
  assign tsOE$D_IN = !WILL_FIRE_RL_wseqFsm_actionof_l72c12 ;
  assign tsOE$EN =
	     WILL_FIRE_RL_wseqFsm_actionof_l72c12 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l68c12 ;

  // register tsWD
  assign tsWD$D_IN = reqF$D_OUT[15:0] ;
  assign tsWD$EN = CAN_FIRE_RL_nextRequest ;

  // register waitReg
  assign waitReg$D_IN = flash_fwait_i ;
  assign waitReg$EN = 1'd1 ;

  // register wdReg
  assign wdReg$D_IN = 16'h0 ;
  assign wdReg$EN = 1'b0 ;

  // register weReg
  assign weReg$D_IN = !WILL_FIRE_RL_wseqFsm_actionof_l71c12 ;
  assign weReg$EN =
	     WILL_FIRE_RL_wseqFsm_actionof_l71c12 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l69c12 ;

  // register wseqFsm_repeat_count
  assign wseqFsm_repeat_count$D_IN =
	     (wseqFsm_repeat_count == 4'd14) ? 4'd0 : x__h24832 ;
  assign wseqFsm_repeat_count$EN = CAN_FIRE_RL_wseqFsm_action_np ;

  // register wseqFsm_start_reg
  assign wseqFsm_start_reg$D_IN = wseqFsm_start_reg_1$whas ;
  assign wseqFsm_start_reg$EN = 1'd1 ;

  // register wseqFsm_state_mkFSMstate
  always@(CAN_FIRE_RL_wseqFsm_action_l66c15 or
	  WILL_FIRE_RL_wseqFsm_actionof_l67c12 or
	  WILL_FIRE_RL_wseqFsm_actionof_l68c12 or
	  WILL_FIRE_RL_wseqFsm_actionof_l69c12 or
	  CAN_FIRE_RL_wseqFsm_action_np or
	  WILL_FIRE_RL_wseqFsm_actionof_l71c12 or
	  WILL_FIRE_RL_wseqFsm_actionof_l72c12 or
	  WILL_FIRE_RL_wseqFsm_actionof_l73c12)
  begin
    case (1'b1) // synopsys parallel_case
      CAN_FIRE_RL_wseqFsm_action_l66c15: wseqFsm_state_mkFSMstate$D_IN = 4'd1;
      WILL_FIRE_RL_wseqFsm_actionof_l67c12:
	  wseqFsm_state_mkFSMstate$D_IN = 4'd2;
      WILL_FIRE_RL_wseqFsm_actionof_l68c12:
	  wseqFsm_state_mkFSMstate$D_IN = 4'd3;
      WILL_FIRE_RL_wseqFsm_actionof_l69c12:
	  wseqFsm_state_mkFSMstate$D_IN = 4'd4;
      CAN_FIRE_RL_wseqFsm_action_np: wseqFsm_state_mkFSMstate$D_IN = 4'd5;
      WILL_FIRE_RL_wseqFsm_actionof_l71c12:
	  wseqFsm_state_mkFSMstate$D_IN = 4'd6;
      WILL_FIRE_RL_wseqFsm_actionof_l72c12:
	  wseqFsm_state_mkFSMstate$D_IN = 4'd7;
      WILL_FIRE_RL_wseqFsm_actionof_l73c12:
	  wseqFsm_state_mkFSMstate$D_IN = 4'd8;
      default: wseqFsm_state_mkFSMstate$D_IN =
		   4'b1010 /* unspecified value */ ;
    endcase
  end
  assign wseqFsm_state_mkFSMstate$EN =
	     WILL_FIRE_RL_wseqFsm_actionof_l66c15_7 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l66c15_6 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l67c12 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l68c12 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l69c12 ||
	     WILL_FIRE_RL_wseqFsm_actionof_np_1 ||
	     WILL_FIRE_RL_wseqFsm_actionof_np ||
	     WILL_FIRE_RL_wseqFsm_actionof_l71c12 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l72c12 ||
	     WILL_FIRE_RL_wseqFsm_actionof_l73c12 ;

  // register wseqFsm_state_standby
  assign wseqFsm_state_standby$D_IN = !wseqFsm_state_run_pw$whas ;
  assign wseqFsm_state_standby$EN = CAN_FIRE_RL_wseqFsm_state_update_standby ;

  // submodule reqF
  assign reqF$D_IN = user_request_put ;
  assign reqF$DEQ = CAN_FIRE_RL_nextRequest ;
  assign reqF$ENQ = EN_user_request_put ;
  assign reqF$CLR = 1'b0 ;

  // submodule respF
  assign respF$D_IN = tsd$O ;
  assign respF$DEQ = EN_user_response_get ;
  assign respF$ENQ = CAN_FIRE_RL_rseqFsm_action_l60c10 ;
  assign respF$CLR = 1'b0 ;

  // remaining internal signals
  assign reqF_i_notEmpty_AND_IF_reqF_first_BIT_40_THEN__ETC___d68 =
	     reqF$EMPTY_N &&
	     (reqF$D_OUT[40] ?
		(rseqFsm_state_mkFSMstate == 4'd7 ||
		 rseqFsm_state_mkFSMstate == 4'd1 &&
		 !rseqFsm_state_standby) &&
		!rseqFsm_start_reg :
		(wseqFsm_state_mkFSMstate == 4'd8 ||
		 wseqFsm_state_mkFSMstate == 4'd1 &&
		 !wseqFsm_state_standby) &&
		!wseqFsm_start_reg) ;
  assign x__h11712 = rseqFsm_repeat_count + 4'd1 ;
  assign x__h24832 = wseqFsm_repeat_count + 4'd1 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        aReg <= `BSV_ASSIGNMENT_DELAY 24'd0;
	ceReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	isRead <= `BSV_ASSIGNMENT_DELAY 1'd1;
	oeReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rseqFsm_repeat_count <= `BSV_ASSIGNMENT_DELAY 4'd0;
	rseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 4'd1;
	rseqFsm_state_standby <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tsOE <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tsWD <= `BSV_ASSIGNMENT_DELAY 16'd0;
	wdReg <= `BSV_ASSIGNMENT_DELAY 16'd0;
	weReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wseqFsm_repeat_count <= `BSV_ASSIGNMENT_DELAY 4'd0;
	wseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 4'd1;
	wseqFsm_state_standby <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (aReg$EN) aReg <= `BSV_ASSIGNMENT_DELAY aReg$D_IN;
	if (ceReg$EN) ceReg <= `BSV_ASSIGNMENT_DELAY ceReg$D_IN;
	if (isRead$EN) isRead <= `BSV_ASSIGNMENT_DELAY isRead$D_IN;
	if (oeReg$EN) oeReg <= `BSV_ASSIGNMENT_DELAY oeReg$D_IN;
	if (rseqFsm_repeat_count$EN)
	  rseqFsm_repeat_count <= `BSV_ASSIGNMENT_DELAY
	      rseqFsm_repeat_count$D_IN;
	if (rseqFsm_start_reg$EN)
	  rseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY rseqFsm_start_reg$D_IN;
	if (rseqFsm_state_mkFSMstate$EN)
	  rseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY
	      rseqFsm_state_mkFSMstate$D_IN;
	if (rseqFsm_state_standby$EN)
	  rseqFsm_state_standby <= `BSV_ASSIGNMENT_DELAY
	      rseqFsm_state_standby$D_IN;
	if (tsOE$EN) tsOE <= `BSV_ASSIGNMENT_DELAY tsOE$D_IN;
	if (tsWD$EN) tsWD <= `BSV_ASSIGNMENT_DELAY tsWD$D_IN;
	if (wdReg$EN) wdReg <= `BSV_ASSIGNMENT_DELAY wdReg$D_IN;
	if (weReg$EN) weReg <= `BSV_ASSIGNMENT_DELAY weReg$D_IN;
	if (wseqFsm_repeat_count$EN)
	  wseqFsm_repeat_count <= `BSV_ASSIGNMENT_DELAY
	      wseqFsm_repeat_count$D_IN;
	if (wseqFsm_start_reg$EN)
	  wseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY wseqFsm_start_reg$D_IN;
	if (wseqFsm_state_mkFSMstate$EN)
	  wseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY
	      wseqFsm_state_mkFSMstate$D_IN;
	if (wseqFsm_state_standby$EN)
	  wseqFsm_state_standby <= `BSV_ASSIGNMENT_DELAY
	      wseqFsm_state_standby$D_IN;
      end
    if (waitReg$EN) waitReg <= `BSV_ASSIGNMENT_DELAY waitReg$D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    aReg = 24'hAAAAAA;
    ceReg = 1'h0;
    isRead = 1'h0;
    oeReg = 1'h0;
    rseqFsm_repeat_count = 4'hA;
    rseqFsm_start_reg = 1'h0;
    rseqFsm_state_mkFSMstate = 4'hA;
    rseqFsm_state_standby = 1'h0;
    tsOE = 1'h0;
    tsWD = 16'hAAAA;
    waitReg = 1'h0;
    wdReg = 16'hAAAA;
    weReg = 1'h0;
    wseqFsm_repeat_count = 4'hA;
    wseqFsm_start_reg = 1'h0;
    wseqFsm_state_mkFSMstate = 4'hA;
    wseqFsm_state_standby = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N) if (WILL_FIRE_RL_wseqFsm_action_l67c12) $write("");
    if (RST_N) if (WILL_FIRE_RL_wseqFsm_action_l68c12) $write("");
    if (RST_N) if (WILL_FIRE_RL_wseqFsm_action_l69c12) $write("");
    if (RST_N) if (WILL_FIRE_RL_wseqFsm_action_np) $write("");
    if (RST_N) if (WILL_FIRE_RL_wseqFsm_action_l71c12) $write("");
    if (RST_N) if (WILL_FIRE_RL_wseqFsm_action_l72c12) $write("");
    if (RST_N) if (WILL_FIRE_RL_wseqFsm_action_l73c12) $write("");
    if (RST_N) if (WILL_FIRE_RL_wseqFsm_action_l66c15) $write("");
    if (RST_N) if (WILL_FIRE_RL_rseqFsm_action_l57c12) $write("");
    if (RST_N) if (WILL_FIRE_RL_rseqFsm_action_l58c12) $write("");
    if (RST_N) if (WILL_FIRE_RL_rseqFsm_action_np) $write("");
    if (RST_N) if (WILL_FIRE_RL_rseqFsm_action_l60c10) $write("");
    if (RST_N) if (WILL_FIRE_RL_rseqFsm_action_l61c12) $write("");
    if (RST_N) if (WILL_FIRE_RL_rseqFsm_action_l62c12) $write("");
    if (RST_N) if (WILL_FIRE_RL_rseqFsm_action_l56c15) $write("");
  end
  // synopsys translate_on
endmodule  // mkFlashController2416

