functor SimdReal32_128(S:SSE and S3:SSE3 and S4:SSE4):SIMD_FLOAT =
  struct
  open S
  open S3
  val VADD = ADDPS
  val VSUB = SUBPS
  val VMUL = MULPS
  val VDIV = DIVPS
  val VRCP = RCCPS
  val VSQRT = SQRTPS
  val VMIN = MAXPS
  val VAND = ANDPS
end
	    
functor SimdReal32_256 (A:AVX):SIMD_FLOAT =
  struct
end

functor SimdReal64_128 (S2:SSE2 and S3:SSE3 and S4:SSE4):SIMD_FLOAT = 
  struct
end

functor SimdInt8_128 (S2:SSE2 and S3:SSSE3 and S4:SSE4):SIMD_INT =
  struct
(*this is the easiest one, we alread work with word8 arrays so no conversion
is necessary, however, we don't have a ton of byte opperations...*)
  open S2
  open S3
  open S4
  val VADD = PADDB128
  val VSUB = PSUBB128
end
(*for the rest of the int structures we need to convert the word 8 array
used internally into the proper word size array. We do this using the 
pack word structure, which does the job nicely*)
(*we probably need a few functions to load,store and extract data i.e:
  val load:Word<N> array/vector -> Word8 array
  or val load:Word<N>*Word<N>... -> Word8 array
and val store/get Word8 array -> Word<N> array/vector
and val extract Word8 array*int -> Word<N> (*builtin as PackWord.subArr*)*)
functor SimdInt16_128 (S2:SSE2 and S3:SSSE3 and S4:SSE4):SIMD_INT =
  struct
  open PackWord16
  val VADD = PADDW128
  val VSUB = PSUBW128
  val VMULH = PMULHW128 (*store high 16 bits of doubleword results*)
  val VMULL = PMULLW128 (*store low  16 bits ...*)

end
functor SimdInt32_128 (S2:SSE2 and S3:SSSE3 and S4:SSE4):SIMD_INT =
  struct
  open PackWord32
end
functor SimdInt64_128 (S2:SSE2 and S3:SSSE3 and S4:SSE4):SIMD_INT =
  struct
  open PackWord64
end
