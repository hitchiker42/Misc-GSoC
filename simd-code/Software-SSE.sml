structure SSE_Software:SSE =
struct
  local
    open Vector
  in
  fun vectorFun (a,b,vecOp) = let
    val f = fn x =>vecOp(sub(a,x),sub(b,x))
  in tabulate f 4 end
  fun vectorFun1 (a,vecOp) = let
    val f = fn x =>vecOp(sub(a,x))
  in tabulate f 4 end
  fun bitwiseFun (a,b,vecOp) = let
    val f = 
     fn x =>
        Real32.fromInt(
	  Word32.toInt(vecOp(Word32.fromInt(Real32.round(sub(a,x))),
			   Word32.fromInt(Real32.round(sub(b,x))))))
  in tabulate f 4 end
  end
  type v4sf = Real32.real vector
  type t = v4sf
  (*Math fxns*)
  fun ADDPS (a,b)=vectorFun(a,b,Real32.+)
  fun SUBPS (a,b)=vectorFun(a,b,Real32.-)
  fun MULPS (a,b)=vectorFun(a,b,Real32.*)
  fun DIVPS (a,b)=vectorFun(a,b,Real32./)
  fun MAXPS (a,b)=vectorFun(a,b,Real32.max)
  fun MINPS (a,b)=vectorFun(a,b,Real32.min)
  fun SQRTPS (a) =vectorFun1(a,Real32.Math.sqrt)
  fun RCPPS  (a) =vectorFun1(a,fn x => 1/x)
  fun ANDPS (a,b)=bitwiseFun(a,b,Word32.andb)
  fun ORPS  (a,b)=bitwiseFun(a,b,Word32.orb)
  fun XORPS (a,b)=bitwiseFun(a,b,Word32.xorb)
  fun ANDNPS (a,b)=bitwiseFun(a,b,Word32.notb o Word32.andb)
end
