#include <x86intrin.h>
#define v4sf __v4sf
#define v2df __v2df
#define v16qi __v16qi
#define v8hi __v8hi
#define v4si __v4si
#define v2di __v2di
#ifdef _EMMINTRIN_H_INCLUDED
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
void andpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_andpd(x,y));
}
void minpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_minpd(x,y));
}
void maxpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_maxpd(x,y));
}
void orpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_orpd(x,y));
}
void xorpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_xorpd(x,y));
}
void andnpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_andnpd(x,y));
}
void cmpeqpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_cmpeqpd(x,y));
}
void cmpltpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_cmpltpd(x,y));
}
void cmplepd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_cmplepd(x,y));
}
void cmpgtpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_cmpgtpd(x,y));
}
void cmpgepd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_cmpgepd(x,y));
}
void cmpunordpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_cmpunordpd(x,y));
}
void cmpneqpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_cmpneqpd(x,y));
}
void cmpnltpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_cmpnltpd(x,y));
}
void cmpnlepd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_cmpnlepd(x,y));
}
void cmpngtpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_cmpngtpd(x,y));
}
void cmpngepd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_cmpngepd(x,y));
}
void cmpordpd(double * arg1,double * arg2,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_cmpordpd(x,y));
}
void sqrtpd(double * arg1,double * retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  __builtin_ia32_storeupd(retval,__builtin_ia32_sqrtpd(x));
}
#endif
