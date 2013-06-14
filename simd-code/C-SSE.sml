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

structure SSE_Datatype =
struct
local
  open MLton.Pointer 
in
  fun unpack p = Vector.fromList[getReal32(p,0),getReal32(p,1),getReal32(p,2),getReal32(p,3)]
end
  type v4sf = Real32.real Vector.vector
  type a4sf = Real32.real Array.array
  type v4sf_op = v4sf*v4sf*a4sf->MLton.Pointer.t
  val a4sf0 = Array.fromList[0.0,0.0,0.0,0.0]
  val addps = _import "addps":v4sf_op;
  val subps = _import "subps":v4sf_op;
  val mulps = _import "mulps":v4sf_op;
  val divps = _import "divps":v4sf_op;
  datatype SSE_Arith_op = arith_op of v4sf_op
  fun mathop (arith_op f) (a,b) =
      unpack(f(a,b,a4sf0))
end
(*OR*)
signature SSE_DATATYPE =
sig
  type v4sf = Real32.real Vector.vector
  type a4sf = Real32.real Vector.vector
  type t
  type v4sf_op = v4sf*v4sf*a4sf->MLton.Pointer.t
  type t_op = t*t->t
  val pack:t->v4sf
  val unpack:MLton.Pointer.t->t
end
functor Sse_Datatype_fun(T:SSE_DATATYPE):SSE = 
  struct
  type v4sf = T.v4sf
  type t = T.t
  type a4sf = Real32.real Array.array
  type v4sf_op = v4sf*v4sf*a4sf->MLton.Pointer.t
  val a4sf0 = Array.fromList[0.0,0.0,0.0,0.0]
  val addps = _import "addps":v4sf_op;
  val subps = _import "subps":v4sf_op;
  val mulps = _import "mulps":v4sf_op;
  val divps = _import "divps":v4sf_op;
  datatype SSE_Arith_op = arith_op of v4sf_op
  fun vmath_op (arith_op f) =
      fn (a,b) => let 
        val x = T.pack a
        val y = T.pack b
      in T.unpack(f(x,y,a4sf0)) end
  val ADDPS = vmath_op (arith_op addps)
  val SUBPS = vmath_op (arith_op subps)
  val MULPS = vmath_op (arith_op mulps)
  val DIVPS = vmath_op (arith_op divps)
end
  
