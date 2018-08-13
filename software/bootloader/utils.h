// Written by:
//     Evan Andersen
//
// Created Aug 6, 2018

#include <stddef.h>
#include <stdint.h>

void no_cache_cpy(volatile void *dest, volatile void *source, size_t len);
void flush_dcache();