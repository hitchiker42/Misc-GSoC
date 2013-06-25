structure SimdFloat32:SIMD_FLOAT =
  struct
  open C_SSE
  val VADD = ADDPS
  val VSUB = SUBPS
  val VMUL = MULPS
  val VDIV = DIVPS
end
	    
