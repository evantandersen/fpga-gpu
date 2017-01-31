module dram_to_fifo(
	input clk,
	input resetn,
	
	input [31:0]base_addr,
	input [31:0]numWords,
	input readVector,
	output done,
	
	//avalon master for accessing SDRAM
	output [31:0]master_address, 
	output master_read, 
	input [31:0]master_read_data, 
	input master_wait_request,
	input master_read_data_valid,
	output [7:0]master_burst_count,

	input readreq,
	output [31:0]data_out,
	output fifo_empty
);

	//the fifo itself
	wire wrfull;
	wire [9:0]usedw;
	gpu_dram_read	F0 (
		.clock ( clk ),
		.data ( master_read_data ),
		.rdreq ( readreq ),
		.wrreq ( master_read_data_valid ),
		.empty ( fifo_empty ),
		.full ( wrfull ),
		.q ( data_out ),
		.usedw ( usedw )
	);

	
	localparam burst_power = 3;
	localparam burstAmount = 1 << burst_power;
	assign master_burst_count = wordsLeftInBurst;
	assign master_address = currAddress; 
	
	reg master_read_reg;
	assign master_read = master_read_reg;
	
	reg state;
	reg [31:0]currAddress;
	reg [31:0]wordsLeft;
	assign done = (wordsLeft == 32'd0);
	
	reg [burst_power - 1:0]wordsLeftInBurst;
	always @ (posedge clk or negedge resetn) begin
		if(!resetn) begin
			currAddress <= 32'd0;
			wordsLeft <= 32'd0;
			master_read_reg <= 1'b0;
			wordsLeftInBurst <=  0;
			state <= 1'd0;
		end else begin
			case (state)
				1'd0: begin
					if (readVector) begin
						currAddress <= base_addr;
						wordsLeft <= numWords;
						master_read_reg <= 1'b0;
						wordsLeftInBurst <= {burst_power{1'b0}};
					end else if (!usedw[9] && (wordsLeft > 32'd0)) begin
						master_read_reg <= 1'b1;
						wordsLeftInBurst <= wordsLeft > burstAmount ? burstAmount : wordsLeft;
						state <= 1'd1;
					end
				end
				1'd1: begin
					if (!master_wait_request) begin
						master_read_reg <= 1'b0;
					end
					if(master_read_data_valid) begin
						wordsLeftInBurst <= wordsLeftInBurst - 1;
						wordsLeft <= wordsLeft - 1;
						currAddress <= currAddress + 4;
						if(wordsLeftInBurst == 1) begin
							state <= 1'd0;
						end
					end
				end
			endcase
		end
	end

	
	
endmodule


