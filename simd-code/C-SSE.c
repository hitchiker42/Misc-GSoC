#include <x86intrin.h>
#ifdef _XMMINTRIN_H_INCLUDED
/*typedef float v4sf __attribute__ ((__vector_size__ (16)));
*/
#define v4sf __v4sf
void addps(float *arg1,float* arg2,float* retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_addps(x,y));
}
void subps(float *arg1,float* arg2,float* retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_subps(x,y));
}
void mulps(float *arg1,float* arg2,float* retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_mulps(x,y));
}
void divps(float *arg1,float* arg2,float* retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_divps(x,y));
}
void maxps(float *arg1,float* arg2,float* retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_maxps(x,y));
}
void minps(float *arg1,float* arg2,float* retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_minps(x,y));
}
void rcpps(float* arg,float* retval){
  v4sf x = __builtin_ia32_loadups(arg);
  __builtin_ia32_storeups(retval,__builtin_ia32_rcpps(x));
}
void sqrtps(float* arg,float* retval){
  v4sf x = __builtin_ia32_loadups(arg);
  __builtin_ia32_storeups(retval,__builtin_ia32_sqrtps(x));
}
void rsqrtps(float* arg,float* retval){
  v4sf x = __builtin_ia32_loadups(arg);
  __builtin_ia32_storeups(retval,__builtin_ia32_rsqrtps(x));
}
#endif
