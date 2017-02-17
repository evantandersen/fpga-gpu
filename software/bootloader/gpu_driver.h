// Written by:
//     Evan Andersen
//
// Created March 22, 2013

#pragma once

#include <stdint.h>
#include <stddef.h>
#include "system.h"
#include "math.h"

#define COLOR(r,g,b) (((r & 0x1f) << 10) | ((g & 0x1f) << 5) | (b & 0x1f))

#define GPU_PIXEL_SUBSTEP (16)


typedef uint16_t color_t; 
 
typedef struct {
	point_t* vertices;
	triangle_t* triangles;
	uint16_t nvertices;
	uint16_t ntris;
} polygon_list_t;

typedef struct {
	color_t background;
	polygon_list_t poly_list;
	float view[16];
	float proj[16];
} scene_t;

typedef struct {
	color_t* framebuffer;
	size_t stride;
	uint16_t width;
	uint16_t height;
} render_target_t;

void gpu_render_scene(render_target_t *target, scene_t *scene);




