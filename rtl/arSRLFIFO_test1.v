//
// Generated by Bluespec Compiler, version 2009.11.beta2 (build 18693, 2009-11-24)
//
// On Wed Oct  6 14:55:31 EDT 2010
//
//
// Ports:
// Name                         I/O  size props
// CLK                            I     1 clock
// RST_N                          I     1 reset
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module arSRLFIFO_test1(CLK,
		       RST_N);
  input  CLK;
  input  RST_N;

  // ports of submodule i
  wire [7 : 0] i$D_IN;
  wire i$CLR, i$DEQ, i$ENQ;

  // submodule i
  arSRLFIFO #(.width(32'd8), .l2depth(32'd5), .depth(32'd32)) i(.CLK(CLK),
								.RST_N(RST_N),
								.D_IN(i$D_IN),
								.DEQ(i$DEQ),
								.ENQ(i$ENQ),
								.CLR(i$CLR),
								.EMPTY_N(),
								.D_OUT(),
								.FULL_N());

  // submodule i
  assign i$DEQ = 1'b0 ;
  assign i$D_IN = 8'h0 ;
  assign i$ENQ = 1'b0 ;
  assign i$CLR = 1'b0 ;
endmodule  // arSRLFIFO_test1

