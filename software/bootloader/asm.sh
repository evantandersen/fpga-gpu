#! /bin/bash

nios2-elf-gcc -g -O2 -S -std=c99 -ffunction-sections -fverbose-asm -fno-inline -mhw-mulx -mhw-mul -mhw-div -DSYSTEM_BUS_WIDTH=32 -Wall -Werror -DALT_SINGLE_THREADED -Wl,--defsym -Wl,--script=bootloader.ld bootloader.c 
