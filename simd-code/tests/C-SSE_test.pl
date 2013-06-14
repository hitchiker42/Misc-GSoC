use 5.16.0;
open(my $file,">","temp.sml") || die "can't open > temp.sml:$!";

my $nl="print /n";
my $vp="Vector.app printReal (Vector.fromList[";
my $pv="])\n";
my @simple=(1.0,2.0,3.0,4.0);
my $simple=join(",",@simple);
my @elpmis=(4.0,3.0,2.0,1.0);
my $elpmis=join(",",@elpmis);
my @rand=(3.7,2.4,9.9,100.0);
my $rand=join(",",@rand);
my @dnar=(5.5,8.6,7.5,0.01);
my $dnar=join(",",@dnar);
print $file <<END;
val print = TextIO.print
fun printReal x = print (Real32.toString x ^ " ")
local
  open Sse_Cvector 
in
(*ADDPS*)
val a = Vector.fromList[$simple]
val b = Vector.fromList[$elpmis]
val d = ADDPS(a,b)
val x = Vector.fromList[$rand]
val y = Vector.fromList[$dnar]
val z = ADDPS(x,y)
val _ = (${vp}5.0,5.0,5.0,5.0${pv}
        ;$nl
        ;Vector.app printReal d
        ;$nl
        ;${vp}9.2,11.0,17.4,100.01${pv}
        ;$nl
        ;Vector.app printReal z
        ;$nl
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
