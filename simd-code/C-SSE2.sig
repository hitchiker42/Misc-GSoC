signature SSE2 = 
sig
  type v2df
  type v4sf
  type v2di
  type v4si
  type v8hi
  type v16qi
(* packed types/values
 * vxdf = double float
 * vxsf = single float
 * vxdi = packed quadword
 * vxsi = packed doubleword
 * vxhi = packed word
 * vxqi = packed byte *)
(*MOVAPD 
 *MOVUPD
 *MOVHPD
 *MOVLPD
 *MOVMSKPD Extract sign mask
 *MOVSD*)
(*MATH*)
  val ADDPD:v2df*v2df->v2df
  val SUBPD:v2df*v2df->v2df 
  val MULPD:v2df*v2df->v2df
  val DIVPD:v2df*v2df->v2df 
  val SQRTPD:v2df*v2df->v2df 
  val MAXPD:v2df*v2df->v2df 
  val MINPD:v2df*v2df->v2df 
(*BITWISE*)
  val ANDPD:v2df*v2df->v2df 
  val ANDNPD:v2df*v2df->v2df 
  val ORPD:v2df*v2df->v2df 
  val XORPD:v2df*v2df->v2df 
(*COMPARE*)
  val CMPEQPD:v2df*v2df->v2df 
  val CMPLTPD:v2df*v2df->v2df 
  val CMPLEPD:v2df*v2df->v2df
  val CMPGTPD:v2df*v2df->v2df 
  val CMPGEPD:v2df*v2df->v2df 
  val CMPUNORDPD:v2df*v2df->v2df 
  val CMPNEQPD:v2df*v2df->v2df 
  val CMPNLTPD:v2df*v2df->v2df 
  val CMPNLEPD:v2df*v2df->v2df 
  val CMPNGTPD:v2df*v2df->v2df 
  val CMPORDPD:v2df*v2df->v2df 
(*PACK/SHUFFLE*)
  val SHUFPD:v2df*v2df->v2df 
  val UNPCKHPD:v2df*v2df->v2df 
  val UNPCKLPD:v2df*v2df->v2df
(*CONVERT DOUBLES*)
  val CVTPD2PI:v2df->v2si
  val CVTTPD2PI:v2df->v2si(*v2si is in mmx reg*)
  val CVTPI2PD:v2si->v2df
  val CVTPD2DQ:v2df->v4si
  val CVTTPD2DQ:v2df->v4si(*v4si is 2 doublewords, but in xmm reg*)
  val CVTDQ2PD:v4si->v2df
  val CVTPS2PD:v4sf->v2df(*not sure what floats get copied*)
  val CVTPD2PS:v2df->v4sf
(*CVTSS2SD:v4sf->v2df
 *CVTSD2SS:v2df->v4sf
 *CVTSD2SI:v2df->v4si
 *CVTTSD2SI:v2df->v4si
 *CVTSI2SD:v4si->v2df*)
5.6.2 SSE2 Packed Single-Precision Floating-Point Instructions
SSE2 packed single-precision floating-point instructions perform conversion operations on single-precision
floating-point and integer operands. These instructions
represent enhancements to the SSE single-precision
floating-point instructions.

CVTDQ2PS Convert packed doubleword integers to
packed single-precision floating-point values

CVTPS2DQ Convert packed single-precision floating
-point values to packed doubleword integers

CVTTPS2DQ Convert with truncation packed single-preci
sion floating-point values to packed doubleword
integers

5.6.3 SSE2 128-Bit SIMD Integer Instructions
SSE2 SIMD integer instructions perform additional oper
ations on packed words, doublewords, and quadwords
contained in XMM and MMX registers.
MOVDQA Move aligned double quadword.
MOVDQU Move unaligned double quadword
MOVQ2DQ Move quadword integer from MMX to XMM registers
MOVDQ2Q Move quadword integer from XMM to MMX registers
PMULUDQ Multiply packed unsigned doubleword integers
PADDQ Add packed quadword integers
PSUBQ Subtract packed
quadword integers
PSHUFLW Shuffle packed low words
PSHUFHW Shuffle packed high words
PSHUFD Shuffle packed doublewords
PSLLDQ Shift double quadword left logical
PSRLDQ Shift double quadword right logical
PUNPCKHQDQ Unpack high quadwords
PUNPCKLQDQ Unpack low quadwords

5.6.4 SSE2 Cacheability Control and Ordering Instructions
SSE2 cacheability control instructions provide additional op
erations for caching of non-temporal data when storing
data from XMM registers to memory. LFENCE and MFENCE provide additional control of instruction ordering on
store operations.

CLFLUSH Flushes and invalidates a memory operand and
its associated cache line from all levels of the
processor’s cache hierarchy

LFENCE Serializes load operations
MFENCE Serializes load and store operations
PAUSE Improves the performance of “spin-wait loops”
MASKMOVDQU Non-temporal store of selected bytes from
an XMM register into memory
MOVNTPD Non-temporal store of two packed double-preci
sion floating-point values from an XMM register
into memory
MOVNTDQ Non-temporal store of double quad
word from an XMM register into memory
MOVNTI Non-temporal store of a doubleword from a general-purpose register into memory

     v16qi __builtin_ia32_paddb128 (v16qi, v16qi)
     v8hi __builtin_ia32_paddw128 (v8hi, v8hi)
     v4si __builtin_ia32_paddd128 (v4si, v4si)
     v2di __builtin_ia32_paddq128 (v2di, v2di)
     v16qi __builtin_ia32_psubb128 (v16qi, v16qi)
     v8hi __builtin_ia32_psubw128 (v8hi, v8hi)
     v4si __builtin_ia32_psubd128 (v4si, v4si)
     v2di __builtin_ia32_psubq128 (v2di, v2di)
     v8hi __builtin_ia32_pmullw128 (v8hi, v8hi)
     v8hi __builtin_ia32_pmulhw128 (v8hi, v8hi)
     v2di __builtin_ia32_pand128 (v2di, v2di)
     v2di __builtin_ia32_pandn128 (v2di, v2di)
     v2di __builtin_ia32_por128 (v2di, v2di)
     v2di __builtin_ia32_pxor128 (v2di, v2di)
     v16qi __builtin_ia32_pavgb128 (v16qi, v16qi)
     v8hi __builtin_ia32_pavgw128 (v8hi, v8hi)
     v16qi __builtin_ia32_pcmpeqb128 (v16qi, v16qi)
     v8hi __builtin_ia32_pcmpeqw128 (v8hi, v8hi)
     v4si __builtin_ia32_pcmpeqd128 (v4si, v4si)
     v16qi __builtin_ia32_pcmpgtb128 (v16qi, v16qi)
     v8hi __builtin_ia32_pcmpgtw128 (v8hi, v8hi)
     v4si __builtin_ia32_pcmpgtd128 (v4si, v4si)
     v16qi __builtin_ia32_pmaxub128 (v16qi, v16qi)
     v8hi __builtin_ia32_pmaxsw128 (v8hi, v8hi)
     v16qi __builtin_ia32_pminub128 (v16qi, v16qi)
     v8hi __builtin_ia32_pminsw128 (v8hi, v8hi)
     v16qi __builtin_ia32_punpckhbw128 (v16qi, v16qi)
     v8hi __builtin_ia32_punpckhwd128 (v8hi, v8hi)
     v4si __builtin_ia32_punpckhdq128 (v4si, v4si)
     v2di __builtin_ia32_punpckhqdq128 (v2di, v2di)
     v16qi __builtin_ia32_punpcklbw128 (v16qi, v16qi)
     v8hi __builtin_ia32_punpcklwd128 (v8hi, v8hi)
     v4si __builtin_ia32_punpckldq128 (v4si, v4si)
     v2di __builtin_ia32_punpcklqdq128 (v2di, v2di)
     v16qi __builtin_ia32_packsswb128 (v8hi, v8hi)
     v8hi __builtin_ia32_packssdw128 (v4si, v4si)
     v16qi __builtin_ia32_packuswb128 (v8hi, v8hi)
     v8hi __builtin_ia32_pmulhuw128 (v8hi, v8hi)
     void __builtin_ia32_maskmovdqu (v16qi, v16qi)
     v2df __builtin_ia32_loadupd (double *)
     void __builtin_ia32_storeupd (double *, v2df)
     v2df __builtin_ia32_loadhpd (v2df, double const *)
     v2df __builtin_ia32_loadlpd (v2df, double const *)
     int __builtin_ia32_movmskpd (v2df)
     int __builtin_ia32_pmovmskb128 (v16qi)
     void __builtin_ia32_movnti (int *, int)
     void __builtin_ia32_movnti64 (long long int *, long long int)
     void __builtin_ia32_movntpd (double *, v2df)
     void __builtin_ia32_movntdq (v2df *, v2df)
     v4si __builtin_ia32_pshufd (v4si, int)
     v8hi __builtin_ia32_pshuflw (v8hi, int)
     v8hi __builtin_ia32_pshufhw (v8hi, int)
     v2di __builtin_ia32_psadbw128 (v16qi, v16qi)
     v2df __builtin_ia32_sqrtpd (v2df)
     v2df __builtin_ia32_sqrtsd (v2df)
     v2df __builtin_ia32_shufpd (v2df, v2df, int)
     v2df __builtin_ia32_cvtdq2pd (v4si)
     v4sf __builtin_ia32_cvtdq2ps (v4si)
     v4si __builtin_ia32_cvtpd2dq (v2df)
     v2si __builtin_ia32_cvtpd2pi (v2df)
     v4sf __builtin_ia32_cvtpd2ps (v2df)
     v4si __builtin_ia32_cvttpd2dq (v2df)
     v2si __builtin_ia32_cvttpd2pi (v2df)
     v2df __builtin_ia32_cvtpi2pd (v2si)
     int __builtin_ia32_cvtsd2si (v2df)
     int __builtin_ia32_cvttsd2si (v2df)
     long long __builtin_ia32_cvtsd2si64 (v2df)
     long long __builtin_ia32_cvttsd2si64 (v2df)
     v4si __builtin_ia32_cvtps2dq (v4sf)
     v2df __builtin_ia32_cvtps2pd (v4sf)
     v4si __builtin_ia32_cvttps2dq (v4sf)
     v2df __builtin_ia32_cvtsi2sd (v2df, int)
     v2df __builtin_ia32_cvtsi642sd (v2df, long long)
     v4sf __builtin_ia32_cvtsd2ss (v4sf, v2df)
     v2df __builtin_ia32_cvtss2sd (v2df, v4sf)
     void __builtin_ia32_clflush (const void *)
     void __builtin_ia32_lfence (void)
     void __builtin_ia32_mfence (void)
     v16qi __builtin_ia32_loaddqu (const char *)
     void __builtin_ia32_storedqu (char *, v16qi)
     v1di __builtin_ia32_pmuludq (v2si, v2si)
     v2di __builtin_ia32_pmuludq128 (v4si, v4si)
     v8hi __builtin_ia32_psllw128 (v8hi, v8hi)
     v4si __builtin_ia32_pslld128 (v4si, v4si)
     v2di __builtin_ia32_psllq128 (v2di, v2di)
     v8hi __builtin_ia32_psrlw128 (v8hi, v8hi)
     v4si __builtin_ia32_psrld128 (v4si, v4si)
     v2di __builtin_ia32_psrlq128 (v2di, v2di)
     v8hi __builtin_ia32_psraw128 (v8hi, v8hi)
     v4si __builtin_ia32_psrad128 (v4si, v4si)
     v2di __builtin_ia32_pslldqi128 (v2di, int)
     v8hi __builtin_ia32_psllwi128 (v8hi, int)
     v4si __builtin_ia32_pslldi128 (v4si, int)
     v2di __builtin_ia32_psllqi128 (v2di, int)
     v2di __builtin_ia32_psrldqi128 (v2di, int)
     v8hi __builtin_ia32_psrlwi128 (v8hi, int)
     v4si __builtin_ia32_psrldi128 (v4si, int)
     v2di __builtin_ia32_psrlqi128 (v2di, int)
     v8hi __builtin_ia32_psrawi128 (v8hi, int)
     v4si __builtin_ia32_psradi128 (v4si, int)
     v4si __builtin_ia32_pmaddwd128 (v8hi, v8hi)
     v2di __builtin_ia32_movq128 (v2di)
