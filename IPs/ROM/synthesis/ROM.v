// ROM.v

// Generated using ACDS version 24.1 1077

`timescale 1 ps / 1 ps
module ROM (
		input  wire        clk_rom_clk,           //   clk_rom.clk
		input  wire [9:0]  rom_slave_address,     // rom_slave.address
		input  wire        rom_slave_debugaccess, //          .debugaccess
		input  wire        rom_slave_clken,       //          .clken
		input  wire        rom_slave_chipselect,  //          .chipselect
		input  wire        rom_slave_write,       //          .write
		output wire [31:0] rom_slave_readdata,    //          .readdata
		input  wire [31:0] rom_slave_writedata,   //          .writedata
		input  wire [3:0]  rom_slave_byteenable,  //          .byteenable
		input  wire        rst_rom_reset          //   rst_rom.reset
	);

	ROM_onchip_memory2_0 onchip_memory2_0 (
		.clk         (clk_rom_clk),           //   clk1.clk
		.address     (rom_slave_address),     //     s1.address
		.debugaccess (rom_slave_debugaccess), //       .debugaccess
		.clken       (rom_slave_clken),       //       .clken
		.chipselect  (rom_slave_chipselect),  //       .chipselect
		.write       (rom_slave_write),       //       .write
		.readdata    (rom_slave_readdata),    //       .readdata
		.writedata   (rom_slave_writedata),   //       .writedata
		.byteenable  (rom_slave_byteenable),  //       .byteenable
		.reset       (rst_rom_reset),         // reset1.reset
		.reset_req   (1'b0),                  // (terminated)
		.freeze      (1'b0)                   // (terminated)
	);

endmodule
