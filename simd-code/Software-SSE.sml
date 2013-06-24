structure SSE_Software:SSE =
struct
  local
    open Vector
  in
  fun vectorFun vecOp = 
      fn (a,b) =>
	 let
	   val f = fn x =>vecOp(sub(a,x),sub(b,x))
	 in tabulate f 4 end
  fun vectorFun1 vecOp =
      fn (a,b)
	 let
	   val f = fn x =>vecOp(sub(a,x))
	 in tabulate f 4 end
  fun bitwiseFun vecOp = 
      fn (a,b)
	 let
	   val f = 
	    fn x =>
	       MLton.Real32.castFromWord(
		 vecOp(MLton.Real32.castToWord(sub(a,x)),
		       MLton.Real32.castToWord(sub(b,x))))
	 in tabulate f 4 end
  end
  type v4sf = Real32.real vector
  type t = v4sf
  (*Math fxns*)
  val ADDPS = vectorFun Real32.+
  val SUBPS = vectorFun Real32.-
  val MULPS = vectorFun Real32.*
  val DIVPS = vectorFun Real32./
  val MAXPS = vectorFun Real32.max
  val MINPS = vectorFun Real32.min
  val SQRTPS = vectorFun1 Real32.Math.sqrt
  val RCPPS = vectorFun1 (fn x => 1/x)
  val ANDPS = bitwiseFun Word32.andb
  val ORPS = bitwiseFun Word32.orb
  val XORPS = bitwiseFun Word32.xorb
  val ANDNPS = bitwiseFun (Word32.notb o Word32.andb)
end
