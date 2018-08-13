// Written by:
//     Evan Andersen
//
// Created January 18, 2017

#include "gpu_driver.h"


int32_t orient2d(screen_point_t *a, screen_point_t *b, screen_point_t *c)
{
    return (b->x - a->x)*(c->y - a->y) - (b->y - a->y)*(c->x - a->x);
}

int32_t isTopLeft(screen_point_t *v0, screen_point_t *v1) {
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
	clip_point_t *clip_vertices = alloc_tmp(sizeof(clip_point_t) * scene->poly_list.nvertices);
	uint8_t *clip_codes = alloc_tmp(scene->poly_list.nvertices);
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
	triangle_t *kept_tris = alloc_tmp(sizeof(triangle_t) * scene->poly_list.ntris);
	size_t num_kept = 0;
	for(size_t i = 0; i < scene->poly_list.ntris; i++) {
		if(keep_tri(&scene->poly_list.triangles[i], clip_vertices, clip_codes)) {
			kept_tris[num_kept] = scene->poly_list.triangles[i];
			num_kept++;
		}
	}
	
	//do perspective division/scaling
	screen_point_t *screen_vertices = alloc_tmp(sizeof(screen_point_t) * scene->poly_list.nvertices);
	for(size_t i = 0; i < scene->poly_list.nvertices; i++) {
		float xNDC = (clip_vertices[i].x/clip_vertices[i].w);
		float yNDC = (clip_vertices[i].y/clip_vertices[i].w);
		float zNDC = (clip_vertices[i].z/clip_vertices[i].w);
		screen_vertices[i].x = (xNDC+1)*0.5f*(target->width-1)*GPU_PIXEL_SUBSTEP;
		screen_vertices[i].y = (yNDC+1)*0.5f*(target->height-1)*GPU_PIXEL_SUBSTEP;
		screen_vertices[i].z = 1-((zNDC+1)*0.5f);
	}

	size_t num_kept_2 = 0;
	for(size_t i = 0; i < num_kept; i++) {
		screen_point_t *v0 = &screen_vertices[kept_tris[i].v0];
		screen_point_t *v1 = &screen_vertices[kept_tris[i].v1];
		screen_point_t *v2 = &screen_vertices[kept_tris[i].v2];
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

void draw_triangles_barycentric_gpu(render_target_t *target, polygon_list_t *data) {
	
	//reset the sequence number
	GPU[0] = 5;
    
    uint8_t *clip_codes = alloc_tmp(data->nvertices);
	screen_point_t *verts = (screen_point_t*)data->vertices;
    
    //compute Z values for all tris
    struct {
        float dzdx;
        float dzdy;
        float c;
    } *z_info = alloc_tmp(sizeof(float)*3*data->ntris);
    for(size_t x = 0; x < data->ntris; x++) {
        triangle_t* curr = &data->triangles[x];
        screen_point_t *v0 = &verts[curr->v0];
        screen_point_t *v1 = &verts[curr->v1];
        screen_point_t *v2 = &verts[curr->v2];
        float i, j, k;
		k = normal(v0, v1, v2, &i, &j);
	    //compute the plane equation in the form Z = ix + jy + c
	    float c = (v0->x * i) + (v0->y * j) + (v0->z * k);
	    z_info[x].c = c/k;
	    z_info[x].dzdx = i / -k;
	    z_info[x].dzdy = j / -k;

	    //normalized the normal (get it?)
	    float mag = sqrtf(i*i + j*j + k*k);
	    i /= mag;
	    j /= mag;
	    k /= mag;

	    //hacky flat shading
	    int32_t light = 20*(k);
		if(light > 31) {light = 31;}
		if(light < 0) { light = 0;}
		light += 5;
		//curr->color = COLOR(light, light, light);
    }
            
	//set the stride
	GPU[9] = target->stride;
	
	
	uint16_t tile_height = ((target->height + 31)/32);
	uint16_t tile_width = ((target->width + 31)/32);
	for(int i = 0; i < tile_height; i++) {
		for(int j = 0; j < tile_width; j++) {
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
			uint16_t tri_rendered = 0;
			for(int tri = 0; tri < data->ntris; tri++) {
				triangle_t* curr = &data->triangles[tri];
								
				//if triangle doesn't overlap tile, no need to render
				if(clip_codes[curr->v0] & clip_codes[curr->v1] & clip_codes[curr->v2]) {
					continue;
				}
				tri_rendered++;				

				screen_point_t v0 = verts[curr->v0];
				screen_point_t v1 = verts[curr->v1];
				screen_point_t v2 = verts[curr->v2];
				
				//compute the step functions
				int32_t A01 = (v0.y - v1.y);
				int32_t B01 = (v1.x - v0.x) - 31*A01;	
					
				int32_t A12 = (v1.y - v2.y);
				int32_t B12 = (v2.x - v1.x) - 31*A12;
				
				int32_t A20 = (v2.y - v0.y);
				int32_t B20 = (v0.x - v2.x) - 31*A20;

							
				//color
				GPU[1] = curr->color;

				GPU[2] = A01;
				GPU[3] = A12;
				GPU[4] = A20;
				
				GPU[10] = B01;
				GPU[11] = B12;
				GPU[12] = B20;
			
				//set the w's
				screen_point_t p = { j*GPU_PIXEL_SUBSTEP*32, i*GPU_PIXEL_SUBSTEP*32 };
				int32_t w0_row = orient2d(&v1, &v2, &p);
				int32_t w1_row = orient2d(&v2, &v0, &p);
				int32_t w2_row = orient2d(&v0, &v1, &p);
				
				//compute fill rules
				w0_row -= isTopLeft(&v1, &v2) ? 0 : 1;
				w1_row -= isTopLeft(&v2, &v0) ? 0 : 1;
				w2_row -= isTopLeft(&v0, &v1) ? 0 : 1;

				GPU[5] = w0_row >> 4;
				GPU[6] = w1_row >> 4;
				GPU[7] = w2_row >> 4;
                
                //set the Z data
                *((float*)&GPU[13]) = z_info[tri].dzdx*GPU_PIXEL_SUBSTEP;
                *((float*)&GPU[14]) = z_info[tri].dzdy*GPU_PIXEL_SUBSTEP;
                *((float*)&GPU[15]) = z_info[tri].c + p.x*z_info[tri].dzdx + p.y*z_info[tri].dzdy;
				
				//start rendering tile
				GPU[0] = 0;			
			}
			if(tri_rendered == 0) {
				//clear tile
				GPU[2] = 0;
				GPU[3] = 0;
				GPU[4] = 0;
				GPU[10] = 0;
				GPU[11] = 0;
				GPU[12] = 0;
			
				GPU[5] = -1;
				GPU[6] = -1;
				GPU[7] = -1;

				//render the "triangle"
				GPU[0] = 0;

			}
			//set the address to write to RAM
			GPU[8] = ((uint32_t)(target->framebuffer)) + (i*32*800*2) + (j*32*2);

			//write it to fifo
			GPU[0] = 2;
		}
	}	
	//wait for all data to finish writing
	GPU[0] = 4;
	//while(GPU[0]);
}


void gpu_render_scene(render_target_t *target, scene_t *scene) {
	
	//create a list of screen coordinate triangles to render
	polygon_list_t tris_to_render;
	transform_poly_list(scene, target, &tris_to_render);

	//render them
	draw_triangles_barycentric_gpu(target, &tris_to_render);
	
	//reset our memory scratch space when we're done rendering
	reset_tmp();
}





