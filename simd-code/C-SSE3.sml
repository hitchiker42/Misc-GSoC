structure C_SSE3 =
struct
  open SSE_Types
  type v2di = m128i
  type v4si = m128i
  type v8hi = m128i 
  type v16qi = m128i
  val addsubpd = _import "addsubpd":v2df*v2df*v2df->unit;
  val haddpd = _import "haddpd":v2df*v2df*v2df->unit;
  val hsubpd = _import "hsubpd":v2df*v2df*v2df->unit;
  val addsubps = _import "addsubps":v4sf*v4sf*v4sf->unit;
  val haddps = _import "haddps":v4sf*v4sf*v4sf->unit;
  val hsubps = _import "hsubps":v4sf*v4sf*v4sf->unit;
  local
    open Unsafe
  in
  fun sml2c_double f = fn (x,y) =>
                   let
                     val z = Unsafe.Array.create(2,0.0:Real64.real)
                   in (f(x,y,z);z) end
  fun sml2c_float  f = fn (x,y) =>
                   let
		     val z = Unsafe.Array.create(4,0.0:Real32.real)
		   in (f(x,y,z);z) end
  end
  val ADDSUBPD = sml2c_double addsubpd
  val HADDPD = sml2c_double haddpd
  val HSUBPD = sml2c_double hsubpd
  val ADDSUBPS = sml2c_float addsubps
  val HADDPS = sml2c_float haddps
  val HSUBPS = sml2c_float hsubps
end
functor C_SSE3_Types(T:SSE_C_FLOATS):SSE3 = 
struct
  val v2df=C_SSE3.v2df
  val v4sf=C_SSE3.v4sf
  val t2df=T.t2df
  val t4df=T.t4df
  fun sse_calld (a,b,f) = T.unpackDouble(f(T.packDouble(a),T.packDouble(b)))
  fun sse_calls (a,b,f) = T.unpackFloat(f(T.packFloat(a),T.packFloat(b)))
  fun ADDSUBPD (a,b) = sse_calld(a,b,SSE3_C.ADDSUBPD)
  fun HADDPD (a,b) = sse_calld(a,b,SSE3_C.HADDPD)
  fun HSUBPD (a,b) = sse_calld(a,b,SSE3_C.HSUBPD)
  fun ADDSUBPS (a,b) = sse_calls(a,b,SSE3_C.ADDSUBPS)
  fun HADDPS (a,b) = sse_calls(a,b,SSE3_C.HADDPS)
  fun HSUBPS (a,b) = sse_calls(a,b,SSE3_C.HSUBPS)

end
structure C_SSSE3 =
struct
  open SSE_Types
  type v2di = m128i
  type v4si = m128i
  type v8hi = m128i
  type v16qi = m128i
  val phaddd128 = _import "phaddd128":v4si*v4si*v4si->unit
  val phaddw128 = _import "phaddw128":v8hi*v8hi*v8hi->unit
  val phaddsw128 = _import "phaddsw128":v8hi*v8hi*v8hi->unit
  val phsubd128 = _import "phsubd128":v4si*v4si*v4si->unit
  val phsubw128 = _import "phsubw128":v8hi*v8hi*v8hi->unit
  val phsubsw128 = _import "phsubsw128":v8hi*v8hi*v8hi->unit
  val pmaddubsw128 = _import "pmaddubsw128":v16qi*v16qi*v8hi->unit
  val pmulhrsw = _import "pmulhrsw":v8hi*v8hi*v8hi->unit
  val pabsb128 = _import "pabsb128":v16qi*v16qi->unit  
  val pabsw128 = _import "pabsw128":v8hi*v8hi->unit
  val pabsd128 = _import "pabsd128":v4si*v4si->unit
  fun sml2c_int f = fn (x,y) =>
		       let
			 val z = Unsafe.Array.create(16,0w0:Word8.word)
		       in (f(x,y,z);z) end
  fun sml2c_unary_int f = fn (x) =>
			   let 
			     val y = Unsafe.Array.create(16,0w0:Word8.word)
			   in (f(x);y) end
  val PHADDD128 = sml2c_int phaddd128
  val PHADDW128 = sml2c_int phaddw128
  val PHADDSW128 = sml2c_int phaddsw128
  val PSUBD128 = sml2c_int psubd128
  val PSUBW128 = sml2c_int psubw128
  val PSUBSW128 = sml2c_int psubsw128
  val PMADDUBSW128 = sml2c_int pmaddubsw128
  val PMULHRSW = sml2c_unary_int pmulhrsw
  val PABSB128 = sml2c_unary_int pabsb128
  val PABSW128 = sml2c_unary_int pabsw128
  val PABSD128 = sml2c_unary_int pabsd128

end
functor C_SSSE3_Types(T:SSE_C_INTS):SSSE3 = 
struct
  val m128i=SSE_Types.m128i
  val simdInt=T.simdInt
  fun sse_call (a,b,f) = T.unpackInt(f(T.packInt(a),T.packInt(b)))
  fun PHADDD128 (a,b) = sse_call(a,b,SSSE3_C.PHADDD128)
  fun PHADDW128 (a,b) = sse_call(a,b,SSSE3_C.PHADDW128)
  fun PHADDSW128 (a,b) = sse_call(a,b,SSSE3_C.PHADDSW128)
  fun PSUBD128 (a,b) = sse_call(a,b,SSSE3_C.PSUBD128)
  fun PSUBW128 (a,b) = sse_call(a,b,SSSE3_C.PSUBW128)
  fun PSUBSW128 (a,b) = sse_call(a,b,SSSE3_C.PSUBSW128)
  fun PMADDUBSW128 (a,b) = sse_call(a,b,SSSE3_C.PMADDUBSW128)
  fun PMULHRSW (a,b) = sse_call(a,b,SSSE3_C.PMULHRSW)
  fun PABSB128 (a,b) = sse_call(a,b,SSSE3_C.PABSB128)
  fun PABSW128 (a,b) = sse_call(a,b,SSSE3_C.PABSW128)
  fun PABSD128 (a,b) = sse_call(a,b,SSSE3_C.PABSD128)
end
(*
(*(defun cffi (name type) (insert (format "val %s = _import \"%s\":v%s*v%s*a%s->unit;\n" name name type type type)))
(defun c-vals ()
  (let ((beg (point)))
    (insert "\n")
           (cffi name "")) 
   (indent-region beg (point))))
(defun sml-ffi (name) (insert (format "val %s = sml2c %s\n" (upcase name) (downcase name))))
(defun sml-vals()
(let ((beg (point)))
   (insert "\n")
(dolist (name '("phaddd128" "phaddw128" "phaddsw128" "psubd128" "psubw128" "psubsw128" "pmaddubsw128" "pmulhrsw" "pabsb128" "pabsw128" "pabsd128"))
;;(dolist (name '("addsubpd" "haddpd" "hsubpd" "addsubps" "haddps" "hsubps"))
           (sml-ffi name)) 
   (indent-region beg (point))))
(defun sse-call (name) (insert (format "fun %s (a,b) = sse_call(a,b,SSE_C.%s)\n" (upcase name) (upcase name))))
(defun sml-calls()
(let ((beg (point)))
   (insert "\n")
(dolist (name '("phaddd128" "phaddw128" "phaddsw128" "psubd128" "psubw128" "psubsw128" "pmaddubsw128" "pmulhrsw" "pabsb128" "pabsw128" "pabsd128"))
;;(dolist (name '("addsubpd" "haddpd" "hsubpd" "addsubps" "haddps" "hsubps"))
           (sse-call name)) 
   (indent-region beg (point))))*)
