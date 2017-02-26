
module fifo_writer(
	input clk,
	input resetn,
	input [15:0]stride_in,
	input [31:0]addr_in,
	input start,
	output running_out,
	
	input [31:0]fifo_data,
	input fifo_empty,
	output fifo_ack,
	
	//avalon master for writing
	output [31:0]master_address,
	output master_write,
	output [31:0]master_write_data,
	input master_wait_request
);

//	parameter row_word_width = 16;
//	parameter rows = 32;
	
	reg [31:0]currAddr;
	reg [15:0]stride;
	assign master_address = currAddr;
	assign master_write_data = fifo_data;
	reg [4:0]currLine;
	reg [3:0]currCol;
	reg running;
	assign running_out = running;
	assign master_write = running & !fifo_empty;
 
	wire done_row = (currCol == 15);
	wire last_line = (currLine == 31);
	assign fifo_ack = !master_wait_request && master_write;
 
 
	always @ (posedge clk or negedge resetn) begin
		if (!resetn) begin
			currAddr <= 0;
			currLine <= 0;
			currCol <= 0;
			running <= 0;
			stride <= 0;
		end else begin
			case(running)
				0: begin
					if(start) begin
						currAddr <= addr_in;
						stride <= stride_in;
						currCol <= 0;
						currLine <= 0;
						running <= 1;
					end
				end
				1:begin 
					if(fifo_ack) begin
						currCol <= currCol + 1'd1;
						if(done_row) begin
							currLine <= currLine + 1'd1;					
							currAddr <= currAddr + stride - 60;
						end else begin
							currAddr <= currAddr + 4;
						end
						if(done_row && last_line) begin
							running <= 0;
						end
					end
				end
			endcase
		end
	end


endmodule
