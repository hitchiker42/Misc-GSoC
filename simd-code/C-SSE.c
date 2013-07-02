#include <x86intrin.h>
#ifdef _XMMINTRIN_H_INCLUDED
/*typedef float v4sf __attribute__ ((__vector_size__ (16)));
*/
#define v4sf __v4sf
void addps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_addps(x,y));
}
void subps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_subps(x,y));
}
void mulps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_mulps(x,y));
}
void divps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_divps(x,y));
}
void maxps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_maxps(x,y));
}
void minps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_minps(x,y));
}
void andps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_andps(x,y));
}
void orps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_orps(x,y));
}
void xorps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_xorps(x,y));
}
void andnps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_andnps(x,y));
}
void cmpeqps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_cmpeqps(x,y));
}
void cmpltps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_cmpltps(x,y));
}
void cmpleps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_cmpleps(x,y));
}
void cmpgtps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_cmpgtps(x,y));
}
void cmpgeps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_cmpgeps(x,y));
}
void cmpunordps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_cmpunordps(x,y));
}
void cmpneqps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_cmpneqps(x,y));
}
void cmpnltps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_cmpnltps(x,y));
}
void cmpnleps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_cmpnleps(x,y));
}
void cmpngtps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_cmpngtps(x,y));
}
void cmpngeps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_cmpngeps(x,y));
}
void cmpordps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_cmpordps(x,y));
}
void rcpps(float * arg1,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  __builtin_ia32_storeups(retval,__builtin_ia32_rcpps(x));
}
void sqrtps(float * arg1,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  __builtin_ia32_storeups(retval,__builtin_ia32_sqrtps(x));
}
void rsqrtps(float * arg1,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  __builtin_ia32_storeups(retval,__builtin_ia32_rsqrtps(x));
}
#endif
