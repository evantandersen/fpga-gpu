#this code clears the instruction and data caches after a CPU reset
#values in the cache are undefined after reset

.section .reset

.equ NIOS2_ICACHE_SIZE, 16384
.equ NIOS2_ICACHE_LINE_SIZE, 4

.equ NIOS2_DCACHE_SIZE, 32768
.equ NIOS2_DCACHE_LINE_SIZE, 32
.equ STACK_TOP, 0x00010000

.global _begin
_begin:
#init instruction cache
mov r4, r0
movi r5, %hi(NIOS2_ICACHE_SIZE)
ori r5, r5, %lo(NIOS2_ICACHE_SIZE)
icache_init_loop:
initi r4
addi r4, r4, NIOS2_ICACHE_LINE_SIZE
bltu r4, r5, icache_init_loop

#init data cache
mov r4, r0
movhi r5, %hi(NIOS2_DCACHE_SIZE)
ori r5, r5, %lo(NIOS2_DCACHE_SIZE)
dcache_init_loop:
initd 0(r4)
addi r4, r4, NIOS2_DCACHE_LINE_SIZE
bltu r4, r5, dcache_init_loop

#set the stack pointer
movhi sp, %hi(STACK_TOP)
ori sp, sp, %lo(STACK_TOP)

call main
br _begin
