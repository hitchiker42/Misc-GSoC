structure SSE_Software:SSE = 
struct
  open Real32 
  (*all sse functions are on singles so we don't need to wory about name clashes*)
    type v4sf = real*real*real*real
    type t = v4sf
    (*Math fxns*)
    fun ADDPS ((a,b,c,d),(w,x,y,z}) = (op+(a,w),op+(b,x),op+(c,y),op+(d,z))
    fun SUBPS ((a,b,c,d),(w,x,y,z)) = (op-(a,w),op-(b,x),op-(c,y),op-(d,z))
    fun MULPS ((a,b,c,d),(w,x,y,z)) = (op*(a,w),op*(b,x),op*(c,y),op*(d,z))
    fun DIVPS ((a,b,c,d),(w,x,y,z)) = (op/(a,w),op/(b,x),op/(c,y),op/(d,z))
end(*
    fun RCPPS (a,b) = (1.0 /(op/(#1a,#1b)),1.0 /(op/(#2a,#2b)),1.0 /(op/(#3a,#3b)),1.0 /(op/(#4a,#4b)))
    fun SQRTPS (a,b) = (Math.sqrt(#1a,#1b),Math.sqrt(#2a,#2b),Math.sqrt(#3a,#3b),Math.sqrt(#4a,#4b))
    fun MAXPS (a,b) = (max(#1a,#1b),max(#2a,#2b),max(#3a,#3b),max(#4a,#4b))
    fun MINPS (a,b) = (min(#1a,#1b),min(#2a,#2b),min(#3a,#3b),min(#4a,#4b))
   *)
(*    (*Bitwise operations*)
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
*)
