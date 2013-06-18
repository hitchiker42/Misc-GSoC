structure SSE_Software:SSE =
struct
  local
    open Vector
  inn
  fun vectorFun (a,b,vecOp) = let
    val f = fn x =>vecOp(sub(a,x),sub(b,x))
  in tabulate f 4 end
  fun bitwiseFun (a,b,vecOp) = let
    val f = 
     fn x =>
        Word32.toInt(vecOp(Word32.fromInt(sub(a,x)),Word32.fromInt(sub(b,x))))
  in tabulate f 4 end
  end
  (*all sse functions are on singles so we don't need to wory about name clashes*)
  type v4sf = Real32.real vector
  type t = v4sf
  (*Math fxns*)
  fun ADDPS (a,b)=vectorFun(a,b,op+)
  fun SUBPS (a,b)=vectorFun(a,b,op-)
  fun MULPS (a,b)=vectorFun(a,b,op*)
  fun DIVPS (a,b)=vectorFun(a,b,op/)
  fun ANDPS (a,b)=bitwiseFun(a,b,Word32.andb)
  fun ORPS  (a,b)=bitwiseFun(a,b,Word32.orb)
  fun XORPS (a,b)=bitwiseFun(a,b,Word32.xorb)
end
