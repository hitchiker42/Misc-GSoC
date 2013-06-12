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
  type v4sf
  val ADDPS:v4sf*v4sf->v4sf
  val MULPS:v4sf*v4sf->v4sf
  val DIVPS:v4sf*v4sf->v4sf
  val RCPPS:v4sf*v4sf->v4sf  
  val SQRTPS:v4sf*v4sf->v4sf
  val RSQRTPS:v4sf*v4sf->v4sf
  val MAXPS:v4sf*v4sf->v4sf
  val MINPS:v4sf*v4sf->v4sf
  val ANDPS:v4sf*v4sf->v4sf
  val ORPS:v4sf*v4sf->v4sf
  val XORPS:v4sf*v4sf->v4sf
  val CMPEQPS:v4sf*v4sf->v4sf
  val CMPLTPS:v4sf*v4sf->v4sf
  val CMPLEPS:v4sf*v4sf->v4sf
  val CMPGTPS:v4sf*v4sf->v4sf
  val CMPGEPS:v4sf*v4sf->v4sf
  val CMPUNORDPS:v4sf*v4sf->v4sf
  val CMPNEQPS:v4sf*v4sf->v4sf
  val CMPNLTPS:v4sf*v4sf->v4sf
  val CMPNLEPS:v4sf*v4sf->v4sf
  val CMPNGTPS:v4sf*v4sf->v4sf
  val CMPNGEPS:v4sf*v4sf->v4sf
  val CMPORDPS:v4sf*v4sf->v4sf
  val SHUFPS:v4sf*v4sf->v4sf
  val UNPCKHPS:v4sf*v4sf->v4sf
  val UNPCKLPS:v4sf*v4sf->v4sf
(* rest of sse instructions are prefetch, cache control, save/store,etc. Probably good to implement
 * them, but I doubt they would be of much use to the programmer*)
(*(mapcar #'binop (mapcar (apply-partially #'concat "CMP") '("EQPS" "LTPS" "LEPS" "GTPS" "GEPS" UNORDPS" "NEQPS" "NLTPS" "NLEPS" "NGTPS" "NGEPS" "ORDPS")))
(*(defun binop (name)
       (insert (format "  val %s:v4sf*v4sf->v4sf\n" name)))*)*)
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


val _="NOTE on shuffle:
  takes 3 args byte src dest, byte ditctates how to fill the dest
  let src be of the form (a,b,c,d) and dest (w,x,y,z),
  byte is read as 4 seperate sets of 2  bits, for the first two sets of bits,
  00->a
  01->b
  10->c
  11->d
  the first two bits select the first float, the second 2 the second float
  the next two sets of bits work like
  00->w
  01->x
  10->y
  11->z
  again 3rd group 3rd float 4th group 4th float

From the intel manual:

Operation
CASE (SELECT[1:0]) OF
0: DEST[31:0] ← DEST[31:0];
1: DEST[31:0] ← DEST[63:32];
2: DEST[31:0] ← DEST[95:64];
3: DEST[31:0] ← DEST[127:96];
ESAC;
CASE (SELECT[3:2]) OF
0: DEST[63:32] ← DEST[31:0];
1: DEST[63:32] ← DEST[63:32];
2: DEST[63:32] ← DEST[95:64];
3: DEST[63:32] ← DEST[127:96];
ESAC;
CASE (SELECT[5:4]) OF
0: DEST[95:64] ← SRC[31:0];
1: DEST[95:64] ← SRC[63:32];
2: DEST[95:64] ← SRC[95:64];
3: DEST[95:64] ← SRC[127:96];
ESAC;
CASE (SELECT[7:6]) OF
0: DEST[127:96] ← SRC[31:0];   
1: DEST[127:96] ← SRC[63:32]; 
2: DEST[127:96] ← SRC[95:64]; 
3: DEST[127:96] ← SRC[127:96];
ESAC;
SHUFPS (128-bit Legacy SSE version)
DEST[31:0] ← Select4(SRC1[127:0], imm8[1:0]);
DEST[63:32] ← Select4(SRC1[127:0], imm8[3:2]);
DEST[95:64] ← Select4(SRC2[127:0], imm8[5:4]);
DEST[127:96] ← Select4(SRC2[127:0], imm8[7:6]);
DEST[VLMAX-1:128] (Unmodified)
VSHUFPS (VEX.128 encoded version)
DEST[31:0] ← Select4(SRC1[127:0], imm8[1:0]);
DEST[63:32] ← Select4(SRC1[127:0], imm8[3:2]);
DEST[95:64] ← Select4(SRC2[127:0], imm8[5:4]);
DEST[127:96] ← Select4(SRC2[127:0], imm8[7:6]);
DEST[VLMAX-1:128] ← 0

(string ?\u2190) "
signature SSE_C_TYPE = 
sig 
  type v4sf = Real32.real Vector.vector
  type t
  val pack:t->v4sf
  val unpack:MltonPointer->t
  val store:t ref*MltonPointer->()
end

structure SseType_Cvector:SSE_C_TYPE=
struct
  type t = v4sf
  exception unimplemented
  val pack = fn x => x
  (*I'm not sure of the read syntax of vectors, I think its [|1,2,...n|]*)
  local
    open MltonPointer in
      val unpack p = [|getReal32(p,0),getReal32(p,1),getReal32(p,2),getReal32(p,3)|]
      val store (p,v4sfRef) = v4sfRef:=unpack p (*declare inline how?*)
   end
end
structure SseType_Ctuple:SSE_C_TYPE=
struct
  local open Real32 in
    type t = real*real*real*real
    fun pack x = [|#1x,#2x,#3x,#4x|]
  end
  local open MltonPointer in
    val unpack p = (getReal32(p,0),getReal32(p,1),getReal32(p,2),getReal32(p,3))
    val store (p,tRef) = tRef:=unpack p
  end
end
functor Sse_C(T:SSE_C_TYPE):SSE =
  struct
    type v4sf = T.t
        ADDPS 
        MULPS
        DIVPS
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
