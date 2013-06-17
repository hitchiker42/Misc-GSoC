signature SIMD_FLOAT =
(*there are enough differences between floating pt simd instructions and 
 *integer ones that they merit different signatures*)
sig
  type v (*the vector type we're using*)
  val VADD:v*v->v
  val VSUB:v*v->v
  val VMUL:v*v->v
  val VDIV:v*v->v
  val VMIN:v*v->v
  val VMAX:v*v->v
  val VAND:v*v->v
  val VNOR:v*v->v
  val VOR: v*v->v
  val VANDN:v*v->v
(*a lot of these aren't avaiable for all integer types*)
  val VCMPEQ:v*v->v(*or v*v->bool (same idea w/all cmp instructions*)
  val VCMPGT:v*v->v
  val VCMPLT:v*v->v
  val VCMPGE:v*v->v
  val VCMPLE:v*v->v
  val VCMPNEQ:v*v->v
  val VCMPNLT:v*v->v
  val VCMPNGT:v*v->v
  val VCMPNGE:v*v->v
  val VCMPNLE:v*v->v
  val VCMPORD:v*v->v
  val VCMPUNORD:v*v->v
end

signature SIMD_INT = sig
  type v
  val VADD:v*v->v
  val VSUB:v*v->v
  val VMUL:v*v->v
  val VDIV:v*v->v
  val VMIN:v*v->v
  val VMAX:v*v->v
  val VAND:v*v->v
  val VNOR:v*v->v
  val VOR: v*v->v
  val VANDN:v*v->v
  (*this is all we get for integer comparison*)
  val VCMPEQ:v*v->v
  val VCMPGT:v*v->v
end
