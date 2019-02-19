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

	//calculate flat shading using world space coordinates, only on triangles that will actually be rendered
	for(size_t x = 0; x < num_kept_2; x++) {
		point_t *v0 = &scene->poly_list.vertices[kept_tris[x].v0];
		point_t *v1 = &scene->poly_list.vertices[kept_tris[x].v1];
		point_t *v2 = &scene->poly_list.vertices[kept_tris[x].v2];
		
		float i, j, k;
		k = normal(v0, v1, v2, &i, &j);
	    //normalize the normal (get it?)
	    float mag = sqrtf(i*i + j*j + k*k);
	  
	    i /= mag;
	    j /= mag;
	    k /= mag;

	    //hacky flat shading
	    point_t *lv = &scene->lightVector;
	    int32_t light = 26*(lv->x*i + lv->y*j + lv->z*k);
		if(light > 31) {light = 31;}
		if(light < 0) { light = 0;}
		light += 5;
		kept_tris[x].color = COLOR(light, light, light);
	}

	out->nvertices = scene->poly_list.nvertices;
	out->ntris = num_kept_2;
	out->triangles = kept_tris;
	out->vertices = (point_t*)screen_vertices;
}

int16_t minMax3(int16_t *min, int16_t a, int16_t b, int16_t c) {
	int16_t max = a;
	*min = a;
	if(b > max) {
		max = b;
	} else if(b < *min) {
		*min = b;
	}
	if(c > max) {
		max = c;
	} else if(c < *min) {
		*min = c;
	}
	return max;
}

int16_t clamp16i(int16_t x, int16_t min, int16_t max) {
	if(x < min) {
		return min;
	}
	if(x > max) {
		return max;
	}
	return x;
}

struct triBin {
	uint16_t ntris;
	uint16_t *tris;
};

struct triBin *bin_tris(int16_t tile_width, int16_t tile_height, polygon_list_t *data) {

	uint16_t nTiles = tile_height*tile_width;
	screen_point_t *verts = (screen_point_t*)data->vertices;

	struct triBin *bins = alloc_tmp(sizeof(struct triBin) * nTiles);
	for(int i = 0; i < nTiles; i++) {
		bins[i].ntris = 0;
		bins[i].tris = alloc_tmp(sizeof(uint16_t) * data->ntris);
	}

	for(int tri = 0; tri < data->ntris; tri++) {
		triangle_t* curr = &data->triangles[tri];
		screen_point_t *v0 = &verts[curr->v0];
		screen_point_t *v1 = &verts[curr->v1];
		screen_point_t *v2 = &verts[curr->v2];

		int16_t minY, minX;
		int16_t maxY = minMax3(&minY, v0->y, v1->y, v2->y);
		int16_t maxX = minMax3(&minX, v0->x, v1->x, v2->x);

		//convert to bin coordinates
		minY /= 32*GPU_PIXEL_SUBSTEP;
		maxY /= 32*GPU_PIXEL_SUBSTEP;
		minX /= 32*GPU_PIXEL_SUBSTEP;
		maxX /= 32*GPU_PIXEL_SUBSTEP;

		//clamp
		minY = clamp16i(minY, 0, tile_height - 1);
		maxY = clamp16i(maxY, 0, tile_height - 1);
		minX = clamp16i(minX, 0, tile_width - 1);
		maxX = clamp16i(maxX, 0, tile_width - 1);

		for(int i = minY; i <= maxY; i++) {
			for(int j = minX; j <= maxX; j++) {
				struct triBin *bin = &bins[i*tile_width + j];
				bin->tris[bin->ntris] = tri;
				bin->ntris++;
			}
		}
	} 	
	return bins;
}

void draw_triangles_barycentric_gpu(render_target_t *target, polygon_list_t *data) {


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
        z_info[x].c = equationOfPlane(v0, v1, v2, &z_info[x].dzdx, &z_info[x].dzdy);
        z_info[x].dzdy *= GPU_PIXEL_SUBSTEP;
        z_info[x].dzdx *= GPU_PIXEL_SUBSTEP;
    }    
    
	//set the stride
	GPU->core[2] = target->stride;
	
	//bin the triangles into tiles based on their bounding box
	uint16_t tile_height = ((target->height + 31)/32);
	uint16_t tile_width = ((target->width + 31)/32);
	struct triBin *bins = bin_tris(tile_width, tile_height, data);



	size_t tri_tiles_rastered = 0;

	//render each tile
	for(int i = 0; i < tile_height; i++) {
		for(int j = 0; j < tile_width; j++) {

			//render triangles
			struct triBin *bin = &bins[i*tile_width + j];
			for(int n = 0; n < bin->ntris; n++) {
				int tri = bin->tris[n];
//				triangle_t* curr = &data->triangles[];		
				triangle_t* curr = &data->triangles[tri];
								
				screen_point_t v0 = verts[curr->v0];
				screen_point_t v1 = verts[curr->v1];
				screen_point_t v2 = verts[curr->v2];
				
				//compute the step functions
				int32_t A01 = (v0.y - v1.y);
				int32_t B01 = (v1.x - v0.x);	
					
				int32_t A12 = (v1.y - v2.y);
				int32_t B12 = (v2.x - v1.x);
				
				int32_t A20 = (v2.y - v0.y);
				int32_t B20 = (v0.x - v2.x);

							
				//color
				GPU->rasterizer[0] = curr->color;

				GPU->rasterizer[1] = A01;
				GPU->rasterizer[2] = A12;
				GPU->rasterizer[3] = A20;
				
				GPU->rasterizer[4] = B01;
				GPU->rasterizer[5] = B12;
				GPU->rasterizer[6] = B20;
			
				//set the w's
				screen_point_t p = { j*GPU_PIXEL_SUBSTEP*32, i*GPU_PIXEL_SUBSTEP*32 };
				int32_t w0_row = orient2d(&v1, &v2, &p);
				int32_t w1_row = orient2d(&v2, &v0, &p);
				int32_t w2_row = orient2d(&v0, &v1, &p);
				
				//compute fill rules
				w0_row -= isTopLeft(&v1, &v2) ? 0 : 1;
				w1_row -= isTopLeft(&v2, &v0) ? 0 : 1;
				w2_row -= isTopLeft(&v0, &v1) ? 0 : 1;

				GPU->rasterizer[7] = w0_row >> 4;
				GPU->rasterizer[8] = w1_row >> 4;
				GPU->rasterizer[9] = w2_row >> 4;
                
                //set the Z data
                *((float*)&GPU->rasterizer[10]) = z_info[tri].dzdx;
                *((float*)&GPU->rasterizer[11]) = z_info[tri].dzdy;
                *((float*)&GPU->rasterizer[12]) = z_info[tri].c + j*32*z_info[tri].dzdx + i*32*z_info[tri].dzdy;
				
				//start rendering tile
				GPU->core[0] = 0;	
			}
			tri_tiles_rastered += bin->ntris;

			if(bin->ntris == 0) {
				//clear tile
				GPU->rasterizer[1] = 0;
				GPU->rasterizer[2] = 0;
				GPU->rasterizer[3] = 0;
				GPU->rasterizer[4] = 0;
				GPU->rasterizer[5] = 0;
				GPU->rasterizer[6] = 0;
			
				GPU->rasterizer[7] = -1;
				GPU->rasterizer[8] = -1;
				GPU->rasterizer[9] = -1;

				//render the "triangle"
				GPU->core[0] = 0;
				tri_tiles_rastered += 1;
			}

			//set the address to write to RAM
			GPU->core[1] = ((uint32_t)(target->framebuffer)) + (i*32*800*2) + (j*32*2);

			//write it to fifo
			GPU->core[0] = 2;
			//*LEDR = GPU[0];
		}
	}	
	//wait for all data to finish writing
	GPU->core[0] = 4;
	*LEDR = tri_tiles_rastered;
	while(GPU->core[0]);
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





