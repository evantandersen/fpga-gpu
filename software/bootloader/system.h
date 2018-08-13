// Written by:
//     Evan Andersen
//
// Created January 17, 2017

#pragma once

#include <stdint.h>
#include <stddef.h>

#define DRAM ((uint8_t*)0x08000000)
#define VGA ((volatile uint32_t*)0x80001000)
#define GPU ((volatile uint32_t*)0x80001040)
#define LEDR ((volatile uint32_t*)0x80001010)
#define SW ((volatile uint32_t*)0x80001020)
#define KEY ((volatile uint32_t*)0x80001080)
#define SDCARD ((volatile char*)0x80002000)


typedef struct {
	float x;
	float y;
	float z;
} point_t;
 
typedef struct {
	int16_t x;
	int16_t y;
	float z;
} screen_point_t;

typedef struct {
	float x;
	float y;
	float z;
	float w;
} clip_point_t;
 
typedef struct {
	uint16_t v0;
	uint16_t v1;
	uint16_t v2;
	uint16_t color;
} triangle_t;


void *alloc_tmp(size_t n);
void *alloc_perm(size_t n);
void reset_tmp();


