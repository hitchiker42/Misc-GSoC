(*amd64.fun*)
structure XmmRegister =
struct

datatype reg
  = XMM0 | XMM1 | XMM2 | XMM3 | XMM4 | XMM5 | XMM6 | XMM7 
    | XMM8 | XMM9 | XMM10 | XMM11 | XMM12 | XMM13 | XMM14 | XMM15 
val allReg = [XMM0, XMM1, XMM2, XMM3, XMM4, XMM5, XMM6, XMM7,
              XMM8, XMM9, XMM10, XMM11, XMM12, XMM13, XMM14, XMM15]
(* This needs to change, we need to have more than just scalars*)
datatype part
  = D | S | L | I | W | B (*double,single, long, int ,word(16 bit int and byte*)
(*datatype simd_vector
  = v2df | v4sf | v2di | v4si | v8hi | v16qi*)
  (*| all of the actual vector types*)
datatype t = T of {reg: reg, part: part}(*, packed: bool*)

fun size (T {part, ...})
    = case part
`
       of D => Size.DBLE
        | S => Size.SNGL
        | L => Size.QUAD
        | I => Size.LONG
        | W => Size.WORD
        | B => Size.BYTE

fun layout (T {reg, ...})
    = let
  open Layout
in
  case reg
   of XMM0 => str "%xmm0"
    | XMM1 => str "%xmm1"
    | XMM2 => str "%xmm2"
    | XMM3 => str "%xmm3"
    | XMM4 => str "%xmm4"
    | XMM5 => str "%xmm5"
    | XMM6 => str "%xmm6"
    | XMM7 => str "%xmm7"
    | XMM8 => str "%xmm8"
    | XMM9 => str "%xmm9"
    | XMM10 => str "%xmm10"
    | XMM11 => str "%xmm11"
    | XMM12 => str "%xmm12"
    | XMM13 => str "%xmm13"
    | XMM14 => str "%xmm14"
    | XMM15 => str "%xmm15"
end
val toString = Layout.toString o layout

fun eq(T r1, T r2) = r1 = r2

val xmm0S = T {reg = XMM0, part = S}
val xmm0D = T {reg = XMM0, part = D}
val xmm1S = T {reg = XMM1, part = S}
val xmm1D = T {reg = XMM1, part = D}
val xmm2S = T {reg = XMM2, part = S}
val xmm2D = T {reg = XMM2, part = D}
val xmm3S = T {reg = XMM3, part = S}
val xmm3D = T {reg = XMM3, part = D}
val xmm4S = T {reg = XMM4, part = S}
val xmm4D = T {reg = XMM4, part = D}
val xmm5S = T {reg = XMM5, part = S}
val xmm5D = T {reg = XMM5, part = D}
val xmm6S = T {reg = XMM6, part = S}
val xmm6D = T {reg = XMM6, part = D}
val xmm7S = T {reg = XMM7, part = S}
val xmm7D = T {reg = XMM7, part = D}
val xmm8S = T {reg = XMM8, part = S}
val xmm8D = T {reg = XMM8, part = D}
val xmm9S = T {reg = XMM9, part = S}
val xmm9D = T {reg = XMM9, part = D}
val xmm10S = T {reg = XMM10, part = S}
val xmm10D = T {reg = XMM10, part = D}
val xmm11S = T {reg = XMM11, part = S}
val xmm11D = T {reg = XMM11, part = D}
val xmm12S = T {reg = XMM12, part = S}
val xmm12D = T {reg = XMM12, part = D}
val xmm13S = T {reg = XMM13, part = S}
val xmm13D = T {reg = XMM13, part = D}
val xmm14S = T {reg = XMM14, part = S}
val xmm14D = T {reg = XMM14, part = D}
val xmm15S = T {reg = XMM15, part = S}
val xmm15D = T {reg = XMM15, part = D}

local
  fun make part =
      List.rev
        [T {reg = XMM0, part = part},
         T {reg = XMM1, part = part},
         T {reg = XMM2, part = part},
         T {reg = XMM3, part = part},
         T {reg = XMM4, part = part},
         T {reg = XMM5, part = part},
         T {reg = XMM6, part = part},
         T {reg = XMM7, part = part},
         T {reg = XMM8, part = part},
         T {reg = XMM9, part = part},
         T {reg = XMM10, part = part},
         T {reg = XMM11, part = part},
         T {reg = XMM12, part = part},
         T {reg = XMM13, part = part},
         T {reg = XMM14, part = part},
         T {reg = XMM15, part = part}]
in
val singleRegisters = make S
val doubleRegisters = make D
end

val all = List.concat [singleRegisters, doubleRegisters]

fun valid r = List.contains(all, r, eq)

val contains 
    = fn (D, D) => true | (D, S) => true
    | (S, S) => true
    | _      => false

fun coincide (T {reg = reg1, part = part1}, 
              T {reg = reg2, part = part2}) 
    = reg1 = reg2 andalso (contains(part1,part2) orelse 
                           contains(part2,part1))

fun coincident' reg
    = List.keepAllMap([D, S],
                      fn part 
                         => let
                        val register' = T {reg = reg, part = part}
                      in 
                        if valid register' andalso 
                           coincide(T {reg = reg, part = D}, register')
                        then SOME register'
                        else NONE
                      end)

fun coincident (T {reg, ...}) = coincident' reg
(* quell unused warning *)
val _ = coincident

val registers
    = fn Size.SNGL => singleRegisters
  | Size.DBLE => doubleRegisters
  | _ => Error.bug "amd64.XmmRegister.registers"

val callerSaveRegisters = all
val calleeSaveRegisters = []
end

(* Scalar SSE binary arithmetic instructions. *)
datatype sse_binas
  = SSE_ADDSS (* addition; p. 7,10 *)
  | SSE_SUBSS (* subtraction; p. 371,374 *)
  | SSE_MULSS (* multiplication; p. 201,204 *)
  | SSE_DIVSS (* division; p. 97,100 *)
  | SSE_MAXSS (* maximum; p. 128, 130 *)
  | SSE_MINSS (* minimum; p. 132, 134 *)
val sse_binas_layout
    = let
  open Layout
in 
  fn SSE_ADDS => str "adds"
| SSE_SUBS => str "subs"
| SSE_MULS => str "muls"
| SSE_DIVS => str "divs"
| SSE_MAXS => str "maxs"
| SSE_MINS => str "mins"
end
(* Scalar SSE unary arithmetic instructions. *)
datatype sse_unas
  = SSE_SQRTS (* square root; p. 360,362 *)
val sse_unas_layout
    = let
  open Layout
in 
  fn SSE_SQRTS => str "sqrts"
end
(* Packed SSE binary logical instructions (used as scalar). *)
datatype sse_binlp
  = SSE_ANDNP (* and-not; p. 17,19 *)
  | SSE_ANDP (* and; p. 21,23 *)
  | SSE_ORP (* or; p. 206,208 *)
  | SSE_XORP (* xor; p. 391,393 *)
val sse_binlp_layout
    = let
  open Layout
in
  fn SSE_ANDNP => str "andnp"
| SSE_ANDP => str "andp"
| SSE_ORP => str "orp"
| SSE_XORP => str "xorp"
end

(* amd64 Instructions.
 * src operands are not changed by the instruction.
 * dst operands are changed by the instruction.
 *)
datatype t
  (* No operation *)
  = NOP
      .
      .
      .
  (* Scalar SSE binary arithmetic instructions.
   *)
  | SSE_BinAS of {oper: sse_binas,
                  src: Operand.t,
                  dst: Operand.t,
                  size: Size.t}
  (* Scalar SSE unary arithmetic instructions.
   *)
  | SSE_UnAS of {oper: sse_unas,
                 src: Operand.t,
                 dst: Operand.t,
                 size: Size.t}
  (* Packed SSE binary logical instructions (used as scalar). 
   *)
  | SSE_BinLP of {oper: sse_binlp,
                  src: Operand.t,
                  dst: Operand.t,
                  size: Size.t}
  (* Scalar SSE move instruction.
   *)
  | SSE_MOVS of {src: Operand.t,
                 dst: Operand.t,
                 size: Size.t}
  (* Scalar SSE compare instruction.
   *)
  | SSE_COMIS of {src1: Operand.t,
                  src2: Operand.t,
                  size: Size.t}
  (* Scalar SSE unordered compare instruction.
   *)
  | SSE_UCOMIS of {src1: Operand.t,
                   src2: Operand.t,
                   size: Size.t}
  (* Scalar SSE floating-point/floating-point convert instruction.
   *)
  | SSE_CVTSFP2SFP of {src: Operand.t,
                       srcsize: Size.t,
                       dst: Operand.t,
                       dstsize: Size.t}
  (* Scalar SSE floating-point/signed-integer convert instruction.
   *)
  | SSE_CVTSFP2SI of {src: Operand.t,
                      srcsize: Size.t,
                      dst: Operand.t,
                      dstsize: Size.t}
  | SSE_CVTSI2SFP of {src: Operand.t,
                      srcsize: Size.t,
                      dst: Operand.t,
                      dstsize: Size.t}
  (* Scalar SSE move data instruction.
   *)
  | SSE_MOVD of {src: Operand.t,
                 srcsize: Size.t,
                 dst: Operand.t,
                 dstsize: Size.t}

val layout
    = let
  open Layout
  fun bin (oper, size, oper1, oper2)
      = seq [oper,
             size,
             str " ",
             oper1,
             str ",",
             oper2]
  fun un (oper, size, oper1)
      = seq [oper,
             size,
             str " ",
             oper1]
in 
  fn NOP
     => str "nop"
            .
            .
            .
| SSE_BinAS {oper, src, dst, size}
  => bin (sse_binas_layout oper,
          Size.layout size,
          Operand.layout src,
          Operand.layout dst)
| SSE_UnAS {oper, src, dst, size}
  => bin (sse_unas_layout oper,
          Size.layout size,
          Operand.layout src,
          Operand.layout dst)
| SSE_BinLP {oper, src, dst, size}
  => bin (sse_binlp_layout oper,
          Size.layout size,
          Operand.layout src,
          Operand.layout dst)
| SSE_MOVS {src, dst, size}
  => bin (str "movs", 
          Size.layout size,
          Operand.layout src,
          Operand.layout dst)
| SSE_COMIS {src1, src2, size}
  => bin (str "comis",
          Size.layout size,
          Operand.layout src1,
          Operand.layout src2)
| SSE_UCOMIS {src1, src2, size}
  => bin (str "ucomis",
          Size.layout size,
          Operand.layout src1,
          Operand.layout src2)
| SSE_CVTSFP2SFP {src, srcsize, dst, dstsize}
  => bin (str "cvt",
          seq [str "s", Size.layout srcsize,
               str "2", str "s", Size.layout dstsize],
          Operand.layout src,
          Operand.layout dst)
| SSE_CVTSFP2SI {src, srcsize, dst, dstsize, ...}
  => bin (str "cvt",
          seq [str "s", Size.layout srcsize,
               str "2", str "si",
               case dstsize of
                   Size.LONG => empty
                 | Size.QUAD => Size.layout dstsize
                 | _ => Error.bug "amd64.Instruction.layout: SSE_CVTSFP2SI,unsupported conversion"],
          Operand.layout src,
          Operand.layout dst)
| SSE_CVTSI2SFP {src, srcsize, dst, dstsize, ...}
  => bin (str "cvt",
          seq [str "si", 
               str "2", str "s", Size.layout dstsize,
               case srcsize of
                   Size.LONG => empty
                 | Size.QUAD => Size.layout srcsize
                 | _ => Error.bug "amd64.Instruction.layout: SSE_CVTSI2SFP,unsupported conversion"],
          Operand.layout src,
          Operand.layout dst)
| SSE_MOVD {src, dst, ...}
  => bin (str "movd",
          empty,
          Operand.layout src,
          Operand.layout dst)
end

(*Some more stuff, but mostly the same, and some directives*)

(*amd64-mlton.fun*)
fun sse_movs ()
    = let
  val (dst,dstsize) = getDst1 ()
  val (src,srcsize) = getSrc1 ()
  val _ 
      = Assert.assert
          ("amd64MLton.prim: sse_movs, dstsize/srcsize",
           fn () => srcsize = dstsize)
in
  AppendList.fromList
    [Block.mkBlock'
       {entry = NONE,
        statements
        = [Assembly.instruction_sse_movs
             {dst = dst,
              src = src,
              size = srcsize}],
        transfer = NONE}]
end

(*
        fun sse_ucomis condition
          = let
              val (dst,dstsize) = getDst1 ()
              val ((src1,src1size),
                   (src2,src2size)) = getSrc2 ()
              val _ 
                = Assert.assert
                  ("amd64MLton.prim: cmp, src1size/src2size",
                   fn () => src1size = src2size)
            in
              AppendList.fromList
              [Block.mkBlock'
               {entry = NONE,      
                statements
                = [Assembly.instruction_sse_ucomis
                   {src1 = src1,
                    src2 = src2,
                    size = src1size},
                   Assembly.instruction_setcc
                   {condition = condition,
                    dst = dst,
                    size = dstsize}],
                transfer = NONE}]
            end
*)

fun sse_cvtsfp2sfp ()
    = let
  val (dst,dstsize) = getDst1 ()
  val (src,srcsize) = getSrc1 ()
  val _ 
      = Assert.assert
          ("amd64MLton.prim: sse_cvtsfp2sfp, dstsize/srcsize",
           fn () => srcsize <> dstsize)
in
  AppendList.fromList
    [Block.mkBlock'
       {entry = NONE,
        statements
        = [Assembly.instruction_sse_cvtsfp2sfp
             {dst = dst,
              dstsize = dstsize,
              src = src,
              srcsize = srcsize}],
        transfer = NONE}]
end

fun sse_movd ()
    = let
  val (dst,dstsize) = getDst1 ()
  val (src,srcsize) = getSrc1 ()
  val _ 
      = Assert.assert
          ("amd64MLton.prim: sse_movd, dstsize/srcsize",
           fn () => srcsize <> dstsize)
in
  AppendList.fromList
    [Block.mkBlock'
       {entry = NONE,
        statements
        = [Assembly.instruction_sse_movd
             {dst = dst,
              dstsize = dstsize,
              src = src,
              srcsize = srcsize}],
        transfer = NONE}]
end

fun sse_binas oper
    = let
  val ((src1,src1size),
       (src2,src2size)) = getSrc2 ()
  val (dst,dstsize) = getDst1 ()
  val _ 
      = Assert.assert
          ("amd64MLton.prim: binal, dstsize/src1size/src2size",
           fn () => src1size = dstsize andalso
                    src2size = dstsize)

  (* Reverse src1/src2 when src1 and src2 are temporaries
   * and the oper is commutative. 
   *)
  val (src1,src2)
      = if (oper = Instruction.SSE_ADDS)
           orelse
           (oper = Instruction.SSE_MULS)
           orelse
           (oper = Instruction.SSE_MAXS)
           orelse
           (oper = Instruction.SSE_MINS)
        then case (Operand.deMemloc src1, Operand.deMemloc src2)
              of (SOME memloc_src1, SOME memloc_src2)
                 => if amd64Liveness.track memloc_src1
                       andalso
                       amd64Liveness.track memloc_src2
                    then (src2,src1)
                    else (src1,src2)
               | _ => (src1,src2)
        else (src1,src2)
in
  AppendList.fromList
    [Block.mkBlock'
       {entry = NONE,
        statements
        = [Assembly.instruction_sse_movs
             {dst = dst,
              src = src1,
              size = src1size},
           Assembly.instruction_sse_binas
             {oper = oper,
              dst = dst,
              src = src2,
              size = dstsize}],
        transfer = NONE}]
end

fun sse_binas_mul oper
    = let
  val ((src1,src1size),
       (src2,src2size),
       (src3,src3size)) = getSrc3 ()
  val (dst,dstsize) = getDst1 ()
  val _ 
      = Assert.assert
          ("amd64MLton.prim: binal, dstsize/src1size/src2size",
           fn () => src1size = dstsize andalso
                    src2size = dstsize andalso
                    src3size = dstsize)
in
  AppendList.fromList
    [Block.mkBlock'
       {entry = NONE,
        statements
        = [Assembly.instruction_sse_movs
             {dst = dst,
              src = src1,
              size = src1size},
           Assembly.instruction_sse_binas
             {oper = Instruction.SSE_MULS,
              dst = dst,
              src = src2,
              size = dstsize},
           Assembly.instruction_sse_binas
             {oper = oper,
              dst = dst,
              src = src3,
              size = dstsize}],
        transfer = NONE}]
end

fun sse_unas oper
    = let
  val (src,srcsize) = getSrc1 ()
  val (dst,dstsize) = getDst1 ()
  val _ 
      = Assert.assert
          ("amd64MLton.prim: unal, dstsize/srcsize",
           fn () => srcsize = dstsize)
in
  AppendList.fromList
    [Block.mkBlock'
       {entry = NONE,
        statements 
        = [Assembly.instruction_sse_unas
             {oper = oper,
              src = src,
              dst = dst,
              size = dstsize}],
        transfer = NONE}]
end
