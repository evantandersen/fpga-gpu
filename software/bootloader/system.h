// Written by:
//     Evan Andersen
//
// Created March 22, 2013

#pragma once

#define DRAM ((uint32_t*)0x08000000)
#define VGA ((volatile uint32_t*)0x80001000)
#define GPU ((volatile uint32_t*)0x80001040)
#define LEDR ((volatile uint32_t*)0x80001010)
#define SW ((volatile uint32_t*)0x80001020)
#define KEY ((volatile uint32_t*)0x80001080)

typedef struct {
	float x;
	float y;
	float z;
} point_t;
 
typedef struct {
	int16_t x;
	int16_t y;
	int16_t z;
} int_point_t;

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
