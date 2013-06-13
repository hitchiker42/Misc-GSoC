structure Misc_Util = 
struct
fun Word64toInt (from:Word64.word) = 
    Word64.toInt(Word64.>>((Word64.andb (from,0wx3FFFFFFf00000000)),0w32))
(* standard mix max fxns *)
val min = fn (i,j)=>if (i<j) then i else j
val max = fn (i,j)=>if (i>j) then i else j
(* simplify testing for an item in a list*)
fun contains l x = let
    val check = fn n => n=x
in List.exists check l end
(* simplify testing for an item in an array*)
fun ArrContains l x = let
    val check = fn n => n=x
in Array.exists check l end
(*return all but the last element of list (not a very efficent thing to do)*)
fun most [] = raise List.Empty
  | most (x::[]) = []
  | most (x::y::[]) = x::[]
  | most (x::z) = x::(most z)
(*return list 1::2::3...::n::[]*)
fun seq m n = let
    val stop = (m-1)
    fun build n l = if n=stop then l else build (n-1) (n::l)
in build n [] end
(* remove and return first element from a list reference*)
fun pop (l:'a list ref) = let
  val x = (!l)
in (l:=tl x;hd x) end
(* push element onto head of list ref*)
fun push (l:'a list ref) (x:'a) = (l:=(x::(!l));l)
(*strip whitespace from string*)
fun strip str =let
    val chars = explode str
    val f = (not o Char.isSpace)
in List.filter f chars end
(* useful for lazy evaluation *)
fun id x = x
fun gen_id x = fn () => x
fun to_unit (f,x) = fn ()=> f(x)
(* standard quicksort *)
fun quickSort filt (x::xs) = let
    val f = List.filter
    fun qs [] = []
      | qs (x::[]) = (x::[])
      | qs (x::xs) = let
          val pred = fn y => filt (y,x)
      in qs (f pred xs)@x::(qs (List.filter (not o pred) xs)) end
in qs (x::xs) end
end
