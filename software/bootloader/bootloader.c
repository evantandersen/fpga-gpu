// Written by:
//     Evan Andersen
//
// Created March 22, 2013

#include <stdint.h>

#define DRAM ((uint32_t*)0x08000000)
#define VGA ((volatile uint32_t*)0x80001000)
#define GPU ((volatile uint32_t*)0x80001040)
#define LEDR ((volatile uint32_t*)0x80001010)
#define SW ((volatile uint32_t*)0x80001020)

#define F_PI 3.14159265359f
#define F_2_PI 6.28318530718f


#define COLOR(r,g,b) (((r & 0x1f) << 10) | ((g & 0x1f) << 5) | (b & 0x1f))

#define SUBSTEP (16)

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

void clear_to_color(uint16_t *addr, uint16_t color) {
	uint32_t *buf = (uint32_t*)addr;
	uint32_t val = (color << 16) | color;
	for(int i = 0; i < 600; i++) {
		for(int j = 0; j < 400; j++) {
			buf[i * 400 + j] = val;
		}
	}
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

int abs(int x) {
	if(x < 0) {
		return -x;
	}
	return x;
}
 
 typedef struct {
	 int16_t x;
	 int16_t y;
 } point;

int orient2d(point a, point b, point c)
{
    return (b.x-a.x)*(c.y-a.y) - (b.y-a.y)*(c.x-a.x);
}

int isTopLeft(point v0, point v1) {
	//top edge
	if(v0.y == v1.y && v0.x > v1.x) {
		return 1;
	}
	//left edge
	if(v1.y > v0.y) {
		return 1;
	}
	return 0;
}

int min3(int a, int b, int c) {
	int ab = a;
	if (b < a) {
		ab = b;
	}
	if(ab < c) {
		return ab;
	} else {
		return c;
	}
}

int max3(int a, int b, int c) {
	int ab = a;
	if(b > ab) {
		ab = b;
	}
	if(ab > c) {
		return ab;
	} else {
		return c;
	}
}

typedef struct {
	point v0;
	point v1;
	point v2;
	uint16_t color;
} triangle_t;

int tri_overlap_tile(triangle_t* tri, uint16_t x, uint16_t y) {
	//check min/max
	int minX = min3(tri->v0.x, tri->v1.x, tri->v2.x);
	int minY = min3(tri->v0.y, tri->v1.y, tri->v2.y);
	int maxX = max3(tri->v0.x, tri->v1.x, tri->v2.x);
	int maxY = max3(tri->v0.y, tri->v1.y, tri->v2.y);

	if(minX >= (x+1)*16*32) {
		return 0;
	}
	if(minY >= (y+1)*16*32) {
		return 0;	
	}
	if(maxX < x*16*32) {
		return 0;
	}
	if(maxY < y*16*32) {
		return 0;
	}
	return 1;
}

void draw_triangles_barycentric_gpu(uint16_t* fbaddr, triangle_t* tris, uint32_t ntri) {
	
	//set the stride
	GPU[8] = 800*2;

	for(int i = 0; i < 19; i++) {
		for(int j = 0; j < 25; j++) {
			//clear tile
			//x, y and color
			GPU[0] = (j << 21) | (i << 16) | COLOR(31, 31, 31);

			GPU[1] = 0;
			GPU[2] = 0;
			GPU[3] = 0;
			GPU[10] = 0;
			GPU[11] = 0;
			GPU[12] = 0;
			
			GPU[4] = 1;
			GPU[5] = 1;
			GPU[6] = 1;
			
			GPU[7] = (uint32_t)(fbaddr) + (i*32*800*2) + (j*32*2);
						
			//start rendering tile
			GPU[9] = 1;
			//wait for it to finish
			while(GPU[9]);
			
			//render triangles
			for(int tri = 0; tri < ntri; tri++) {
				triangle_t* curr = &tris[tri];
				
				//if triangle doesn't overlap tile, no need to render
				if(!tri_overlap_tile(curr, j, i)) {
					continue;
				}

				int32_t A01 = (curr->v0.y - curr->v1.y);
				int32_t B01 = (curr->v1.x - curr->v0.x) - 31*A01;	
					
				int32_t A12 = (curr->v1.y - curr->v2.y);
				int32_t B12 = (curr->v2.x - curr->v1.x) - 31*A12;
				
				int32_t A20 = (curr->v2.y - curr->v0.y);
				int32_t B20 = (curr->v0.x - curr->v2.x) - 31*A20;

							
				//x, y and color
				GPU[0] = (j << 21) | (i << 16) | curr->color;

				GPU[1] = A01;
				GPU[2] = A12;
				GPU[3] = A20;
				
				GPU[10] = B01;
				GPU[11] = B12;
				GPU[12] = B20;
			
				//set the w's
				point p = { j*16*32, i*16*32 };
				int32_t w0_row = orient2d(curr->v1, curr->v2, p);
				int32_t w1_row = orient2d(curr->v2, curr->v0, p);
				int32_t w2_row = orient2d(curr->v0, curr->v1, p);
				
				w0_row -= isTopLeft(curr->v1, curr->v2) ? 0 : SUBSTEP;
				w1_row -= isTopLeft(curr->v2, curr->v0) ? 0 : SUBSTEP;
				w2_row -= isTopLeft(curr->v0, curr->v1) ? 0 : SUBSTEP;

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

void draw_triangle_barycentric(uint16_t* addr, point v0, point v1, point v2, uint16_t color) {
	
    // Compute triangle bounding box
    int minX = min3(v0.x, v1.x, v2.x);
    int minY = min3(v0.y, v1.y, v2.y);
    int maxX = max3(v0.x, v1.x, v2.x);
    int maxY = max3(v0.y, v1.y, v2.y);
	
	//coordinates in 1/16ths of a pixel
	int subMask = SUBSTEP - 1;

	minX = (minX + subMask) & ~subMask;
    minY = (minY + subMask) & ~subMask;

	//dont mult by SUBSTEP for hw
	int16_t A01 = (v0.y - v1.y);
	int16_t B01 = (v1.x - v0.x);
	
    int16_t A12 = (v1.y - v2.y);
	int16_t B12 = (v2.x - v1.x);
	
    int16_t A20 = (v2.y - v0.y);
	int16_t B20 = (v0.x - v2.x);

    // Barycentric coordinates at minX/minY corner
    point p = { minX, minY };
    int w0_row = orient2d(v1, v2, p);
    int w1_row = orient2d(v2, v0, p);
    int w2_row = orient2d(v0, v1, p);

	//Fill rules
	w0_row -= isTopLeft(v1, v2) ? 0 : SUBSTEP;
    w1_row -= isTopLeft(v2, v0) ? 0 : SUBSTEP;
    w2_row -= isTopLeft(v0, v1) ? 0 : SUBSTEP;
	
    // Rasterize	
    for (p.y = minY; p.y <= maxY; p.y += SUBSTEP) {
        // Barycentric coordinates at start of row
		int w0 = w0_row;
		int w1 = w1_row;
		int w2 = w2_row;

        for (p.x = minX; p.x <= maxX; p.x += SUBSTEP) {
            // If p is on or inside all edges, render pixel.
            if ((w0 | w1 | w2) >= 0) {
				uint16_t x = p.x / 16;
				uint16_t y = p.y / 16;
                addr[y*800 + x] = color;        
			}
            // One step to the right
            w0 += A12*SUBSTEP;
            w1 += A20*SUBSTEP;
            w2 += A01*SUBSTEP;
        }

        // One row step
        w0_row += B12*SUBSTEP;
        w1_row += B20*SUBSTEP;
        w2_row += B01*SUBSTEP;
    }
}

void show_tiles(void) {
	uint16_t *frontFB = (uint16_t*)DRAM;
	uint16_t *backFB = (uint16_t*)(DRAM + 243200);
	
	VGA[1] = 0; 
	
	point v0 = {.x = 250*16, .y = 100*16};
	point v1 = {.x = 750*16, .y = 50*16};
	point v2 = {.x = 150*16, .y = 500*16};

	
	uint16_t black = COLOR(0, 0, 0);
	clear_to_color(frontFB, black);
	clear_to_color(backFB, black);
	flush_dcache();
	VGA[1] = (uint32_t)frontFB;
	
	int16_t A01 = (v0.y - v1.y);
	int16_t B01 = (v1.x - v0.x);
	//careful to cast to a uint first, otherwise the leading 1's get extended into all 32 bits
	GPU[1] = (A01 << 16) |  (uint16_t)B01;
	
	int16_t A12 = (v1.y - v2.y);
	int16_t B12 = (v2.x - v1.x);
	GPU[2] = (A12 << 16) |  (uint16_t)B12;
	
	int16_t A20 = (v2.y - v0.y);
	int16_t B20 = (v0.x - v2.x);
	GPU[3] = (A20 << 16) |  (uint16_t)B20;
	
	//set the stride
	GPU[8] = 800*2;
	
	
	for(int maxLoc = 0; maxLoc <= 475; maxLoc++) {		
		for(int loc = 0; loc < maxLoc; loc++) {
			uint16_t i = loc / 25;
			uint16_t j = loc % 25;
			
			//set the clear bit, x, y and color
			GPU[0] = (1 << 26) | (j << 21) | (i << 16) | COLOR(31, 0, 0);
			
			//set the w's
			point p = { j*16*32, i*16*32 };
			int32_t w0_row = orient2d(v1, v2, p);
			int32_t w1_row = orient2d(v2, v0, p);
			int32_t w2_row = orient2d(v0, v1, p);
			
			w0_row -= isTopLeft(v1, v2) ? 0 : SUBSTEP;
			w1_row -= isTopLeft(v2, v0) ? 0 : SUBSTEP;
			w2_row -= isTopLeft(v0, v1) ? 0 : SUBSTEP;

			GPU[4] = w0_row;
			GPU[5] = w1_row;
			GPU[6] = w2_row;
			
			GPU[7] = (uint32_t)(backFB) + (i*32*800*2) + (j*32*2);
			//start rendering tile
			GPU[9] = 1;
			//wait for it to finish
			while(GPU[9]);
			
			//write it to memory
			GPU[9] = 2;
						
			//wait to complete
			while(GPU[9]);
		}
		VGA[1] = (uint32_t)backFB;
		uint16_t *tmpFB = backFB;
		backFB = frontFB;
		frontFB = tmpFB;
		
		//speed of animation controlled by SW bits 17 to 14
		int framesToWait = (*SW >> 10);
		int frames = 0;
		while(frames < framesToWait) {
			frames += VGA[0];
		}
	}
}

float sine_inner(float x)
{
    // useful to pre-calculate
    float x2 = x*x;
    float x4 = x2*x2;

    // Calculate the terms
    // As long as abs(x) < sqrt(6), which is 2.45, all terms will be positive.
    // Values outside this range should be reduced to [-pi/2, pi/2] anyway for accuracy.
    // Some care has to be given to the factorials.
    // They can be pre-calculated by the compiler,
    // but the value for the higher ones will exceed the storage capacity of int.
    // so force the compiler to use unsigned long longs (if available) or doubles.
    float t1 = x * (1.0f - x2 / (2*3));
    float x5 = x * x4;
    float t2 = x5 * (1.0f - x2 / (6*7)) / (1.0f* 2*3*4*5);
    float x9 = x5 * x4;
    float t3 = x9 * (1.0f - x2 / (10*11)) / (1.0f* 2*3*4*5*6*7*8*9);
    float x13 = x9 * x4;
    float t4 = x13 * (1.0f - x2 / (14*15)) / (1.0f* 2*3*4*5*6*7*8*9*10*11*12*13);
    // add some more if your accuracy requires them.
    // But remember that x is smaller than 2, and the factorial grows very fast
    // so I doubt that 2^17 / 17! will add anything.
    // Even t4 might already be too small to matter when compared with t1.

    // Sum backwards
    float result = t4;
    result += t3;
    result += t2;
    result += t1;

    return result;
}

float sine(float x) {
	if(x > F_PI) {
		return -sine_inner(x - F_PI);
	}
	return sine_inner(x);
}

float cosine(float x) {
	return sine(x + F_PI/2);
}

void rotate_point(point* p, float s, float c) {
	float xnew = p->x * c - p->y * s;
	float ynew = p->x * s + p->y * c;
	
	p->x = xnew;
	p->y = ynew;
}

int main(void) {
	// while(1) {
		// show_tiles();
	// }	
	uint16_t *frontFB = (uint16_t*)DRAM;
	uint16_t *backFB = (uint16_t*)(DRAM + 243200);

	//clear the buffers to the gradient background
	VGA[1] = 0; //disable the screen for a second
	
	int lightBlue = COLOR(13,20,31);
	
	
	// point e = {.x = 0*16, .y = 0*16};
	// point f = {.x = 100*16, .y = 50*16};
	// point g = {.x = 0*16, .y = 100*16};

	
	// gradient(frontFB);
	// gradient(backFB);
		
	// draw_triangle_barycentric(frontFB, a, d, c, COLOR(31, 15, 0));
	// draw_triangle_barycentric(backFB, a, d, c, lightBlue);
		// flush_dcache();

//	draw_triangle_barycentric_gpu(backFB, a, d, c, lightBlue);

	
	// uint16_t orange = COLOR(31, 15, 0);
	// frontFB[800*600] = orange;
	// backFB[800*600] = orange;
	

	//draw_triangle_barycentric_gpu(frontFB, a, d, c, COLOR(31, 0, 0));
	// gradient(backFB);
	// flush_dcache();

	VGA[1] = (uint32_t)backFB;
	// while(1);
	
	// uint16_t* buff[2] = {frontFB, backFB}; 
	
	uint32_t pos = 0;
	uint32_t angle = 0;
	uint32_t width = 50;
	uint32_t distance = 500 - width;
	while(1) {
		pos += 2;
		pos %= distance*2;
		angle += 1;
		angle %= 360;
		
		uint32_t y = pos;
		if(y > distance) {
			y = distance*2 - y;
		}
		//y = distance*sine(((float)y)/(float)distance*F_2_PI);
		y += 75;
		//uint32_t y = 100;
		float rad = angle*F_2_PI/360.0f;
		float cosT = cosine(rad);
		float sinT = sine(rad);
		

		
		point a = {.x = -150*16, .y = -(width/2)*16};
		point b = {.x = 150*16, .y = (width/2)*16};
		point c = {.x = -150*16, .y = (width/2)*16};
		point d = {.x = 150*16, .y = -(width/2)*16};
		
		rotate_point(&a, sinT, cosT);
		rotate_point(&b, sinT, cosT);
		rotate_point(&c, sinT, cosT);
		rotate_point(&d, sinT, cosT);

		a.x += 400*16;
		a.y += y*16;
		
		b.x += 400*16;
		b.y += y*16;
		
		c.x += 400*16;
		c.y += y*16;
		
		d.x += 400*16;
		d.y += y*16;

		triangle_t tris[] =  {
			{.v0 = a, .v1 = d, .v2 = c, .color = lightBlue},
			{.v0 = d, .v1 = b, .v2 = c, .color = COLOR(31,0,0)},
		};
		int32_t ntris = sizeof(tris)/sizeof(triangle_t);

		while(SW[0] & 2);
		draw_triangles_barycentric_gpu(backFB, tris, ntris);
		
		// VGA[1] = ((uint32_t)buff[SW[0] & 1]) + (SW[0] & 2);
		// int frames = 0;
		// while(frames < 10) {
			// frames += VGA[0];
		// }
				
		//swap the buffers
		VGA[1] = (uint32_t)backFB;
		uint16_t *tmpFB = backFB;
		backFB = frontFB;
		frontFB = tmpFB;
		c.x++;
		
		int frames;
		while(!(frames = VGA[0]));
		*LEDR = frames;
	}
	return 0;
}
