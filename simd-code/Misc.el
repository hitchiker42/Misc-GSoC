;;;a bunch of random bits of elisp code used when writing some sml files
;;;collected here as to clean up said sml files
;;from C-SSE3.sml
(defun cffi (name type) (insert (format "val %s = _import \"%s\":v%s*v%s*a%s->unit;\n" name name type type type)))
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
   (indent-region beg (point))))
;;From C-SSE.sml
(defun cffi (name) (insert (format "val %s = _import \"%s\":v4sf*v4sf*a4sf->unit;\n" name name)))
(defun c-vals ()
(let ((beg (point)))
   (insert "\n")
;;   (dolist (name '("addps" "subps" "mulps" "divps" "rcpps" "sqrtps" "maxps" "minps" "andps" "orps" "xorps" "andnps"))
     (dolist (name '("add_ps" "sub_ps" "mul_ps" "div_ps" "min_ps" "max_ps"
           (cffi name)) 
   (indent-region beg (point))))
(*(defun sml-ffi (name) (insert (format "val %s = sml2c %s\n" (upcase name) (downcase name))))
(defun sml-vals()
(let ((beg (point)))
   (insert "\n")
   (dolist (name '("addps" "subps" "mulps" "divps" "rcpps" "sqrtps" "maxps" "minps" "andps" "orps" "xorps" "andnps"))
           (sml-ffi name)) 
   (indent-region beg (point))))*)
(*(defun sse-call (name) (insert (format "fun %s (a,b) = sse_call(a,b,C_SSE.%s)\n" (upcase name) (upcase name))))
(defun sml-calls()
(let ((beg (point)))
   (insert "\n")
   (dolist (name '("cmpltps" "cmpeqps" "cmpleps" "cmpgtps" "cmpgeps""cmpunordys" "cmpneqps" "cmpnltps" "cmpnleps" "cmpngtps" "cmpngeps" "cmpordps" "shufps"))
           (sse-call name)) 
   (indent-region beg (point))))*)
;;From C-SSE2.sml
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

