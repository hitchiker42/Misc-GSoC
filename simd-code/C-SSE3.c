#include <x86intrin.h>
#define v4sf __v4sf
#define v2df __v2df
#define v16qi __v16qi
#define v8hi __v8hi
#define v4si __v4si
#define v2di __v2di
#ifdef _PMMINTRIN_H_INCLUDED
void addsubps(float * arg1,float * arg2,float * retval){
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
void phaddw128(char* arg1,char* arg2,char* retval){
  v8hi x = __builtin_ia32_loaddqu(arg1);
  v8hi y = __builtin_ia32_loaddqu(arg2);
  __builtin_ia32_storedqu(retval,__builtin_ia32_phaddw128(x,y));
}
void phaddsw128(char* arg1,char* arg2,char* retval){
  v8hi x = __builtin_ia32_loaddqu(arg1);
  v8hi y = __builtin_ia32_loaddqu(arg2);
  __builtin_ia32_storedqu(retval,__builtin_ia32_phaddsw128(x,y));
}
void phsubw128(char* arg1,char* arg2,char* retval){
  v8hi x = __builtin_ia32_loaddqu(arg1);
  v8hi y = __builtin_ia32_loaddqu(arg2);
  __builtin_ia32_storedqu(retval,__builtin_ia32_phsubw128(x,y));
}
void phsubsw128(char* arg1,char* arg2,char* retval){
  v8hi x = __builtin_ia32_loaddqu(arg1);
  v8hi y = __builtin_ia32_loaddqu(arg2);
  __builtin_ia32_storedqu(retval,__builtin_ia32_phsubsw128(x,y));
}
void phadd128(char* arg1,char* arg2,char* retval){
  v4si x = __builtin_ia32_loaddqu(arg1);
  v4si y = __builtin_ia32_loaddqu(arg2);
  __builtin_ia32_storedqu(retval,__builtin_ia32_phadd128(x,y));
}
void phsubd128(char* arg1,char* arg2,char* retval){
  v4si x = __builtin_ia32_loaddqu(arg1);
  v4si y = __builtin_ia32_loaddqu(arg2);
  __builtin_ia32_storedqu(retval,__builtin_ia32_phsubd128(x,y));
}
#ifdef _TMMINTRIN_H_INCLUDED
#endif
#endif
