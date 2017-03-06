
module fifo_writer(
	input clk,
	input resetn,
	
	input [31:0]data,
	input [31:0]addr,
	input fifo_empty,
	output fifo_ack,
	
	//avalon master for writing
	output [31:0]master_address,
	output master_write,
	output [31:0]master_write_data,
	input master_wait_request
);


endmodule
