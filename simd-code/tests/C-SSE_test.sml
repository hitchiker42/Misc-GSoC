val print = TextIO.print
fun printReal x = print (Real32.toString x ^ " ")
local 
  open C_SSE_array
in
val a = Array.fromList[1.000000,2.000000,3.000000,4.000000]
val b = Array.fromList[4.000000,3.000000,2.000000,1.000000]
val x = Array.fromList[3.700000,2.400000,9.900000,100.000000]
val y = Array.fromList[5.500000,8.600000,7.500000,0.010000]
(*ADDPS*)
val z = ADDPS(x,y)
val c = ADDPS(a,b)
val _ = (print ("ADDPS" ^ "\n")
	;Array.app printReal (Array.fromList[5.000000,5.000000,5.000000,5.000000])
	;print "\n"
	;Array.app printReal c
	;print "\n"
	;Array.app printReal (Array.fromList[9.200000,11.000000,17.400000,100.010000])
	;print "\n"
	;Array.app printReal z
	;print "\n")
(*SUBPS*)
val z = SUBPS(x,y)
val c = SUBPS(a,b)
val _ = (print ("SUBPS" ^ "\n")
	;Array.app printReal (Array.fromList[~3.000000,~1.000000,1.000000,3.000000])
	;print "\n"
	;Array.app printReal c
	;print "\n"
	;Array.app printReal (Array.fromList[~1.800000,~6.200000,2.400000,99.990000])
	;print "\n"
	;Array.app printReal z
	;print "\n")
(*MULPS*)
val z = MULPS(x,y)
val c = MULPS(a,b)
val _ = (print ("MULPS" ^ "\n")
	;Array.app printReal (Array.fromList[4.000000,6.000000,6.000000,4.000000])
	;print "\n"
	;Array.app printReal c
	;print "\n"
	;Array.app printReal (Array.fromList[20.350000,20.640000,74.250000,1.000000])
	;print "\n"
	;Array.app printReal z
	;print "\n")
(*DIVPS*)
val z = DIVPS(x,y)
val c = DIVPS(a,b)
val _ = (print ("DIVPS" ^ "\n")
	;Array.app printReal (Array.fromList[0.250000,0.666667,1.500000,4.000000])
	;print "\n"
	;Array.app printReal c
	;print "\n"
	;Array.app printReal (Array.fromList[0.672727,0.279070,1.320000,10000.000000])
	;print "\n"
	;Array.app printReal z
	;print "\n")
(*MAXPS*)
val z = MAXPS(x,y)
val c = MAXPS(a,b)
val _ = (print ("MAXPS" ^ "\n")
	;Array.app printReal (Array.fromList[4.000000,3.000000,3.000000,4.000000])
	;print "\n"
	;Array.app printReal c
	;print "\n"
	;Array.app printReal (Array.fromList[5.500000,8.600000,9.900000,100.000000])
	;print "\n"
	;Array.app printReal z
	;print "\n")
(*MINPS*)
val z = MINPS(x,y)
val c = MINPS(a,b)
val _ = (print ("MINPS" ^ "\n")
	;Array.app printReal (Array.fromList[1.000000,2.000000,2.000000,1.000000])
	;print "\n"
	;Array.app printReal c
	;print "\n"
	;Array.app printReal (Array.fromList[3.700000,2.400000,7.500000,0.010000])
	;print "\n"
	;Array.app printReal z
	;print "\n")
(*CMPLTPS*)
val z = CMPLTPS(x,y)
val c = CMPLTPS(a,b)
val _ = (print ("CMPLTPS" ^ "\n")
	;Array.app printReal (Array.fromList[1.000000,1.000000,0.000000,0.000000])
	;print "\n"
	;Array.app printReal c
	;print "\n"
	;Array.app printReal (Array.fromList[1.000000,1.000000,0.000000,0.000000])
	;print "\n"
	;Array.app printReal z
	;print "\n")
end