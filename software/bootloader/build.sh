#! /bin/bash

nios2-elf-gcc -g -O2 -std=c99 -ffunction-sections -fverbose-asm -fno-inline -mhw-mulx -mhw-mul -mhw-div -DSYSTEM_BUS_WIDTH=32 -Wall -Werror -DALT_SINGLE_THREADED -Wl,--script=bootloader.ld -o bootloader.elf bootloader.c cache_clear.s \
-mcustom-fcmpeqs=227 \
-mcustom-fcmpges=228 \
-mcustom-fcmpgts=229 \
-mcustom-fcmples=230 \
-mcustom-fcmplts=231 \
-mcustom-fixsi=249 \
-mcustom-floatis=250 \
-mcustom-fmuls=252 \
-mcustom-fadds=253 \
-mcustom-fsubs=254 \
-mcustom-fdivs=255

elf2hex --input=bootloader.elf --base=0x08000 --end=0x10000 --width=32 --output=nios_system_bootloader.hex --no-zero-fill
#rm bootloader.elf

