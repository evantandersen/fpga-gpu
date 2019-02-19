module edge_function #(
	ORDER=1,
	parameter SIZE= 1 << ORDER
)(
	input clk,
	input rst,
	
	input start,
	input row_end,
	input [18:0]dx,
	input [23:0]dy,
	input [31:0]w_in,
	
	output [SIZE-1:0][SIZE-1:0]sign
);
	
	reg [31:0]w;
	reg [31:0]w_row;
	
	//sign extend
	wire [31:0]dx_ex = {{13{dx[18]}}, dx};
	wire [31:0]dy_ex = {{8{dy[23]}}, dy};
			
	wire [31:0]row_adder = w_row + dy_ex*SIZE;
	wire [31:0]col_adder = w + dx_ex*SIZE;

	reg [SIZE-1:0][SIZE-1:0]out_reg;
	assign sign = out_reg;
	
	
	always_ff @ (posedge clk or posedge rst) begin
		if(rst) begin
			w <= 0;
			w_row <= 0;
			out_reg <= 0;
		end else begin
			out_reg <= sign_bits;
			if(start) begin
				w <= w_in;
				w_row <= w_in;
			end else begin
				if(row_end) begin
					w <= row_adder;
					w_row <= row_adder;
				end else begin
					w <= col_adder;
				end
			end
		end
	end

	wire [SIZE-1:0][SIZE-1:0]sign_bits;
	
	genvar i,j;
	generate
		//generate the x and y offsets
		//NOTE - this code may have to be improved for SIZE>2
		wire [SIZE-1:0][31:0]xDelta;
		wire [SIZE-1:0][31:0]yDelta;
		for(i = 0; i < SIZE; i++) begin : l0
			assign xDelta[i] = dx_ex * i;
			assign yDelta[i] = dy_ex * i;
		end
		
		//sum it all up and register the sign bit (MSB)
		for(i = 0; i < SIZE; i++) begin : l1
			for(j = 0; j < SIZE; j++) begin : l2
				wire [31:0]result;
				fast_3_adder a0(
					.a	(w),
					.b	(xDelta[j]),
					.c	(yDelta[i]),
					.q	(result)
				);
				assign sign_bits[i][j] = result[31];
			end
		end
	endgenerate
	
	
	
	
endmodule
