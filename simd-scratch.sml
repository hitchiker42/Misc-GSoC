(* Not sure what to name types yet, but for now using the same names as the
 * gcc intrinsic types seems to make sense*)
datatype word128 (* talk to mentor, maybe make a new word128 primitive*) =
         (* sse type*)
         v4sf  of (Real32.real*Real32.real*Real32.real*Real32.real) 
                   (* 4 packed single floats *)
         (* sse2 types *)
       | v2df  of (Real64.real*Real64.real) (* 2 packed double floats *)
       | v2di  of (Int64.int*Int64.int) (* 2 packed long ints *)
       | v4si  of (Int32.int*Int32.int*Int32.int*Int32.int) (* 4 packed ints*)
       | v8hi  of (Int16.int*Int16.int*Int16.int*Int16.int*Int16.int*Int16.int*Int16.int*Int16.int)
                   (* 8 packed shorts *)
       | v16qi of (Int8.int*Int8.int*Int8.int*Int8.int*Int8.int*Int8.int*Int8.int*Int8.int*Int8.int*Int8.int*Int8.int*Int8.int*Int8.int*Int8.int*Int8.int*Int8.int)
                    (* 16 packed bytes *)
(* zero vectors *)
val v4sf_zero  = v4sf  (0.0,0.0,0.0,0.0)
val v2df_zero  = v2df  (0.0,0.0)
val v2di_zero  = v2di  (0,0)
val v4si_zero  = v4si  (0,0,0,0)
val v8hi_zero  = v8hi  (0,0,0,0,0,0,0,0)
val v18qi_zero = v16qi (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

(* or maybe make a signiture that each vector type fits *)
signature SIMD_VECTOR =
sig
(* not sure what this should be*)
  eqtype 'a vec
  val zero : 'a vec
(* The whole research bit of the project will determine what operations
 * to implement, so this is going to change, as of now these are just the
 * opperations I know I'm going to need to implement *)
  val add : 'a vec*'a vec -> 'a vec
  val sub : 'a vec*'a vec -> 'a vec
  val mul : 'a vec*'a vec -> 'a vec
  val div : 'a vec*'a vec -> 'a vec
  val or  : 'a vec*'a vec -> 'a vec
  val land: 'a vec*'a vec -> 'a vec (* logical and, I guess *)
  val xor : 'a vec*'a vec -> 'a vec
  val loadp: 'a vec*'a -> 'a vec (*make a vector of n of the given value*)
end

(* Big question is what to do about loading and whatnot, will the datatype
 * stuff take care of that?*)
