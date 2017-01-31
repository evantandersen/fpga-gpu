
module fifo_writer(
	input clk,
	input resetn,
	input [15:0]stride,

	input [15:0]fifo_data,
	input fifo_empty,
	output fifo_ack,
	
	//avalon master for writing
	output [31:0]master_address,
	output master_write,
	output [15:0]master_write_data,
	input master_wait_request
);
	
	reg [31:0]currAddr;
	assign master_address = currAddr;
	assign master_write_data = fifo_data;
	reg [4:0]currLine;
	reg [4:0]currCol;
	reg [1:0]state;
	assign master_write = (state == 2'd2) & !fifo_empty;
 
 
	wire done_row = (currCol == 5'd31);
	wire last_line = (currLine == 5'd31);
	assign fifo_ack = !master_wait_request & !fifo_empty;
 
 
	always @ (posedge clk or negedge resetn) begin
		if (!resetn) begin
			currAddr <= 32'd0;
			currLine <= 5'd0;
			currCol <= 5'd0;
			state <= 2'b0;
		end else begin
			case(state)
				2'd0: begin
					if(!fifo_empty) begin
						currAddr[31:16] <= fifo_data;
						state <= 2'd1;
					end
				end
				2'd1: begin
					if(!fifo_empty) begin
						currAddr[15:0] <= fifo_data;
						state <= 2'd2;
					end
				end
				2'd2:begin 
					if(!master_wait_request) begin
						currCol <= currCol + 5'd1;
						if(done_row) begin
							currLine <= currLine + 5'd1;					
							currAddr <= currAddr + stride - 62;
						end else begin
							currAddr <= currAddr + 2;
						end
						if(done_row && last_line) begin
							state <= 2'd0;
						end
					end
				end
			endcase
		end
	end


endmodule
