//
// Generated by Bluespec Compiler, version 2012.01.A (build 26572, 2012-01-17)
//
// On Sat Feb 18 16:12:02 EST 2012
//
//
// Ports:
// Name                         I/O  size props
// rxf_get                        O    11 reg
// RDY_rxf_get                    O     1 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// gmii_rxd_i                     I     8 reg
// gmii_rx_dv_i                   I     1 reg
// gmii_rx_er_i                   I     1 reg
// EN_rxf_get                     I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkRxRS(CLK,
	      RST_N,

	      gmii_rxd_i,

	      gmii_rx_dv_i,

	      gmii_rx_er_i,

	      EN_rxf_get,
	      rxf_get,
	      RDY_rxf_get);
  input  CLK;
  input  RST_N;

  // action method gmii_rxd
  input  [7 : 0] gmii_rxd_i;

  // action method gmii_rx_dv
  input  gmii_rx_dv_i;

  // action method gmii_rx_er
  input  gmii_rx_er_i;

  // actionvalue method rxf_get
  input  EN_rxf_get;
  output [10 : 0] rxf_get;
  output RDY_rxf_get;

  // signals for module outputs
  wire [10 : 0] rxf_get;
  wire RDY_rxf_get;

  // inlined wires
  wire [1 : 0] eof_1$wget;
  wire eof_1$whas, preambleCnt_decAction$whas, preambleCnt_incAction$whas;

  // register eof
  reg [1 : 0] eof;
  wire [1 : 0] eof$D_IN;
  wire eof$EN;

  // register preambleCnt_value
  reg [3 : 0] preambleCnt_value;
  wire [3 : 0] preambleCnt_value$D_IN;
  wire preambleCnt_value$EN;

  // register rxActive
  reg rxActive;
  wire rxActive$D_IN, rxActive$EN;

  // register rxDV
  reg rxDV;
  wire rxDV$D_IN, rxDV$EN;

  // register rxData
  reg [7 : 0] rxData;
  wire [7 : 0] rxData$D_IN;
  wire rxData$EN;

  // register rxER
  reg rxER;
  wire rxER$D_IN, rxER$EN;

  // register rxPipe
  reg [31 : 0] rxPipe;
  wire [31 : 0] rxPipe$D_IN;
  wire rxPipe$EN;

  // ports of submodule crc
  wire [31 : 0] crc$complete;
  wire [7 : 0] crc$add_data;
  wire crc$EN_add, crc$EN_clear, crc$EN_complete;

  // ports of submodule rxF
  wire [10 : 0] rxF$D_IN, rxF$D_OUT;
  wire rxF$CLR, rxF$DEQ, rxF$EMPTY_N, rxF$ENQ;

  // inputs to muxes for submodule ports
  wire [3 : 0] MUX_preambleCnt_value$write_1__VAL_3;
  wire MUX_rxActive$write_1__SEL_1;

  // actionvalue method rxf_get
  assign rxf_get = rxF$D_OUT ;
  assign RDY_rxf_get = rxF$EMPTY_N ;

  // submodule crc
  mkCRC32 crc(.CLK(CLK),
	      .RST_N(RST_N),
	      .add_data(crc$add_data),
	      .EN_add(crc$EN_add),
	      .EN_clear(crc$EN_clear),
	      .EN_complete(crc$EN_complete),
	      .RDY_add(),
	      .RDY_clear(),
	      .result(),
	      .RDY_result(),
	      .complete(crc$complete),
	      .RDY_complete());

  // submodule rxF
  FIFO2 #(.width(32'd11), .guarded(32'd1)) rxF(.RST_N(RST_N),
					       .CLK(CLK),
					       .D_IN(rxF$D_IN),
					       .ENQ(rxF$ENQ),
					       .DEQ(rxF$DEQ),
					       .CLR(rxF$CLR),
					       .D_OUT(rxF$D_OUT),
					       .FULL_N(),
					       .EMPTY_N(rxF$EMPTY_N));

  // inputs to muxes for submodule ports
  assign MUX_rxActive$write_1__SEL_1 =
	     rxDV && preambleCnt_value > 4'd6 && rxData == 8'd213 ;
  assign MUX_preambleCnt_value$write_1__VAL_3 =
	     (preambleCnt_value == 4'd15) ?
	       preambleCnt_value :
	       preambleCnt_value + 4'd1 ;

  // inlined wires
  assign eof_1$wget = (crc$complete == rxPipe) ? 2'd1 : 2'd2 ;
  assign eof_1$whas = !rxDV && rxActive ;
  assign preambleCnt_incAction$whas = rxDV && rxData == 8'd85 ;
  assign preambleCnt_decAction$whas = 1'b0 ;

  // register eof
  assign eof$D_IN = eof_1$whas ? eof_1$wget : 2'd0 ;
  assign eof$EN = 1'd1 ;

  // register preambleCnt_value
  assign preambleCnt_value$D_IN =
	     (!rxDV) ? 4'd0 : MUX_preambleCnt_value$write_1__VAL_3 ;
  assign preambleCnt_value$EN = preambleCnt_incAction$whas || !rxDV ;

  // register rxActive
  assign rxActive$D_IN = MUX_rxActive$write_1__SEL_1 ;
  assign rxActive$EN =
	     rxDV && preambleCnt_value > 4'd6 && rxData == 8'd213 || !rxDV ;

  // register rxDV
  assign rxDV$D_IN = gmii_rx_dv_i ;
  assign rxDV$EN = 1'd1 ;

  // register rxData
  assign rxData$D_IN = gmii_rxd_i ;
  assign rxData$EN = 1'd1 ;

  // register rxER
  assign rxER$D_IN = gmii_rx_er_i ;
  assign rxER$EN = 1'd1 ;

  // register rxPipe
  assign rxPipe$D_IN = { rxPipe[23:0], rxData } ;
  assign rxPipe$EN = rxDV ;

  // submodule crc
  assign crc$add_data = rxData ;
  assign crc$EN_add = rxDV && rxActive ;
  assign crc$EN_clear = 1'b0 ;
  assign crc$EN_complete = !rxDV ;

  // submodule rxF
  assign rxF$D_IN = 11'h0 ;
  assign rxF$ENQ = 1'b0 ;
  assign rxF$DEQ = EN_rxf_get ;
  assign rxF$CLR = 1'b0 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        eof <= `BSV_ASSIGNMENT_DELAY 2'd0;
	preambleCnt_value <= `BSV_ASSIGNMENT_DELAY 4'd0;
	rxActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rxDV <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rxER <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (eof$EN) eof <= `BSV_ASSIGNMENT_DELAY eof$D_IN;
	if (preambleCnt_value$EN)
	  preambleCnt_value <= `BSV_ASSIGNMENT_DELAY preambleCnt_value$D_IN;
	if (rxActive$EN) rxActive <= `BSV_ASSIGNMENT_DELAY rxActive$D_IN;
	if (rxDV$EN) rxDV <= `BSV_ASSIGNMENT_DELAY rxDV$D_IN;
	if (rxER$EN) rxER <= `BSV_ASSIGNMENT_DELAY rxER$D_IN;
      end
    if (rxData$EN) rxData <= `BSV_ASSIGNMENT_DELAY rxData$D_IN;
    if (rxPipe$EN) rxPipe <= `BSV_ASSIGNMENT_DELAY rxPipe$D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    eof = 2'h2;
    preambleCnt_value = 4'hA;
    rxActive = 1'h0;
    rxDV = 1'h0;
    rxData = 8'hAA;
    rxER = 1'h0;
    rxPipe = 32'hAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkRxRS

