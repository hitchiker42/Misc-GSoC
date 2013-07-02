(*NOTE: Still a lot to do here esp. with type stuff (conversions, how to do
 *ints, casting, etc..*)
structure C_SSE2 =
struct
  open SSE_Types
  type v2di = m128i
  type v4si = m128i
  type v8hi = m128i
  type v16qi = m128i
  val addpd = _import "addpd":v2df*v2df*v2df->unit;
  val subpd = _import "subpd":v2df*v2df*v2df->unit;
  val mulpd = _import "mulpd":v2df*v2df*v2df->unit;
  val divpd = _import "divpd":v2df*v2df*v2df->unit;
(*  val rcppd = _import "rcppd":v2df*v2df->unit;
  val sqrtpd = _import "sqrtpd":v2df*v2df->unit;*)
  val maxpd = _import "maxpd":v2df*v2df*v2df->unit;
  val minpd = _import "minpd":v2df*v2df*v2df->unit;
  val andpd = _import "andpd":v2df*v2df*v2df->unit;
  val orpd = _import "orpd":v2df*v2df*v2df->unit;
  val xorpd = _import "xorpd":v2df*v2df*v2df->unit;
  val andnpd = _import "andnpd":v2df*v2df*v2df->unit;
  val cmpltpd = _import "cmpltpd":v2df*v2df*v2df->unit;
  val cmpeqpd = _import "cmpeqpd":v2df*v2df*v2df->unit;
  val cmpltpd = _import "cmpltpd":v2df*v2df*v2df->unit;
  val cmplepd = _import "cmplepd":v2df*v2df*v2df->unit;
  val cmpgtpd = _import "cmpgtpd":v2df*v2df*v2df->unit;
  val cmpgepd = _import "cmpgepd":v2df*v2df*v2df->unit;
  val cmpunordpd = _import "cmpunordpd":v2df*v2df*v2df->unit;
  val cmpneqpd = _import "cmpneqpd":v2df*v2df*v2df->unit;
  val cmpnltpd = _import "cmpnltpd":v2df*v2df*v2df->unit;
  val cmpnlepd = _import "cmpnlepd":v2df*v2df*v2df->unit;
  val cmpngtpd = _import "cmpngtpd":v2df*v2df*v2df->unit;
  val cmpngepd = _import "cmpngepd":v2df*v2df*v2df->unit;
  val cmpordpd = _import "cmpordpd":v2df*v2df*v2df->unit;
(*  val shufpd = _import "shufpd":v2df*v2df*v2df->unit;*)
  val paddb128 = _import "paddb128":v16qi*v16qi*v16qi->unit;
  val psubb128 = _import "psubb128":v16qi*v16qi*v16qi->unit;
  val pavgb128 = _import "pavgb128":v16qi*v16qi*v16qi->unit;
  val pminub128 = _import "pminub128":v16qi*v16qi*v16qi->unit;
  val pmaxub128 = _import "pmaxub128":v16qi*v16qi*v16qi->unit;
  val psadbw128 = _import "psadbw128":v16qi*v16qi*v16qi->unit;
  val pcmpeqb128 = _import "pcmpeqb128":v16qi*v16qi*v16qi->unit;
  val pcmpgtb128 = _import "pcmpgtb128":v16qi*v16qi*v16qi->unit;
  val paddw128 = _import "paddw128":v8hi*v8hi*v8hi->unit;
  val psubw128 = _import "psubw128":v8hi*v8hi*v8hi->unit;
  val pmullw128 = _import "pmullw128":v8hi*v8hi*v8hi->unit;
  val pmulhw128 = _import "pmulhw128":v8hi*v8hi*v8hi->unit;
  val pavgw128 = _import "pavgw128":v8hi*v8hi*v8hi->unit;
  val pmaxw128 = _import "pmaxw128":v8hi*v8hi*v8hi->unit;
  val pminw128 = _import "pminw128":v8hi*v8hi*v8hi->unit;
  val pmulhuw128 = _import "pmulhuw128":v8hi*v8hi*v8hi->unit;
  val psllw128 = _import "psllw128":v8hi*v8hi*v8hi->unit;
  val psrlw128 = _import "psrlw128":v8hi*v8hi*v8hi->unit;
  val psraw128 = _import "psraw128":v8hi*v8hi*v8hi->unit;
  val psllwi128 = _import "psllwi128":v8hi*int*v8hi->unit;
  val psrlwi128 = _import "psrlwi128":v8hi*int*v8hi->unit;
  val psrawi128 = _import "psrawi128":v8hi*int*v8hi->unit;
  val pcmpeqw128= _import "pcmpeqw128":v8hi*v8hi*v8hi->unit;
  val pcmpgtw128= _import "pcmpgtw128":v8hi*v8hi*v8hi->unit;
  val paddd128 = _import "paddd128":v4si*v4si*v4si->unit;
  val psubd128 = _import "psubd128":v4si*v4si*v4si->unit;
  val pcmpeqd128 = _import "pcmpeqd128":v4si*v4si*v4si->unit;
  val pcmpgtd128 = _import "pcmpgtd128":v4si*v4si*v4si->unit;
  val pmuludq128 = _import "pmuludq128":v4si*v4si*v4si->unit;
  val pslld128 = _import "pslld128":v4si*v4si*v4si->unit;
  val psrld128 = _import "psrld128":v4si*v4si*v4si->unit;
  val psrad128 = _import "psrad128":v4si*v4si*v4si->unit;
(*  val pslldi128 = _import "pslldi128":v4si*int*v4si->unit;
  val psrldi128 = _import "psrldi128":v4si*int*v4si->unit;
  val psradi128 = _import "psradi128":v4si*int*v4si->unit;*)
  val paddq = _import "paddq":v2di*v2di*v2di->unit;
  val psubq = _import "psubq":v2di*v2di*v2di->unit;
  val psllq128 = _import "psllq128":v2di*v2di*v2di->unit;
  val psrlq128 = _import "psrlq128":v2di*v2di*v2di->unit;
  val psllqi128 = _import "psllqi128":v2di*v2di*v2di->unit;
  val psrlqi128 = _import "psrlqi128":v2di*v2di*v2di->unit;
  val pand128 = _import "pand128":m128i*m128i*m128i->unit;
  val pandn128 = _import "pandn128":m128i*m128i*m128i->unit;
  val por128 = _import "por128":m128i*m128i*m128i->unit;
  val pxor128 = _import "pxor128":m128i*m128i*m128i->unit;
local
  open Unsafe
in
  fun sml2c_double f = fn (x,y) =>
                   let
                     val z = Unsafe.Array.create(2,0.0:Real64.real)
                   in (f(x,y,z);z) end
  fun sml2c_unary_double f = fn (x) =>
                         let
                           val y = Unsafe.Array.create(2,0.0:Real64.real)
                         in (f(x,y);y) end
  fun sml2c_int f = fn (x,y) =>
                let
                  val z = Unsafe.Array.create(16,0w0:Word8.word)
                in (f(x,y,z);z) end
  fun sml2c_unary_int f = fn (x) =>
                      let
                        val y = Unsafe.Array.create(16,0w0:Word8.word)
                      in (f(x);y) end
end

  val ADDPD = sml2c_double addpd
  val SUBPD = sml2c_double subpd
  val MULPD = sml2c_double mulpd
  val DIVPD = sml2c_double divpd
(*  val RCPPD = sml2c_unary_double rcppd
  val SQRTPD = sml2c_unary_double sqrtpd*)
  val MAXPD = sml2c_double maxpd
  val MINPD = sml2c_double minpd
  val ANDPD = sml2c_double andpd
  val ORPD = sml2c_double orpd
  val XORPD = sml2c_double xorpd
  val ANDNPD = sml2c_double andnpd
  val CMPEQPD = sml2c_double cmpeqpd
  val CMPLTPD = sml2c_double cmpltpd
  val CMPLEPD = sml2c_double cmplepd
  val CMPGTPD = sml2c_double cmpgtpd
  val CMPGEPD = sml2c_double cmpgepd
  val CMPUNORDPD = sml2c_double cmpunordpd
  val CMPNEQPD = sml2c_double cmpneqpd
  val CMPNLTPD = sml2c_double cmpnltpd
  val CMPNLEPD = sml2c_double cmpnlepd
  val CMPNGTPD = sml2c_double cmpngtpd
  val CMPNGEPD = sml2c_double cmpngepd
  val CMPORDPD = sml2c_double cmpordpd
(*  val SHUFPD = sml2c_double shufpd*)
  val PADDB128 = sml2c_int paddb128
  val PAVGB128 = sml2c_int pavgb128
  val PSUBB128 = sml2c_int psubb128
  val PMINUB128 = sml2c_int pminub128
  val PMAXUB128 = sml2c_int pmaxub128
  val PSADBW128 = sml2c_int psadbw128
  val PCMPEQB128 = sml2c_int pcmpeqb128
  val PCMPGTB128 = sml2c_int pcmpgtb128
  val PADDW128 = sml2c_int paddw128
  val PSUBW128 = sml2c_int psubw128
  val PMULLW128 = sml2c_int pmullw128
  val PMULHW128 = sml2c_int pmulhw128
  val PAVGW128 = sml2c_int pavgw128
  val PMAXW128 = sml2c_int pmaxw128
  val PMINW128 = sml2c_int pminw128
  val PMULHUW128 = sml2c_int pmulhuw128
  val PSLLW128 = sml2c_int psllw128
  val PSRLW128 = sml2c_int psrlw128
  val PSRAW128 = sml2c_int psraw128
  val PSLLWI128 = sml2c_int psllwi128
  val PSRLWI128 = sml2c_int psrlwi128
  val PSRAWI128 = sml2c_int psrawi128
  val PCMPEQW128 = sml2c_int pcmpeqw128
  val PCMPGTW128 = sml2c_int pcmpgtw128
  val PADDD128 = sml2c_int paddd128
  val PSUBD128 = sml2c_int psubd128
  val PCMPEQD128 = sml2c_int pcmpeqd128
  val PCMPGTD128 = sml2c_int pcmpgtd128
  val PMULUDQ128 = sml2c_int pmuludq128
  val PSLLD128 = sml2c_int pslld128
  val PSRLD128 = sml2c_int psrld128
  val PSRAD128 = sml2c_int psrad128
(*  val PSLLDI128 = sml2c_int pslldi128
  val PSRLDI128 = sml2c_int psrldi128
  val PSRADI128 = sml2c_int psradi128*)
end
functor C_SSE2_Types(T:SSE_C_TYPES)(*:SSE2*) =
struct
  type m128i=C_SSE2.m128i
  type v2di = m128i
  type v4si = m128i
  type v8hi = m128i
  type v16qi = m128i
  type v2df=C_SSE2.v2df
  type t2df=T.t2df
  type smidInt=T.simdInt
  fun double_sse_call (a,b,f) = T.unpackDouble(f(T.packDouble(a),T.packDouble(b)))
  fun double_sse_call_1 (a,f) = T.unpackDouble(f(T.packDouble(a)))
  fun int_sse_call (a,b,f) = T.unpackInt(f(T.packInt(a),T.packInt(b)))
  fun int_sse_call_1 (a,f) = T.unpackInt(f(T.packInt(a)))
  fun ADDPD (a,b) = double_sse_call(a,b,C_SSE2.ADDPD)
  fun SUBPD (a,b) = double_sse_call(a,b,C_SSE2.SUBPD)
  fun MULPD (a,b) = double_sse_call(a,b,C_SSE2.MULPD)
  fun DIVPD (a,b) = double_sse_call(a,b,C_SSE2.DIVPD)
(*  fun RCPPD (a,b) = double_sse_call_1(a,C_SSE2.RCPPD)
  fun SQRTPD (a,b) = double_sse_call_1(a,C_SSE2.SQRTPD)*)
  fun MAXPD (a,b) = double_sse_call(a,b,C_SSE2.MAXPD)
  fun MINPD (a,b) = double_sse_call(a,b,C_SSE2.MINPD)
  fun ANDPD (a,b) = double_sse_call(a,b,C_SSE2.ANDPD)
  fun ORPD (a,b) = double_sse_call(a,b,C_SSE2.ORPD)
  fun XORPD (a,b) = double_sse_call(a,b,C_SSE2.XORPD)
  fun ANDNPD (a,b) = double_sse_call(a,b,C_SSE2.ANDNPD)
  fun CMPLTPD (a,b) = double_sse_call(a,b,C_SSE2.CMPLTPD)
  fun CMPEQPD (a,b) = double_sse_call(a,b,C_SSE2.CMPEQPD)
  fun CMPLEPD (a,b) = double_sse_call(a,b,C_SSE2.CMPLEPD)
  fun CMPGTPD (a,b) = double_sse_call(a,b,C_SSE2.CMPGTPD)
  fun CMPGEPD (a,b) = double_sse_call(a,b,C_SSE2.CMPGEPD)
  fun CMPUNORDPD (a,b) = double_sse_call(a,b,C_SSE2.CMPUNORDPD)
  fun CMPNEQPD (a,b) = double_sse_call(a,b,C_SSE2.CMPNEQPD)
  fun CMPNLTPD (a,b) = double_sse_call(a,b,C_SSE2.CMPNLTPD)
  fun CMPNLEPD (a,b) = double_sse_call(a,b,C_SSE2.CMPNLEPD)
  fun CMPNGTPD (a,b) = double_sse_call(a,b,C_SSE2.CMPNGTPD)
  fun CMPNGEPD (a,b) = double_sse_call(a,b,C_SSE2.CMPNGEPD)
  fun CMPORDPD (a,b) = double_sse_call(a,b,C_SSE2.CMPORDPD)
(*  fun SHUFPD (a,b) = double_sse_call(a,b,C_SSE2.SHUFPD)*)
  fun PADDB128 (a,b) = int_sse_call(a,b,C_SSE2.PADDB128)
  fun PAVGB128 (a,b) = int_sse_call(a,b,C_SSE2.PAVGB128)
  fun PSUBB128 (a,b) = int_sse_call(a,b,C_SSE2.PSUBB128)
  fun PMINUB128 (a,b) = int_sse_call(a,b,C_SSE2.PMINUB128)
  fun PMAXUB128 (a,b) = int_sse_call(a,b,C_SSE2.PMAXUB128)
  fun PSADBW128 (a,b) = int_sse_call(a,b,C_SSE2.PSADBW128)
  fun PCMPEQB128 (a,b) = int_sse_call(a,b,C_SSE2.PCMPEQB128)
  fun PCMPGTB128 (a,b) = int_sse_call(a,b,C_SSE2.PCMPGTB128)
  fun PADDW128 (a,b) = int_sse_call(a,b,C_SSE2.PADDW128)
  fun PSUBW128 (a,b) = int_sse_call(a,b,C_SSE2.PSUBW128)
  fun PMULLW128 (a,b) = int_sse_call(a,b,C_SSE2.PMULLW128)
  fun PMULHW128 (a,b) = int_sse_call(a,b,C_SSE2.PMULHW128)
  fun PAVGW128 (a,b) = int_sse_call(a,b,C_SSE2.PAVGW128)
  fun PMAXW128 (a,b) = int_sse_call(a,b,C_SSE2.PMAXW128)
  fun PMINW128 (a,b) = int_sse_call(a,b,C_SSE2.PMINW128)
  fun PMULHUW128 (a,b) = int_sse_call(a,b,C_SSE2.PMULHUW128)
  fun PSLLW128 (a,b) = int_sse_call(a,b,C_SSE2.PSLLW128)
  fun PSRLW128 (a,b) = int_sse_call(a,b,C_SSE2.PSRLW128)
  fun PSRAW128 (a,b) = int_sse_call(a,b,C_SSE2.PSRAW128)
(*  fun PSLLWI128 (a,b) = int_sse_call(a,b,C_SSE2.PSLLWI128)
  fun PSRLWI128 (a,b) = int_sse_call(a,b,C_SSE2.PSRLWI128)
  fun PSRAWI128 (a,b) = int_sse_call(a,b,C_SSE2.PSRAWI128)*)
  fun PCMPEQW128 (a,b) = int_sse_call(a,b,C_SSE2.PCMPEQW128)
  fun PCMPGTW128 (a,b) = int_sse_call(a,b,C_SSE2.PCMPGTW128)
  fun PADDD128 (a,b) = int_sse_call(a,b,C_SSE2.PADDD128)
  fun PSUBD128 (a,b) = int_sse_call(a,b,C_SSE2.PSUBD128)
  fun PCMPEQD128 (a,b) = int_sse_call(a,b,C_SSE2.PCMPEQD128)
  fun PCMPGTD128 (a,b) = int_sse_call(a,b,C_SSE2.PCMPGTD128)
  fun PMULUDQ128 (a,b) = int_sse_call(a,b,C_SSE2.PMULUDQ128)
  fun PSLLD128 (a,b) = int_sse_call(a,b,C_SSE2.PSLLD128)
  fun PSRLD128 (a,b) = int_sse_call(a,b,C_SSE2.PSRLD128)
  fun PSRAD128 (a,b) = int_sse_call(a,b,C_SSE2.PSRAD128)
(*  fun PSLLDI128 (a,b) = int_sse_call(a,b,C_SSE2.PSLLDI128)
  fun PSRLDI128 (a,b) = int_sse_call(a,b,C_SSE2.PSRLDI128)
  fun PSRADI128 (a,b) = int_sse_call(a,b,C_SSE2.PSRADI128)*)
end
structure C_SSE2_Array = C_SSE2_Types(SSE_Ctype_array)
