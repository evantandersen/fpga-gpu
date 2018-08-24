// Written by:
//     Evan Andersen
//
// Created Aug 6, 2018

#include "utils.h"


//no cache memcpy
void no_cache_cpy(volatile void *dest, volatile void *source, size_t len)
{
    volatile uint8_t* dst1 = dest;
    volatile uint8_t* src = source;
    uint8_t amount = (uint32_t)src % 4;
    len -= amount;
    switch (amount)
    {
        case 1: *dst1++ = __builtin_ldbio(src++); len--;
        case 2: *dst1++ = __builtin_ldbio(src++); len--;
        case 3: *dst1++ = __builtin_ldbio(src++); len--;
    }
    volatile uint32_t* dst = (uint32_t*)dst1;
    while(len >= 4)
    {
        *dst++ = __builtin_ldwio(src);
        src += sizeof(void*);
        len -= sizeof(void*);
    }
    dst1 = (uint8_t*)dst;
    switch (len)
    {
        case 3: *dst1++ = __builtin_ldbio(src++);
        case 2: *dst1++ = __builtin_ldbio(src++);
        case 1: *dst1++ = __builtin_ldbio(src++);
    }
}

