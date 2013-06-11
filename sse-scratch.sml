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
  (*External representations*)
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

signature SSE4.2 = sig
end

(*signature AVX = sig
end*)
functor SSE (T:SSE_TYPE) = 
struct
(*example, assuming packing takes place behind the scenes*)
 fun ADDPS (a,b) = let
   val src = T.pack a
   val dst = T.pack b
   val _ = (*primitive operation goes here*)
 in T.unpack dst end
end

functor SSE2 (T:SSE2_TYPE) = 
struct
end

functor SSE3 (T:SSE3_TYPE) = 
struct
end

functor SSSE3 (T:SSSE3_TYPE) = 
struct
end

functor SSE4.1 (T:SSE4.1_TYPE) = 
struct
end

functor SSE4.2 (T:SSE4.2_TYPE) = 
struct
end
