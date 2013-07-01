signature SSE2 = 
sig
  include SSE_TYPES
(*  local*)
    type v2di = m128i
    type v4si = m128i
    type v8hi = m128i
    type v16qi = m128i
(*  in*)
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
  val SQRTPD:v2df->v2df
  val RCPPD:v2df->v2df 
  val MAXPD:v2df*v2df->v2df 
  val MINPD:v2df*v2df->v2df 
(*BITWISE*)
  val ANDPD:v2df*v2df->v2df 
  val ANDNPD:v2df*v2df->v2df 
  val ORPD:v2df*v2df->v2df 
  val XORPD:v2df*v2df->v2df 
(*COMPARE, there are also scalar compare instructions which just set EFLAGS*)
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
  val SHUFPD:v2df*v2df->v2df (*I believe that it takes an immediate to determine order*)
  val UNPCKHPD:v2df*v2df->v2df 
  val UNPCKLPD:v2df*v2df->v2df
(*CONVERT DOUBLES*)
(*two ts indicate conversion with truncation*)
(*  val CVTPD2PI:v2df->v2si
  val CVTTPD2PI:v2df->v2si(*v2si is in mmx reg*)
  val CVTPI2PD:v2si->v2df
  val CVTPD2DQ:v2df->v4si
  val CVTTPD2DQ:v2df->v4si(*v4si is 2 doublewords, but in xmm reg*)
  val CVTDQ2PD:v4si->v2df
  val CVTPS2PD:v4sf->v2df(*not sure what floats get copied*)
  val CVTPD2PS:v2df->v4sf*)
(*CVTSS2SD:v4sf->v2df
 *CVTSD2SS:v2df->v4sf
 *CVTSD2SI:v2df->v4si
 *CVTTSD2SI:v2df->v4si
 *CVTSI2SD:v4si->v2df*)
(*convert floats*)
  val CVTDQ2PS:v4si->v4sf
  val CVTPS2DQ:v4sf->v4si
  val CVTTPS2DQ:v4sf->v4si
(*128 bit versions of MMX instructions*)
  val PADDB128:v16qi*v16qi->v16qi
  val PADDW128:v8hi*v8hi->v8hi
  val PADDD128:v4si*v4si->v4si
  val PADDQ128:v2di*v2di->v2di
  val PSUBB128:v16qi*v16qi->v16qi 
  val PSUBW128:v8hi*v8hi->v8hi 
  val PSUBD128:v4si*v4si->v4si
  val PSUBQ128:v2di*v2di->v2di
(*multiply words, get results as doublewords then store either the high or low
 *16 bits of each doubleword in the destinaiton*)
  val PMULLW128:v8hi*v8hi->v8hi
  val PMULHW128:v8hi*v8hi->v8hi 
(*bit of a weird one, take 2 packed words, add them getting doubleword results,
 *then add adjacent doublewords and store doubleword results in dest.
 (*using a 64 bit example*)
 SRC: |X3|X2|X1|X0|
 DEST:|Y3|Y2|Y1|Y0|
 TEMP:|X3*Y3|X2*Y2|X1*Y1|X0*Y0|
 DEST:|(X3*Y3)+(X2*Y2)|(X1*Y1)+(X0*Y0)|*)  
  val PMADDWD128:v8hi*v8hi->v4si
(*Comparison, only eq and gt*)
  val PCMPEQB128:v16qi*v16qi->v16qi
  val PCMPEQW128:v8hi*v8hi->v8hi
  val PCMPEQD128:v4si*v4si->v4si
  val PCMPEQQ128:v2di*v2di->v2di
  val PCMPGTB128:v16qi*v16qi->v16qi
  val PCMPGTW128:v8hi*v8hi->v8hi
  val PCMPGTD128:v4si*v4si->v4si
  val PCMPGTQ128:v2di*v2di->v2di
  val PAND128:v2di*v2di->v2di
  val PANDN128:v2di*v2di->v2di
  val POR128:v2di*v2di->v2di
  val PXOR128:v2di*v2di->v2di
(*all logical instructions can take an imm8 or an xmm register
 *as 2nd opperand to determine how many bits to shift*)
(*shift packed left logical*)
  val PSLLW128:v8hi*v8hi->v8hi
  val PSLLD128:v4si*v4si->v4si
  val PSLLQ128:v2di*v2di->v2di
(*shift packed right logical*)
  val PSRLW128:v8hi*v8hi->v8hi
  val PSRLD128:v4si*v4si->v4si
  val PSRLQ128:v2di*v2di->v2di
(*shift right packed arithmatic*)
  val PSRAW128:v8hi*v8hi->v8hi
  val PSRAD128:v4si*v4si->v4si
  val PMULUDQ128:v4si*v4si->v4si(*unsigned mul*)
(*avg integers*)
  val PAVGB128:v16qi*v16qi->v16qi
  val PAVGW128:v8hi*v8hi->v8hi
(*min/max*)
  val PMAXUB128:v16qi*v16qi->v16qi(*unsigned bytes*)
  val PMAXSW128:v8hi*v8hi->v8hi(*signed words*)
  val PMINUB128:v16qi*v16qi->v16qi
  val PMINSW128:v8hi*v8hi->v8hi
(*unpack and interleave high order(PUNPCKH...
 *SRC :|X3|X2|X1|X0|
 *DEST:|Y3|Y2|Y1|Y0|
 *END :|X3|Y3|X2|Y2|
 *unpack and interleave low order(PUNPCKL...
 *SRC :|X3|X2|X1|X0|
 *DEST:|Y3|Y2|Y1|Y0|
 *END :|X1|Y1|X0|Y0|*)
  val PUNPCKHBW128:v16qi*v16qi->v16qi
  val PUNPCKHWD128:v8hi*v8hi->v8hi
  val PUNPCKHDQ128:v4si*v4si->v4si
  val PUNPCKHQDQ128:v2di*v2di->v2di
  val PUNPCKLBW128:v16qi*v16qi->v16qi
  val PUNPCKLWD128:v8hi*v8hi->v8hi
  val PUNPCKLDQ128:v4si*v4si->v4si
  val PUNPCKLQDQ128:v2di*v2di->v2di
(*pack w/saturation*)
  val PACKSSWB128:v8hi*v8hi->v16qi
  val PACKSSDW128:v4si*v4si->v8hi
  val PACKUSWB128:v8hi*v8hi->v16qi(*unsigned*)
(*shuffle instructions*)
  val PSHUFD:v4si*Word8.word->v4si
  val PSHUFLW:v8hi*Word8.word->v8hi(*low order words only*)
  val PSHUFHW:v8hi*Word8.word->v8hi(*high order words only*)
(*ignoring:
 *maskmovdqu
 *(p)movmskpd(128)
 *all move & cache control instructions*)
end
(*end*)
