// Written by:
//     Evan Andersen
//
// Created January 21, 2017

#include <stdint.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#include <time.h>
#include "gpu_driver.h"
#include "system.h"

#define PI (3.14159265359f)

void drawLine(uint16_t *fb, size_t width, size_t barYpos, size_t barHeight, float barValue, color_t color) {

	size_t barWidth = barHeight*8;
	size_t colorEnd = ((float)barWidth)*barValue;

	size_t end = barYpos + barHeight;
	for(int i = barYpos; i < end; i++) {
		init_dcache(&fb[i*width], 2*(barWidth + 1));
		for(int j = 0; j < colorEnd; j++) {
			fb[i*width + j] = color;
		}
		for(int j = colorEnd; j < barWidth; j++) {
			fb[i*width + j] = 0;
		}
		fb[i*width + barWidth] = COLOR(31, 31, 31);
		flush_dcache(&fb[i*width], 2*(barWidth + 1));
	}

} 

size_t tokenizeString(char *src, char **tokens, size_t size) {
	size_t n = 0;
	while(n < size && *src != '\0') {
		//consume whitespace
		while(isspace(*src)) {
			src++;
			if(*src == '\0') {
				return n;
			}
		}
		tokens[n] = src;
		n++;
		//consume non-whitespace
		while(!isspace(*src)) {
			src++;
			if(*src == '\0') {
				return n;
			}
		}
		*src = '\0';
		src++;
	}
	return n;
}

void getNextLine(char *src, size_t *pos, size_t size, char *dst, size_t n) {
	size_t copied = 0;
	while(*pos < size) {
		char next = src[*pos];
		(*pos)++;

		if(next == '\n') {
			break;
		} else {
			dst[copied] = next;
			copied++; 
		}
	}
	dst[copied] = '\0';
}

void usage(const char *name) {
	fprintf(stderr, "Usage:\n\t%s <model_file> <opt:n_frames>\n", name);
}

int main(int argc, char *argv[]) {
	if(argc != 2 && argc != 3) {
		usage(argv[0]);
		return -1;
	}
	long framesToRender = 0;
	if(argc == 3) {
		framesToRender = strtol(argv[2], NULL, 10);
		if(framesToRender <= 0) {
			usage(argv[0]);
			return -1;
		}
	}

	volatile gpu_t *GPU = init_gpu();
	if(!GPU) {
		return -1;
	}
	vga_t *VGA = init_vga();
	if(!VGA) {
		return -1;
	}

	printf("1:%x 2:%x\n", VGA->buffers[0].paddr, VGA->buffers[1].paddr);

    FILE* file = fopen(argv[1], "r");
    if(!file) {
    	fprintf(stderr, "Failed to open file: %s:%s\n", argv[1], strerror(errno));
    	return -1;
    }

    size_t nvertices = 0;
    size_t nverts_alloced = 1000;
    point_t *vertices = malloc(sizeof(point_t) * nverts_alloced);

	size_t ntris = 0;
	size_t ntris_alloced = 2000;
	triangle_t *tris = malloc(sizeof(triangle_t) * ntris_alloced);

    char line[1024];
    while (fgets(line, sizeof(line), file)) {
    	char *tokens[10];
    	int nTok = tokenizeString(line, tokens, sizeof(tokens)/sizeof(tokens[0]));
    	//both triangles and vertices have 4 tokens
    	if(nTok == 4) {
    		if(!strcmp(tokens[0], "v")){
    			//found a vertex
    			if(nvertices >= nverts_alloced) {
    				nverts_alloced *= 2;
    				vertices = realloc(vertices, sizeof(point_t) * nverts_alloced);
    			}
    			vertices[nvertices].x = strtof(tokens[1], NULL);
	    		vertices[nvertices].y = strtof(tokens[2], NULL);
	    		vertices[nvertices].z = strtof(tokens[3], NULL);
	    		nvertices++;
    		} else if(!strcmp(tokens[0], "f")) {
    			//found a triangle
    			if(ntris >= ntris_alloced) {
    				ntris_alloced *= 2;
    				tris = realloc(tris, sizeof(triangle_t) * ntris_alloced);
    			}
    			tris[ntris].v0 = strtol(tokens[1], NULL, 10) - 1;
	    		tris[ntris].v1 = strtol(tokens[2], NULL, 10) - 1;
	    		tris[ntris].v2 = strtol(tokens[3], NULL, 10) - 1;
	    		tris[ntris].color = COLOR(31, 31, 31);
	    		ntris++;
    		}
    	}
    }

    fclose(file);

    //finished parsing, cleanup mem
    vertices = realloc(vertices, sizeof(point_t)*nvertices);
    tris = realloc(tris, sizeof(triangle_t)*ntris);

	VGA->regs->fbaddr = VGA->buffers[1].paddr;
	
	int32_t xpos = 180;
	int32_t ypos = 180;
	int32_t zpos = 0;
    
    uint32_t frame = 0;
	while(1) {
		zpos += 1;
		zpos %= 360;
		ypos += 1;
		ypos %= 360;
				        
		render_target_t target = {
			.framebuffer = VGA->buffers[frame % 2].paddr,
			.stride = 640*2,
			.width = 640,
			.height = 480,
		};
				
		float xAngle = (xpos/360.0f)*PI*2;
		float sinX = sin(xAngle);
		float cosX = cos(xAngle);
		float rotMatX[] = {
			1, 0, 0, 0,
			0, cosX, -sinX, 0,
			0, sinX, cosX, 0,
			0, 0, 0, 1,
		};
		float yAngle = (zpos/360.0f)*PI*2;
		float sinY = sin(yAngle);
		float cosY = cos(yAngle);
		float rotMatY[] = {
			cosY, 0, sinY, 0,
			0, 1, 0, 0,
			-sinY, 0, cosY, 0,
			0, 0, 0, 1,
		};
		float zAngle = (0/360.0f)*PI*2;
		float sinZ = sin(zAngle);
		float cosZ = cos(zAngle);
		float rotMatZ[] = {
			cosZ, -sinZ, 0, 0,
			sinZ, cosZ, 0, 0,
			0, 0, 1, 0,
			0, 0, 0, 1,
		};

		float viewMat[] = {
			0.02, 0, 0, 0,
			0, 0.02, 0, 1.0,
			0, 0, 0.02, -2.0,
			0, 0, 0, 1,			
		};
		
		float near = 0.1;
		float far = 100;
		float top = 0.1;
		float bottom = -top;
		float right = (4.0f/3.0f) * top;
		float left = -right;
		
		float tmp[16];
				float yAngle2 = (ypos/360.0f)*PI*2;

		scene_t scene = {
			.lightVector = {
				.x = sin(yAngle2),
				.y = 0,
				.z = cos(yAngle2),
			},
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
		
		//reset the GPU stats
		GPU->core[0] = 5;

		//time for the magic
		gpu_render_scene(GPU, &target, &scene);

		//send the fresh frame to the VGA module
		VGA->regs->fbaddr = VGA->buffers[frame % 2].paddr;

		//wait for the VGA module to start using the new buffer
		uint32_t count = 0;
		while(VGA->regs->fbaddr != VGA->buffers[frame % 2].paddr) {
			// struct timespec delay = {
			//    .tv_sec = 0,        /* seconds */
			//    .tv_nsec = 1e6,       /* nanoseconds */
			// };
			// nanosleep(&delay, NULL);
			//usleep(1000);
			count++;
		}
		if(frame < 3) {
			printf("Waited %u cycles\n", count);
		}

		frame++;

		// //fetch the GPU statistics and draw them to the top of the screen
		// size_t totalTick = GPU->core[1];
		// size_t rasterTick = GPU->core[2];
		// size_t writerTick = GPU->core[3];
		// size_t bufferTick = GPU->core[4];

		// float rasterDuty = ((float)rasterTick)/totalTick;
		// float writerDuty = ((float)writerTick)/totalTick;
		// float bufferDuty = ((float)bufferTick)/totalTick;

		// drawLine(target.framebuffer, target.width, 0, 15, rasterDuty, COLOR(0, 5, 31));
		// drawLine(target.framebuffer, target.width, 15, 15, writerDuty, COLOR(0, 15, 0));
		// drawLine(target.framebuffer, target.width, 30, 15, bufferDuty, COLOR(31, 31, 0));
		
        if(framesToRender > 0 && frame >= framesToRender) {
        	break;
        }
	}
	return 0;
}
