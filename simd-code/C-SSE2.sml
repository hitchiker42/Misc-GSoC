structure C_SSE2 =
struct
  open SSE_Types
  val addpd = _import "addpd":v2df*v2df*a2df->unit;
  val subpd = _import "subpd":v2df*v2df*a2df->unit;
  val mulpd = _import "mulpd":v2df*v2df*a2df->unit;
  val divpd = _import "divpd":v2df*v2df*a2df->unit;
  val rcppd = _import "rcppd":v2df*a2df->unit;
  val sqrtpd = _import "sqrtpd":v2df*a2df->unit;
  val maxpd = _import "maxpd":v2df*v2df*a2df->unit;
  val minpd = _import "minpd":v2df*v2df*a2df->unit;
  val andpd = _import "andpd":v2df*v2df*a2df->unit;
  val orpd = _import "orpd":v2df*v2df*a2df->unit;
  val xorpd = _import "xorpd":v2df*v2df*a2df->unit;
  val andnpd = _import "andnpd":v2df*v2df*a2df->unit;
  fun sml2c f = fn (x,y) =>
                   let
                     val z = Array.array(4,0.0)
                   in (f(x,y,z);z) end
  fun sml2c_unary f = fn (x) =>
                         let 
                           val y = Array.array(4,0.0)
                         in (f(x,y);y) end
  val ADDPD = sml2c addpd
  val SUBPD = sml2c subpd
  val MULPD = sml2c mulpd
  val DIVPD = sml2c divpd
  val RCPPD = sml2c_unary rcppd
  val SQRTPD = sml2c_unary sqrtpd
  val MAXPD = sml2c maxpd
  val MINPD = sml2c minpd
  val ANDPD = sml2c andpd
  val ORPD = sml2c orpd
  val XORPD = sml2c xorpd
  val ANDNPD = sml2c andnpd
end
functor C_SSE2_Types(T:SSE_C_TYPES):SSE2 = 
struct
  type v2df=SSE_C.v2df
  type t2f=T.t2f
  fun sse_call (a,b,f) = T.unpack(f(T.pack(a),T.pack(b)))
  fun sse_call_1 (a,f) = T.unpack(f(T.pack(a)))
  fun ADDPD (a,b) = sse_call(a,b,SSE_C.ADDPD)
  fun SUBPD (a,b) = sse_call(a,b,SSE_C.SUBPD)
  fun MULPD (a,b) = sse_call(a,b,SSE_C.MULPD)
  fun DIVPD (a,b) = sse_call(a,b,SSE_C.DIVPD)
  fun RCPPD (a,b) = sse_call_1(a,SSE_C.RCPPD)
  fun SQRTPD (a,b) = sse_call_1(a,SSE_C.SQRTPD)
  fun MAXPD (a,b) = sse_call(a,b,SSE_C.MAXPD)
  fun MINPD (a,b) = sse_call(a,b,SSE_C.MINPD)
  fun ANDPD (a,b) = sse_call(a,b,SSE_C.ANDPD)
  fun ORPD (a,b) = sse_call(a,b,SSE_C.ORPD)
  fun XORPD (a,b) = sse_call(a,b,SSE_C.XORPD)
  fun ANDNPD (a,b) = sse_call(a,b,SSE_C.ANDNPD)
end
(*(defun cffi (name) (insert (format "val %s = _import \"%s\":v4sf*v4sf*a4sf->unit;\n" name name)))
(defun c-vals ()
(let ((beg (point)))
   (insert "\n")
   (dolist (name '("addpd" "subpd" "mulpd" "divpd" "rcppd" "sqrtpd" "maxpd" "minpd" "andpd" "orpd" "xorpd" "andnpd"))
           (cffi name)) 
   (indent-region beg (point))))
(defun sml-ffi (name) (insert (format "val %s = sml2c %s\n" (upcase name) (downcase name))))
(defun sml-vals()
(let ((beg (point)))
   (insert "\n")
   (dolist (name '("addpd" "subpd" "mulpd" "divpd" "rcppd" "sqrtpd" "maxpd" "minpd" "andpd" "orpd" "xorpd" "andnpd"))
           (sml-ffi name)) 
   (indent-region beg (point))))
(defun sse-call (name) (insert (format "fun %s (a,b) = sse_call(a,b,SSE_C.%s)\n" (upcase name) (upcase name))))
(defun sml-calls()
(let ((beg (point)))
   (insert "\n")
   (dolist (name '("addpd" "subpd" "mulpd" "divpd" "rcppd" "sqrtpd" "maxpd" "minpd" "andpd" "orpd" "xorpd" "andnpd"))
           (sse-call name)) 
   (indent-region beg (point))))*)
