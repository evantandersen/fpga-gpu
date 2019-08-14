//
// Dual-Port RAM with different read/write addresses and single read/write clock
// and with a control for writing single bytes into the memory word; byte enable
// Note - bytes are VERY often not even close to 8 bits. 16 for colors, 18 for floats, etc. 
module byte_enabled_dual_port_ram
	#(parameter int
		RADDR_WIDTH = 8,
		WADDR_WIDTH = 6,
		BYTE_WIDTH = 8,
		BYTES = 4,
		WIDTH = BYTES * BYTE_WIDTH
)
( 
	input [WADDR_WIDTH-1:0] waddr,
	input [RADDR_WIDTH-1:0] raddr,
	input [BYTES-1:0] be,
	input [WIDTH-1:0] wdata, 
	input we, clk,
	output reg [WIDTH/(1<<(RADDR_WIDTH - WADDR_WIDTH))-1:0] q
);
	localparam int WORDS = 1 << WADDR_WIDTH;
	localparam int RATIO = 1 << (RADDR_WIDTH - WADDR_WIDTH);
	
	// use a multi-dimensional packed array to model individual bytes within the word
	logic [BYTES-1:0][BYTE_WIDTH-1:0] ram[0:WORDS-1];

	//buffer all inputs 1 cycle
	logic [WADDR_WIDTH-1:0] waddr_reg;
	logic [RADDR_WIDTH-1:0] raddr_reg;
	logic [BYTES-1:0] be_reg;
	logic [WIDTH-1:0] wdata_reg; 
	logic we_reg;
	
	//this has to be done in two separate lines for some reason
	wire [WIDTH-1:0]word = ram[raddr_reg/RATIO];
	
	always_ff@(posedge clk) begin
		waddr_reg <= waddr;
		raddr_reg <= raddr;
		be_reg <= be;
		wdata_reg <= wdata;
		we_reg <= we;
	
		for(int i = 0; i < BYTES; i++) begin
			if(be_reg[i] && we_reg) begin
				ram[waddr_reg][i] <= wdata_reg[i*BYTE_WIDTH +: BYTE_WIDTH];
			end
		end
		//q <= ram[raddr / RATIO][(raddr % RATIO) * (BYTES/RATIO) +: (BYTES/RATIO)];
		q <= word[(raddr_reg % RATIO) * (WIDTH/RATIO) +: (WIDTH/RATIO)];
	end
endmodule : byte_enabled_dual_port_ram

