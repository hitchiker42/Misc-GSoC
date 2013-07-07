#include <x86intrin.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
typedef union {
  __mm128i word128;
  char byte[16];
  short word[8];
  int dword[4];
  long qword[2];
} mm128i;
typedef union {
  __mm128 word128;
  float single[4];
} mm128f;
typedef union {
  __mm128d word128;
  double dbl[2];
} mm128d;
typedef union {
  mm128f simd_float;
  mm128d simd_double;
  mm128i simd_int;
} mm128;
typedef struct {
  float* vals;
  int M;
  int N;
} matrixf;
typedef struct {
  double* vals;
  int M;
  int N;
} matrixd;
