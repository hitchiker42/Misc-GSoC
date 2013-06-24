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
  val PADDB128 = vecBinOp Int8.+ 16
  val PADDW128 = vecBinOp Int16.+ 8
  val PADDD128 = vecBinOp Int32.+ 4
  val PADDQ128 = vecBinOp Int64.+ 2
  val PSUBB128 = vecBinOp Int8.- 16
  val PSUBW128 = vecBinOp Int16.- 8
  val PSUBD128 = vecBinOp Int32.- 4
  val PSUBQ128 = vecBinOp Int64.- 2
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
	   toInt32( +( *(fromInt(sub(a,(2*x-1))),fromInt(sub(b,(2*x-1)))),
		       *(fromInt(sub(a,(2*x))),fromInt(sub(b,(2*x))))))
    end
  in Vector.tabulate f 4 end
  val PAVGB128 = vecBinOp (fn (x,y) => ((x+y)/2)) 16
  val PAVGW128 = vecBinOp (fn (x,y) => ((x+y)/2)) 8
(* << logical left
   >> logical right
  ~>> arithmatic right*) 
  val PSLLW128 = vecBinOp (fn (x,y) => 
			      Word16.toInt16(Word16.<<(y,Word16.fromInt x))) 8
  val PSLLD128 = vecBinOp (fn (x,y) => 
			      Word32.toInt32(Word32.<<(y,Word32.fromInt x))) 4
  val PSLLQ128 = vecBinOp (fn (x,y) => 
			      Word64.toInt64(Word64.<<(y,Word64.fromInt x))) 2
  val PSRLW128 = vecBinOp (fn (x,y) => 
			      Word16.toInt16(Word16.>>(y,Word16.fromInt x))) 8
  val PSRLD128 = vecBinOp (fn (x,y) => 
			      Word32.toInt32(Word32.>>(y,Word32.fromInt x))) 4
  val PSRLQ128 = vecBinOp (fn (x,y) => 
			      Word64.toInt64(Word64.>>(y,Word64.fromInt x))) 2
  val PSRAW128 = vecBinOp (fn (x,y) => 
			      Word16.toInt16(Word16.~>>(y,Word16.fromInt x))) 8
  val PSRAD128 = vecBinOp (fn (x,y) => 
			      Word32.toInt32(Word32.~>>(y,Word32.fromInt x))) 4
  val PMAXUB128 = vecBinOp (fn (x,y) =>
			       Word8.toInt(Word8.max(Word8.fromInt(x),
						     Word8.fromInt(y)))) 16
  val PMINUB128 = vecBinOp (fn (x,y) =>
			       Word8.toInt(Word8.min(Word8.fromInt(x),
						     Word8.fromInt(y)))) 16
  val PMAXSW128 = vecBinOp Int16.max 8
  val PMINSW128 = vecBinOp Int16.min 8
end
