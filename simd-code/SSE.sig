signature SSE_TYPE = sig
  type v4sf 
  type t
  val pack:t->v4sf
  val unpack:v4sf->t
end
signature SSE_C_TYPE = 
sig 
  type v4sf = Real32.real Vector.vector
  type t
  val pack:t->v4sf
  val unpack:MLton.Pointer.t->t
end
signature SSE =
sig
  type v4sf
  type t
  val ADDPS:t*t->t
  val SUBPS:t*t->t
  val MULPS:t*t->t
  val DIVPS:t*t->t
  val RCPPS:t->t
  val SQRTPS:t->t
  val MINPS:t*t->t
  val MAXPS:t*t->t
end
signature SSE_C_TYPE = 
sig 
  type v4sf = Real32.real Vector.vector
  type t
  val pack:t->v4sf
  val unpack:Real32.real array->t
end
(*
  val MULPS:v4sf*v4sf->v4sf
  val DIVPS:v4sf*v4sf->v4sf
  val RCPPS:v4sf*v4sf->v4sf  
  val SQRTPS:v4sf*v4sf->v4sf
  val RSQRTPS:v4sf*v4sf->v4sf
  val MAXPS:v4sf*v4sf->v4sf
  val MINPS:v4sf*v4sf->v4sf
  val ANDPS:v4sf*v4sf->v4sf
  val ANDNPS:v4sf*v4sf->v4sf
  val ORPS:v4sf*v4sf->v4sf
  val XORPS:v4sf*v4sf->v4sf
  val CMPEQPS:v4sf*v4sf->v4sf
  val CMPLTPS:v4sf*v4sf->v4sf
  val CMPLEPS:v4sf*v4sf->v4sf
  val CMPGTPS:v4sf*v4sf->v4sf
  val CMPGEPS:v4sf*v4sf->v4sf
  val CMPUNORDPS:v4sf*v4sf->v4sf
  val CMPNEQPS:v4sf*v4sf->v4sf
  val CMPNLTPS:v4sf*v4sf->v4sf
  val CMPNLEPS:v4sf*v4sf->v4sf
  val CMPNGTPS:v4sf*v4sf->v4sf
  val CMPNGEPS:v4sf*v4sf->v4sf
  val CMPORDPS:v4sf*v4sf->v4sf
  val SHUFPS:v4sf*v4sf->v4sf
(*or SHUFPS:Word8.word*v4sf*v4sf
where Word8.word determines what do to,the first four bits set the 
first two floats, taking values from the src opperand, where the values
in that opperand can be seen as (00,01,10,11)where thoes are the bit patterns
of the first two bits in the Word8.
The second two floats are chosen using the same means, only taking from the 
dest opperand*)
  val UNPCKHPS:v4sf*v4sf->v4sf
  val UNPCKLPS:v4sf*v4sf->v4sf
end*)
