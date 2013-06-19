(defun C-SSE () (with-temp-file "C-SSE.c"
  (insert
"#include <x86intrin.h>
#ifdef _XMMINTRIN_H_INCLUDED
/*typedef float v4sf __attribute__ ((__vector_size__ (16)));\n*/
#define v4sf __v4sf\n")
  (dolist (opcode '("addps" "subps" "mulps" "divps" "maxps" "minps"));;
    (insert (format
"void %s(float *arg1,float* arg2,float* retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_%s(x,y));
}\n" opcode opcode)))
  (dolist (opcode '("rcpps" "sqrtps" "rsqrtps"))
    (insert (format
"void %s(float* arg,float* retval){
  v4sf x = __builtin_ia32_loadups(arg);
  __builtin_ia32_storeups(retval,__builtin_ia32_%s(x));
}\n" opcode opcode)))
  (insert
"#endif\n")))
(defun C-SSE2 ()
  (with-temp-file "C-SSE2.c"
    (insert
"#include <x86intrin.h>
#ifdef _EMMINTRIN_H_INCLUDED
#define v4sf __v4sf
#define v2df __v2df
#define v16qi __v16qi
#define v8hi __v8hi
#define v4si __v4si
#define v2di __v2di\n")
    (dolist (opcode '("addpd" "subpd" "mulpd" "divpd"))
      (insert (format
"double* %s(double *arg1,double* arg2,double* retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_%s(x,y));
  return retval;
}\n" opcode opcode)))
    (insert "#endif\n")))

(defun C-SSE2 ()
  (with-temp-file "C-SSE2.c"
    (insert
"#include <x86intrin.h>
#include <stdlib.h>
#ifdef _EMMINTRIN_H_INCLUDED
#define v4sf __v4sf
#define v2df __v2df
#define v16qi __v16qi
#define v8hi __v8hi
#define v4si __v4si
#define v2di __v2di\n")
    (dolist (opcode '("haddpd" "hsubpd"

(defun C-intrin (
  (insert (format
"void %s(double *arg1,double* arg2,double* retval){
  v2df x = __builtin_ia32_loadupd(arg1);
  v2df y = __builtin_ia32_loadupd(arg2);
  __builtin_ia32_storeupd(retval,__builtin_ia32_%s(x,y));
}\n" opcode opcode)))
