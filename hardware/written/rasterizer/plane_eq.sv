module plane_eq #(
	SIZE=2
)
(
	input clk,
	input rst,

	input [17:0]dzdy,
	input [17:0]dzdx,
	input [17:0]c,
	input [15:0]x,
	input [15:0]y,
	output [SIZE-1:0][SIZE-1:0][17:0]z
);

	//compute dzdx * x + c for all x
	genvar i, j;
	wire [SIZE-1:0][17:0]x_result;
	generate
		for(i = 0; i < SIZE; i++) begin : x_loop
			//convert x values to floats
			wire [17:0]x_float;
			u16_f18 u0(
				.clk(clk),
				.areset(rst),
				.a(16'(x + i)),
				.q(x_float)
			);
			fma_f18 fma0(
				.clk(clk),
				.areset(rst),
				.a(x_float),
				.b(dzdx),
				.c(c),
				.q(x_result[i])
			);
		end
	endgenerate

	//mult has latency 4, fma has latency 13
	//this delays the y path by 9 cycles to compensate
	wire [15:0]y_delay;
	shift_reg #(
		.WIDTH(16),
		.DEPTH(9)
	) r0 (
		.clk(clk),
		.rst(rst),
		.clk_en(1),
		.in(y),
		.out(y_delay)
	);

	//compute dzdy * y for all y
	wire [SIZE-1:0][17:0]y_result;
	generate
		for(j = 0; j < SIZE; j++) begin :y_loop
			wire [17:0]y_float;
			u16_f18 u0(
				.clk(clk),
				.areset(rst),
				.a(16'(y_delay + j)),
				.q(y_float)
			);
			mult_f18 fma0(
				.clk(clk),
				.areset(rst),
				.a(y_float),
				.b(dzdy),
				.q(y_result[j])
			);
		end
	endgenerate

	//sum them together
	generate
		for(i = 0; i < SIZE; i++) begin : x_loop_2
			for(j = 0; j < SIZE; j++) begin : y_loop_2
				add_f18 a0(
					.clk(clk),
					.areset(rst),
					.a(x_result[j]),
					.b(y_result[i]),
					.q(z[i][j])
				);
			end
		end
	endgenerate

endmodule

