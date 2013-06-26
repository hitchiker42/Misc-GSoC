(*_import "CFunctionName" attr... : cFuncTy;*)
(*NOTE: Figure out the right typecasts/conversions etc for using
 *Unsafe mono arrays*)
structure SSE_Ctype_vector:SSE_C_TYPE=
struct
  type v4sf = Real32.real Vector.vector
  type t = v4sf 
 val pack = fn x => x
  fun unpack a = Array.vector a
end
structure SSE_Ctype_array:SSE_C_TYPE=
struct
  type v4sf = Real32.real Vector.vector
  type t = Real32.real Array.array
  val pack = fn x => Array.vector x
  val unpack = fn x => x
end
structure SSE_Ctype_tuple:SSE_C_TYPE=
struct
  open Real32
  type v4sf = real Vector.vector
  type t = real*real*real*real
  fun pack (a,b,c,d)= Vector.fromList[a,b,c,d]
  fun unpack a = (Array.sub(a,0),Array.sub(a,1),Array.sub(a,2),Array.sub(a,3))
end
structure C_SSE =
(*shared code, call c functions with vector args and an array dest
 * return unit, result is in the array*)
struct
    type v4sf = Real32.real Vector.vector
    type a4sf = Real32.real Array.array
(*(defun cffi (name) (insert (format "val %s = _import \"%s\":v4sf*v4sf*a4sf->unit;\n" name name)))
(defun c-vals ()
(let ((beg (point)))
   (insert "\n")
;;   (dolist (name '("addps" "subps" "mulps" "divps" "rcpps" "sqrtps" "maxps" "minps" "andps" "orps" "xorps" "andnps"))
     (dolist (name '("add_ps" "sub_ps" "mul_ps" "div_ps" "min_ps" "max_ps"
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
   (dolist (name '("addps" "subps" "mulps" "divps" "rcpps" "sqrtps" "maxps" "minps" "andps" "orps" "xorps" "andnps"))
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
end

  
structure C_SSE_vector = C_SSE_Typed(SSE_Ctype_vector)
structure C_SSE_array = C_SSE_Typed(SSE_Ctype_array)
structure C_SSE_tuple = C_SSE_Typed(SSE_Ctype_tuple)
