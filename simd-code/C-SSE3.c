#include <x86intrin.h>
#define v4sf __v4sf
#define v2df __v2df
#define v16qi __v16qi
#define v8hi __v8hi
#define v4si __v4si
#define v2di __v2di
#ifdef _PMMINTRIN_H_INCLUDEDvoid addsubps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_addsubps(x,y));
}
void haddps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_haddps(x,y));
}
void hsubps(float * arg1,float * arg2,float * retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_hsubps(x,y));
}
void addsubpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_addsubpd(x,y));
}
void haddpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_haddpd(x,y));
}
void hsubpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_hsubpd(x,y));
}
#endif
ifdef _TMMINTRIN_H_INCLUDED
#endif
#endif
