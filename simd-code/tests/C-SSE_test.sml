val print = TextIO.print
fun printReal x = print (Real32.toString x ^ " ")
local 
  open Sse_Cvector 
in
(*ADDPS*)
val a = Vector.fromList[1.0,2.0,3.0,4.0]
val b = Vector.fromList[4.0,3.0,2.0,1.0]
val d = ADDPS(a,b)
val x = Vector.fromList[3.7,2.4,9.9,100.0]
val y = Vector.fromList[5.5,8.6,7.5,0.01]
val z = ADDPS(x,y)
val _ = (Vector.app printReal (Vector.fromList[5.0,5.0,5.0,5.0])
        ;print "\n"
        ;Vector.app printReal d
        ;print "\n"
        ;Vector.app printReal (Vector.fromList[9.2,11.0,17.4,100.01])
        ;print "\n"
        ;Vector.app printReal z
        ;print "\n")
(*SUBPS*)
val d = SUBPS(a,b)
val z = SUBPS(x,y)
val _ = (Vector.app printReal (Vector.fromList[~3.0,~1.0,1.0,3.0])
        ;print "\n"
        ;Vector.app printReal d
        ;print "\n"
        ;Vector.app printReal (Vector.fromList[~1.79999,~6.19999,2.4,99.99])
        ;print "\n"
        ;Vector.app printReal z
        ;print "\n")
(*MULPS*)
val d = MULPS(a,b)
val z = MULPS(x,y)
val _ = (Vector.app printReal (Vector.fromList[4.0,6.0,6.0,4.0])
        ;print "\n"
        ;Vector.app printReal d
        ;print "\n"
        ;Vector.app printReal (Vector.fromList[20.35,20.639999999999997,74.25,1.0])
        ;print "\n"
        ;Vector.app printReal z
        ;print "\n")
(*DIVPS*)
val d = DIVPS(a,b)
val z = DIVPS(x,y)
val _ = (Vector.app printReal (Vector.fromList[0.25,0.66666666,1.5,4.0])
        ;print "\n"
        ;Vector.app printReal d
        ;print "\n"
        ;Vector.app printReal (Vector.fromList[0.6727272727272727,0.27906976744186046,1.32,10000.0])
        ;print "\n"
        ;Vector.app printReal z
        ;print "\n")
end
(*
val a = Vector.fromList[1.0,2.0,3.0,4.0]
val b = Vector.fromList[4.0,3.0,2.0,1.0]
val x = Vector.fromList[3.7,2.4,9.9,100.0]
val y = Vector.fromList[5.5,8.6,7.5,0.01]
(*(mapcar #'(lambda (x) (/ (first x) (second x))) '((3.7 5.5)(2.4 8.6)(9.9 7.5)(100.0 0.01)))*)*)
