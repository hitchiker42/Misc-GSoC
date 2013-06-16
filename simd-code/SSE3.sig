signature SSE_TYPES =
sig
  type v2df
  type v4sf
  type v2di
  type v4si
  type v8hi
  type v16qi
(* packed types/values(with x = the appropiate integer*)
 * vxdf = double float
 * vxsf = single float
 * vxdi = packed quadword
 * vxsi = packed doubleword
 * vxhi = packed word
 * vxqi = packed byte *)
end
signature SSE3 =
sig
  include SSE_TYPES
(*duplicate 2nd and 4th 32 bit elements,i.e.
 *SRC:|X3|X2|X1|X0|
 *END:|X3|X3|X1|x1|*)
  val MOVSHDUP:v4sf->v4sf
(*duplicate 1st and 3rd 32 bit elements,i.e.
 *SRC:|X3|X2|X1|X0|
 *END:|X2|X2|X0|X0|*)
  val MOVSLDUP:v4sf->v4sf
(*Add/sub instructions
 *SRC :|X3|X2|X1|X0|
 *DEST:|Y3|Y2|Y1|Y0|
 *END :|X3+Y3|X2-Y2|X1+Y1|X0-Y0|*)
  val ADDSUBPD:v2df*v2df->v2df
  val ADDSUBPS:v4sf*v4sf->v4sf
(*Horizontal add/sub instructions
 *SRC :|X3|X2|X1|X0|
 *DEST:|Y3|Y2|Y1|Y0|
 *END :|X3+/-X2|X1+/-X0|Y3+/-Y2|Y1+/-Y0|*)
  val HADDPD:v2df*v2df->v2df
  val HADDPS:v4vf*v4sf->v4sf
  val HSUBPD:v2df*v2df->v2df
  val HSUBPS:v4sf*v4sf->v4sf
end
signature SSSE3 = sig
  include SSE_TYPES
(*Horizontal add/sub instructions
 *same idea as above but using integers instead of floats
 *There are 64&128 bit versions,but ignore the 64 bit ones, at least for now*)
  val PHADDD128:v4si*v4si->v4si
  val PHADDW128:v8hi*v8hi->v8hi
  val PHADDSW128:v8hi*v8hi->v8hi(*add w/saturation*)
  val PHSUBD128:v4si*v4si->v4si
  val PHSUBW128:v8hi*v8hi->v8hi
  val PHSUBSW128:v8hi*v8hi->v8hi
(*Absolute value instructions*)
  val PABSB128:v16qi->v16qi
  val PABSW128:v8hi->v8hi
  val PABSD128:v4si->v4si
(*Remember pmaddwd(see SSE2.sig), same idea, but bytes->words
 *instead of words->doublewords.
 *Also SRC opperand are signed bytes DEST opperand are unsigned*)
  val PMADDUBSW128:v16qi*v16qi->v8hi
(*...yeah,so take 2 packed word opperands, multiply corrsponding elements,
 *store intermediates in doublewords, truncate intermediates to 18 bits,
 *then take the 16 most significand bits of the intermediates and store in
 *the destination opperand...right*)
  val PMULHRSW128:v8hi*v8hi->v8hi
(*shuffle bytes in dest in place according to the values in src opperand,
 *specifically the 4 lsb in each byte of the src determine which byte to 
 *place in the corrsponding dest (if the msb is set on a src byte set the
 *dest to 0 instead*)
  val PSHUFB128:v16qi*v16qi->v16qi
(*Negate signed integers in dest according to sign of corrsponding src values,
 *if positive do nothing, if 0 set dest to 0, if negitive negate dest*)
  val PSIGNB128:v16qi*v16qi->v16qi
  val PSIGNW128:v8hi*v8hi->v8hi
  val PSIGND128:v4si*v4si->v4si
end
