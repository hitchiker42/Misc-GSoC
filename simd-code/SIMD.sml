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
