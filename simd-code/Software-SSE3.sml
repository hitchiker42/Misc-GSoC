structure SoftwareSSE3:SSE3 =
struct
  open SSE_TYPES
  local
    val evenp = fn x => op=(op mod(x,2),0)
    open Array
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
    open Array

  in
  fun PHADDD128 (a,b) = fromList(op+(sub(b,1),sub(b,0)),op+(sub(b,3),sub(b,2)),
			      op+(sub(a,1),sub(a,0)),op+(sub(a,3),sub(a,2)))
  fun PHADDW128 (a,b) = fromList(op+(sub(b,1),sub(b,0)),op+(sub(b,3),sub(b,2)),
			      op+(sub(a,1),sub(a,0)),op+(sub(a,3),sub(a,2)))
  end
(*bitwize abs for an int x of n bits |x|=== (x ^ (x >> (n-1))) - (x >> (n-1))*)
    local
      fun abs n = Word32.xorb(n,(Word32.>>(n,31)))-Word32.>>(n,31)
    in
    fun PABSD128 (a) = map abs a 
    local
      fun abs n = Word16.xorb(n,(Word16.>>(n,15)))-Word16.>>(n,15)
    in
    fun PABSW128 (a) = map abs a 
    local
      fun abs n = Word8.xorb(n,(Word8.>>(n,7)))-Word8.>>(n,7)
    in
    fun PABSB128 (a) = map abs a 
    fun sign 0 = 0
      | sign x = if Word32.=(1,(Word32.>>(x,>>))) then ~1 else 1(*maybe 1 else 2*)
end
