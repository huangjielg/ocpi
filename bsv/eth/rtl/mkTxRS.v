//
// Generated by Bluespec Compiler, version 2012.01.A (build 26572, 2012-01-17)
//
// On Sat Feb 18 16:12:02 EST 2012
//
//
// Ports:
// Name                         I/O  size props
// RDY_txf_put                    O     1 reg
// txUnderflow                    O     1 reg
// RDY_txUnderflow                O     1 const
// gmii_txd                       O     8 reg
// gmii_tx_en                     O     1 reg
// gmii_tx_er                     O     1 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// txf_put                        I    11 reg
// EN_txf_put                     I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkTxRS(CLK,
	      RST_N,

	      txf_put,
	      EN_txf_put,
	      RDY_txf_put,

	      txUnderflow,
	      RDY_txUnderflow,

	      gmii_txd,

	      gmii_tx_en,

	      gmii_tx_er);
  input  CLK;
  input  RST_N;

  // action method txf_put
  input  [10 : 0] txf_put;
  input  EN_txf_put;
  output RDY_txf_put;

  // value method txUnderflow
  output txUnderflow;
  output RDY_txUnderflow;

  // value method gmii_txd
  output [7 : 0] gmii_txd;

  // value method gmii_tx_en
  output gmii_tx_en;

  // value method gmii_tx_er
  output gmii_tx_er;

  // signals for module outputs
  wire [7 : 0] gmii_txd;
  wire RDY_txUnderflow, RDY_txf_put, gmii_tx_en, gmii_tx_er, txUnderflow;

  // inlined wires
  reg [7 : 0] txData_1$wget;
  wire ifgCnt_decAction$whas,
       ifgCnt_incAction$whas,
       lenCnt_decAction$whas,
       lenCnt_incAction$whas,
       preambleCnt_decAction$whas,
       preambleCnt_incAction$whas,
       txDV_1$wget,
       txDV_1$whas,
       txData_1$whas,
       txER_1$wget,
       txER_1$whas,
       underflow_1$wget,
       underflow_1$whas;

  // register doPad
  reg doPad;
  wire doPad$D_IN, doPad$EN;

  // register emitFCS
  reg [2 : 0] emitFCS;
  wire [2 : 0] emitFCS$D_IN;
  wire emitFCS$EN;

  // register ifgCnt_value
  reg [4 : 0] ifgCnt_value;
  wire [4 : 0] ifgCnt_value$D_IN;
  wire ifgCnt_value$EN;

  // register lenCnt_value
  reg [11 : 0] lenCnt_value;
  wire [11 : 0] lenCnt_value$D_IN;
  wire lenCnt_value$EN;

  // register preambleCnt_value
  reg [4 : 0] preambleCnt_value;
  wire [4 : 0] preambleCnt_value$D_IN;
  wire preambleCnt_value$EN;

  // register txActive
  reg txActive;
  wire txActive$D_IN, txActive$EN;

  // register txDV
  reg txDV;
  wire txDV$D_IN, txDV$EN;

  // register txData
  reg [7 : 0] txData;
  wire [7 : 0] txData$D_IN;
  wire txData$EN;

  // register txER
  reg txER;
  wire txER$D_IN, txER$EN;

  // register underflow
  reg underflow;
  wire underflow$D_IN, underflow$EN;

  // ports of submodule crc
  wire [31 : 0] crc$result;
  wire [7 : 0] crc$add_data;
  wire crc$EN_add, crc$EN_clear, crc$EN_complete;

  // ports of submodule txF
  wire [10 : 0] txF$D_IN, txF$D_OUT;
  wire txF$CLR, txF$DEQ, txF$EMPTY_N, txF$ENQ, txF$FULL_N;

  // rule scheduling signals
  wire WILL_FIRE_RL_egress_Body,
       WILL_FIRE_RL_egress_EOF,
       WILL_FIRE_RL_egress_PAD,
       WILL_FIRE_RL_egress_SOF;

  // inputs to muxes for submodule ports
  reg [7 : 0] MUX_txData_1$wset_1__VAL_2;
  wire [11 : 0] MUX_lenCnt_value$write_1__VAL_2;
  wire [7 : 0] MUX_txData_1$wset_1__VAL_3;
  wire [4 : 0] MUX_ifgCnt_value$write_1__VAL_2,
	       MUX_preambleCnt_value$write_1__VAL_3;
  wire [2 : 0] MUX_emitFCS$write_1__VAL_2;
  wire MUX_crc$add_1__SEL_2,
       MUX_doPad$write_1__SEL_1,
       MUX_emitFCS$write_1__PSEL_1,
       MUX_emitFCS$write_1__SEL_1,
       MUX_txActive$write_1__SEL_1;

  // remaining internal signals
  wire lenCnt_value_1_ULT_60___d75, preambleCnt_value_5_ULT_7___d113;

  // action method txf_put
  assign RDY_txf_put = txF$FULL_N ;

  // value method txUnderflow
  assign txUnderflow = underflow ;
  assign RDY_txUnderflow = 1'd1 ;

  // value method gmii_txd
  assign gmii_txd = txData ;

  // value method gmii_tx_en
  assign gmii_tx_en = txDV ;

  // value method gmii_tx_er
  assign gmii_tx_er = txER ;

  // submodule crc
  mkCRC32 crc(.CLK(CLK),
	      .RST_N(RST_N),
	      .add_data(crc$add_data),
	      .EN_add(crc$EN_add),
	      .EN_clear(crc$EN_clear),
	      .EN_complete(crc$EN_complete),
	      .RDY_add(),
	      .RDY_clear(),
	      .result(crc$result),
	      .RDY_result(),
	      .complete(),
	      .RDY_complete());

  // submodule txF
  FIFO2 #(.width(32'd11), .guarded(32'd1)) txF(.RST_N(RST_N),
					       .CLK(CLK),
					       .D_IN(txF$D_IN),
					       .ENQ(txF$ENQ),
					       .DEQ(txF$DEQ),
					       .CLR(txF$CLR),
					       .D_OUT(txF$D_OUT),
					       .FULL_N(txF$FULL_N),
					       .EMPTY_N(txF$EMPTY_N));

  // rule RL_egress_Body
  assign WILL_FIRE_RL_egress_Body =
	     txF$EMPTY_N && txActive && !txF$D_OUT[9] && !txF$D_OUT[8] &&
	     !WILL_FIRE_RL_egress_PAD &&
	     !(emitFCS != 3'd0) ;

  // rule RL_egress_SOF
  assign WILL_FIRE_RL_egress_SOF =
	     txF$EMPTY_N && txF$D_OUT[9] && ifgCnt_value == 5'h0 &&
	     !WILL_FIRE_RL_egress_EOF &&
	     !WILL_FIRE_RL_egress_PAD &&
	     !(emitFCS != 3'd0) ;

  // rule RL_egress_EOF
  assign WILL_FIRE_RL_egress_EOF =
	     txF$EMPTY_N && txActive && txF$D_OUT[8] &&
	     !WILL_FIRE_RL_egress_PAD &&
	     !(emitFCS != 3'd0) ;

  // rule RL_egress_PAD
  assign WILL_FIRE_RL_egress_PAD = txActive && doPad && !(emitFCS != 3'd0) ;

  // inputs to muxes for submodule ports
  assign MUX_crc$add_1__SEL_2 =
	     WILL_FIRE_RL_egress_Body || WILL_FIRE_RL_egress_EOF ;
  assign MUX_doPad$write_1__SEL_1 =
	     WILL_FIRE_RL_egress_EOF && lenCnt_value_1_ULT_60___d75 ;
  assign MUX_emitFCS$write_1__PSEL_1 =
	     WILL_FIRE_RL_egress_EOF || WILL_FIRE_RL_egress_PAD ;
  assign MUX_emitFCS$write_1__SEL_1 =
	     MUX_emitFCS$write_1__PSEL_1 && !lenCnt_value_1_ULT_60___d75 ;
  assign MUX_txActive$write_1__SEL_1 =
	     MUX_emitFCS$write_1__PSEL_1 && !lenCnt_value_1_ULT_60___d75 ;
  assign MUX_emitFCS$write_1__VAL_2 = emitFCS - 3'd1 ;
  assign MUX_ifgCnt_value$write_1__VAL_2 =
	     (ifgCnt_value == 5'h0) ? ifgCnt_value : ifgCnt_value - 5'd1 ;
  assign MUX_lenCnt_value$write_1__VAL_2 =
	     (lenCnt_value == 12'd4095) ?
	       lenCnt_value :
	       lenCnt_value + 12'd1 ;
  assign MUX_preambleCnt_value$write_1__VAL_3 =
	     (preambleCnt_value == 5'd31) ?
	       preambleCnt_value :
	       preambleCnt_value + 5'd1 ;
  always@(emitFCS or crc$result)
  begin
    case (emitFCS)
      3'd1: MUX_txData_1$wset_1__VAL_2 = crc$result[7:0];
      3'd2: MUX_txData_1$wset_1__VAL_2 = crc$result[15:8];
      3'd3: MUX_txData_1$wset_1__VAL_2 = crc$result[23:16];
      default: MUX_txData_1$wset_1__VAL_2 = crc$result[31:24];
    endcase
  end
  assign MUX_txData_1$wset_1__VAL_3 =
	     preambleCnt_value_5_ULT_7___d113 ?
	       8'd85 :
	       ((preambleCnt_value == 5'd7) ? 8'd213 : txF$D_OUT[7:0]) ;

  // inlined wires
  always@(MUX_crc$add_1__SEL_2 or
	  txF$D_OUT or
	  emitFCS or
	  MUX_txData_1$wset_1__VAL_2 or
	  WILL_FIRE_RL_egress_SOF or
	  MUX_txData_1$wset_1__VAL_3 or WILL_FIRE_RL_egress_PAD)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_crc$add_1__SEL_2: txData_1$wget = txF$D_OUT[7:0];
      emitFCS != 3'd0: txData_1$wget = MUX_txData_1$wset_1__VAL_2;
      WILL_FIRE_RL_egress_SOF: txData_1$wget = MUX_txData_1$wset_1__VAL_3;
      WILL_FIRE_RL_egress_PAD: txData_1$wget = 8'd0;
      default: txData_1$wget = 8'b10101010 /* unspecified value */ ;
    endcase
  end
  assign txData_1$whas =
	     WILL_FIRE_RL_egress_Body || WILL_FIRE_RL_egress_EOF ||
	     emitFCS != 3'd0 ||
	     WILL_FIRE_RL_egress_SOF ||
	     WILL_FIRE_RL_egress_PAD ;
  assign txDV_1$wget = 1'd1 ;
  assign txDV_1$whas =
	     WILL_FIRE_RL_egress_SOF || WILL_FIRE_RL_egress_Body ||
	     WILL_FIRE_RL_egress_EOF ||
	     WILL_FIRE_RL_egress_PAD ||
	     emitFCS != 3'd0 ;
  assign txER_1$wget = 1'b0 ;
  assign txER_1$whas = 1'b0 ;
  assign underflow_1$wget = 1'b0 ;
  assign underflow_1$whas = 1'b0 ;
  assign preambleCnt_incAction$whas = WILL_FIRE_RL_egress_SOF ;
  assign preambleCnt_decAction$whas = 1'b0 ;
  assign ifgCnt_incAction$whas = 1'b0 ;
  assign ifgCnt_decAction$whas = ifgCnt_value != 5'h0 ;
  assign lenCnt_incAction$whas =
	     WILL_FIRE_RL_egress_SOF && !preambleCnt_value_5_ULT_7___d113 &&
	     preambleCnt_value != 5'd7 ||
	     WILL_FIRE_RL_egress_Body ||
	     WILL_FIRE_RL_egress_EOF ||
	     WILL_FIRE_RL_egress_PAD ||
	     emitFCS != 3'd0 ;
  assign lenCnt_decAction$whas = 1'b0 ;

  // register doPad
  assign doPad$D_IN = MUX_doPad$write_1__SEL_1 ;
  assign doPad$EN =
	     WILL_FIRE_RL_egress_EOF && lenCnt_value_1_ULT_60___d75 ||
	     WILL_FIRE_RL_egress_PAD && !lenCnt_value_1_ULT_60___d75 ;

  // register emitFCS
  assign emitFCS$D_IN =
	     MUX_emitFCS$write_1__SEL_1 ? 3'd4 : MUX_emitFCS$write_1__VAL_2 ;
  assign emitFCS$EN =
	     (WILL_FIRE_RL_egress_EOF || WILL_FIRE_RL_egress_PAD) &&
	     !lenCnt_value_1_ULT_60___d75 ||
	     emitFCS != 3'd0 ;

  // register ifgCnt_value
  assign ifgCnt_value$D_IN =
	     (emitFCS == 3'd1) ? 5'd12 : MUX_ifgCnt_value$write_1__VAL_2 ;
  assign ifgCnt_value$EN = emitFCS == 3'd1 || ifgCnt_value != 5'h0 ;

  // register lenCnt_value
  assign lenCnt_value$D_IN =
	     (emitFCS == 3'd1) ? 12'd0 : MUX_lenCnt_value$write_1__VAL_2 ;
  assign lenCnt_value$EN =
	     emitFCS == 3'd1 || lenCnt_incAction$whas && !(emitFCS != 3'd0) ;

  // register preambleCnt_value
  assign preambleCnt_value$D_IN =
	     (emitFCS == 3'd1) ? 5'd0 : MUX_preambleCnt_value$write_1__VAL_3 ;
  assign preambleCnt_value$EN = emitFCS == 3'd1 || WILL_FIRE_RL_egress_SOF ;

  // register txActive
  assign txActive$D_IN = !MUX_txActive$write_1__SEL_1 ;
  assign txActive$EN =
	     (WILL_FIRE_RL_egress_EOF || WILL_FIRE_RL_egress_PAD) &&
	     !lenCnt_value_1_ULT_60___d75 ||
	     WILL_FIRE_RL_egress_SOF ;

  // register txDV
  assign txDV$D_IN = txDV_1$whas ;
  assign txDV$EN = 1'd1 ;

  // register txData
  assign txData$D_IN = txData_1$whas ? txData_1$wget : 8'd0 ;
  assign txData$EN = 1'd1 ;

  // register txER
  assign txER$D_IN = 1'b0 ;
  assign txER$EN = 1'd1 ;

  // register underflow
  assign underflow$D_IN = 1'b0 ;
  assign underflow$EN = 1'd1 ;

  // submodule crc
  assign crc$add_data = txF$D_OUT[7:0] ;
  assign crc$EN_add =
	     WILL_FIRE_RL_egress_SOF && !preambleCnt_value_5_ULT_7___d113 &&
	     preambleCnt_value != 5'd7 ||
	     WILL_FIRE_RL_egress_Body ||
	     WILL_FIRE_RL_egress_EOF ;
  assign crc$EN_clear = 1'b0 ;
  assign crc$EN_complete = 1'b0 ;

  // submodule txF
  assign txF$D_IN = txf_put ;
  assign txF$ENQ = EN_txf_put ;
  assign txF$DEQ =
	     WILL_FIRE_RL_egress_SOF && !preambleCnt_value_5_ULT_7___d113 &&
	     preambleCnt_value != 5'd7 ||
	     WILL_FIRE_RL_egress_Body ||
	     WILL_FIRE_RL_egress_EOF ;
  assign txF$CLR = 1'b0 ;

  // remaining internal signals
  assign lenCnt_value_1_ULT_60___d75 = lenCnt_value < 12'd60 ;
  assign preambleCnt_value_5_ULT_7___d113 = preambleCnt_value < 5'd7 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        doPad <= `BSV_ASSIGNMENT_DELAY 1'd0;
	emitFCS <= `BSV_ASSIGNMENT_DELAY 3'd0;
	ifgCnt_value <= `BSV_ASSIGNMENT_DELAY 5'd0;
	lenCnt_value <= `BSV_ASSIGNMENT_DELAY 12'd0;
	preambleCnt_value <= `BSV_ASSIGNMENT_DELAY 5'd0;
	txActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	txDV <= `BSV_ASSIGNMENT_DELAY 1'd0;
	txData <= `BSV_ASSIGNMENT_DELAY 8'd0;
	txER <= `BSV_ASSIGNMENT_DELAY 1'd0;
	underflow <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (doPad$EN) doPad <= `BSV_ASSIGNMENT_DELAY doPad$D_IN;
	if (emitFCS$EN) emitFCS <= `BSV_ASSIGNMENT_DELAY emitFCS$D_IN;
	if (ifgCnt_value$EN)
	  ifgCnt_value <= `BSV_ASSIGNMENT_DELAY ifgCnt_value$D_IN;
	if (lenCnt_value$EN)
	  lenCnt_value <= `BSV_ASSIGNMENT_DELAY lenCnt_value$D_IN;
	if (preambleCnt_value$EN)
	  preambleCnt_value <= `BSV_ASSIGNMENT_DELAY preambleCnt_value$D_IN;
	if (txActive$EN) txActive <= `BSV_ASSIGNMENT_DELAY txActive$D_IN;
	if (txDV$EN) txDV <= `BSV_ASSIGNMENT_DELAY txDV$D_IN;
	if (txData$EN) txData <= `BSV_ASSIGNMENT_DELAY txData$D_IN;
	if (txER$EN) txER <= `BSV_ASSIGNMENT_DELAY txER$D_IN;
	if (underflow$EN) underflow <= `BSV_ASSIGNMENT_DELAY underflow$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    doPad = 1'h0;
    emitFCS = 3'h2;
    ifgCnt_value = 5'h0A;
    lenCnt_value = 12'hAAA;
    preambleCnt_value = 5'h0A;
    txActive = 1'h0;
    txDV = 1'h0;
    txData = 8'hAA;
    txER = 1'h0;
    underflow = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkTxRS

