// Written by:
//     Evan Andersen
//
// Created August 12, 2018


#include "system.h"

//de2-115 has 128 MB SDRAM
#define MEM_START (DRAM + 8 * 1024 * 1024)
#define MEM_END (DRAM + 128 * 1024 * 1024)

static uint8_t *memory_perm = MEM_START;
static uint8_t *memory_tmp = MEM_END;

void *alloc_tmp(size_t n) {
	//round up to nearest 4 bytes
	n = (n + 3) & 0xFFFFFFFC;
	memory_tmp -= n;
	return memory_tmp;
}

void reset_tmp() {
	memory_tmp = MEM_END;
}

void *alloc_perm(size_t n) {
	//round up to nearest 4 bytes
	n = (n + 3) & 0xFFFFFFFC;

	void *ret = memory_perm;
	memory_perm += n;
	return ret;
}

void flush_dcache(void *addr, size_t len) {
  char* i = addr;
  size_t cleared = 0;
  while(cleared < len) {
      __asm__ volatile ("flushda (%0)" :: "r" (i));
      i += 32;
      cleared += 32;
  }
}

void init_dcache(void *addr, size_t len) {
  char* i = addr;
  size_t cleared = 0;
  while(cleared < len) {
      __asm__ volatile ("initda (%0)" :: "r" (i));
      i += 32;
      cleared += 32;
  }
}



