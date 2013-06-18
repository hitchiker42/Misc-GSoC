(*software implementation*)
signature SIMD_TYPE =
sig
  val len:int
  type element
end
functor Simd_Float(T:SIMD_TYPE):SIMD_FLOAT=
struct
  type v = T.element vector
  local
    open Vector
  in
    fun vectorFun (a,b,vecOp,n) = let
      val f = fn x =>vecOp(sub(a,x),sub(b,x))
    in tabulate f n end
  end
  (*ex*)
  fun VADD (a,b) = vectorFun (a,b,op+,T.len)
  fun VSUB (a,b) = vectorFun (a,b,op-,T.len)
end

functor Simd_Int(T:SIMD_TYPE):SIMD_INT=
struct
  type v = T.element vector
  local
    open Vector
  in
    fun vectorFun (a,b,vecOp,n) = let
      val f = fn x =>vecOp(sub(a,x),sub(b,x))
    in tabulate f n end
  fun bitwiseFun (a,b,vecOp,n) = let
      val f = fn x =>
                 Word.toInt(vecOp(Word.fromInt(sub(a,x)),Word.fromInt(sub(b,x))))
    in tabulate f n end
 
  fun vectorCmp (a,b,vecOp,n) = let
    val f = fn x => case Int.compare(sub(a,x),sub(b,x)) of
(*Int.compare returns one of the following, shoud be able to use this to
 *implemet comparison stuff*)
                        EQUAL => _
                        LESS => _
                        GREATER => _ 
        
  in tabluate f n end
  end
