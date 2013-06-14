val print = TextIO.print
fun printReal x = print (Real32.toString x ^ " ")
local 
  open SSE_Software_vec 
in
val a = Vector.fromList[1.000000,2.000000.3.000000,4.000000]
val b = Vector.fromList[4.000000,3.000000.2.000000,1.000000]
val x = Vector.fromList[3.700000,2.400000.9.900000,100.000000]
val y = Vector.fromList[5.500000,8.600000.7.500000,0.010000]
(*ADDPS*)
val z = ADDPS(x,y)
val c = ADDPS(a,b)
val _ = (Vector.app printReal (Vector.fromList[5.000000,5.000000,5.000000,5.000000])
	;print "\n"
	(Vector.app printReal d
	;print "\n"
	(Vector.app printReal (Vector.fromList[9.200000,11.000000,17.400000,100.010000])
	;print "\n"
	(Vector.app printReal z
	;print "\n"
(*SUBPS*)
val z = SUBPS(x,y)
val c = SUBPS(a,b)
val _ = (Vector.app printReal (Vector.fromList[-3.000000,-1.000000,1.000000,3.000000])
	;print "\n"
	(Vector.app printReal d
	;print "\n"
	(Vector.app printReal (Vector.fromList[-1.800000,-6.200000,2.400000,99.990000])
	;print "\n"
	(Vector.app printReal z
	;print "\n"
(*MULPS*)
val z = MULPS(x,y)
val c = MULPS(a,b)
val _ = (Vector.app printReal (Vector.fromList[4.000000,6.000000,6.000000,4.000000])
	;print "\n"
	(Vector.app printReal d
	;print "\n"
	(Vector.app printReal (Vector.fromList[20.350000,20.640000,74.250000,1.000000])
	;print "\n"
	(Vector.app printReal z
	;print "\n"
(*DIVPS*)
val z = DIVPS(x,y)
val c = DIVPS(a,b)
val _ = (Vector.app printReal (Vector.fromList[0.250000,0.666667,1.500000,4.000000])
	;print "\n"
	(Vector.app printReal d
	;print "\n"
	(Vector.app printReal (Vector.fromList[0.672727,0.279070,1.320000,10000.000000])
	;print "\n"
	(Vector.app printReal z
	;print "\n"
end