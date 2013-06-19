(with-temp-file "C-SSE.c"
  (insert
"#include <x86intrin.h>
#include <stdlib.h>
#ifdef _XMMINTRIN_H_INCLUDED
/*typedef float v4sf __attribute__ ((__vector_size__ (16)));\n*/
#define v4sf __v4sf\n")
  (dolist (opcode '("addps" "subps" "mulps" "divps" "maxps" "minps"));;
    (insert (format
"float* %s(float *arg1,float* arg2,float* retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_%s(x,y));
  return retval;
}\n" opcode opcode)))
  (dolist (opcode '("rcpps" "sqrtps" "rsqrtps"))
    (insert (format
"float* %s(float* arg,float* retval){
  v4sf x = __builtin_ia32_loadups(arg);
  __builtin_ia32_storeups(retval,__builtin_ia32_%s(x));
  return retval;
}\n" opcode opcode)))
  (insert
"#endif\n"))


