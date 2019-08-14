// Written by:
//     Evan Andersen
//
// Created January 20, 2017


#include "vector_math.h"


void mult_4x4(float *a, float *b, float *result) {
	for(uint8_t i = 0; i < 4; i++) {
		for(uint8_t j = 0; j < 4; j++) {
			float sum = 0.0f;
			for(uint8_t k = 0; k < 4; k++) {
				sum += a[i*4 + k]*b[k*4 + j];
			}
			result[i*4 + j] = sum;
		}
	}	
}

void mult_4xVec(float *a, point_t *b, clip_point_t *result) {
	result->x = a[0]*b->x + a[1]*b->y + a[2]*b->z + a[3];
	result->y = a[4]*b->x + a[5]*b->y + a[6]*b->z + a[7];
	result->z = a[8]*b->x + a[9]*b->y + a[10]*b->z + a[11];
	result->w = a[12]*b->x + a[13]*b->y + a[14]*b->z + a[15];
}

float equationOfPlane(screen_point_t *v0, screen_point_t *v1, screen_point_t *v2, float *dzdx, float *dzdy) {
    //compute two vectors, V01 and V02
    float V01_x = v1->x - v0->x;
    float V01_y = v1->y - v0->y;
    float V01_z = v1->z - v0->z;

    float V02_x = v2->x - v0->x;
    float V02_y = v2->y - v0->y;
    float V02_z = v2->z - v0->z;

    //compute the normal
    float i = (V01_y*V02_z) - (V01_z*V02_y);
    float j = (V01_z*V02_x) - (V01_x*V02_z);
    float k = (V01_x*V02_y) - (V01_y*V02_x);

    //compute the plane equation in the form Z = ix + jy + c
    float c = (v0->x * i) + (v0->y * j) + (v0->z * k);
    c /= k;
    *dzdx = i / -k;
    *dzdy = j / -k;
    return c; 
}

float normal(point_t *v0, point_t *v1, point_t *v2, float *i, float *j) {
    //compute two vectors, V01 and V02
    float V01_x = v1->x - v0->x;
    float V01_y = v1->y - v0->y;
    float V01_z = v1->z - v0->z;

    float V02_x = v2->x - v0->x;
    float V02_y = v2->y - v0->y;
    float V02_z = v2->z - v0->z;

    //compute the normal
    *i = (V01_y*V02_z) - (V01_z*V02_y);
    *j = (V01_z*V02_x) - (V01_x*V02_z);
    float k = (V01_x*V02_y) - (V01_y*V02_x);

    return k; 
}
