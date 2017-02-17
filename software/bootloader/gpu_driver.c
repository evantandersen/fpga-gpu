// Written by:
//     Evan Andersen
//
// Created March 22, 2013

#include "gpu_driver.h"


#define MEM_START (DRAM+(243200*2))

static uint8_t *memory_ptr = (uint8_t*)MEM_START;

void *alloc(size_t n) {
	void *ret = memory_ptr;
	memory_ptr += n;
	return ret;
}

void reset_mem() {
	memory_ptr = (uint8_t*)MEM_START;
}

int32_t orient2d(int_point_t *a, int_point_t *b, int_point_t *c)
{
    return (b->x - a->x)*(c->y - a->y) - (b->y - a->y)*(c->x - a->x);
}

int32_t isTopLeft(int_point_t *v0, int_point_t *v1) {
	//top edge
	if(v0->y == v1->y && v0->x < v1->x) {
		return 1;
	}
	//left edge
	if(v1->y > v0->y) {
		return 1;
	}
	return 0;
}

// float min3(float a, float b, float c) {
	// float ab = a;
	// if (b < a) {
		// ab = b;
	// }
	// if(ab < c) {
		// return ab;
	// } else {
		// return c;
	// }
// }

// float max3(float a, float b, float c) {
	// float ab = a;
	// if(b > ab) {
		// ab = b;
	// }
	// if(ab > c) {
		// return ab;
	// } else {
		// return c;
	// }
// }

int keep_tri(triangle_t *tri, clip_point_t *verts, uint8_t *clip_codes) {
	//cull if bounding box doesn't overlap viewframe
	if(clip_codes[tri->v0] & clip_codes[tri->v1] & clip_codes[tri->v2]) {
		return 0;
	}
	
	return 1;
}

void transform_poly_list(scene_t *scene, render_target_t *target, polygon_list_t *out) {
	//compute the projection view transform
	float transform_mat[16];
	mult_4x4(scene->proj, scene->view, transform_mat);
	
	//transform vertices and compute clip codes
	clip_point_t *clip_vertices = alloc(sizeof(clip_point_t) * scene->poly_list.nvertices);
	uint8_t *clip_codes = alloc(scene->poly_list.nvertices);
	for(size_t i = 0; i < scene->poly_list.nvertices; i++) {
		clip_point_t *p = &clip_vertices[i];
		mult_4xVec(transform_mat, &scene->poly_list.vertices[i], p);
		uint8_t val = 0;
		if(p->x < -p->w) {
			val |= 0x01;
		}
		if(p->x > p->w) {
			val |= 0x02;
		}
		if(p->y < -p->w) {
			val |= 0x04;
		}
		if(p->y > p->w) {
			val |= 0x08;
		}
		if(p->z < -p->w) {
			val |= 0x10;
		}
		if(p->z > p->w) {
			val |= 0x20;
		}
		clip_codes[i] = val;
	}
	
	//cull triangles with backface and bounds clipping
	triangle_t *kept_tris = alloc(sizeof(triangle_t) * scene->poly_list.ntris);
	size_t num_kept = 0;
	for(size_t i = 0; i < scene->poly_list.ntris; i++) {
		if(keep_tri(&scene->poly_list.triangles[i], clip_vertices, clip_codes)) {
			kept_tris[num_kept] = scene->poly_list.triangles[i];
			num_kept++;
		}
	}
	
	//do perspective division/scaling
	int_point_t *screen_vertices = alloc(sizeof(int_point_t) * scene->poly_list.nvertices);
	for(size_t i = 0; i < scene->poly_list.nvertices; i++) {
		float xNDC = (clip_vertices[i].x/clip_vertices[i].w);
		float yNDC = (clip_vertices[i].y/clip_vertices[i].w);
		float zNDC = (clip_vertices[i].z/clip_vertices[i].w);
		screen_vertices[i].x = (xNDC+1)*0.5f*(target->width-1)*GPU_PIXEL_SUBSTEP;
		screen_vertices[i].y = (yNDC+1)*0.5f*(target->height-1)*GPU_PIXEL_SUBSTEP;
		screen_vertices[i].z = zNDC;
	}

	size_t num_kept_2 = 0;
	for(size_t i = 0; i < num_kept; i++) {
		int_point_t *v0 = &screen_vertices[kept_tris[i].v0];
		int_point_t *v1 = &screen_vertices[kept_tris[i].v1];
		int_point_t *v2 = &screen_vertices[kept_tris[i].v2];
		if(orient2d(v0, v1, v2) > 0) {
			kept_tris[num_kept_2] = kept_tris[i];
			num_kept_2++;
		}
	}

	
	out->nvertices = scene->poly_list.nvertices;
	out->ntris = num_kept_2;
	out->triangles = kept_tris;
	out->vertices = (point_t*)screen_vertices;
}

void draw_triangles_barycentric_gpu(render_target_t *target, color_t background, polygon_list_t *data) {
	
	//set the stride
	GPU[8] = target->stride;

	uint8_t *clip_codes = alloc(data->nvertices);
	int_point_t *verts = (int_point_t*)data->vertices;
	
	uint16_t tile_height = ((target->height + 31)/32);
	uint16_t tile_width = ((target->width + 31)/32);
	for(int i = 0; i < tile_height; i++) {
		for(int j = 0; j < tile_width; j++) {
			//clear tile
			//x, y and color
			GPU[0] = (j << 21) | (i << 16) | background;

			GPU[1] = 0;
			GPU[2] = 0;
			GPU[3] = 0;
			GPU[10] = 0;
			GPU[11] = 0;
			GPU[12] = 0;
			
			GPU[4] = 1;
			GPU[5] = 1;
			GPU[6] = 1;
			
			GPU[7] = (uint32_t)(target->framebuffer) + (i*32*800*2) + (j*32*2);
						
			//start rendering tile
			GPU[9] = 1;
			//wait for it to finish
			while(GPU[9]);
			
			//generate clip data for vertices
			int32_t maxX = (j+1)*32*GPU_PIXEL_SUBSTEP - 1;
			int32_t minX = j*32*GPU_PIXEL_SUBSTEP;
			int32_t maxY = (i+1)*32*GPU_PIXEL_SUBSTEP - 1;
			int32_t minY = i*32*GPU_PIXEL_SUBSTEP;
			for(size_t i = 0; i < data->nvertices; i++) {
				uint8_t val = 0;
				if(verts[i].x < minX) {
					val |= 0x1;
				}
				if(verts[i].x > maxX) {
					val |= 0x2;
				}
				if(verts[i].y < minY) {
					val |= 0x4;
				}
				if(verts[i].y > maxY) {
					val |= 0x8;
				}
				clip_codes[i] = val;
			}
			
			//render triangles
			for(int tri = 0; tri < data->ntris; tri++) {
				triangle_t* curr = &data->triangles[tri];
				
				//if triangle doesn't overlap tile, no need to render
				if(clip_codes[curr->v0] & clip_codes[curr->v1] & clip_codes[curr->v2]) {
					continue;
				}

				int_point_t v0 = verts[curr->v0];
				int_point_t v1 = verts[curr->v1];
				int_point_t v2 = verts[curr->v2];
				
				//compute the step functions
				int32_t A01 = (v0.y - v1.y);
				int32_t B01 = (v1.x - v0.x) - 31*A01;	
					
				int32_t A12 = (v1.y - v2.y);
				int32_t B12 = (v2.x - v1.x) - 31*A12;
				
				int32_t A20 = (v2.y - v0.y);
				int32_t B20 = (v0.x - v2.x) - 31*A20;

							
				//x, y and color
				GPU[0] = (j << 21) | (i << 16) | curr->color;

				GPU[1] = A01;
				GPU[2] = A12;
				GPU[3] = A20;
				
				GPU[10] = B01;
				GPU[11] = B12;
				GPU[12] = B20;
			
				//set the w's
				int_point_t p = { j*16*32, i*16*32 };
				int32_t w0_row = orient2d(&v1, &v2, &p);
				int32_t w1_row = orient2d(&v2, &v0, &p);
				int32_t w2_row = orient2d(&v0, &v1, &p);
				
				//compute fill rules
				w0_row -= isTopLeft(&v1, &v2) ? 0 : 1;
				w1_row -= isTopLeft(&v2, &v0) ? 0 : 1;
				w2_row -= isTopLeft(&v0, &v1) ? 0 : 1;

				GPU[4] = w0_row;
				GPU[5] = w1_row;
				GPU[6] = w2_row;
				
				//start rendering tile
				GPU[9] = 1;
				//wait for it to finish
				while(GPU[9]);
			}
			//write it to memory
			GPU[9] = 2;
						
			//wait to complete
			while(GPU[9]);
		}
	}	
}


void gpu_render_scene(render_target_t *target, scene_t *scene) {
	
	//create a list of screen coordinate triangles to render
	polygon_list_t tris_to_render;
	transform_poly_list(scene, target, &tris_to_render);

	//render them
	draw_triangles_barycentric_gpu(target, scene->background, &tris_to_render);
	
	//reset our memory scratch space when we're done rendering
	reset_mem();
}





