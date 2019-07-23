QUARTUS_PATH=/home/evan/apps/altera

OPTIONS="-lang verilog -target CycloneIVE -frequency 200 -enableHardFP 1 -noChanValid -faithfulRounding -speedgrade 7"

CMD="$QUARTUS_PATH/ip/altera/dsp/altera_fp_functions/source//cmdPolyEval.sh $QUARTUS_PATH/quartus/dspba/backend/linux64 $OPTIONS"

EXP_BITS=6
MAN_BITS=11
FBITS="f$(($EXP_BITS + $MAN_BITS + 1))"

echo Generating IP cores for $FBITS
{
	$CMD -name add_$FBITS FPAdd $EXP_BITS $MAN_BITS 
	$CMD -name mult_$FBITS FPMul $EXP_BITS $MAN_BITS
	$CMD -name fma_$FBITS FPMultAdd $EXP_BITS $MAN_BITS
	$CMD -name div_$FBITS FPDiv $EXP_BITS $MAN_BITS 0
	$CMD -name sin_$FBITS FPSinPiX $EXP_BITS $MAN_BITS
	$CMD -name cmp_lt_$FBITS FPCompare $EXP_BITS $MAN_BITS -2
	$CMD -name cmp_sel_$FBITS FPCompareFused $EXP_BITS $MAN_BITS
	$CMD -enable -name f32_$FBITS FPToFP 8 23 $EXP_BITS $MAN_BITS
	$CMD -name u16_$FBITS FXPToFP 16 0 0 $EXP_BITS $MAN_BITS
} > log.txt
cp $QUARTUS_PATH/quartus/dspba/backend/Libraries/sv/base/dspba_library_ver.sv .
