QUARTUS_PATH=/home/evantandersen/apps/altera

OPTIONS="-lang verilog -target CycloneIVE -frequency 200 -enableHardFP 1 -noChanValid -faithfulRounding -speedgrade 7"

CMD="$QUARTUS_PATH/ip/altera/dsp/altera_fp_functions/source//cmdPolyEval.sh $QUARTUS_PATH/quartus/dspba/backend/linux64 $OPTIONS"

EXP_BITS=6
MAN_BITS=11
FBITS="f$(($EXP_BITS + $MAN_BITS + 1))"

cp $QUARTUS_PATH/quartus/dspba/backend/Libraries/sv/base/dspba_library_ver.sv .
$CMD -name add_$FBITS FPAdd $EXP_BITS $MAN_BITS 
$CMD -name mult_$FBITS FPMul $EXP_BITS $MAN_BITS
$CMD -name fma_$FBITS FPMultAdd $EXP_BITS $MAN_BITS
$CMD -enable -name f32_$FBITS FPToFP 8 23 $EXP_BITS $MAN_BITS
$CMD -name u16_$FBITS FXPToFP 16 0 0 $EXP_BITS $MAN_BITS
