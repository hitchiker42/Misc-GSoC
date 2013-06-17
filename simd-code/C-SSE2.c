#include <x86intrin.h>
#include <stdlib.h>
#ifdef _EMMINTRIN_H_INCLUDED
#define v4sf __v4sf
#define v2df __v2df
#define v16qi __v16qi
#define v8hi __v8hi
#define v4si __v4si
#define v2di __v2di
double* addpd(float *arg1,double* arg2,double* retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_addpd(x,y));
  return retval;
}double* subpd(float *arg1,double* arg2,double* retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_subpd(x,y));
  return retval;
}double* mulpd(float *arg1,double* arg2,double* retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_mulpd(x,y));
  return retval;
}double* divpd(float *arg1,double* arg2,double* retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_divpd(x,y));
  return retval;
}