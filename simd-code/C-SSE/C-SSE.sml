(*_import "CFunctionName" attr... : cFuncTy;*)
signature SSE =
sig
  type v4sf
  type t
  val ADDPS:t*t*t->t
end
signature SSE_C_TYPE = 
sig 
  type v4sf = Real32.real Vector.vector
  type t
  val pack:t->v4sf
  val unpack:MLton.Pointer.t->t
  val store:t ref*MLton.Pointer.t->unit
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
  val UNPCKHPS:v4sf*v4sf->v4sf
  val UNPCKLPS:v4sf*v4sf->v4sf
end*)
structure SseType_Cvector:SSE_C_TYPE=
struct
  type v4sf = Real32.real Vector.vector
  type t = v4sf
  exception unimplemented
  val pack = fn x => x
  (*I'm not sure of the read syntax of vectors, I think its [|1,2,...n|]*)
  local
    open MLton.Pointer in
      fun unpack p = Vector.fromList[getReal32(p,0),getReal32(p,1),getReal32(p,2),getReal32(p,3)]
      fun store (v4sfRef,p) = v4sfRef:=unpack p (*declare inline how?*)
   end
end
functor Sse_C(T:SSE_C_TYPE):SSE =
struct
    type v4sf = Real32.real Vector.vector
    type t=T.t
    val addps = _import "addps" :v4sf*v4sf*v4sf->MLton.Pointer.t;
    fun ADDPS(a,b,c) = let
      val x = T.pack a
      val y = T.pack b
      val z = T.pack c
    in T.unpack (addps(x,y,z)) end
end
(*
        MULPS
        DIVPS
        RCPPS
        SQRTPS
        RSQRTPS
        MAXPS
        MINPS
        ANDPS
        ORPS
        XORPS
        CMPEQPS
        CMPLTPS
        CMPLEPS
        CMPGTPS
        CMPGEPS
        CMPUNORDPS
        CMPNEPS
        CMPNLTPS
        CMPNLEPS
        CMPNGTPS
        CMPNGEPS
        CMPORDPS
        SHUFPS
        UNPCKHPS
        UNPCKLPS
end
*)
structure Sse_Cvector = Sse_C(SseType_Cvector)
