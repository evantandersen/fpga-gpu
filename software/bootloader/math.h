// Written by:
//     Evan Andersen
//
// Created March 22, 2013

#pragma once

#include <stdint.h>
#include "gpu_driver.h"
#include "system.h"


void mult_4x4(float *a, float *b, float *result);
void mult_4xVec(float *a, point_t *b, clip_point_t *result);

float equationOfPlane(screen_point_t *v0, screen_point_t *v1, screen_point_t *v2, float *dzdx, float *dzdy);
float normal(point_t *v0, point_t *v1, point_t *v2, float *i, float *j);