signature SIMD_AVAIL =
sig
  val sse:bool
  val sse2:bool
  val sse3:bool
  val ssse3:bool
  val sse4.1:bool
  val sse4.2:bool
  val avx:bool
  val avx2:bool
end
signature SIMD_FLOAT =
(*there are enough differences between floating pt simd instructions and 
 *integer ones that they merit different signatures*)
sig
(*lots of ways this could be done, if we stick just to
 *machine possible types it could be v2df or v4sf for sse
 *or v4df/v8sf for avx.
 *But we could do 3 types
 *type size = RealX, where x is probably just 32 or 64
 *type length = X + (X%2) (*it's a lot eaiser with an even type*)
 *type t = vector type (*vector,vector slice,n-tuple,array,array-slice,etc*)
 *type v = size vector
 *val pack = t->v
 *val unpack v->t(*or MLton.Pointer->t*)*)
  type v (*the vector type we're using, for now*)
  type e (*the element type*)
  type m128i (*lets call this some integer type for now*)
(*(avx extensions) vex incoding (3 opperand support,no alignment restriction)
 *256 bit vex instructions, extended width. 128 bit, only ^*)
(*vex incoding makes vectorization much eaiser, because we have to use
 *3 opperands by default, so if we can translate this to asm then its much eaiser*)
(*math*)
  val VADD:v*v->v(*vex 256 && 128*)
  val VSUB:v*v->v(*vex 256 && 128*)
  val VMUL:v*v->v(*vex 256 && 128*)
  val VDIV:v*v->v(*vex 256 && 128*)
  val VRCP:v*v->v(*reciprocal*)
  val VSQRT:v*v->v(*vex 256 && 128*)
  val VRSQRT:v*v->v(*1/SQRT*)(*vex 256 && 128*)
  val VMIN:v*v->v(*vex 256 && 128*)
  val VMAX:v*v->v(*vex 256 && 128*)
(*HADD(HSUB is same but with - instead of +
 *SRC :|X7|X6|X5|X4|X3|X2|X1|X0|
 *DEST:|Y7|Y6|Y5|Y4|Y3|Y2|Y1|Y0| (*or SRC2*)
 *END :|Y6+Y7|Y4+Y5|X6+X7|X4+X5|Y2+Y3|X0+Y1|X2+X3|X0+X1|*)
  val VHADD:v*v->v(*horozontal add*)(*vex 256 && 128*)
  val VHSUB:v*v->v(*horozontal sub*)(*vex 256 && 128*)
  val VADDSUB:v*v->v(*add odd indices, sub even indices*)(*vex 256 && 128*)
  val VDOT:v*v->e(*dot product, if type=float (*vex 256 && 128*)
                   *if type = double (*vex 128 only*)*)
(*bitwise, no shifts for floating pt numbers*)
  val VAND:v*v->v(*vex 256 && 128*)
  val VXOR:v*v->v(*vex 256 && 128*)
  val VOR: v*v->v(*vex 256 && 128*)
  val VANDN:v*v->v(*vex 256 && 128*)
  val VNOT:v->v(*all 1s  and opperand = ! opperand*)
(*Round/Convert*)
  val VROUNDP:v*v*Word8.word->vi(*actual round instruction*)(*vex 256 && 128*)
(*might not make ^ part of the final sig, but it does need to exist internally*)
  (*Need to implement these myself,all are just round with a different imm*)
  val VROUND:v*v->vi(*imm=00*)
  val VCEIL:v*v->vi(*imm=01*)
  val VFLOOR:v*V->vi(*imm=10*)
  val VTRUNC:v*v->vi(*imm=11*)
(*these are a lot more complicated, but we should be able to just have a from
 *and a to function and pick the right instruction based on the types*)
  val VCVT2F:vi->v
  val VCVT2I:v->vi
(*SSE has 8 float comparisons, AVX has 32 so we implement comparisons as
 *a datatype of possible comparisions and a function that takes
 *a value of that type to generate the right instruction*)
  datatype Cmp(*type of comparison predicates*)
  val VCMP:v*v*Cmp->v(*vex 256 && 128*)
(*unpack/shuffle/blend,etc*)
(*if we can have any size vector not sure how best to do shuffle*)
  val VSHUF:v*v*word->v(*vex 256 && 128*)
(*not sure what should go in the public sig, but blend seems useful even
 *for higher level programming*)
  val VBLEND:v*v*v->v(*vex 256 && 128*)
(*whole bunch of mov & pack/unpack etc instructions, don't need those in the
 *public sig, though part of me wants to put them there since I hate private
 *stuff that doesn't need to be private*)
end

signature SIMD_INT = sig
(*integer instructios are not promoted to 256 bit vectors in avx
 *thus all vector integer types are 128 bit(assuming we ignore mmx)
 *avx still provides 3 opperannd instructions and unaligned access
 *so it is still quite useful. the only note are for insructinons
 *than don't support the avx exensions(I believe there aren't any)*)
  type v(*packed vector type*)
  type e(*element type*)
  type vf(*generic float type, for now*)
(*Math*)
(*S & US suffixs are for signed and unsigned saturation, saturation means
 *values don't wraparound, ie in an unsigned byte 255+1->0 w/o saturation
 *but 255+1->255 w/ saturation*)
  val VADD:v*v->v
  val VADDS:v*v->v
  val VADDUS:v*v->v
  val VSUB:v*v->v
  val VSUBS:v*v->v
  val VSUBUS:v*v->v
  val VMUL:v*v->v
  val VDIV:v*v->v
  val VMIN:v*v->v
  val VMAX:v*v->v
  val VPMADD:v16*v16->v32(*words only,multiply adjecent words and add adjectent
                        *doubleword results*)
  val VMADDSB:v8(*signed*)*v8(*unsigned*)->v16(*same as VPMADD but with bytes
                                               *also signed/unsigned weirdness*)
  val VMULHRS:v16*v16->v16(*not even going to try to explain, see SSE3.sig*)
  val VHADD:v*v->v(*same convention as floating point HADD*)
  val VHSUB:v*v->v
  val VABS:v->v
(*Bitwise*)
  val VAND:v*v->v
  val VNOR:v*v->v
  val VOR: v*v->v
  val VXOR:v*v->v
  val VANDN:v*v->v
  val VNOT:v->v(*VANDN 11..1*v->v,and not w/src = all 1s is a not of the dest*)
(*SA=arathmatic shift(preserve sign) SL=logical shift(fill w/zeros*)
  val VSAR:v*v->v
  val VSLR:v*v->v
  val VSLL:v*v->v
(*we can also logically shift a full 128bit vector left/right*)
(*Comparison*)
  datatype cmp
  val VCMP:v*v*cmp->v
  (*this is all we get for builtin integer comparison*)
  val VCMPEQ:v*v->v
  val VCMPGT:v*v->v
(*so I'll need to write these myself
 *VCMPNE(!=),VCMPGE(= | >),VCMPLT(!(> | =)),VCMPLE(!>)
 *VCMPNGT(!>),VCMPNGE(!(= | >)),VCMPNLT(> | =),VCMPNLE(>)*)
  val VBLEND:v*v->v(*bytes or words only*)
end
