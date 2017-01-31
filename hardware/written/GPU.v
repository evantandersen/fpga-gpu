module GPU(
	input CLOCK_50, 
	input [17:0]SW,
	input [3:0]KEY,
	output [17:0]LEDR,
	
	output VGA_CLK,
	output VGA_SYNC_N,
	output VGA_BLANK_N,
	output [7:0]VGA_R,
	output [7:0]VGA_G,
	output [7:0]VGA_B,
	output VGA_HS,
	output VGA_VS,
	
//	output [19:0]SRAM_ADDR,
//	inout [15:0]SRAM_DQ,
//	output SRAM_OE_N,
//	output SRAM_WE_N,
//	output SRAM_CE_N,
//	output SRAM_LB_N,
//	output SRAM_UB_N,
	
	output [12:0]DRAM_ADDR,
	inout [31:0]DRAM_DQ,
	output [1:0]DRAM_BA,
	output [3:0]DRAM_DQM,
	output DRAM_RAS_N,
	output DRAM_CAS_N,
	output DRAM_CKE,
	output DRAM_CLK,
	output DRAM_WE_N,
	output DRAM_CS_N
);	

	wire reset = !KEY[0];
	
	wire system_clock;
	wire vga_clock;
	
	//flip polarity of VGA_CLK output to solve timing issue with VGA DAC
	assign VGA_CLK = !vga_clock;
	
	//main clock
	system_clock_pll P0(reset, CLOCK_50, system_clock, DRAM_CLK, vga_clock);
	
	nios2 u0 (
        .clk_clk                      (system_clock),                      //                     clk.clk
		  .reset_reset  (reset),   	// reset.reset
//        .sram_DQ   (SRAM_DQ),   // sram_external_interface.DQ
//        .sram_ADDR (SRAM_ADDR), //                        .ADDR
//        .sram_LB_N (SRAM_LB_N), //                        .LB_N
//        .sram_UB_N (SRAM_UB_N), //                        .UB_N
//        .sram_CE_N (SRAM_CE_N), //                        .CE_N
//        .sram_OE_N (SRAM_OE_N), //                        .OE_N
//        .sram_WE_N (SRAM_WE_N),  //                        .WE_N

		  .dram_addr                   (DRAM_ADDR),                   //                   sdram.addr
        .dram_ba                     (DRAM_BA),                     //                        .ba
        .dram_cas_n                  (DRAM_CAS_N),                  //                        .cas_n
        .dram_cke                    (DRAM_CKE),                    //                        .cke
        .dram_cs_n                   (DRAM_CS_N),                   //                        .cs_n
        .dram_dq                     (DRAM_DQ),                     //                        .dq
        .dram_dqm                    (DRAM_DQM),                    //                        .dqm
        .dram_ras_n                  (DRAM_RAS_N),                  //                        .ras_n
        .dram_we_n                   (DRAM_WE_N),                    //                        .we_n
		  
		  .vga_sync_n                   (VGA_SYNC_N),                   //                     gpu.SYNC_N
        .vga_blank_n                  (VGA_BLANK_N),                  //                        .BLANK_N
        .vga_r                        (VGA_R),                        //                        .R
        .vga_g                        (VGA_G),                        //                        .G
        .vga_b                        (VGA_B),                        //                        .B
        .vga_hs                       (VGA_HS),                       //                        .HS
        .vga_vs                       (VGA_VS),                        //                        .VS
        .vga_clk                      (vga_clock),                        //                        .CLK
		  
		  .led_r_export                 (LEDR),                 //                   led_r.export
        .sw_export                    (SW)                     //                      sw.export
    );

	
endmodule

