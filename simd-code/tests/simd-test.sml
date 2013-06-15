type matrix64 = Real64.real array*int*int
type matrix32 = Real32.real array*int*int
fun rows ((x,y,z):matrix32)=y
fun cols ((x,y,z):matrix32)=z
fun vals ((x,y,z):matrix32)=x
fun ++ a = a:=(!a)+1
fun mat_mult (a:matrix32,b:matrix32) = let
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
fun mat_dot_v4sf ((a,ra,ca):matrix32,(b,rb,cb):matrix32,max:int) = let
  fun pack_tuple (a,b,c,d)= Vector.fromList[a,b,c,d]
  local
    open ArraySlice
  in
  fun pack_array (a,i) = vector(slice(a,i,SOME(4)))
  end
  val i = ref 0
  val (ans:Real32.real ref) = ref 0.0
  open SSE_Cvector
in (while ((!i)<max) do
        (let
           val x = pack_array(a,(!i))
           val y = pack_tuple(Array.sub(b,((!i)*rb)),Array.sub(b,(((!i)+1)*rb)),
                              Array.sub(b,(((!i)+2)*rb)),Array.sub(b,((!i)+3)*rb))
           val z = ADDPS(x,y)
         in
         ans:=(!ans)+Vector.sub(z,0)+Vector.sub(z,1)+Vector.sub(z,2)+Vector.sub(z,3);
         i:=(!i)+1
         end)
   ;ans)
end
      
