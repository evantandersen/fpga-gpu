## Generated SDC file "GPU.sdc"

## Copyright (C) 1991-2011 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 11.1 Build 259 01/25/2012 Service Pack 2.11 SJ Full Version"

## DATE    "Mon Mar 17 04:39:50 2014"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLOCK_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]
create_clock -name {CLOCK2_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK2_50}]
#create_clock -period 10MHz {altera_reserved_tck}
set_clock_groups -asynchronous -group {altera_reserved_tck}

create_generated_clock -source {P0|altpll_component|auto_generated|pll1|inclk[0]} -divide_by 5 -multiply_by 9 -duty_cycle 50.00 -name {nios_clk} {P0|altpll_component|auto_generated|pll1|clk[0]}
create_generated_clock -source {P0|altpll_component|auto_generated|pll1|inclk[0]} -divide_by 5 -multiply_by 9 -phase -90.00 -duty_cycle 50.00 -name {dram_clk} {P0|altpll_component|auto_generated|pll1|clk[1]}
create_generated_clock -source {P0|altpll_component|auto_generated|pll1|inclk[0]} -divide_by 5 -multiply_by 4 -duty_cycle 50.00 -name {vga_clk} {P0|altpll_component|auto_generated|pll1|clk[2]}
create_generated_clock -source {P1|altpll_component|auto_generated|pll1|inclk[0]} -divide_by 5 -multiply_by 16 -duty_cycle 50.00 -name {gpu_clk} {P1|altpll_component|auto_generated|pll1|clk[0]}


#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************
set_clock_groups -asynchronous -group {nios_clk dram_clk} -group {gpu_clk} -group {vga_clk}



#**************************************************************
# Set False Path
#**************************************************************

#set_false_path -from {nios2:u0|altera_reset_controller:rst_controller|r_sync_rst} -to {nios2:u0|VGA_Controller:vga_controller|VGA_driver:VGA0|vga_dram_master:DM0|pixel_fifo:F1|dcfifo_mixed_widths:dcfifo_mixed_widths_component|dcfifo_brk1:auto_generated|dffpipe_3dc:rdaclr|dffe12a[0]}
#set_false_path -from {nios2:u0|altera_reset_controller:rst_controller|r_sync_rst} -to {nios2:u0|VGA_Controller:vga_controller|VGA_driver:VGA0|vga_dram_master:DM0|pixel_fifo:F1|dcfifo_mixed_widths:dcfifo_mixed_widths_component|dcfifo_brk1:auto_generated|cntr_54e:cntr_b|counter_reg_bit[0]}
#set_false_path -from {nios2:u0|altera_reset_controller:rst_controller|r_sync_rst} -to {nios2:u0|VGA_Controller:vga_controller|VGA_driver:VGA0|vga_dram_master:DM0|pixel_fifo:F1|dcfifo_mixed_widths:dcfifo_mixed_widths_component|dcfifo_brk1:auto_generated|dffpipe_3dc:rdaclr|dffe13a[0]}


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

