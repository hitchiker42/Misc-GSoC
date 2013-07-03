#include <stdio.h>
#include <x86intrin.h>
#include <stdlib.h>
#define v4sf __v4sf
#define v2df __v2df
typedef union {
  unsigned int as_int;
  int as_signed;
  float as_float;
} word32;
typedef union {
  unsigned long as_long;
  long as_signed;
  double as_double;
} word64;
v4sf float_a = {1.0,2.0,3.0,4.0};
v4sf float_b = {4.0,3.0,2.0,1.0};
v2df double_a = {1.0,2.0};

