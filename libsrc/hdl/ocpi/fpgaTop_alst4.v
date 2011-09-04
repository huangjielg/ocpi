// fpgaTop_alst4.v - the top-level Verilog for the Altera 4SGX230N board
// Copyright (c) 2011 Atomic Rules LLC - ALL RIGHTS RESERVED
//

module fpgaTop (
  input  wire         sys0_clk,       // 200MHz free-running
  input  wire         sys0_rstn,      // External active-low reset 
  input  wire         pcie_clk,       // PCIe Clock
  input  wire         pcie_rstn,      // PCIe Reset
  input  wire [ 3:0]  pcie_rx,        // PCIe lanes...
  output wire [ 3:0]  pcie_tx,
  input  wire [ 7:0]  usr_sw,         // dip-switches
  output wire [15:0]  led,            // leds
  input  wire [15:0]  hsmc_in,        // HSMC_Inputs  D0 :15
  output wire [15:0]  hsmc_out,       // HSMC_Outputs D16:31
  output wire [19:0]  led_cathode,    // LED cathodes
  output wire [19:0]  led_anode,      // LED anodes,
  output wire [ 3:0]  lcd_db,         // LCD databus
  output wire         lcd_e,          // LCD enable
  output wire         lcd_rs,         // LCD register-select
  output wire         lcd_rw,         // LCD read-not-write
  input  wire         ppsExtIn,       // PPS in
  output wire         ppsOut,         // PPS out
  output wire [25:0]  fsm_a,          // Shared FLASH and SRAM address
  inout  wire [31:0]  fsm_d,          // Shared FLASH[15:0]and SRAM[31:0] data
  /*
  output wire         sram_clk,       // SRAM clock
  output wire         sram_oen,       // SRAM output enable
  output wire         sram_cen,       // SRAM chip enable
  inout  wire [3:0]   sram_dqp,       // SRAM data bus parity bits
  output wire         sram_bwen,      // SRAM Byte Write enable
  output wire [3:0]   sram_bwn,       // SRAM Byte Lane Write enables
  output wire         sram_gwn,       // SRAM Global Write enable
  output wire         sram_adscn,     // SRAM Address Status Controller
  output wire         sram_adspn,     // SRAM Address Status Processor
  output wire         sram_advn,      // SRAM Address Valid
  output wire         sram_zz,        // SRAM Sleep
  */
  output wire         flash_clk,      // FLASH clock
  output wire         flash_resetn,   // FLASH reset
  output wire         flash_cen,      // FLASH chip enable
  output wire         flash_oen,      // FLASH output enable
  output wire         flash_wen,      // FLASH write enable
  output wire         flash_advn,     // FLASH Address Valid
  input  wire         flash_rdybsyn   // FLASH Ready
);

// Instance and connect mkFTop...
 mkFTop_alst4 ftop (
  .sys0_clk          (sys0_clk),
  .sys0_rstn         (sys0_rstn),
  .pcie_clk          (pcie_clk),
  .pcie_rstn         (pcie_rstn),
  .pcie_rx_i         (pcie_rx),
  .pcie_tx           (pcie_tx),
  .usr_sw_i          (usr_sw),
  .led               (led),
  .p125clk           (),
  .CLK_GATE_p125clk  (),
  .p125rst           (),
  .hsmc_in_i         (hsmc_in),
  .hsmc_out          (hsmc_out),
  .led_cathode       (led_cathode),
  .led_anode         (led_anode),
  .lcd_db            (lcd_db),
  .lcd_e             (lcd_e),
  .lcd_rs            (lcd_rs),
  .lcd_rw            (lcd_rw),
  .gps_ppsSyncIn_x   (ppsExtIn),
  .gps_ppsSyncOut    (ppsOut), 
  .flash_addr        (fsm_a[23:0]),
  .flash_io_dq       (fsm_d),
  /*
  .sram_clk          (sram_clk),
  .sram_oen          (sram_oen),
  .sram_cen          (sram_cen),
  .sram_dqp          (sram_dqp),
  .sram_bwen         (sram_bwen),
  .sram_bwn          (sram_bwn),
  .sram_gwn          (sram_gwn),
  .sram_adscn        (sram_adscn),
  .sram_adspn        (sram_adspn),
  .sram_advn         (sram_advn),
  .sram_zz           (sram_zz),
  */
//  .flash_clk         (flash_clk),
//  .flash_resetn      (flash_resetn),
  .flash_ce_n        (flash_cen),
  .flash_oe_n        (flash_oen),
  .flash_we_n        (flash_wen),
//  .flash_advn        (flash_advn),
  .flash_fwait_i     (flash_rdybsyn)
);

assign fsm_a[25:24] = 0;

endmodule
