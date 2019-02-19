#! /bin/bash

nios2-elf-gcc  -g -O2 -std=gnu99 -ffunction-sections -fverbose-asm -fno-inline -mhw-mulx -mhw-mul -mhw-div -DSYSTEM_BUS_WIDTH=32 -DALT_SINGLE_THREADED -Wl,--script=bootloader.ld \
-mno-gpopt \
-Wall -Werror -Wdouble-promotion \
-nostartfiles \
-fno-math-errno \
-ffinite-math-only \
bootloader.c \
math.c \
gpu_driver.c \
ext2_driver.c \
utils.c \
system.c \
cache_clear.s \
-mcustom-fabss=224 \
-mcustom-fnegs=225 \
-mcustom-fcmpnes=226 \
-mcustom-fcmpeqs=227 \
-mcustom-fcmpges=228 \
-mcustom-fcmpgts=229 \
-mcustom-fcmples=230 \
-mcustom-fcmplts=231 \
-mcustom-round=248 \
-mcustom-fixsi=249 \
-mcustom-floatis=250 \
-mcustom-fsqrts=251 \
-mcustom-fmuls=252 \
-mcustom-fadds=253 \
-mcustom-fsubs=254 \
-mcustom-fdivs=255 \
-lm \
-o bootloader.elf

#-mcustom-fmins=232 \
#-mcustom-fmaxs=233 \

nios2-elf-objdump -S bootloader.elf > bootloader.s

elf2hex --input=bootloader.elf --base=0x8000 --end=0xffff --width=32 --output=nios_system_bootloader.hex

