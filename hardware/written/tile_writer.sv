module tile_writer (
	//gpu clk domain for reading buffer
	input gpu_clk,
	input gpu_rst,
	input [15:0]stride_in,
	input [31:0]addr_in,
	input start,
	output reading,
	output flushed,

	//access tile RAM
	output [9:0]ram_addr_out,
	input [15:0]ram_data,

	//system clk domain for avalon master
	input clk,
	input rst,

	output [31:0]master_address,
	output master_write,
	output [31:0]master_write_data,
	input master_wait_request
);

	assign reading = (state != S_IDLE);
	assign flushed = !reading && wrempty;
	assign ram_addr_out = ram_addr;
	
	//whenever the fifo is at least half-empty, write 16 pixels into it
	wire shouldWriteBurst = !usedw[7] && !full;
	wire shouldWrite = shouldWriteBurst || (ram_addr[3:0] != 0);
	
	
	enum int unsigned
	{
		S_IDLE,
		S_WAIT,
		S_SAVE,
		S_WRITE
	} state;

	reg [15:0]savedPixel;
	reg [9:0]ram_addr;
	reg [31:0]currAddr;
	reg [15:0]stride;
	
	always_ff @ (posedge gpu_clk or posedge gpu_rst) begin
		if (gpu_rst) begin
			state <= S_IDLE;
			currAddr <= 0;
			stride <= 0;
			savedPixel <= 0;
			ram_addr <= 0;
		end else begin
			case (state)
			
				S_IDLE: begin
					if (start) begin
						currAddr <= addr_in;
						stride <= stride_in;
						ram_addr <= 0;
						state <= S_WAIT;
					end
				end
				
				S_WAIT: begin
					if(shouldWrite) begin
						ram_addr <= ram_addr + 1'd1;
						state <= S_SAVE;
					end
				end
				
				S_SAVE: begin
					savedPixel <= ram_data;
					ram_addr <= ram_addr + 1'd1;
					state <= S_WRITE;
				end
				
				S_WRITE: begin
					if(ram_addr[4:0] == 0) begin
						currAddr <= currAddr + stride - 60;
					end else begin
						currAddr <= currAddr + 4;
					end	
					
					if(ram_addr == 0) begin
						state <= S_IDLE;
					end else if(shouldWrite) begin
						ram_addr <= ram_addr + 1'd1;
						state <= S_SAVE;
					end else begin
						state <= S_WAIT;
					end

				end
				
			endcase
		end
	end

	wire [63:0]fifo_data_in = {currAddr, ram_data, savedPixel};
	wire fifo_wren = (state == S_WRITE);
	
	wire [63:0]fifo_data_out;
	wire empty;
	wire wrempty;
	wire full;
	wire fifo_ack;
	wire [7:0]usedw;
	tile_fifo f0(
		.aclr (gpu_rst),
		.data (fifo_data_in),
		.rdclk(clk),
		.rdreq(fifo_ack),
		.wrclk(gpu_clk),
		.wrempty(wrempty),
		.wrreq(fifo_wren),
		.q(fifo_data_out),
		.rdempty(empty),
		.wrfull(full),
		.wrusedw(usedw)
	);
	
	
	//write the fifo data out over avalon bus
	assign master_address = fifo_data_out[63:32];
	assign master_write_data = fifo_data_out[31:0];
	assign master_write = !empty;
 	assign fifo_ack = !master_wait_request && master_write;

endmodule
