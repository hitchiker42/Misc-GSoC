(*Assuming all integer instructions take int args, not word args*)
structure Software_SSE2:SSE2 = 
struct
  local 
    open Vector
  in
(* val vecBinOp:('a*'a->'a)->('a vector*'a vector ->'a vector)*)
    fun vecBinOp f n = (*generate a binary vector function*)
	fn (a,b) =>
	   let val g = fn x => f(sub(a,x),sub(b,x))
	   in tabulate g n end
    fun vecUnaryOp f n = 
	fn (a,b) =>
	   let val g = fn x => f(sub(a,x))
	   in tabulate g n end
    fun vecBitOp f to from n=
	fn (a,x) =>
	 let
	   val g = fn x => from(f(to(sub(a,x)),from(sub(b,x))))
	 in tabulate g n end
  end
  val ADDPD = vecBinOp Real64.+ 2
  val SUBPD = vecBinOp Real64.- 2
  val MULPD = vecBinOp Real64.* 2
  val DIVPD = vecBinOp Real64./ 2
  val MAXPD = vecBinOp Real64.max 2
  val MINPD = vecBinOp Real64.min 2
  val SQRTPD = vecUnaryOp Real64.math.sqrt 2
  val RCPPD = vecUnaryOp (fn x => 1/x) 2
  fun df2w x = MLton.Real64.castToWord 
  fun w2df x = MLton.Real64.castFromWord
  val ANDPD = vecBitOp Word64.andb df2w w2df 2
  val ORPD = vecBitOp Word64.orb df2w w2df 2
  val XORPD = vecBitOp Word64.xorb df2w w2df 2
  val ANDNPD = vecBitOp (Word64.notb o Word64.andb) 2
  val PADDB128 = vecBinOp Word8.+ 16
  val PADDW128 = vecBinOp Word16.+ 8
  val PADDD128 = vecBinOp Word32.+ 4
  val PADDQ128 = vecBinOp Word64.+ 2
  val PSUBB128 = vecBinOp Word8.- 16
  val PSUBW128 = vecBinOp Word16.- 8
  val PSUBD128 = vecBinOp Word32.- 4
  val PSUBQ128 = vecBinOp Word64.- 2
(*next 3 fxns take a vector of words and return a vector of doublewords
 *Need to figure out how to expand words(i.e. word8->word16*)
  fun PMULLW128 (a,b) = let
    local
      open Word32
    in val f = 
	fn x => 
	   toInt16(andb(0wxFFFFFFFF,( *(fromInt(sub(a,x)),fromInt(sub(b,x))))))
    end
  in Vector.tabulate f 8 end
  fun PMULLW128 (a,b) = let
    local
      open Word32
    in val f = 
	fn x => 
	   toInt16(>>(16,( *(fromInt(sub(a,x)),fromInt(sub(b,x))))))
    end
  in Vector.tabulate f 8 end
  fun PMADDWD128 (a,b) = let
    local
      open Word32
    in val f =
	fn x =>
	   +( *(toWord32sub(a,(2*x-1)),sub(b,(2*x-1))),
	      *(sub(a,(2*x)),sub(b,(2*x))))
    end
  in Vector.tabulate f 4 end
  val PAVGB128 = vecBinOp (fn (x,y) => ((x+y)/2)) 16
  val PAVGW128 = vecBinOp (fn (x,y) => ((x+y)/2)) 8
(* << logical left
   >> logical right
  ~>> arithmatic right*) 
  val PSLLW128 = vecBinOp Word16.<< 8
  val PSLLD128 = vecBinOp Word32.<< 4
  val PSLLQ128 = vecBinOp Word64.<< 2
  val PSRLW128 = vecBinOp Word16.>> 8
  val PSRLD128 = vecBinOp Word32.>> 4
  val PSRLQ128 = vecBinOp Word64.>> 2
  val PSRAW128 = vecBinOp Word16.~>> 8
  val PSRAD128 = vecBinOp Word32.~>> 4
(*unsignex min/max on bytes*)
  val PMAXUB128 = vecBinOp Word8.max 16
  val PMINUB128 = vecBinOp Word8.min 16
(*signed min/max on words, need to fiddle with a bit*)
  val PMAXSW128 = vecBinOp Word16.max 8
  val PMINSW128 = vecBinOp Word16.min 8
end
