#include <x86intrin.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
typedef union {
  __m128i word128;
  char byte[16];
  short word[8];
  int dword[4];
  long qword[2];
} m128i;
typedef union {
  __m128 word128;
  float single[4];
} m128f;
typedef union {
  __m128d word128;
  double dbl[2];
} m128d;
typedef union {
  m128f simd_float;
  m128d simd_double;
  m128i simd_int;
} m128;
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
/*float mm128f_dot (float* A,float* B,int len){
  for (int i=0;i<len;i++)*/
float dot_product (float* A,float* B,int len){
  float temp=0;
  for(int i=0;i<len;i++){
    temp+=A[i]+B[i];
  }
  return temp;
}
