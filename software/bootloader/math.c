// Written by:
//     Evan Andersen
//
// Created March 22, 2013

#include "math.h"


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
