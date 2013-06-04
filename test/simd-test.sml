type matrix = real array*int*int
fun rows ((x,y,z):matrix)=y
fun cols ((x,y,z):matrix)=z
fun vals ((x,y,z):matrix)=x
fun ++ a = a:=(!a)+1
fun mat_mult (a:matrix,b:matrix)=let
  val i = ref 0
  val j = ref 0
  val k = ref 0
  val c = (Array.array (rows(a)*cols(b),0.0),rows(a),cols(b))
in (while (!i<rows(a)) do
  (j:=0;while (!j<cols(b)) do 
    (k:=0;while (!k<cols(a)) do
      (Array.update(vals(c),((!i)*rows(a)+(!j)),
                   Array.sub(vals(a),((!i)*cols(a)+(!k)))+
                   Array.sub(vals(b),((!k)*cols(b)+(!j))));
       ++k);
     ++j);
   ++i);c)
end
fun test () = let
  val a = (Array.tabulate(10,fn x=>Real.fromInt(x)),2,5)
  val b = (Array.tabulate(10,fn x=>Real.fromInt(x+10)),5,2)
  val c = mat_mult(a,b)
  val print = TextIO.print
  val fmt = Real.toString
  val get = Array.sub
in print(fmt(get(vals(c),0)) ^ " " ^ fmt(get(vals(c),1)) ^ "\n" ^
         fmt(get(vals(c),2)) ^ " " ^ fmt(get(vals(c),3)) ^ "\n")
end
val get = Array.sub
val set = Array.update
type v4sd = real*real*real*real
fun vd1 (a,_,_,_)=a
fun vd2 (_,a,_,_)=a
fun vd3 (_,_,a,_)=a
fun vd4 (_,_,_,a)=a
fun moveapd (a:real array,i:int)=(get(a,i),get(a,i+1),get(a,i+2),get(a,i+3))
fun mulpd (a:v4sd,b:v4sd)=(vd1(a)*vd1(b),vd2(a)*vd2(b),
                           vd3(a)*vd3(b),vd4(a)*vd4(b))
val _ = test ()
