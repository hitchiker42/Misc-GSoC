#include<stdio.h>
#include<x86intrin.h>
#include<stdlib.h>
typedef union {
  unsigned int as_int;
  float as_float;
} word32;
typedef union {
  unsigned long as_long;
  long as_signed;
  double as_double;
} word64;
int main(){
  word64 x,y;
  y.as_long = 0x0FFFFFFF;
  x.as_long << 63;
  printf("x: %lf, y:%lf\n",x.as_double,y.as_double);
  return 0;
}
  
