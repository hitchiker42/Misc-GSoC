(*NOTE: Still a lot to do here esp. with type stuff (conversions, how to do
 *ints, casting, etc..*)
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
  val paddb128 = _import "paddb128":v16qi*v16qi*a16qi->unit;
  val psubb128 = _import "psubb128":v16qi*v16qi*a16qi->unit;
  val pavgb128 = _import "pavgb128":v16qi*v16qi*a16qi->unit;
  val pminub128 = _import "pminub128":v16qi*v16qi*a16qi->unit;
  val pmaxub128 = _import "pmaxub128":v16qi*v16qi*a16qi->unit;
  val psadbw128 = _import "psadbw128":v16qi*v16qi*a16qi->unit;
  val pcmpeqb128 = _import "pcmpeqb128":v16qi*v16qi*a16qi->unit;
  val pcmpgtb128 = _import "pcmpgtb128":v16qi*v16qi*a16qi->unit;
  val paddw128 = _import "paddw128":v8hi*v8hi*a8hi->unit;
  val psubw128 = _import "psubw128":v8hi*v8hi*a8hi->unit;
  val pmullw128 = _import "pmullw128":v8hi*v8hi*a8hi->unit;
  val pmulhw128 = _import "pmulhw128":v8hi*v8hi*a8hi->unit;
  val pavgw128 = _import "pavgw128":v8hi*v8hi*a8hi->unit;
  val pmaxw128 = _import "pmaxw128":v8hi*v8hi*a8hi->unit;
  val pminw128 = _import "pminw128":v8hi*v8hi*a8hi->unit;
  val pmulhuw128 = _import "pmulhuw128":v8hi*v8hi*a8hi->unit;
  val psllw128 = _import "psllw128":v8hi*v8hi*a8hi->unit;
  val psrlw128 = _import "psrlw128":v8hi*v8hi*a8hi->unit;
  val psraw128 = _import "psraw128":v8hi*v8hi*a8hi->unit;
  val psllwi128 = _import "psllwi128":v8hi*int*a8hi->unit;
  val psrlwi128 = _import "psrlwi128":v8hi*int*a8hi->unit;
  val psrawi128 = _import "psrawi128":v8hi*int*a8hi->unit;
  val pcmpeqw128= _import "pcmpeqw128":v8hi*v8hi*a8hi->unit;
  val pcmpgtw128= _import "pcmpgtw128":v8hi*v8hi*a8hi->unit;
  val paddd128 = _import "paddd128":v4si*v4si*a4si->unit;
  val psubd128 = _import "psubd128":v4si*v4si*a4si->unit;
  val pcmpeqd128 = _import "pcmpeqd128":v4si*v4si*a4si->unit;
  val pcmpgtd128 = _import "pcmpgtd128":v4si*v4si*a4si->unit;
  val pmuludq128 = _import "pmuludq128":v4si*v4si*a4si->unit;
  val pslld128 = _import "pslld128":v4si*v4si*a4si->unit;
  val psrld128 = _import "psrld128":v4si*v4si*a4si->unit;
  val psrad128 = _import "psrad128":v4si*v4si*a4si->unit;
  val pslldi128 = _import "pslldi128":v4si*int*a4si->unit;
  val psrldi128 = _import "psrldi128":v4si*int*a4si->unit;
  val psradi128 = _import "psradi128":v4si*int*a4si->unit;
  val paddq = _import "paddq":v2di*v2di*a2di->unit;
  val psubq = _import "psubq":v2di*v2di*a2di->unit;
  val psllq128 = _import "psllq128":v2di*v2di*a2di->unit;
  val psrlq128 = _import "psrlq128":v2di*v2di*a2di->unit;
  val psllqi128 = _import "psllqi128":v2di*v2di*a2di->unit;
  val psrlqi128 = _import "psrlqi128":v2di*v2di*a2di->unit;
  val pand128 = _import "pand128":__mm128i*__mm128i*__mm128i->unit;
  val pandn128 = _import "pandn128":__mm128i*__mm128i*__mm128i->unit;
  val por128 = _import "por128":__mm128i*__mm128i*__mm128i->unit;
  val pxor128 = _import "pxor128":__mm128i*__mm128i*__mm128i->unit;
local
  open Unsafe
in
  fun sml2c_double f = fn (x,y) =>
                   let
                     val z = Real64Array.create 2
                   in (f(x,y,z);z) end
  fun sml2c_unary_double f = fn (x) =>
                         let 
                           val y = Real64Array.create 2
                         in (f(x,y);y) end
  fun sml2c_int f = fn (x,y) =>
		       let
(* it would be nice not to make 8 functions for all int types but I'm
 * not sure the best way to cast a Word8 array to all the other types
 * Maybe I should used a packed type instead?*)
			 val z = Word8Array.create 16
		       in (f(x,y,z);z) end
  fun sml2c_unary_int f = fn (x) =>
			   let 
			     val y = Word8Array.create 16
			   in (f(x);y) end
end
			    
  val ADDPD = sml2c_double addpd
  val SUBPD = sml2c_double subpd
  val MULPD = sml2c_double mulpd
  val DIVPD = sml2c_double divpd
  val RCPPD = sml2c_unary_double rcppd
  val SQRTPD = sml2c_unary_double sqrtpd
  val MAXPD = sml2c_double maxpd
  val MINPD = sml2c_double minpd
  val ANDPD = sml2c_double andpd
  val ORPD = sml2c_double orpd
  val XORPD = sml2c_double xorpd
  val ANDNPD = sml2c_double andnpd
  val PADDB128 = sml2c_int paddb128
  val PAVGB128 = sml2c_int pavgb128
  val PSUBB128 = sml2c_int psubb128
  val PMINUB128 = sml2c_int pminub128
  val PMAXUB128 = sml2c_int pmaxub128
  val PSADBW128 = sml2c_int psadbw128
  val PCMPEQB128 = sml2c_int pcmpeqb128
  val PCMPGTB128 = sml2c_int pcmpgtb128
  val PADDW128 = sml2c_int paddw128
  val PSUBW128 = sml2c_int psubw128
  val PMULLW128 = sml2c_int pmullw128
  val PMULHW128 = sml2c_int pmulhw128
  val PAVGW128 = sml2c_int pavgw128
  val PMAXW128 = sml2c_int pmaxw128
  val PMINW128 = sml2c_int pminw128
  val PMULHUW128 = sml2c_int pmulhuw128
  val PSLLW128 = sml2c_int psllw128
  val PSRLW128 = sml2c_int psrlw128
  val PSRAW128 = sml2c_int psraw128
  val PSLLWI128 = sml2c_int psllwi128
  val PSRLWI128 = sml2c_int psrlwi128
  val PSRAWI128 = sml2c_int psrawi128
  val PCMPEQW128 = sml2c_int pcmpeqw128
  val PCMPGTW128 = sml2c_int pcmpgtw128
  val PADDD128 = sml2c_int paddd128
  val PSUBD128 = sml2c_int psubd128
  val PCMPEQD128 = sml2c_int pcmpeqd128
  val PCMPGTD128 = sml2c_int pcmpgtd128
  val PMULUDQ128 = sml2c_int pmuludq128
  val PSLLD128 = sml2c_int pslld128
  val PSRLD128 = sml2c_int psrld128
  val PSRAD128 = sml2c_int psrad128
  val PSLLDI128 = sml2c_int pslldi128
  val PSRLDI128 = sml2c_int psrldi128
  val PSRADI128 = sml2c_int psradi128
end
functor C_SSE2_Types(T:SSE_C_TYPES):SSE2 = 
struct
  type v2df=C_SSE2.v2df
  type t2f=T.t2f
  type v2di=C_SSE2.v2di(*...etc I'll do it later*)
  fun sse_call (a,b,f) = T.unpack(f(T.pack(a),T.pack(b)))
  fun sse_call_1 (a,f) = T.unpack(f(T.pack(a)))
  fun ADDPD (a,b) = sse_call(a,b,C_SSE2.ADDPD)
  fun SUBPD (a,b) = sse_call(a,b,C_SSE2.SUBPD)
  fun MULPD (a,b) = sse_call(a,b,C_SSE2.MULPD)
  fun DIVPD (a,b) = sse_call(a,b,C_SSE2.DIVPD)
  fun RCPPD (a,b) = sse_call_1(a,C_SSE2.RCPPD)
  fun SQRTPD (a,b) = sse_call_1(a,C_SSE2.SQRTPD)
  fun MAXPD (a,b) = sse_call(a,b,C_SSE2.MAXPD)
  fun MINPD (a,b) = sse_call(a,b,C_SSE2.MINPD)
  fun ANDPD (a,b) = sse_call(a,b,C_SSE2.ANDPD)
  fun ORPD (a,b) = sse_call(a,b,C_SSE2.ORPD)
  fun XORPD (a,b) = sse_call(a,b,C_SSE2.XORPD)
  fun ANDNPD (a,b) = sse_call(a,b,C_SSE2.ANDNPD)
  fun PADDB128 (a,b) = sse_call(a,b,C_SSE2.PADDB128)
  fun PAVGB128 (a,b) = sse_call(a,b,C_SSE2.PAVGB128)
  fun PSUBB128 (a,b) = sse_call(a,b,C_SSE2.PSUBB128)
  fun PMINUB128 (a,b) = sse_call(a,b,C_SSE2.PMINUB128)
  fun PMAXUB128 (a,b) = sse_call(a,b,C_SSE2.PMAXUB128)
  fun PSADBW128 (a,b) = sse_call(a,b,C_SSE2.PSADBW128)
  fun PCMPEQB128 (a,b) = sse_call(a,b,C_SSE2.PCMPEQB128)
  fun PCMPGTB128 (a,b) = sse_call(a,b,C_SSE2.PCMPGTB128)
  fun PADDW128 (a,b) = sse_call(a,b,C_SSE2.PADDW128)
  fun PSUBW128 (a,b) = sse_call(a,b,C_SSE2.PSUBW128)
  fun PMULLW128 (a,b) = sse_call(a,b,C_SSE2.PMULLW128)
  fun PMULHW128 (a,b) = sse_call(a,b,C_SSE2.PMULHW128)
  fun PAVGW128 (a,b) = sse_call(a,b,C_SSE2.PAVGW128)
  fun PMAXW128 (a,b) = sse_call(a,b,C_SSE2.PMAXW128)
  fun PMINW128 (a,b) = sse_call(a,b,C_SSE2.PMINW128)
  fun PMULHUW128 (a,b) = sse_call(a,b,C_SSE2.PMULHUW128)
  fun PSLLW128 (a,b) = sse_call(a,b,C_SSE2.PSLLW128)
  fun PSRLW128 (a,b) = sse_call(a,b,C_SSE2.PSRLW128)
  fun PSRAW128 (a,b) = sse_call(a,b,C_SSE2.PSRAW128)
  fun PSLLWI128 (a,b) = sse_call(a,b,C_SSE2.PSLLWI128)
  fun PSRLWI128 (a,b) = sse_call(a,b,C_SSE2.PSRLWI128)
  fun PSRAWI128 (a,b) = sse_call(a,b,C_SSE2.PSRAWI128)
  fun PCMPEQW128 (a,b) = sse_call(a,b,C_SSE2.PCMPEQW128)
  fun PCMPGTW128 (a,b) = sse_call(a,b,C_SSE2.PCMPGTW128)
  fun PADDD128 (a,b) = sse_call(a,b,C_SSE2.PADDD128)
  fun PSUBD128 (a,b) = sse_call(a,b,C_SSE2.PSUBD128)
  fun PCMPEQD128 (a,b) = sse_call(a,b,C_SSE2.PCMPEQD128)
  fun PCMPGTD128 (a,b) = sse_call(a,b,C_SSE2.PCMPGTD128)
  fun PMULUDQ128 (a,b) = sse_call(a,b,C_SSE2.PMULUDQ128)
  fun PSLLD128 (a,b) = sse_call(a,b,C_SSE2.PSLLD128)
  fun PSRLD128 (a,b) = sse_call(a,b,C_SSE2.PSRLD128)
  fun PSRAD128 (a,b) = sse_call(a,b,C_SSE2.PSRAD128)
  fun PSLLDI128 (a,b) = sse_call(a,b,C_SSE2.PSLLDI128)
  fun PSRLDI128 (a,b) = sse_call(a,b,C_SSE2.PSRLDI128)
  fun PSRADI128 (a,b) = sse_call(a,b,C_SSE2.PSRADI128)
end
(*(defun cffi (name type) (insert (format "val %s = _import \"%s\":v%s*v%s*a%s->unit;\n" name name type type type)))
(defun c-vals ()
  (let ((beg (point)))
    (insert "\n")
;;byte (dolist (name '("paddb128"  "pavgb128" "psubb128" "pminub128" "pmaxub128" "psadbw128" "pcmpeqb128" "pcmpgtb128"))
;;short (dolist (name '("paddw128" "psubw128" "pmullw128" "pmulhw128" "pavgw128" "pmaxw128" "pminw128" "pmulhuw128" "psllw128" "psrlw128" "psraw128" "psllwi128" "psrlwi128" "psrawi128" "pcmpeqw128" "pcmpgtw128"))
;;int (dolist (name '("paddd128" "psubd128" "pcmpeqd128" "pcmpgtd128" "pmuludq128" "pslld128" "psrld128" "psrad128" "pslldi128" "psrldi128" "psradi128"))
;;long (dolist (name '("paddq" "psubq" "psllq128" "psrlq128" "psllqi128" "psrlqi128"))
;;word128 (dolist (name '("pand128" "pandn128" "por128" "pxor128"))
;;doubles   (dolist (name '("addpd" "subpd" "mulpd" "divpd" "rcppd" "sqrtpd" "maxpd" "minpd" "andpd" "orpd" "xorpd" "andnpd"))
           (cffi name "_mm128i")) 
   (indent-region beg (point))))
(defun sml-ffi (name) (insert (format "val %s = sml2c %s\n" (upcase name) (downcase name))))
(defun sml-vals()
(let ((beg (point)))
   (insert "\n")
;;double (dolist (name '("addpd" "subpd" "mulpd" "divpd" "rcppd" "sqrtpd" "maxpd" "minpd" "andpd" "orpd" "xorpd" "andnpd"))
;;byte 
(dolist (name '("paddb128"  "pavgb128" "psubb128" "pminub128" "pmaxub128" "psadbw128" "pcmpeqb128" "pcmpgtb128"
;;short (dolist (name '(
"paddw128" "psubw128" "pmullw128" "pmulhw128" "pavgw128" "pmaxw128" "pminw128" "pmulhuw128" "psllw128" "psrlw128" "psraw128" "psllwi128" "psrlwi128" "psrawi128" "pcmpeqw128" "pcmpgtw128"
;;int (dolist (name '(
"paddd128" "psubd128" "pcmpeqd128" "pcmpgtd128" "pmuludq128" "pslld128" "psrld128" "psrad128" "pslldi128" "psrldi128" "psradi128"))
           (sml-ffi name)) 
   (indent-region beg (point))))
(defun sse-call (name) (insert (format "fun %s (a,b) = sse_call(a,b,C_SSE2.%s)\n" (upcase name) (upcase name))))
(defun sml-calls()
(let ((beg (point)))
   (insert "\n")
;;double (dolist (name '("addpd" "subpd" "mulpd" "divpd" "rcppd" "sqrtpd" "maxpd" "minpd" "andpd" "orpd" "xorpd" "andnpd"))
;;byte 
(dolist (name '("paddb128"  "pavgb128" "psubb128" "pminub128" "pmaxub128" "psadbw128" "pcmpeqb128" "pcmpgtb128"
;;short (dolist (name '(
"paddw128" "psubw128" "pmullw128" "pmulhw128" "pavgw128" "pmaxw128" "pminw128" "pmulhuw128" "psllw128" "psrlw128" "psraw128" "psllwi128" "psrlwi128" "psrawi128" "pcmpeqw128" "pcmpgtw128"
;;int (dolist (name '(
"paddd128" "psubd128" "pcmpeqd128" "pcmpgtd128" "pmuludq128" "pslld128" "psrld128" "psrad128" "pslldi128" "psrldi128" "psradi128"))
           (sse-call name)) 
   (indent-region beg (point))))*)
structure SSE_Ctype_vector:SSE_C_TYPES =
struct
  type v2df = Real64.real Vector.vector
  type v4sf = Real32.real Vector.vector
  type v2di = Word64.word Vector.vector
  type v4si = Word32.word Vector.vector
  type v8hi = Word16.word Vector.vector
  type v16qi = Word8.word Vector.vector
  type 'a vec_type = { name:type,pack:(name->'a vector),unpack:('a array->name)}
  type t2df = v2df
  type t4sf = v4sf
end
                          
signature VEC_TYPE_CONVERT =
sig
  type t
  type e
  val pack:t->e vector
  val unpack:e array->t
end
