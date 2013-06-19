(*_import "CFunctionName" attr... : cFuncTy;*)
structure SSE_Ctype_vector:SSE_C_TYPE=
struct
  type e = Real32.real
  type v4sf = Real32.real Vector.vector
  type t = v4sf
  val pack = fn x => x
  fun unpack a = Array.vector a
end
structure SSE_Ctype_array:SSE_C_TYPE=
struct
  type e = Real32.real
  type v4sf = Real32.real Vector.vector
  type t = Real32.real Array.array
  val pack = fn x => Array.vector x
  val unpack = fn x => x
end
structure SSE_Ctype_tuple:SSE_C_TYPE=
struct
  type e = Real32.real
  open Real32
  type v4sf = real Vector.vector
  type t = real*real*real*real
  fun pack (a,b,c,d)= Vector.fromList[a,b,c,d]
  fun unpack a = (Array.sub(a,0),Array.sub(a,1),Array.sub(a,2),Array.sub(a,3))
end
structure SSE_C =
(*shared code, call c functions with vector args and an array dest
 * return unit, result is in the array*)
struct
    type v4sf = Real32.real Vector.vector
    type a4sf = Real32.real Array.array
(*(defun cffi (name) (insert (format "val %s = _import \"%s\":v4sf*v4sf*a4sf->unit;\n" name name)))
(defun c-vals ()
(let ((beg (point)))
   (insert "\n")
   (dolist (name '("addps" "subps" "mulps" "divps" "rcpps" "sqrtps" "maxps" "minps" "andps" "orps" "xorps" "andnps"))
           (cffi name)) 
   (indent-region beg (point))))*)
    val addps = _import "addps":v4sf*v4sf*a4sf->unit;
    val subps = _import "subps":v4sf*v4sf*a4sf->unit;
    val mulps = _import "mulps":v4sf*v4sf*a4sf->unit;
    val divps = _import "divps":v4sf*v4sf*a4sf->unit;
    val rcpps = _import "rcpps":v4sf*a4sf->unit;
    val sqrtps = _import "sqrtps":v4sf*a4sf->unit;
    val maxps = _import "maxps":v4sf*v4sf*a4sf->unit;
    val minps = _import "minps":v4sf*v4sf*a4sf->unit;
    val andps = _import "andps":v4sf*v4sf*a4sf->unit;
    val orps = _import "orps":v4sf*v4sf*a4sf->unit;
    val xorps = _import "xorps":v4sf*v4sf*a4sf->unit;
    val andnps = _import "andnps":v4sf*v4sf*a4sf->unit;
    fun sml2c f = fn (x,y) =>
                     let
                       val z = Array.array(4,0.0)
                     in (f(x,y,z);z) end
    fun sml2c_unary f = fn (x) =>
                           let 
                             val y = Array.array(4,0.0)
                           in (f(x,y);y) end
(*(defun sml-ffi (name) (insert (format "val %s = sml2c %s\n" (upcase name) (downcase name))))
(defun sml-vals()
(let ((beg (point)))
   (insert "\n")
   (dolist (name '("addps" "subps" "mulps" "divps" "rcpps" "sqrtps" "maxps" "minps" "andps" "orps" "xorps" "andnps"))
           (sml-ffi name)) 
   (indent-region beg (point))))*)
    val ADDPS = sml2c addps
    val SUBPS = sml2c subps
    val MULPS = sml2c mulps
    val DIVPS = sml2c divps
    val RCPPS = sml2c_unary rcpps
    val SQRTPS = sml2c_unary sqrtps
    val MAXPS = sml2c maxps
    val MINPS = sml2c minps
    val ANDPS = sml2c andps
    val ORPS = sml2c orps
    val XORPS = sml2c xorps
    val ANDNPS = sml2c andnps
end
(*
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
functor SSE_C_Typed(T:SSE_C_TYPE):SSE =
struct
  type v4sf=SSE_C.v4sf
  type t=T.t
  fun sse_call (a,b,f) = T.unpack(f(T.pack(a),T.pack(b)))
  fun sse_call_1 (a,f) = T.unpack(f(T.pack(a)))
(*(defun sse-call (name) (insert (format "fun %s (a,b) = sse_call(a,b,SSE_C.%s)\n" (upcase name) (upcase name))))
(defun sml-calls()
(let ((beg (point)))
   (insert "\n")
   (dolist (name '("addps" "subps" "mulps" "divps" "rcpps" "sqrtps" "maxps" "minps" "andps" "orps" "xorps" "andnps"))
           (sse-call name)) 
   (indent-region beg (point))))*)
  fun ADDPS (a,b) = sse_call(a,b,SSE_C.ADDPS)
  fun SUBPS (a,b) = sse_call(a,b,SSE_C.SUBPS)
  fun MULPS (a,b) = sse_call(a,b,SSE_C.MULPS)
  fun DIVPS (a,b) = sse_call(a,b,SSE_C.DIVPS)
  fun RCPPS (a) = sse_call_1(a,SSE_C.RCPPS)
  fun SQRTPS (a) = sse_call_1(a,SSE_C.SQRTPS)
  fun MAXPS (a,b) = sse_call(a,b,SSE_C.MAXPS)
  fun MINPS (a,b) = sse_call(a,b,SSE_C.MINPS)
  fun ANDPS (a,b) = sse_call(a,b,SSE_C.ANDPS)
  fun ORPS (a,b) = sse_call(a,b,SSE_C.ORPS)
  fun XORPS (a,b) = sse_call(a,b,SSE_C.XORPS)
  fun ANDNPS (a,b) = sse_call(a,b,SSE_C.ANDNPS)
end

  
structure SSE_Cvector = SSE_C_Typed(SSE_Ctype_vector)
structure SSE_Carray = SSE_C_Typed(SSE_Ctype_array)
(*
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
  val rcpps = _import "rcpps":v4sf_op;
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
*)
