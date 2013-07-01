signature SSE_TYPES =
sig
  type v2df
  type v4sf
  datatype m128i = v2di | v4si | v8hi | v16qi
(* packed types/values(with x = the appropiate integer)
 * vxdf = double float
 * vxsf = single float
 * vxdi = packed quadword
 * vxsi = packed doubleword
 * vxhi = packed word
 * vxqi = packed byte *)
end
signature SSE_C_TYPES =
sig
  include SSE_TYPES
  type t2df
  type t4sf
  datatype simdInt = t2di| t4si | t8hi | t16qi
  val packDouble:t2df->v2df
  val packFloat:t4sf->v4sf
  val packInt:simdInt->m128i
  val unpack2f:Real64.real Array.array->t2df
  val unpack4f:Real32.real Array.array->t4sf
  val unpackInt:m128i->simdInt
end
signature SSE_C_FLOATS =
sig
  type v2df = Real64.real Array.array
  type v4sf = Real32.real Array.array
  type t2df
  type t4sf
  val pack2f:t2df->v2df
  val pack4f:t4sf->v4sf
  val unpack2f:Real64.real Array.array->t2df
  val unpack4f:Real32.real Array.array->t4sf
end
signature SSE_C_INTS =
sig
  datatype m128i = v2di | v4si | v8hi | v16qi
  datatype simdInt = t2di| t4si | t8hi | t16qi
  val packInt:simdInt->m128i
  val unpackInt:m128i->simdInt
end
structure SSE_Types:SSE_TYPES =
struct 
  type v2df = Real64.real Array.array
  type v4sf = Real32.real Array.array
  local
    type v2di = Word64.word Array.array
    type v4si = Word32.word Array.array
    type v8hi = Word16.word Array.array
    type v16qi = Word8.word Array.array
  in
  datatype m128i = v2di | v4si | v8hi | v16qi 
  end
end
(*
structure SSE_Ctype_array:SSE_C_TYPES =
struct
  open SSE_Types
  type t2df = v2df
  type t4sf = v4sf
  local
    type t2di = Word64.word Array.array
    type t4si = Word32.word Array.array
    type t8hi = Word16.word Array.array
    type t16qi = Word8.word Array.array
  in
  datatype simdInt = t2di | t4si | t8hi | t16qi
  end
  local
    val id = fn x => x
  in
  val packDouble=id
  val packFloat=id
  val packInt=id
  val unpack2f=id
  val unpack4f=id
  val unpackInt=id
  end
end*)
(*signature SSE_C_WORDS =
sig
  type v2di = Word64.word Array.array
  type v4si = Word32.word Array.array
  type v8hi = Word16.word Array.array
  type v16qi = Word8.word Array.array
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
end*)
