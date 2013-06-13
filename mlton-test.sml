val _ = TextIO.print "hello, world\n"
fun fact 0 = 1
  | fact n = n * fact(n-1)
fun factorial x = let
    fun acc 0 n = n
      | acc y n = acc (y*n) (n-1)
in acc 1 x end
signature POLYARITH = sig
  type t
  val add:t*t->t
  val mult:t*t->t
  val div:t*t->t
  val sub:t*t->t
end
(*signature NUMBER = sig
  val size:int
  val real:bool
end
functor PolyArith (N:NUMBER) =
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
fun add (a,b) = op + (a,b)
fun sub (a,b) = op - (a,b)
fun mult (a,b) = op * (a,b)
fun div (a,b) if N.real then op div (a,b)
              else op / (a,b)
end*)
functor PolyMath (M : POLYARITH) = 
        struct
        fun fma (a,b,c) = M.mult(M.add(a,b),c)
        fun fma2 (a,b,c) = M.mult(a,M.add(b,c))
        end

structure Polydouble:POLYARITH =
struct
type t = Real64.real
fun add (a,b) = op Real64.+ (a,b)
fun mult (a,b) = op Real64.* (a,b)
fun div (a,b) = op Real64./ (a,b)
fun sub (a,b) = op Real64.- (a,b)
end

structure Doublemath = PolyMath (Polydouble)

structure Polyint:POLYARITH = 
struct
type t = Int32.int
fun add (a,b) = op Int32.+ (a,b)
fun mult (a,b) = op Int32.* (a,b)
fun div (a,b) = op Int32.div (a,b)
fun sub (a,b) = op Int32.- (a,b)
end

local
structure Polylong:POLYARITH = 
struct
type t = Int64.int
fun add (a,b) = op Int64.+ (a,b)
fun mult (a,b) = op Int64.* (a,b)
fun div (a,b) = op Int64.div (a,b)
fun sub (a,b) = op Int64.- (a,b)
end
in structure Longmath = PolyMath (Polylong) end
