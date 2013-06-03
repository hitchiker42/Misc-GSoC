signature LIN_ALG =
sig
  type t
  type matrix = t array*int*int
  val dot:matrix*matrix->t
  val mat_mult:matrix*matrix->matrix
  val scalar_mult:matrix*t->matrix
  val mat_add:matrix*matrix->matrix
end
signature NUMBER =
sig
  val size:int
  val real:bool
end
functor Lin_Alg(N:NUMBER) LIN_ALG = 
struct
type t = if N.real then
           case N.size of
               32 => Real.32
             | 64 => Real.64
             | _ => raise Size
         else
           case N.size of
               8 => Int.8
             | 16 => Int.16
             | 32 => Int.32
             | 64 => Int.64
             | _ => if N.size > 64 then Int.inf
                    else raise Size
type matrix = t array*int*int
fun mat_mult ((A,n,m),(B,m,l)) = 
local 
  val i = ref 0
  val j = ref 0
  val k = ref 0
  val C = 
in 

end
