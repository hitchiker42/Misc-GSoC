#include <x86intrin.h>
#ifdef _EMMINTRIN_H_INCLUDED
#define v4sf __v4sf
#define v2df __v2df
#define v16qi __v16qi
#define v8hi __v8hi
#define v4si __v4si
#define v2di __v2di
void addpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_addpd(x,y));
}
void subpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_subpd(x,y));
}
void mulpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_mulpd(x,y));
}
void divpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_divpd(x,y));
}
void rcppd(double * arg1,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  __builtin_ia32_storeupd(retval,__builtin_ia32_rcppd(x));
}
void sqrtpd(double * arg1,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  __builtin_ia32_storeupd(retval,__builtin_ia32_sqrtpd(x));
}
void rsqrtpd(double * arg1,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  __builtin_ia32_storeupd(retval,__builtin_ia32_rsqrtpd(x));
}
#endif
