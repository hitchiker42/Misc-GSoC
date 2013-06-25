structure SoftwareSSE3:SSE3 =
struct
  open SSE_TYPES
  local
    val evenp = fn x => op=(op mod(x,2),0)
    open Vector
  in
  fun ADDSUBPD (a,b) = let
    val f = fn x => if evenp x then op-(sub(a,x),sub(b,x))
		    else op+(sub(a,x),sub(b,x))
  in tabulate f 2 end
  fun ADDSUBPS (a,b) = let
    val f = fn x => if evenp x then op-(sub(a,x),sub(b,x))
		    else op+(sub(a,x),sub(b,x))
  in tabulate f 4 end
  fun HADDPS (a,b) = fromList(op+(sub(b,1),sub(b,0)),op+(sub(b,3),sub(b,2)),
			      op+(sub(a,1),sub(a,0)),op+(sub(a,3),sub(a,2)))
  fun HADDPD (a,b) = fromList(op+(sub(b,1),sub(b,0)),op+(sub(b,3),sub(b,2)),
			      op+(sub(a,1),sub(a,0)),op+(sub(a,3),sub(a,2)))
  fun HSUBPS (a,b) = fromList(op-(sub(b,1),sub(b,0)),op-(sub(b,3),sub(b,2)),
			      op-(sub(a,1),sub(a,0)),op-(sub(a,3),sub(a,2)))
  fun HSUBPD (a,b) = fromList(op-(sub(b,1),sub(b,0)),op-(sub(b,3),sub(b,2)),
			      op-(sub(a,1),sub(a,0)),op-(sub(a,3),sub(a,2)))
  end
end
structure SoftwareSSSE3:SSSE3 =
struct
  local
    open Vector

  in
  fun PHADDD128 (a,b) = fromList(op+(sub(b,1),sub(b,0)),op+(sub(b,3),sub(b,2)),
			      op+(sub(a,1),sub(a,0)),op+(sub(a,3),sub(a,2)))
  fun PHADDW128 (a,b) = fromList(op+(sub(b,1),sub(b,0)),op+(sub(b,3),sub(b,2)),
			      op+(sub(a,1),sub(a,0)),op+(sub(a,3),sub(a,2)))
  end
end
