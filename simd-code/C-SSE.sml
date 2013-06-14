(*_import "CFunctionName" attr... : cFuncTy;*)
structure SseType_Cvector:SSE_C_TYPE=
struct
  type v4sf = Real32.real Vector.vector
  type t = v4sf
  val pack = fn x => x
  local
    open MLton.Pointer in
      fun unpack p = Vector.fromList[getReal32(p,0),getReal32(p,1),getReal32(p,2),getReal32(p,3)]
   end
end
structure SseType_Carray:SSE_C_TYPE=
struct
  type v4sf = Real32.real Vector.vector
  type t = Real32.real Array.array
  val pack = fn x => Array.vector x
  local
    open MLton.Pointer in
      fun unpack p = Array.fromList[getReal32(p,0),getReal32(p,1),getReal32(p,2),getReal32(p,3)]
  end
end
structure SseType_Ctuple:SSE_C_TYPE=
struct
  open Real32
  type v4sf = real Vector.vector
  type t = real*real*real*real
  fun pack (a,b,c,d)= Vector.fromList[a,b,c,d]
  local
    open MLton.Pointer in
      fun unpack p = (getReal32(p,0),getReal32(p,1),getReal32(p,2),getReal32(p,3))
  end
end
functor Sse_C(T:SSE_C_TYPE):SSE =
struct
    type v4sf = Real32.real Vector.vector
    type a4sf = Real32.real Array.array
    type t=T.t
    val addps = _import "addps":v4sf*v4sf*a4sf->MLton.Pointer.t;
    val subps = _import "subps":v4sf*v4sf*a4sf->MLton.Pointer.t;
    val mulps = _import "mulps":v4sf*v4sf*a4sf->MLton.Pointer.t;
    val divps = _import "divps":v4sf*v4sf*a4sf->MLton.Pointer.t;
    fun ADDPS(a,b) = let
      val x = T.pack a
      val y = T.pack b
      val z = Array.fromList[0.0,0.0,0.0,0.0]
    in T.unpack (addps(x,y,z)) end
    fun SUBPS(a,b) = let
      val x = T.pack a
      val y = T.pack b
      val z = Array.fromList[0.0,0.0,0.0,0.0]
    in T.unpack (subps(x,y,z)) end
    fun MULPS(a,b) = let
      val x = T.pack a
      val y = T.pack b
      val z = Array.fromList[0.0,0.0,0.0,0.0]
    in T.unpack (mulps(x,y,z)) end
    fun DIVPS(a,b) = let
      val x = T.pack a
      val y = T.pack b
      val z = Array.fromList[0.0,0.0,0.0,0.0]
    in T.unpack (divps(x,y,z)) end

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
structure Sse_Carray = Sse_C(SseType_Carray)
