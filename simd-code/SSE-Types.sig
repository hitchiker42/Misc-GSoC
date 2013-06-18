signature SSE_TYPES =
sig
  type v2df
  type v4sf
  type v2di
  type v4si
  type v8hi
  type v16qi
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
  type v2di = Int64.int Vector.vector
  type v4si = Int32.int Vector.vector
  type v8hi = Int16.int Vector.vector
  type v16qi = Int8.int Vector.vector
end
signature SSE_C_TYPES =
sig
(*Consider using datatypes for some of this*)
  type v2df = Real64.real Vector.vector
  type v4sf = Real32.real Vector.vector
  type v2di = Int64.int Vector.vector
  type v4si = Int32.int Vector.vector
  type v8hi = Int16.int Vector.vector
  type v16qi = Int8.int Vector.vector
  type t2f
  type t4f
  type t2i
  type t4i
  type t8i
  type t16i
  val pack2f:t2f->v2df
  val pack4f:t4f->v4sf
  val pack2i:t2i->v2di
  val pack4i:t4i->v4si
  val pack8i:t8i->v8hi
  val pack16i:t16i->v16qi
  val unpack2f:MLton.Pointer.t->t2f
  val unpack4f:MLton.Pointer.t->t4f
  val unpack2i:MLton.Pointer.t->t2i
  val unpack4i:MLton.Pointer.t->t4i
  val unpack8i:MLton.Pointer.t->t8i
  val unpack16i:MLton.Pointer.t->t16i
end
signature SSE_C_FLOATS =
sig
  type v2df = Real64.real Vector.vector
  type v4sf = Real32.real Vector.vector
  type t2f
  type t4f
  val pack2f:t2f->v2df
  val pack4f:t4f->v4sf
  val unpack2f:MLton.Pointer.t->t2f
  val unpack4f:MLton.Pointer.t->t4f
end
signature SSE_C_INTS =
sig
  type v2di = Int64.int Vector.vector
  type v4si = Int32.int Vector.vector
  type v8hi = Int16.int Vector.vector
  type v16qi = Int8.int Vector.vector
  type t2i
  type t4i
  type t8i
  type t16i
  val pack2i:t2i->v2di
  val pack4i:t4i->v4si
  val pack8i:t8i->v8hi
  val pack16i:t16i->v16qi
  val unpack2i:MLton.Pointer.t->t2i
  val unpack4i:MLton.Pointer.t->t4i
  val unpack8i:MLton.Pointer.t->t8i
  val unpack16i:MLton.Pointer.t->t16i
end
