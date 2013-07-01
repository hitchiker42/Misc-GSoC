structure C_SSE4.1 =
struct
  open SSE_TYPES
  val dppd = _import "dppd":v2df*v2df*v2df->Real64.real
  val dpps = _import "dpps":v4sf*v4sf*v4sf->Real32.real
  (*rounding stuff are scalar ops, so not sure what to do with them*)
  local
    open Unsafe
  in
  fun sml2c_double f = fn (x,y) =>
			  let
			    val z = Real64Array.create 2
			  in (f(x,y,z);z) end
  fun sml2c_float  f = fn (x,y) =>
			  let
			    val z = Real32Array.create 2
			  in (f(x,y,z);z) end
  end
end
functor C_SSE4.1_Types(T:C_SSE_TYPES):SSE4.1 = 
struct
end
structure C_SSE4.2 =
struct
end
functor C_SSE4.2_Types(T:C_SSE_TYPES):SSE4.2 = 
struct
end
(*(defun sml-ffi (name) (insert (format "val %s = sml2c %s\n" (upcase name) (downcase name))))
(defun sml-vals()
(let ((beg (point)))
   (insert "\n")
   (dolist (name '("addps" "subps" "mulps" "divps" "rcpps" "sqrtps" "maxps" "minps" "andps" "orps" "xorps" "andnps"))
           (sml-ffi name)) 
   (indent-region beg (point))))
(defun sse-call (name) (insert (format "fun %s (a,b) = sse_call(a,b,SSE_C.%s)\n" (upcase name) (upcase name))))
(defun sml-calls()
(let ((beg (point)))
   (insert "\n")
   (dolist (name '("addps" "subps" "mulps" "divps" "rcpps" "sqrtps" "maxps" "minps" "andps" "orps" "xorps" "andnps"))
           (sse-call name)) 
   (indent-region beg (point))))*)
