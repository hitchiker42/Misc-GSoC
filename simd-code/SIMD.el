(defmacro C-intrin-float (name argv retval type &optional arity)
  (if (null arity)
      `(defun ,name (opcode) 
         (insert (format
"void %s(%s arg1,%s retval){
  %s x = __builtin_ia32_loadup%s(arg1);
  __builtin_ia32_storeup%s(retval,__builtin_ia32_%s(x));
}\n" opcode ,argv ,retval 
,type (substring ,type 2 3) (substring ,type 2 3) opcode)))
    `(defun ,name (opcode) (insert (format
"void %s(%s arg1,%s arg2,%s retval){
  %s x = __builtin_ia32_loadup%s(arg1);
  %s y = __builtin_ia32_loadup%s(arg2);
  __builtin_ia32_storeup%s(retval,__builtin_ia32_%s(x,y));
}\n" opcode ,argv ,argv ,retval 
,type (substring ,type 2 3) ,type (substring ,type 2 3)
(substring ,type 2 3) opcode)))))
(defmacro C-intrin-int (name type &optional arity)
(if (null arity)
`(defun ,name(opcode)
   (insert (format
"void %s(char* arg1,char* retval){
  %s x = __builtin_ia32_loaddqu(arg1);
  __builtin_ia32_storedqu(retval,__builtin_ia32_%s(x));
}\n" opcode ,type opcode)))
`(defun ,name(opcode)
   (insert (format
"void %s(char* arg1,char* arg2,char* retval){
  %s x = __builtin_ia32_loaddqu(arg1);
  %s y = __builtin_ia32_loaddqu(arg2);
  __builtin_ia32_storedqu(retval,__builtin_ia32_%s(x,y));
}\n" opcode ,type ,type opcode)))))
(defmacro Intel-intrin (name argv retval type id &optional arity)
  (if (null arity)
      `(defun ,name (opcode)
         (insert (format
"void %s(%s arg1,%s retval){
  %s x = _mm_loadu_%s(arg1);
  _mm_storeu_%s(retval,_mm_%s(x));
}\n" opcode ,argv ,retval ,id ,type ,type opcode)))
    `(defun ,name (opcode)
       (insert (format
"void %s(%s arg1,%s arg2,%s retval){
  %s x = _mm_loadu_%s(arg1);
  %s y = _mm_loadu_%s(arg2);
  _mm_storeu_%s(retval,_mm_%s(x,y));
}\n" opcode ,argv ,argv ,retval ,id ,type
,id ,type ,type opcode )))))
(defmacro Intel-intrin-int (name &optional arity)
  (if (null arity)
      `(defun ,name (opcode)
         (insert (format
"void %s(__m128i* arg1,__m128i* retval){
  __m128i x = _mm_loadu_si128(arg1);
  _mm_storeu_si128(retval,_mm_%s(x));
}\n" opcode opcode)))
    `(defun ,name (opcode)
       (insert (format
"void %s(__m128i* arg1,__m128i* arg2,__m128i* retval){
  __m128i x = _mm_loadu_si128(arg1);
  __m128i y = _mm_loadu_si128(arg2);
  _mm_storeu_si128(retval,_mm_%s(x,y));
}\n" opcode opcode)))))
(defmacro c-opcodes (fxn &rest opcodes)
  `(dolist (opcode ',opcodes)
     (,fxn opcode)))
(C-intrin-float double2 "double *" "double *" "v2df" t)
(C-intrin-float double1 "double *" "double *" "v2df")
(C-intrin-float float2 "float *" "float *" "v4sf" t)
(C-intrin-float float1 "float *" "float *" "v4sf")
(C-intrin-int byte1 "v16qi")
(C-intrin-int byte2 "v16qi" t)
(C-intrin-int short1 "v8hi")
(C-intrin-int short2 "v8hi" t)
(C-intrin-int int1 "v4si")
(C-intrin-int int2 "v4si" t)
(C-intrin-int long1 "v2di")
(C-intrin-int long2 "v2di" t)
(Intel-intrin intel-f1 "float*" "float*" "ps" "__m128")
(Intel-intrin intel-f2 "float*" "float*" "ps" "__m128" t)
(Intel-intrin intel-d1 "double*" "double*" "pd" "__m128d")
(Intel-intrin intel-d2 "double*" "double*" "pd" "__m128d" t)
(Intel-intrin-int intel-int1)
(Intel-intrin-int intel-int2 t)
(defun C-SSE-Intel ()
  (with-temp-file "temp-sse.c"
    (insert
"#include <x86intrin.h>\n")
    (c-opcodes intel-f2 "add" "sub" "mul" "div")))
(C-SSE-Intel)
(defvar SSE-Types 
"#include <x86intrin.h>
#define v4sf __v4sf
#define v2df __v2df
#define v16qi __v16qi
#define v8hi __v8hi
#define v4si __v4si
#define v2di __v2di\n")
(defun C-SSE () (with-temp-file "C-SSE.c"
  (insert
"#include <x86intrin.h>
#ifdef _XMMINTRIN_H_INCLUDED
/*typedef float v4sf __attribute__ ((__vector_size__ (16)));\n*/
#define v4sf __v4sf\n")
  (c-opcodes float2 "addps" "subps" "mulps" "divps" "maxps" "minps" "andps" 
"orps" "xorps" "andnps" "cmpltps")
  (c-opcodes float1 "rcpps" "sqrtps" "rsqrtps")
(insert "#endif\n")))
(C-SSE)
(defun C-SSE2 ()
  (with-temp-file "C-SSE2.c"
    (insert (concat
             SSE-Types
             "#ifdef _EMMINTRIN_H_INCLUDED"))
    (c-opcodes double2 "addpd" "subpd" "mulpd" "divpd" "andpd" "minpd" "maxpd" "orpd" "xorpd" "andnpd")
    (c-opcodes double1 "rcppd" "sqrtpd" "rsqrtpd")
    (insert "#endif\n")))
(C-SSE2)
(defun C-SSE3 ()
  (with-temp-file "C-SSE3.c"
    (insert (concat
             SSE-Types
             "#ifdef _PMMINTRIN_H_INCLUDED"))
    (c-opcodes float2 "addsubps" "haddps" "hsubps")
    (c-opcodes double2 "addsubpd" "haddpd" "hsubpd")
    (insert "#endif\n")
    (c-opcodes short2 "phaddw128" "phaddsw128" "phsubw128" "phsubsw128")
    (c-opcodes int2 "phadd128" "phsubd128")
    (insert "#ifdef _TMMINTRIN_H_INCLUDED\n");;SSSE3 header
    (insert "#endif\n#endif\n")))
(C-SSE3)
(defun C-SSE4 ()
  (with-temp-file "C-SSE4.c"
    (insert (concat
             SSE-Types
             "#ifdef _SMMINTRIN_H_INCLUDED\n#ifdef __SSE4_1__\n"))
    (c-opcodes float2 "blendps") 
    (c-opcodes double2 "blendpd")
    (insert "#ifdef __SSE4_2__")
    (c-opcodes f)
    (insert "#endif\n")
    (insert "#endif\n")
    (insert "#endif\n")))
(C-SSE4)
(defun C-AVX ()
  (with-temp-file "C-AVX.c"
    (insert (concat
             SSE-Types
             AVX-Types
             "#ifdef _IMMINTRIN_H_INCLUDED"))
    (c-opcodes f)
    (insert "#endif\n")))
;; #ifndef _X86INTRIN_H_INCLUDED
;; #define _X86INTRIN_H_INCLUDED

;; #include <ia32intrin.h>

;; #ifdef __MMX__
;; #include <mmintrin.h>
;; #endif

;; #ifdef __SSE__
;; #include <xmmintrin.h>
;; #endif

;; #ifdef __SSE2__
;; #include <emmintrin.h>
;; #endif

;; #ifdef __SSE3__
;; #include <pmmintrin.h>
;; #endif

;; #ifdef __SSSE3__
;; #include <tmmintrin.h>
;; #endif

;; #ifdef __SSE4A__
;; #include <ammintrin.h>
;; #endif

;; #if defined (__SSE4_2__) || defined (__SSE4_1__)
;; #include <smmintrin.h>
;; #endif

;; #if defined (__AES__) || defined (__PCLMUL__)
;; #include <wmmintrin.h>
;; #endif

;; /* For including AVX instructions */
;; #include <immintrin.h>
