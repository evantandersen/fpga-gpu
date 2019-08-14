vlib work

vlog ../generated/fifo/tile_fifo.v
vlog ../generated/fifo/command_buffer.v
vlog ../generated/fp/mult_f18.sv
vlog ../generated/fp/cmp_lt_f18.sv
vlog ../generated/fp/u16_f18.sv
vlog ../generated/fp/sin_f18.sv
vlog ../generated/fp/f32_f18.sv
vlog ../generated/fp/add_f18.sv
vlog ../generated/fp/cmp_sel_f18.sv
vlog ../generated/fp/dspba_library_ver.sv
vlog ../generated/fp/fma_f18.sv
vlog ../generated/fp/div_f18.sv
vlog ../written/compare_float.sv
vlog ../written/shift_reg.sv
vlog ../written/tile_writer.sv
vlog ../written/memory/AlteraByteEnabledDualPort.sv
vlog ../written/GPU_core.v
vlog ../written/z_interpolation.sv
vlog ../written/rasterizer/fast_3_adder.sv
vlog ../written/rasterizer/raster_pipeline.sv
vlog ../written/rasterizer/raster_end.sv
vlog ../written/rasterizer/plane_eq.sv
vlog ../written/rasterizer/plane_eq_tb.sv
vlog ../written/rasterizer/rasterizer_controller.sv
vlog ../written/rasterizer/rasterizer.sv
vlog ../written/rasterizer/edge_equation.sv

vlog gpu_tb.sv
vsim gpu_tb -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver
run -all