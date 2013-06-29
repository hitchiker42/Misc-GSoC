signature SSE_TYPES =
sig
  type v2df
  type v4sf
  datatype m128i = v2di | v4si | v8hi | v16qi
  type a2df 
  type a4sf 
  datatype n128i = a2di | a4si | a8hi | a16qi
(* packed types/values(with x = the appropiate integer)
 * vxdf = double float
 * vxsf = single float
 * vxdi = packed quadword
 * vxsi = packed doubleword
 * vxhi = packed word
 * vxqi = packed byte *)
end
structure SSE_Types:SSE_TYPES =
struct 
  type v2df = Real64.real Vector.vector
  type v4sf = Real32.real Vector.vector
  local
    type v2di = Word64.word Vector.vector
    type v4si = Word32.word Vector.vector
    type v8hi = Word16.word Vector.vector
    type v16qi = Word8.word Vector.vector
  in
  datatype m128i = v2di | v4si | v8hi | v16qi
  type a2df = Real64.real Array.array
  type a4sf = Real32.real Array.array
  local
    type a2di = Word64.word Array.array
    type a4si = Word32.word Array.array
    type a8hi = Word16.word Array.array
    type a16qi = Word8.word Array.array
  in
  datatype n128i = a2di | a4si | a8hi | a16qi
end
signature SSE_C_TYPES =
sig
(*Consider using datatypes for some of this*)
  include SSE_TYPES
  type t2f
  type t4f
  datatype smidInt =t2di| t4si | t8hi | t16qi
  val packDouble:t2f->v2df
  val packFloat:t4f->v4sf
  val packInt:simdInt->m128i
  val unpack2f:Real32.real Array.array->t2f
  val unpack4f:Real64.real Array.array->t4f
  val unpackInt:n128i->simdInt
end
signature SSE_C_FLOATS =
sig
  type v2df = Real64.real Vector.vector
  type v4sf = Real32.real Vector.vector
  type t2df
  type t4sf
  val pack2f:t2df->v2df
  val pack4f:t4sf->v4sf
  val unpack2f:Real32.real Array.array->t2f
  val unpack4f:Real64.real Array.array->t4f
end
signature SSE_C_WORDS =
sig
  type v2di = Word64.word Vector.vector
  type v4si = Word32.word Vector.vector
  type v8hi = Word16.word Vector.vector
  type v16qi = Word8.word Vector.vector
  type t2di
  type t4si
  type t8hi
  type t16qi
  val pack2i:t2di->v2di
  val pack4i:t4si->v4si
  val pack8i:t8hi->v8hi
  val pack16i:t16qi->v16qi
  val unpack2i:Word64.word Array.array->t2di
  val unpack4i:Word32.word Array.array->t4si
  val unpack8i:Word16.word Array.array->t8hi
  val unpack16i:Word8.word Array.array->t16qi
end
