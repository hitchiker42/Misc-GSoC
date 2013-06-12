(*signature MMX_TYPES = sig
end*)
signature SSE_TYPE = sig
  type v4sfInternal (*internal representation of sse type, likely a 128 bit word*)
  type v4sf (*packed type exposed to programmer, i.e a 4-tuple or a vector of size 4*)
         (*ex. type v4sf = Real32.real*Real32.real*Real32.real*Real32.real
          *or type v4sf = Real32.real vector (* can I specify the size here?*)*)
         (*maybe have scalar type, leave open for now, though most of the scalar opperations, 
          *at least for floats and doubles are already implemented*)
  val pack:v4sf->sseInternal
  val loadaps:v4sf->sseInternal
  val unpack:sseInternal->v4sf
  val storeaps:sseInternal*ref v4sf->()
end
signature SSE2_TYPES = 
sig
  include SSE_TYPES
  (*Internal primitive types*)
  type v2dfInternal
  type v16qiInternal
  type v8hiInternal
  type v4siInternal
  type v2diInternal
  (* representations*)
  type v2df
  type v16qi
  type v8hi
  type v4si
  type v2di
  (*pack & unpack instructions go here*)
end
signature SSE3_TYPES=SSE2_TYPES
signature SSSE3_TYPES=SSE3_TYPES
signature SSE4.1_TYPES=SSSE3_TYPES
signature SSE4.2_TYPES=SSE4.1_TYPES

signature SSE = sig
  val ADDPS:T.v4sf*T.v4sf->T.v4sf
  val MULPS:T.v4sf*T.v4sf->T.v4sf
  val DIVPS:T.v4sf*T.v4sf->T.v4sf
  val RCPPS:T.v4sf*T.v4sf->T.v4sf  
  val SQRTPS:T.v4sf*T.v4sf->T.v4sf
  val RSQRTPS:T.v4sf*T.v4sf->T.v4sf
  val MAXPS:T.v4sf*T.v4sf->T.v4sf
  val MINPS:T.v4sf*T.v4sf->T.v4sf
  val ANDPS:T.v4sf*T.v4sf->T.v4sf
  val ORPS:T.v4sf*T.v4sf->T.v4sf
  val XORPS:T.v4sf*T.v4sf->T.v4sf
  val CMPEQPS:T.v4sf*T.v4sf->T.v4sf
  val CMPLTPS:T.v4sf*T.v4sf->T.v4sf
  val CMPLEPS:T.v4sf*T.v4sf->T.v4sf
  val CMPGTPS:T.v4sf*T.v4sf->T.v4sf
  val CMPGEPS:T.v4sf*T.v4sf->T.v4sf
  val CMPUNORDPS:T.v4sf*T.v4sf->T.v4sf
  val CMPNEQPS:T.v4sf*T.v4sf->T.v4sf
  val CMPNLTPS:T.v4sf*T.v4sf->T.v4sf
  val CMPNLEPS:T.v4sf*T.v4sf->T.v4sf
  val CMPNGTPS:T.v4sf*T.v4sf->T.v4sf
  val CMPNGEPS:T.v4sf*T.v4sf->T.v4sf
  val CMPORDPS:T.v4sf*T.v4sf->T.v4sf
  val SHUFPS:T.v4sf*T.v4sf->T.v4sf
  val UNPCKHPS:T.v4sf*T.v4sf->T.v4sf
  val UNPCKLPS:T.v4sf*T.v4sf->T.v4sf
(* rest of sse instructions are prefetch, cache control, save/store,etc. Probably good to implement
 * them, but I doubt they would be of much use to the programmer*)
(*(mapcar #'binop (mapcar (apply-partially #'concat "CMP") '("EQPS" "LTPS" "LEPS" "GTPS" "GEPS" UNORDPS" "NEQPS" "NLTPS" "NLEPS" "NGTPS" "NGEPS" "ORDPS")))
(*(defun binop (name)
       (insert (format "  val %s:T.v4sf*T.v4sf->T.v4sf\n" name)))*)*)
signature SSE2 = sig
end

signature SSE3 = sig
end
signature SSSE3 = sig
end

signature SSE4.1 = sig
end 



(*signature AVX = sig
end*)
functor sse (T:SSE_TYPE) = 
struct
(*example, assuming packing takes place behind the scenes*)
 fun ADDPS (a,b) = let
   val src = T.pack a
   val dst = T.pack b
   val _ = (*primitive operation goes here*)
 in T.unpack dst end

end

functor sse2 (T:SSE2_TYPE): SSE2 = 
struct
end

functor sse3 (T:SSE3_TYPE): SSE3 = 
struct
end

functor ssse3 (T:SSSE3_TYPE): SSSE3 = 
struct
end

functor sse4.1 (T:SSE4.1_TYPE): SSE4.1 = 
  struct
  end

functor sse4.2 (T:SSE4.2_TYPE): SSE4.2 = 
  struct
  end
structure SSE_Software:SSE = 
struct
  open Real32 
  (*all sse functions are on singles so we don't need to wory about name clashes*)
    type t = real*real*real*real
    fun v1 (a,_,_,_) = a
    fun v2 (_,a,_,_) = a
    fun v3 (_,_,a,_) = a
    fun v4 (_,_,_,a) = a
    (*Math fxns*)
    fun ADDPS (a,b) = (op+(#1a,#1b),op+(#2a,#2b),op+(#3a,#3b),op+(#4a,#4b))
    fun MULPS (a,b) = (op*(#1a,#1b),op*(#2a,#2b),op*(#3a,#3b),op*(#4a,#4b))
    fun DIVPS (a,b) = (op/(#1a,#1b),op/(#2a,#2b),op/(#3a,#3b),op/(#4a,#4b))
    fun RCPPS (a,b) = (1 /(op/(#1a,#1b)),1 /(op/(#2a,#2b)),1 /(op/(#3a,#3b)),1 /(op/(#4a,#4b)))
    fun SQRTPS (a,b) = (sqrt(#1a,#1b),sqrt(#2a,#2b),sqrt(#3a,#3b),sqrt(#4a,#4b))
    fun MAXPS (a,b) = (max(#1a,#1b),max(#2a,#2b),max(#3a,#3b),max(#4a,#4b))
    fun MINPS (a,b) = (min(#1a,#1b),min(#2a,#2b),min(#3a,#3b),min(#4a,#4b))
    (*Bitwise operations*)
    local
      open Word32
    in
    fun ANDPS (a,b) = let 
      val wa = (castToWord #1a,castToWord #2a,castToWord #3a,castToWord #4a)
      val wb = (castToWord #1b,castToWord #2b,castToWord #3b,castToWord #4b)
    in (castFromWord(andb (#1wa,#1wb)),castFromWord(andb (#2wa,#2wb)),castFromWord(andb (#3wa,#3wb)),castFromWord(andb (#4wa,#4wb))) end
    fun ORPS (a,b) = let 
      val wa = (castToWord #1a,castToWord #2a,castToWord #3a,castToWord #4a)
      val wb = (castToWord #1b,castToWord #2b,castToWord #3b,castToWord #4b)
    in (castFromWord(orb (#1wa,#1wb))castFromWord(orb (#2wa,#2wb))castFromWord(orb (#3wa,#3wb))castFromWord(orb (#4wa,#4wb))) end
    fun XORPS (a,b) = let 
      val wa = (castToWord #1a,castToWord #2a,castToWord #3a,castToWord #4a)
      val wb = (castToWord #1b,castToWord #2b,castToWord #3b,castToWord #4b)
    in (castFromWord(xorb (#1wa,#1wb)),castFromWord(xorb (#2wa,#2wb)),castFromWord(xorb (#3wa,#3wb)),castFromWord(xorb (#4wa,#4wb))) end
    end
    (*Comparison Functions*)
    (*might need to do someting with the types of the compare functions*)
    fun CMPEQPS (a,b) = (op=(#1a,#1b),op=(#2a,#2b),op=(#3a,#3b),op=(#4a,#4b))
    fun CMPLTPS (a,b) = (op<(#1a,#1b),op<(#2a,#2b),op<(#3a,#3b),op<(#4a,#4b))
    fun CMPLEPS (a,b) = (op<=(#1a,#1b),op<=(#2a,#2b),op<=(#3a,#3b),op<=(#4a,#4b))
    fun CMPGTPS (a,b) = (op>(#1a,#1b),op>(#2a,#2b),op>(#3a,#3b),op>(#4a,#4b))
    fun CMPGEPS (a,b) = (op>=(#1a,#1b),op>=(#2a,#2b),op>=(#3a,#3b),op>=(#4a,#4b))
    fun CMPUNORDPS (a,b) = (not_ordered(#1a,#1b),not_ordered(#2a,#2b),not_ordered(#3a,#3b),not_ordered(#4a,#4b))
    fun CMPNEQPS (a,b) = (!=(#1a,#1b),!=(#2a,#2b),!=(#3a,#3b),!=(#4a,#4b))
    fun CMPNLTPS (a,b) = (op>=(#1a,#1b),op>=(#2a,#2b),op>=(#3a,#3b),op>=(#4a,#4b))
    fun CMPNLEPS (a,b) = (op>(#1a,#1b),op>(#2a,#2b),op>(#3a,#3b),op>(#4a,#4b))
    fun CMPNGTPS (a,b) = (op<=(#1a,#1b),op<=(#2a,#2b),op<=(#3a,#3b),op<=(#4a,#4b))
    fun CMPNGEPS (a,b) = (op<(#1a,#1b),op<(#2a,#2b),op<(#3a,#3b),op<(#4a,#4b))
    fun CMPORDPS (a,b) = (ordered(#1a,#1b),ordered(#2a,#2b),ordered(#3a,#3b),ordered(#4a,#4b))
    (*shuffle and unpack,not sure how to do shuffle*)
    fun UNPCKHPS (a,b) = (#1a,#1b,#2a,#2b)
    fun UNPPKLPS (a,b) = (#3a,#3b,#4a,#4b)
end
(*Giant mass of elisp macros*)
(* (defun software-binop (name fun)
     (insert (format "    fun %s (a,b) = (%s(#1a,#1b),%s(#2a,#2b),%s(#3a,#3b),%s(#4a,#4b))\n" name fun fun fun fun)))
(defun software-math () (mapcar #'(lambda (x) (software-binop (first x) (second x)))
'(("ADDPS" "op+") ("MULPS" "op*") ("DIVPS" "op/") ("RCPPS" "1 / op/") ("SQRTPS" "sqrt") ("MAXPS" "max") ("MINPS" "min"))))
(defu
(defun software-cmp() (let* ((x (-interleave (mapcar (apply-partially #'concat "CMP")
                               '("EQPS" "LTPS" "LEPS" "GTPS" "GEPS" "UNORDPS" "NEQPS" "NLTPS" "NLEPS" "NGTPS" "NGEPS" "ORDPS"))
                       '("op=" "op<" "op<=" "op>" "op>=" "not_ordered"  "!=" "op>=" "op>" "op<=" "op<" "ordered")))
       (y (-partition 2 x)))
  (mapcar #'(lambda (x) (software-binop (first x) (second x))) y)))*)
     (*(defun bit-cast (name fun) (insert (format "fun %s (a,b) = let \n\tval wa = %s\n\tval wb = %s
in %s end\n"
 name (format "(%s#1a,%s#2a,%s#3a,%s#4a)" "castToWord " "castToWord " "castToWord " "castToWord ")
       (format "(%s#1b,%s#2b,%s#3b,%s#4b)" "castToWord " "castToWord " "castToWord " "castToWord ")
(format "(%s(%s(#1wa,#1wb)),%s(%s(#2wa,#2wb)),%s(%s(#3wa,#3wb)),%s(%s(#4wa,#4wb)))" fun "castFromWord "
fun "castFromWord " fun "castFromWord " fun "castFromWord "))))*)
