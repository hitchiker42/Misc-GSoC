functor sse (T:SSE_TYPE) = 
struct
(*example, assuming packing takes place behind the scenes*)
 fun ADDPS (a,b) = let
   val src = T.pack a
   val dst = T.pack b
   val _ = (*primitive operation goes here*)
 in T.unpack dst end
end
