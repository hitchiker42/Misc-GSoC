(*_import "CFunctionName" attr... : cFuncTy;*)
structure SSE_Ctype_vector:SSE_C_TYPE=
struct
  type v4sf = Real32.real Array.array
  type t = Real32.real Vector.vector
  fun pack a = let 
    val z = Unsafe.Array.create (4,0.0:Real32.real)
  in (Array.copyVec{src=a,dst=z,di=0};z) end
  fun unpack a = Array.vector a
end
structure SSE_Ctype_array:SSE_C_TYPE=
struct
  type v4sf = Real32.real Array.array
  type t = v4sf
  val pack = fn x => x
  val unpack = fn x => x
end
structure SSE_Ctype_tuple:SSE_C_TYPE=
struct
  open Real32
  type v4sf = real Array.array
  type t = real*real*real*real
  fun pack (a,b,c,d)= Array.fromList[a,b,c,d]
  fun unpack a = (Array.sub(a,0),Array.sub(a,1),Array.sub(a,2),Array.sub(a,3))
end
structure C_SSE =
(*shared code, call c functions with vector args and an array dest
 * return unit, result is in the array*)
struct
    type v4sf = Real32.real Array.array
(*(defun cffi (name) (insert (format "val %s = _import \"%s\":v4sf*v4sf*a4sf->unit;\n" name name)))
(defun c-vals ()
(let ((beg (point)))
   (insert "\n")
;;   (dolist (name '("addps" "subps" "mulps" "divps" "rcpps" "sqrtps" "maxps" "minps" "andps" "orps" "xorps" "andnps"))
     (dolist (name '("add_ps" "sub_ps" "mul_ps" "div_ps" "min_ps" "max_ps"
           (cffi name)) 
   (indent-region beg (point))))*)
    val addps = _import "addps":v4sf*v4sf*v4sf->unit;
    val subps = _import "subps":v4sf*v4sf*v4sf->unit;
    val mulps = _import "mulps":v4sf*v4sf*v4sf->unit;
    val divps = _import "divps":v4sf*v4sf*v4sf->unit;
    val rcpps = _import "rcpps":v4sf*v4sf->unit;
    val sqrtps = _import "sqrtps":v4sf*v4sf->unit;
    val maxps = _import "maxps":v4sf*v4sf*v4sf->unit;
    val minps = _import "minps":v4sf*v4sf*v4sf->unit;
    val andps = _import "andps":v4sf*v4sf*v4sf->unit;
    val orps = _import "orps":v4sf*v4sf*v4sf->unit;
    val xorps = _import "xorps":v4sf*v4sf*v4sf->unit;
    val andnps = _import "andnps":v4sf*v4sf*v4sf->unit;
    val cmpltps = _import "cmpltps":v4sf*v4sf*v4sf->unit;
    val cmpeqps = _import "cmpeqps" v4sf*v4sf*v4sf->unit;
    val cmpltps = _import "cmpltps" v4sf*v4sf*v4sf->unit;
    val cmpleps = _import "cmpleps" v4sf*v4sf*v4sf->unit;
    val cmpgtps = _import "cmpgtps" v4sf*v4sf*v4sf->unit;
    val cmpgeps = _import "cmpgeps" v4sf*v4sf*v4sf->unit;
    val cmpunordps = _import "cmpunordps" v4sf*v4sf*v4sf->unit;
    val cmpneqps = _import "cmpneqps" v4sf*v4sf*v4sf->unit;
    val cmpnltps = _import "cmpnltps" v4sf*v4sf*v4sf->unit;
    val cmpnleps = _import "cmpnleps" v4sf*v4sf*v4sf->unit;
    val cmpngtps = _import "cmpngtps" v4sf*v4sf*v4sf->unit;
    val cmpngeps = _import "cmpngeps" v4sf*v4sf*v4sf->unit;
    val cmpordps = _import "cmpordps" v4sf*v4sf*v4sf->unit;
    val shufps = _import "shufps" v4sf*v4sf*v4sf->unit;

    fun sml2c f = fn (x,y) =>
                     let
                       val z = Unsafe.Array.create (4,0.0:Real32.real)
                     in (f(x,y,z);z) end
    fun sml2c_unary f = fn (x) =>
                           let 
                             val y = Unsafe.Array.create (4,0.0:Real32.real)
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
    val CMPLTPS = sml2c cmpltps
    val CMPEQPS = sml2c cmpeqps
    val CMPLTPS = sml2c cmpltps
    val CMPLEPS = sml2c cmpleps
    val CMPGTPS = sml2c cmpgtps
    val CMPGEPS = sml2c cmpgeps
    val CMPUNORDPS = sml2c cmpunordps
    val CMPNEQPS = sml2c cmpneqps
    val CMPNLTPS = sml2c cmpnltps
    val CMPNLEPS = sml2c cmpnleps
    val CMPNGTPS = sml2c cmpngtps
    val CMPNGEPS = sml2c cmpngeps
    val CMPORDPS = sml2c cmpordps
    val SHUFPS = sml2c shufps

end
(*  TODO
 CMPEQPS CMPLTPS CMPLEPS CMPGTPS CMPGEPS CMPUNORDPS CMPNEPS CMPNLTPS
 CMPNLEPS CMPNGTPS CMPNGEPS CMPORDPS
 SHUFPS UNPCKHPS UNPCKLPS
end
*)
functor C_SSE_Typed(T:SSE_C_TYPE):SSE =
struct
  type v4sf=C_SSE.v4sf
  type t=T.t
  fun sse_call (a,b,f) = T.unpack(f(T.pack(a),T.pack(b)))
  fun sse_call_1 (a,f) = T.unpack(f(T.pack(a)))
(*(defun sse-call (name) (insert (format "fun %s (a,b) = sse_call(a,b,C_SSE.%s)\n" (upcase name) (upcase name))))
(defun sml-calls()
(let ((beg (point)))
   (insert "\n")
   (dolist (name '("cmpltps" "cmpeqps" "cmpleps" "cmpgtps" "cmpgeps""cmpunordys" "cmpneqps" "cmpnltps" "cmpnleps" "cmpngtps" "cmpngeps" "cmpordps" "shufps"))
           (sse-call name)) 
   (indent-region beg (point))))*)
  fun ADDPS (a,b) = sse_call(a,b,C_SSE.ADDPS)
  fun SUBPS (a,b) = sse_call(a,b,C_SSE.SUBPS)
  fun MULPS (a,b) = sse_call(a,b,C_SSE.MULPS)
  fun DIVPS (a,b) = sse_call(a,b,C_SSE.DIVPS)
  fun RCPPS (a) = sse_call_1(a,C_SSE.RCPPS)
  fun SQRTPS (a) = sse_call_1(a,C_SSE.SQRTPS)
  fun MAXPS (a,b) = sse_call(a,b,C_SSE.MAXPS)
  fun MINPS (a,b) = sse_call(a,b,C_SSE.MINPS)
  fun ANDPS (a,b) = sse_call(a,b,C_SSE.ANDPS)
  fun ORPS (a,b) = sse_call(a,b,C_SSE.ORPS)
  fun XORPS (a,b) = sse_call(a,b,C_SSE.XORPS)
  fun ANDNPS (a,b) = sse_call(a,b,C_SSE.ANDNPS)
  fun CMPLTPS (a,b) = sse_call(a,b,C_SSE.CMPLTPS)
  fun CMPLTPS (a,b) = sse_call(a,b,C_SSE.CMPLTPS)
  fun CMPEQPS (a,b) = sse_call(a,b,C_SSE.CMPEQPS)
  fun CMPLEPS (a,b) = sse_call(a,b,C_SSE.CMPLEPS)
  fun CMPGTPS (a,b) = sse_call(a,b,C_SSE.CMPGTPS)
  fun CMPGEPS (a,b) = sse_call(a,b,C_SSE.CMPGEPS)
  fun CMPUNORDYS (a,b) = sse_call(a,b,C_SSE.CMPUNORDYS)
  fun CMPNEQPS (a,b) = sse_call(a,b,C_SSE.CMPNEQPS)
  fun CMPNLTPS (a,b) = sse_call(a,b,C_SSE.CMPNLTPS)
  fun CMPNLEPS (a,b) = sse_call(a,b,C_SSE.CMPNLEPS)
  fun CMPNGTPS (a,b) = sse_call(a,b,C_SSE.CMPNGTPS)
  fun CMPNGEPS (a,b) = sse_call(a,b,C_SSE.CMPNGEPS)
  fun CMPORDPS (a,b) = sse_call(a,b,C_SSE.CMPORDPS)
  fun SHUFPS (a,b) = sse_call(a,b,C_SSE.SHUFPS)
end

(*need to see if mlton does -nan and -0 or not*)
local
    fun cvt nan = True
    | cvt 0 = False
    open Array
in
fun cmpToBool x = (cvt sub(x,0),cvt sub(x,1),cvt sub(x,2),cvt sub(x,3))

structure C_SSE_vector = C_SSE_Typed(SSE_Ctype_vector)
structure C_SSE_array = C_SSE_Typed(SSE_Ctype_array)
structure C_SSE_tuple = C_SSE_Typed(SSE_Ctype_tuple)
