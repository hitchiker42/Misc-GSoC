structure SoftwareSSE4.1 =
struct
  open SSE_Types
  local
    open Array
  in
(*a bit verbose, but I think its clearer than using fold or map*)
    fun DPPD (a,b) = Real64.+(Real64.*(sub(a,0),sub(b,0)),
                              Real64.*(sub(a,1),sub(b,1)))
    fun DPPS (a,b) = Real32.+(Real32.+(Real32.*(sub(a,0),sub(b,0)),
                                       Real32.*(sub(a,1),sub(b,1))),
                              Real32.+(Real32.*(sub(a,2),sub(b,2)),
                                       Real32.*(sub(a,3),sub(b,3))))
  end                               
