//
// Dual-Port RAM with different read/write addresses and single read/write clock
// and with a control for writing single bytes into the memory word; byte enable
// Note - bytes are VERY often not even close to 8 bits. 16 for colors, 18 for floats, etc. 
module byte_enabled_dual_port_ram (
	waddr,
	raddr,
	be,
	wdata,
	we,
	clk,
	q
);
	parameter int RADDR_WIDTH = 8;
	parameter int WADDR_WIDTH = 6;
	parameter int BYTE_WIDTH = 8;
	parameter int BYTES = 4;
	
	localparam int INPUT_WIDTH = BYTES * BYTE_WIDTH;
	localparam int WORDS = 1 << WADDR_WIDTH;
	localparam int RATIO = 1 << (RADDR_WIDTH - WADDR_WIDTH);
	localparam int OUTPUT_WIDTH = INPUT_WIDTH/RATIO;
	localparam int RAM_BYTE_SIZE = ((BYTE_WIDTH % 9) == 0) ? 9 : 8;
	localparam int EXPANSION = BYTE_WIDTH/RAM_BYTE_SIZE;
	
	input [WADDR_WIDTH-1:0] waddr;
	input [RADDR_WIDTH-1:0] raddr;
	input [BYTES-1:0] be;
	input [INPUT_WIDTH-1:0] wdata; 
	input we;
	input clk;
	output [OUTPUT_WIDTH-1:0] q;

	genvar i;
	generate		
		wire [(EXPANSION*BYTES)-1:0]byteena_a;
		for(i = 0; i < BYTES; i++) begin : expand_byte_en
			assign byteena_a[EXPANSION*i +: EXPANSION] = {EXPANSION{be[i]}};
		end
	endgenerate

// `ifndef ALTERA_RESERVED_QIS
// // synopsys translate_off
// `endif
// 	tri1	[7:0]  byteena_a;
// 	tri1	  clock;
// 	tri0	  wren;
// `ifndef ALTERA_RESERVED_QIS
// // synopsys translate_on
// `endif

	altsyncram	altsyncram_component (
				.address_a (waddr),
				.address_b (raddr),
				.byteena_a (byteena_a),
				.clock0 (clk),
				.data_a (wdata),
				.wren_a (we),
				.q_b (q),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_b ({OUTPUT_WIDTH{1'b1}}),
				.eccstatus (),
				.q_a (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_b = "NONE",
		altsyncram_component.address_reg_b = "CLOCK0",
		altsyncram_component.byte_size = RAM_BYTE_SIZE,
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_input_b = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.intended_device_family = "Cyclone IV E",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = WORDS,
		altsyncram_component.numwords_b = WORDS*RATIO,
		altsyncram_component.operation_mode = "DUAL_PORT",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_b = "CLOCK0",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.read_during_write_mode_mixed_ports = "DONT_CARE",
		altsyncram_component.widthad_a = WADDR_WIDTH,
		altsyncram_component.widthad_b = RADDR_WIDTH,
		altsyncram_component.width_a = INPUT_WIDTH,
		altsyncram_component.width_b = OUTPUT_WIDTH,
		altsyncram_component.width_byteena_a = EXPANSION*BYTES;
endmodule : byte_enabled_dual_port_ram

