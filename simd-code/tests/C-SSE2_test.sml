val print = TextIO.print
fun printReal x = print (Real64.toString x ^ " ")
local 
  open C_SSE2
in
val a = Array.fromList[1.000000,2.000000,3.000000,4.000000]
val b = Array.fromList[4.000000,3.000000,2.000000,1.000000]
val x = Array.fromList[3.700000,2.400000,9.900000,100.000000]
val y = Array.fromList[5.500000,8.600000,7.500000,0.010000]
(*ADDPD*)
val z = ADDPD(x,y)
val c = ADDPD(a,b)
val _ = (print ("ADDPD" ^ "\n")
	;Array.app printReal (Array.fromList[5.000000,5.000000,5.000000,5.000000])
	;print "\n"
	;Array.app printReal c
	;print "\n"
	;Array.app printReal (Array.fromList[9.200000,11.000000,17.400000,100.010000])
	;print "\n"
	;Array.app printReal z
	;print "\n")
(*SUBPD*)
val z = SUBPD(x,y)
val c = SUBPD(a,b)
val _ = (print ("SUBPD" ^ "\n")
	;Array.app printReal (Array.fromList[~3.000000,~1.000000,1.000000,3.000000])
	;print "\n"
	;Array.app printReal c
	;print "\n"
	;Array.app printReal (Array.fromList[~1.800000,~6.200000,2.400000,99.990000])
	;print "\n"
	;Array.app printReal z
	;print "\n")
(*MULPD*)
val z = MULPD(x,y)
val c = MULPD(a,b)
val _ = (print ("MULPD" ^ "\n")
	;Array.app printReal (Array.fromList[4.000000,6.000000,6.000000,4.000000])
	;print "\n"
	;Array.app printReal c
	;print "\n"
	;Array.app printReal (Array.fromList[20.350000,20.640000,74.250000,1.000000])
	;print "\n"
	;Array.app printReal z
	;print "\n")
(*DIVPD*)
val z = DIVPD(x,y)
val c = DIVPD(a,b)
val _ = (print ("DIVPD" ^ "\n")
	;Array.app printReal (Array.fromList[0.250000,0.666667,1.500000,4.000000])
	;print "\n"
	;Array.app printReal c
	;print "\n"
	;Array.app printReal (Array.fromList[0.672727,0.279070,1.320000,10000.000000])
	;print "\n"
	;Array.app printReal z
	;print "\n")
(*MAXPD*)
val z = MAXPD(x,y)
val c = MAXPD(a,b)
val _ = (print ("MAXPD" ^ "\n")
	;Array.app printReal (Array.fromList[4.000000,3.000000,3.000000,4.000000])
	;print "\n"
	;Array.app printReal c
	;print "\n"
	;Array.app printReal (Array.fromList[5.500000,8.600000,9.900000,100.000000])
	;print "\n"
	;Array.app printReal z
	;print "\n")
(*MINPD*)
val z = MINPD(x,y)
val c = MINPD(a,b)
val _ = (print ("MINPD" ^ "\n")
	;Array.app printReal (Array.fromList[1.000000,2.000000,2.000000,1.000000])
	;print "\n"
	;Array.app printReal c
	;print "\n"
	;Array.app printReal (Array.fromList[3.700000,2.400000,7.500000,0.010000])
	;print "\n"
	;Array.app printReal z
	;print "\n")
end