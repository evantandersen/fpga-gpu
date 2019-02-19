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
	output [8:0]ram_addr_out,
	input [31:0]ram_data,

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
	
	reg [8:0]ram_addr;
	reg [31:0]currAddr;
	reg [15:0]stride;
	
	wire [31:0]addr_out = shift_out[31:0];
	wire fifo_wren = shift_out[32];

	wire [32:0]shift_out;
	wire isWriting = (state == S_WRITE);
	shift_reg #(
		.WIDTH(33),
		.DEPTH(2)
	) addrDelay (
		.clk	(gpu_clk),
		.rst	(gpu_rst),
		.clk_en(1),
		.in	({isWriting, currAddr}),
		.out	(shift_out)
	);
	
	enum {
		S_IDLE,
		S_WAIT,
		S_WRITE
	} state;
	
	always_ff @ (posedge gpu_clk or posedge gpu_rst) begin
		if (gpu_rst) begin
			currAddr <= 0;
			stride <= 0;
			ram_addr <= 0;
			state <= S_IDLE;
		end else begin
			case(state)
				S_IDLE: begin
					if (start) begin
						currAddr <= addr_in;
						stride <= stride_in;
						ram_addr <= 0;
						state <= S_WAIT;
					end
				end
				//wait for space in fifo
				S_WAIT: begin
					if(!usedw[7] && !full) begin
						state <= S_WRITE;
					end
				end
				//whenever the fifo is at least half-empty, write 32 pixels into it
				S_WRITE: begin
					if(ram_addr[3:0] == 15) begin
						currAddr <= currAddr + stride - 60;
					end else begin
						currAddr <= currAddr + 4;
					end
					ram_addr <= ram_addr + 1'd1;
					if(ram_addr == 511) begin
						state <= S_IDLE;
					end else if(ram_addr[3:0] == 4'd15) begin
						state <= S_WAIT;
					end
				end
			endcase
		end
	end

	wire [63:0]fifo_data_in = {addr_out, ram_data};
	
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
