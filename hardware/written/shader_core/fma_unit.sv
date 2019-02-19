module fma_unit(
	input clk,
	input rst,
	
	input	[1:0]op,
	input [17:0]a,	
	input [17:0]b,	
	input [17:0]c,
	
	output [17:0]q
);


	reg [17:0]a_reg;
	reg [17:0]b_reg;
	reg [17:0]c_reg;

	//constant 1.0f
	wire [17:0]one = {2'b0, {5{1'b1}}, 11'b0};
	wire [17:0]zero = 18'b0;
	
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			a_reg <= 0;
			b_reg <= 0;
			c_reg <= 0;
		end
		case (op)
			// add - a * 1 + c
			2'd0: begin
				a_reg <= a;
				b_reg <= one;
				c_reg <= c;
			end
			// sub - a * 1 + (-c)
			2'd1: begin
				a_reg <= a;
				b_reg <= one;
				c_reg <= {~c[17], c[16:0]};
			end
			// mult - a * b + 0
			2'd2: begin
				a_reg <= a;
				b_reg <= b;
				c_reg <= zero;
			end
			// fma - a * b + c
			2'd3: begin
				a_reg <= a;
				b_reg <= b;
				c_reg <= c;
			end
		endcase
	end
	
	fma_f18 fma(
		.clk(clk),
		.areset(rst),
		
		.a(a_reg),
		.b(b_reg),
		.c(c_reg),
		.q(q)
	);
	

endmodule
