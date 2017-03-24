// Written by:
//     Evan Andersen
//
// Created March 22, 2013

#include <stdint.h>
#include "math.h"
#include "gpu_driver.h"
#include "system.h"

void gradientSection(uint16_t *addr, int x, int y, int width, int height) {
	width += x;
	height += y;
	int size = 50;
	
	int white = COLOR(31,31,31);
	int black = COLOR(0,0,0);
	if((*SW >> 8) & 1) {
		white = COLOR(0, 31, 0);
		black = COLOR(0, 0, 31);
	}

	for(int i = y; i < height; i++) {
		for(int j = x; j < width; j++) {
			int color;
			if(((i/size) % 2) == ((j/size) % 2)) {
				color = black;
			} else {
				color = white;
			}
			addr[i*800 + j] = color;
		}
	}
}

void gradient(uint16_t *addr) {
	gradientSection(addr, 0, 0, 800, 600);
}


void flush_dcache() {
  char* i;
  for (i = (char*) 0; i < (char*) 32768; i+= 32)
  { 
    __asm__ volatile ("flushd (%0)" :: "r" (i));
  }
}

void fail(uint32_t value) {
	while(1) {
		int newValue = value;
		if(*SW & 2) {
			 newValue >>= 16;
		}
		*LEDR = newValue & 0xffff;
	}
}

void memtest32(uint32_t *addr, uint32_t size) {
	//write a pattern in
	int pattern = 0x0fefefef;
	for(int i = 0; i < size; i++) {
		if(i % (1024*1024) == 0) {
			*LEDR = i/(1024*1024);
		}
		addr[i] = i + pattern;
	}
	//test it
	for(int i = 0; i < size; i++) {
		if(i % (1024*1024) == 0) {
			*LEDR = i/(1024*1024);
		}
		uint32_t value = addr[i] - i;
		if(value != pattern) {
			fail(i);
		}
	}
}
 

// void draw_triangle_barycentric(uint16_t* addr, point_t v0, point_t v1, point_t v2, uint16_t color) {
	
    // // Compute triangle bounding box
    // int minX = min3(v0.x, v1.x, v2.x);
    // int minY = min3(v0.y, v1.y, v2.y);
    // int maxX = max3(v0.x, v1.x, v2.x);
    // int maxY = max3(v0.y, v1.y, v2.y);
	
	// //coordinates in 1/16ths of a pixel
	// int subMask = SUBSTEP - 1;

	// minX = (minX + subMask) & ~subMask;
    // minY = (minY + subMask) & ~subMask;

	// //dont mult by SUBSTEP for hw
	// int16_t A01 = (v0.y - v1.y);
	// int16_t B01 = (v1.x - v0.x);
	
    // int16_t A12 = (v1.y - v2.y);
	// int16_t B12 = (v2.x - v1.x);
	
    // int16_t A20 = (v2.y - v0.y);
	// int16_t B20 = (v0.x - v2.x);

    // // Barycentric coordinates at minX/minY corner
    // point p = { minX, minY };
    // int w0_row = orient2d(v1, v2, p);
    // int w1_row = orient2d(v2, v0, p);
    // int w2_row = orient2d(v0, v1, p);

	// //Fill rules
	// w0_row -= isTopLeft(v1, v2) ? 0 : 1;
    // w1_row -= isTopLeft(v2, v0) ? 0 : 1;
    // w2_row -= isTopLeft(v0, v1) ? 0 : 1;
	
    // // Rasterize	
    // for (p.y = minY; p.y <= maxY; p.y += SUBSTEP) {
        // // Barycentric coordinates at start of row
		// int w0 = w0_row;
		// int w1 = w1_row;
		// int w2 = w2_row;

        // for (p.x = minX; p.x <= maxX; p.x += SUBSTEP) {
            // // If p is on or inside all edges, render pixel.
            // if ((w0 | w1 | w2) >= 0) {
				// uint16_t x = p.x / 16;
				// uint16_t y = p.y / 16;
                // addr[y*800 + x] = color;        
			// }
            // // One step to the right
            // w0 += A12*SUBSTEP;
            // w1 += A20*SUBSTEP;
            // w2 += A01*SUBSTEP;
        // }

        // // One row step
        // w0_row += B12*SUBSTEP;
        // w1_row += B20*SUBSTEP;
        // w2_row += B01*SUBSTEP;
    // }
// }

void *memset(void *ptr, int val, size_t n) {
	for(size_t i = 0; i < n; i++) {
		((char*)ptr)[i] = val;
	}
	return ptr;
}

void draw_checkerboard_gpu(uint16_t *addr) {
	//reset the sequence number
	GPU[0] = 5;
	
	uint32_t gpu_seq = 0;
	//set the stride
	GPU[9] = 800*2;
	gpu_seq++;
	
	uint16_t tile_height = ((600 + 31)/32);
	uint16_t tile_width = ((800 + 31)/32);
	for(int i = 0; i < tile_height; i++) {
		for(int j = 0; j < tile_width; j++) {
			//clear tile
			
			color_t color;
			if((i % 2) == (j % 2)) {
				color = COLOR(0, 0, 0);
			} else {
				color = COLOR(31, 31, 31);
			}

			GPU[1] = color;

			GPU[2] = 0;
			GPU[3] = 0;
			GPU[4] = 0;
			GPU[10] = 0;
			GPU[11] = 0;
			GPU[12] = 0;
			
			GPU[5] = 1;
			GPU[6] = 1;
			GPU[7] = 1;
			
			GPU[8] = ((uint32_t)(addr)) + (i*32*800*2) + (j*32*2);
						
			//start rendering tile
			GPU[0] = 0;
			gpu_seq += 12;
			
			//write it to fifo
			GPU[0] = 2;
			GPU[0] = 4;
			gpu_seq += 2;
		}
	}	
	//wait for all data to finish writing
	GPU[0] = 3;
	GPU[0] = 4;
	gpu_seq += 2;
	while(GPU[0] < gpu_seq);

}

void gpu_test(uint16_t *addr, color_t color) {
	//reset the sequence number
	GPU[0] = 5;
	
	uint32_t gpu_seq = 0;
	//set the stride
	GPU[9] = 800*2;
	gpu_seq++;
	
	//clear tile
	GPU[1] = color;

	GPU[2] = 0;
	GPU[3] = 0;
	GPU[4] = 0;
	GPU[10] = 0;
	GPU[11] = 0;
	GPU[12] = 0;
	
	GPU[5] = 1;
	GPU[6] = 1;
	GPU[7] = 1;
	
	GPU[8] = ((uint32_t)(addr));
				
	//start rendering tile
	GPU[0] = 0;
	gpu_seq += 12;
	
	//write it to fifo
	GPU[0] = 2;
	gpu_seq++;

	//wait for all data to finish writing
	GPU[0] = 3;
	GPU[0] = 4;
	gpu_seq += 2;
	uint32_t seq_no = 0;
	while(seq_no < gpu_seq) {
		seq_no = GPU[0];
		*LEDR = seq_no;
	}

}

void set_rect(point_t *vertices, uint32_t start, float x, float y, float size) {
    vertices[start + 0] = (point_t){.x = x, .y = y-size, .z = -size};
    vertices[start + 1] = (point_t){.x = x, .y = y-size, .z = size};
    vertices[start + 2] = (point_t){.x = x, .y = y+size, .z = size};
    vertices[start + 3] = (point_t){.x = x, .y = y+size, .z = -size};
}

void create_rect_prisim(triangle_t *tris, uint32_t start, uint32_t v) {
    color_t lightBlue = COLOR(13,20,31);
	color_t yellow = COLOR(31,31,0);
	color_t red = COLOR(31,0,0);
	color_t green = COLOR(0,29,5);
	color_t purple = COLOR(15,0,19);
	color_t orange = COLOR(31,16,0);
    
    //left
    tris[start + 0] = (triangle_t){.v0 = v + 0, .v1 = v + 1, .v2 = v + 2, .color = yellow};
    tris[start + 1] = (triangle_t){.v0 = v + 0, .v1 = v + 2, .v2 = v + 3, .color = yellow};
    
    //right
    tris[start + 2] = (triangle_t){.v0 = v + 4, .v1 = v + 6, .v2 = v + 5, .color = lightBlue};
    tris[start + 3] = (triangle_t){.v0 = v + 4, .v1 = v + 7, .v2 = v + 6, .color = lightBlue};
    
    //front
    tris[start + 4] = (triangle_t){.v0 = v + 1, .v1 = v + 5, .v2 = v + 6, .color = red};
    tris[start + 5] = (triangle_t){.v0 = v + 1, .v1 = v + 6, .v2 = v + 2, .color = red};
    
    //back
    tris[start + 6] = (triangle_t){.v0 = v + 4, .v1 = v + 3, .v2 = v + 7, .color = green};
    tris[start + 7] = (triangle_t){.v0 = v + 4, .v1 = v + 0, .v2 = v + 3, .color = green};
    
    //top
    tris[start + 8] = (triangle_t){.v0 = v + 0, .v1 = v + 4, .v2 = v + 5, .color = orange};
    tris[start + 9] = (triangle_t){.v0 = v + 0, .v1 = v + 5, .v2 = v + 1, .color = orange};
    
    //bottom
    tris[start + 10] = (triangle_t){.v0 = v + 2, .v1 = v + 6, .v2 = v + 7, .color = purple};
    tris[start + 11] = (triangle_t){.v0 = v + 2, .v1 = v + 7, .v2 = v + 3, .color = purple};
}

void create_rect_prisim_back_face(triangle_t *tris, uint32_t start, uint32_t v) {
    color_t lightBlue = COLOR(13,20,31);
	color_t yellow = COLOR(31,31,0);
	color_t red = COLOR(31,0,0);
	color_t green = COLOR(0,29,5);
	color_t purple = COLOR(15,0,19);
	color_t orange = COLOR(31,16,0);
    
    //left
    tris[start + 0] = (triangle_t){.v0 = v + 0, .v1 = v + 2, .v2 = v + 1, .color = yellow};
    tris[start + 1] = (triangle_t){.v0 = v + 0, .v1 = v + 3, .v2 = v + 2, .color = yellow};
    
    //right
    tris[start + 2] = (triangle_t){.v0 = v + 4, .v1 = v + 5, .v2 = v + 6, .color = lightBlue};
    tris[start + 3] = (triangle_t){.v0 = v + 4, .v1 = v + 6, .v2 = v + 7, .color = lightBlue};
    
    //front
    tris[start + 4] = (triangle_t){.v0 = v + 1, .v1 = v + 6, .v2 = v + 5, .color = red};
    tris[start + 5] = (triangle_t){.v0 = v + 1, .v1 = v + 2, .v2 = v + 6, .color = red};
    
    //back
    tris[start + 6] = (triangle_t){.v0 = v + 4, .v1 = v + 7, .v2 = v + 3, .color = green};
    tris[start + 7] = (triangle_t){.v0 = v + 4, .v1 = v + 3, .v2 = v + 0, .color = green};
    
    //top
    tris[start + 8] = (triangle_t){.v0 = v + 0, .v1 = v + 5, .v2 = v + 4, .color = orange};
    tris[start + 9] = (triangle_t){.v0 = v + 0, .v1 = v + 1, .v2 = v + 5, .color = orange};
    
    //bottom
    tris[start + 10] = (triangle_t){.v0 = v + 2, .v1 = v + 7, .v2 = v + 6, .color = purple};
    tris[start + 11] = (triangle_t){.v0 = v + 2, .v1 = v + 3, .v2 = v + 7, .color = purple};
}


int main(void) {
	uint16_t *frontFB = (uint16_t*)(DRAM);
	uint16_t *backFB = (uint16_t*)(DRAM + 243200);

    point_t *vertices = (point_t*)(DRAM + 243200*2);
    uint16_t nvertices = 0;
    triangle_t *tris = (triangle_t*)(DRAM + (uint32_t)(243200*2.5f));
    uint16_t ntris = 0;
    
    set_rect(vertices, nvertices, 0, 0, 0.2);
    nvertices += 4;
    
    set_rect(vertices, nvertices, 0.4, 0, 0.2);
    nvertices += 4;
    
    create_rect_prisim(tris, ntris, 0);
    ntris += 12;
    
    nvertices += 4;
    ntris += 12;

    	
	VGA[1] = (uint32_t)frontFB;
	
	int32_t xpos = 0;
	int32_t ypos = 0;
	int32_t zpos = 0;
    
    float currX = 0.4;
    float currY = 0;
    uint32_t index = 1;
    uint32_t frame = 0;
	while(1) {
        //update the preview pos with the switches
        uint32_t sw = *SW;
        uint32_t size = sw & 0x3;
        float newX = (((sw >> 2) & 0xff)/128.0f)-1;
        float newY = (((sw >> 10) & 0xff)/128.0f)-1;
        //draw it
        set_rect(vertices, nvertices-4, newX, newY, size*0.2f);

        if(newX < currX) {
            create_rect_prisim_back_face(tris, ntris-12, index*4);
        } else {
            create_rect_prisim(tris, ntris-12, index*4);
        }

		if(*KEY & 0x1) {
			xpos += 1;
			xpos %= 360;
		}
		if(*KEY & 0x2) {
			ypos += 1;
			ypos %= 360;
		}
		if(*KEY & 0x4) {
            //draw another section
            if(newX != currX || newY != currY) {
                nvertices += 4;
                ntris += 12;
                currX = newX;
                currY = newY;
                index++;
            }
//			zpos += 1;
//			zpos %= 360;
            
		}
				        
		render_target_t target = {
			.framebuffer = backFB,
			.stride = 800*2,
			.width = 800,
			.height = 600,
		};
				
		float xAngle = (xpos/360.0f)*F_2_PI;
		float sinX = sine(xAngle);
		float cosX = cosine(xAngle);
		float rotMatX[] = {
			1, 0, 0, 0,
			0, cosX, -sinX, 0,
			0, sinX, cosX, 0,
			0, 0, 0, 1,
		};
		float yAngle = (ypos/360.0f)*F_2_PI;
		float sinY = sine(yAngle);
		float cosY = cosine(yAngle);
		float rotMatY[] = {
			cosY, 0, sinY, 0,
			0, 1, 0, 0,
			-sinY, 0, cosY, 0,
			0, 0, 0, 1,
		};
		float zAngle = (zpos/360.0f)*F_2_PI;
		float sinZ = sine(zAngle);
		float cosZ = cosine(zAngle);
		float rotMatZ[] = {
			cosZ, -sinZ, 0, 0,
			sinZ, cosZ, 0, 0,
			0, 0, 1, 0,
			0, 0, 0, 1,
		};

		float viewMat[] = {
			0.5, 0, 0, 0,
			0, 0.5, 0, 0,
			0, 0, 0.5, -2.0,
			0, 0, 0, 1,			
		};
		
		float near = 0.1;
		float far = 100;
		float top = 0.1;
		float bottom = -top;
		float right = (4.0f/3.0f) * top;
		float left = -right;
		
		float tmp[16];
		scene_t scene = {
			.background = COLOR(0, 0, 0),
			.poly_list = {
				.vertices = vertices,
				.triangles = tris,
				.nvertices = nvertices,
				.ntris = ntris,
			},
			//perspective
			.proj = {
				2*near/(right-left), 0, (right+left)/(right-left), 0,
				0, 2*near/(top-bottom), (top+bottom)/(top-bottom), 0,
				0, 0, -(far+near)/(far-near), -(2*far*near)/(far-near),
				0, 0, -1, 0,			
			},
			
			//ortho
			// .proj = {
				// 2/(right-left), 0, 0, -(right+left)/(right-left),
				// 0, 2/(top-bottom), 0, -(top+bottom)/(top-bottom),
				// 0, 0, -2/(far-near), -(far+near)/(far-near),
				// 0, 0, 0, 1,			
			// },
		};
		mult_4x4(rotMatY, rotMatX, scene.view);
		mult_4x4(rotMatZ, scene.view, tmp);
		mult_4x4(viewMat, tmp, scene.view);

		//if(SW[0] & 0x2) {
		//	gradient(frontFB);
		//	flush_dcache();
		//	while(SW[0] & 0x2);
		//}
		//if(SW[0] & 0x4) {
		//	draw_checkerboard_gpu(frontFB);
		//	while(SW[0] & 0x4);
		//}
		
		//time for the magic
		gpu_render_scene(&target, &scene);
				
		//send the fresh frame to the VGA module
		VGA[1] = (uint32_t)backFB;
		
		//wait for the VGA module to start using the new buffer
		while(VGA[1] != (uint32_t)backFB);
		
		//how many times did the screen draw while we rendered this frame?
        uint32_t frames = VGA[0];
		*LEDR = frames;
        frame += frames;
		
		//swap back/front buffers 
		uint16_t *tmpFB = backFB;
		backFB = frontFB;
		frontFB = tmpFB;
	}
	return 0;
}
