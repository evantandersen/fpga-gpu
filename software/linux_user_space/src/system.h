// Written by:
//     Evan Andersen
//
// Created January 17, 2017

#pragma once

#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <linux/limits.h>
#include <stdlib.h>
#include <errno.h>
#include <dirent.h>
#include <string.h>
#include <unistd.h>

typedef struct {
	uint32_t core[16];
	uint32_t rasterizer[16];
} gpu_t;

typedef struct {
	uint32_t framesDone;
	uint32_t fbaddr;
} vga_registers_t;

typedef struct {
	uint16_t *vaddr;
	uint32_t paddr;
} vga_framebuffer_t;

typedef struct {
	volatile vga_registers_t* regs;
	vga_framebuffer_t buffers[2];
} vga_t;


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

void flush_dcache(void *addr, size_t len);
void init_dcache(void *addr, size_t len);

volatile gpu_t *init_gpu();

//note - the framebuffers still need to be flushed, but it's much faster
//to fill entire cache lines before writing them back
vga_t *init_vga();
