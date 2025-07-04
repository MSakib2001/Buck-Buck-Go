// output_io.v

// Generated using ACDS version 20.1 720

`timescale 1 ps / 1 ps
module output_io (
		input  wire        clk_clk,                      //                clk.clk
		input  wire [31:0] output_fifo_in_writedata,     //     output_fifo_in.writedata
		input  wire        output_fifo_in_write,         //                   .write
		output wire        output_fifo_in_waitrequest,   //                   .waitrequest
		input  wire [2:0]  output_fifo_in_csr_address,   // output_fifo_in_csr.address
		input  wire        output_fifo_in_csr_read,      //                   .read
		input  wire [31:0] output_fifo_in_csr_writedata, //                   .writedata
		input  wire        output_fifo_in_csr_write,     //                   .write
		output wire [31:0] output_fifo_in_csr_readdata,  //                   .readdata
		input  wire        reset_reset_n                 //              reset.reset_n
	);

	wire  [31:0] output_jtag_master_master_readdata;              // mm_interconnect_0:output_jtag_master_master_readdata -> output_jtag_master:master_readdata
	wire         output_jtag_master_master_waitrequest;           // mm_interconnect_0:output_jtag_master_master_waitrequest -> output_jtag_master:master_waitrequest
	wire  [31:0] output_jtag_master_master_address;               // output_jtag_master:master_address -> mm_interconnect_0:output_jtag_master_master_address
	wire         output_jtag_master_master_read;                  // output_jtag_master:master_read -> mm_interconnect_0:output_jtag_master_master_read
	wire   [3:0] output_jtag_master_master_byteenable;            // output_jtag_master:master_byteenable -> mm_interconnect_0:output_jtag_master_master_byteenable
	wire         output_jtag_master_master_readdatavalid;         // mm_interconnect_0:output_jtag_master_master_readdatavalid -> output_jtag_master:master_readdatavalid
	wire         output_jtag_master_master_write;                 // output_jtag_master:master_write -> mm_interconnect_0:output_jtag_master_master_write
	wire  [31:0] output_jtag_master_master_writedata;             // output_jtag_master:master_writedata -> mm_interconnect_0:output_jtag_master_master_writedata
	wire  [31:0] mm_interconnect_0_output_fifo_out_readdata;      // output_fifo:avalonmm_read_slave_readdata -> mm_interconnect_0:output_fifo_out_readdata
	wire         mm_interconnect_0_output_fifo_out_waitrequest;   // output_fifo:avalonmm_read_slave_waitrequest -> mm_interconnect_0:output_fifo_out_waitrequest
	wire         mm_interconnect_0_output_fifo_out_read;          // mm_interconnect_0:output_fifo_out_read -> output_fifo:avalonmm_read_slave_read
	wire  [31:0] mm_interconnect_0_output_fifo_out_csr_readdata;  // output_fifo:rdclk_control_slave_readdata -> mm_interconnect_0:output_fifo_out_csr_readdata
	wire   [2:0] mm_interconnect_0_output_fifo_out_csr_address;   // mm_interconnect_0:output_fifo_out_csr_address -> output_fifo:rdclk_control_slave_address
	wire         mm_interconnect_0_output_fifo_out_csr_read;      // mm_interconnect_0:output_fifo_out_csr_read -> output_fifo:rdclk_control_slave_read
	wire         mm_interconnect_0_output_fifo_out_csr_write;     // mm_interconnect_0:output_fifo_out_csr_write -> output_fifo:rdclk_control_slave_write
	wire  [31:0] mm_interconnect_0_output_fifo_out_csr_writedata; // mm_interconnect_0:output_fifo_out_csr_writedata -> output_fifo:rdclk_control_slave_writedata
	wire         rst_controller_reset_out_reset;                  // rst_controller:reset_out -> [mm_interconnect_0:output_fifo_reset_out_reset_bridge_in_reset_reset, mm_interconnect_0:output_jtag_master_clk_reset_reset_bridge_in_reset_reset, output_fifo:rdreset_n, output_fifo:wrreset_n]

	output_io_output_fifo output_fifo (
		.wrclock                          (clk_clk),                                         //    clk_in.clk
		.wrreset_n                        (~rst_controller_reset_out_reset),                 //  reset_in.reset_n
		.rdclock                          (clk_clk),                                         //   clk_out.clk
		.rdreset_n                        (~rst_controller_reset_out_reset),                 // reset_out.reset_n
		.avalonmm_write_slave_writedata   (output_fifo_in_writedata),                        //        in.writedata
		.avalonmm_write_slave_write       (output_fifo_in_write),                            //          .write
		.avalonmm_write_slave_waitrequest (output_fifo_in_waitrequest),                      //          .waitrequest
		.avalonmm_read_slave_readdata     (mm_interconnect_0_output_fifo_out_readdata),      //       out.readdata
		.avalonmm_read_slave_read         (mm_interconnect_0_output_fifo_out_read),          //          .read
		.avalonmm_read_slave_waitrequest  (mm_interconnect_0_output_fifo_out_waitrequest),   //          .waitrequest
		.rdclk_control_slave_address      (mm_interconnect_0_output_fifo_out_csr_address),   //   out_csr.address
		.rdclk_control_slave_read         (mm_interconnect_0_output_fifo_out_csr_read),      //          .read
		.rdclk_control_slave_writedata    (mm_interconnect_0_output_fifo_out_csr_writedata), //          .writedata
		.rdclk_control_slave_write        (mm_interconnect_0_output_fifo_out_csr_write),     //          .write
		.rdclk_control_slave_readdata     (mm_interconnect_0_output_fifo_out_csr_readdata),  //          .readdata
		.rdclk_control_slave_irq          (),                                                //   out_irq.irq
		.wrclk_control_slave_address      (output_fifo_in_csr_address),                      //    in_csr.address
		.wrclk_control_slave_read         (output_fifo_in_csr_read),                         //          .read
		.wrclk_control_slave_writedata    (output_fifo_in_csr_writedata),                    //          .writedata
		.wrclk_control_slave_write        (output_fifo_in_csr_write),                        //          .write
		.wrclk_control_slave_readdata     (output_fifo_in_csr_readdata),                     //          .readdata
		.wrclk_control_slave_irq          ()                                                 //    in_irq.irq
	);

	output_io_output_jtag_master #(
		.USE_PLI     (0),
		.PLI_PORT    (50000),
		.FIFO_DEPTHS (2)
	) output_jtag_master (
		.clk_clk              (clk_clk),                                 //          clk.clk
		.clk_reset_reset      (~reset_reset_n),                          //    clk_reset.reset
		.master_address       (output_jtag_master_master_address),       //       master.address
		.master_readdata      (output_jtag_master_master_readdata),      //             .readdata
		.master_read          (output_jtag_master_master_read),          //             .read
		.master_write         (output_jtag_master_master_write),         //             .write
		.master_writedata     (output_jtag_master_master_writedata),     //             .writedata
		.master_waitrequest   (output_jtag_master_master_waitrequest),   //             .waitrequest
		.master_readdatavalid (output_jtag_master_master_readdatavalid), //             .readdatavalid
		.master_byteenable    (output_jtag_master_master_byteenable),    //             .byteenable
		.master_reset_reset   ()                                         // master_reset.reset
	);

	output_io_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                            (clk_clk),                                         //                                          clk_0_clk.clk
		.output_fifo_reset_out_reset_bridge_in_reset_reset        (rst_controller_reset_out_reset),                  //        output_fifo_reset_out_reset_bridge_in_reset.reset
		.output_jtag_master_clk_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                  // output_jtag_master_clk_reset_reset_bridge_in_reset.reset
		.output_jtag_master_master_address                        (output_jtag_master_master_address),               //                          output_jtag_master_master.address
		.output_jtag_master_master_waitrequest                    (output_jtag_master_master_waitrequest),           //                                                   .waitrequest
		.output_jtag_master_master_byteenable                     (output_jtag_master_master_byteenable),            //                                                   .byteenable
		.output_jtag_master_master_read                           (output_jtag_master_master_read),                  //                                                   .read
		.output_jtag_master_master_readdata                       (output_jtag_master_master_readdata),              //                                                   .readdata
		.output_jtag_master_master_readdatavalid                  (output_jtag_master_master_readdatavalid),         //                                                   .readdatavalid
		.output_jtag_master_master_write                          (output_jtag_master_master_write),                 //                                                   .write
		.output_jtag_master_master_writedata                      (output_jtag_master_master_writedata),             //                                                   .writedata
		.output_fifo_out_read                                     (mm_interconnect_0_output_fifo_out_read),          //                                    output_fifo_out.read
		.output_fifo_out_readdata                                 (mm_interconnect_0_output_fifo_out_readdata),      //                                                   .readdata
		.output_fifo_out_waitrequest                              (mm_interconnect_0_output_fifo_out_waitrequest),   //                                                   .waitrequest
		.output_fifo_out_csr_address                              (mm_interconnect_0_output_fifo_out_csr_address),   //                                output_fifo_out_csr.address
		.output_fifo_out_csr_write                                (mm_interconnect_0_output_fifo_out_csr_write),     //                                                   .write
		.output_fifo_out_csr_read                                 (mm_interconnect_0_output_fifo_out_csr_read),      //                                                   .read
		.output_fifo_out_csr_readdata                             (mm_interconnect_0_output_fifo_out_csr_readdata),  //                                                   .readdata
		.output_fifo_out_csr_writedata                            (mm_interconnect_0_output_fifo_out_csr_writedata)  //                                                   .writedata
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule
