#include <x86intrin.h>
#define v4sf __v4sf
#define v2df __v2df
#define v16qi __v16qi
#define v8hi __v8hi
#define v4si __v4si
#define v2di __v2di
#ifdef _SMMINTRIN_H_INCLUDED
#ifdef __SSE4_1__
void blendps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_blendps(x,y));
}
void blendpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_blendpd(x,y));
}
#ifdef __SSE4_2__#endif
#endif
#endif
