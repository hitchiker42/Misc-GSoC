signature SSE4.1 = 
sig
  include SSE_TYPES
(*doubleword multiply instructions*)
  val PMULDQ128:v4si*v4si->v2di
  val PMULLD128:v4si*v4si->v4si(*results are low 16 bits of intermediates*)
(*floating point dot products
 *take an immediate byte to determine which values to multiply
 *and which results to keep,if all immediate bits are 1 then
 *multiply coorsiponding values, sum all results and store answer in all
 *values of dest, if some bits are 0 selectively set some things to 0*)
(*that all said, this is a case to just ignore complexity and just do
 *A simple dot product, multiply two vectors, sum the results and return
 *that value*)
  val DPPD:v2df*v2df->Real64.real
  val DPPS:v4sf*v4sf->Real32.real
(*Blending instructions
 *blending instructions are like fancy shuffle instructions,
 *they take 2 operands and regular blends use an immediate byte as a selector
 *for variable blends the xmm0 register is implictly used as a selector
 *the selector is a single bit(the msb of an element in xmm0 for variable blends
 *a 1 selects the value in the src operand, a 0 the value in the dest
 *ex.
 *SRC :|X3|X2|X1|X0|
 *DEST:|Y3|Y2|Y1|Y0|
 *XMM0:|1 |0 |0 |1 |
 *END :|X3|Y2|Y1|X0*)
  val BLENDPD:v2df*v2df*Word8.word->v2df
  val BLENDPS:v4sf*v4sf*Word8.word->v4sf
  val BLENDVPD:v2df*v2df*v2df->v2df(*3rd opperand is value to put in xmm0*)
  val BLENDVPS:v4sf*v4sf*v4sf->v4sf
  val PBLENDDW128:v8hi*v8hi*Word8.word->v8hi
  val PBLENDVB128:v16qi*v16qi*v16qi->v16qi
(*signed/unsigned Integer min/max instructions*)
  val PMAXSB128:v16qi*v16qi->v16qi
  val PMAXSD128:v4si*v4si->v4si
  val PMAXUW128:v8hi*v8hi->v8hi
  val PMAXUD128:v4si*v4si->v4si
  val PMINSB128:v16qi*v16qi->v16qi
  val PMINSD128:v4si*v4si->v4si
  val PMINUW128:v8hi*v8hi->v8hi
  val PMINUD128:v4si*v4si->v4si
(*Floating pt rounding with selectable rounding mode
 *mode determined by byte immediate
 *00=round to nearest
 *01=round to -inf
 *10=round to +inf
 *11=truncate*)
  val ROUNDPD:v2df*Word8.word->v2df
  val ROUNDPS:v4sf*Word8.word->v4sf
(*scalar ops, round lowest double/quadword of src1 according to imm
 *fill upper values of dest with values from src2 and fill low value
 *with rounded value from src1*)
  val ROUNDSD:v2df*v2df*Word8.word->v2df
  val ROUNDSS:v4sf*v4sf*Word8.word->v4sf
(*ignore a bunch of select instructions for picking values out of xmm registers*)
(*expand a signed/unsigned int to a larger type(i.e byte->word)
 *values are taken from the lowest bytes,(i.e. low 8 bytes for byte->word*)
(*signed(packed mov with sign extend)*)
  val PMOVSXBW128:v16qi->v8hi
  val PMOVSXBD128:v16qi->v4si
  val PMOVSXBQ128:v16qi->v2di
  val PMOVSXWD128:v8hi->v4si
  val PMOVSXWQ128:v8hi->v2di
  val PMOVSXDQ128:v4si->v2di
(*unsigned(packed mov with zero extend)*)
  val PMOVZXBW128:v16qi->v8hi
  val PMOVZXBD128:v16qi->v4si
  val PMOVZXBQ128:v16qi->v2di
  val PMOVZXWD128:v8hi->v4si
  val PMOVZXWQ128:v8hi->v2di
  val PMOVZXDQ128:v4si->v2di
(*MPSADBW sums of absolute differances, to confusing to deal with right now*)
(*PHMINPOSUW128 pick minimum word and store it and its offset within the src
 *register into the low doubleword of the dest*)
  val PHMINPOSUW128:v8hi->v8hi
(*set ZF if src&dest=0;set CF if !src&dest=0*)
val PTEST(*some suffix to decide what we're testing*):v2di*v2di->bool
(*quadword eqality test*)
val PCMPEQQ:v2di*v2di->v2di
(*pack dword w/unsigned saturation*)
val PACKUSDW:v4si*v4si->v8hi
(*a few more things but all are cache control, or streaming hints etc*)
end
signature SSE4.2 =
sig
  include SSE_TYPES
(*String compare instructions,
 *4 instructions with really damn complicated ways of comparing strings
 *too tired to figure it out now
PCMPESTRI
PCMPESTRM
PCMPISTRI
PCRMISTRM
*)
(*compare gt on quadwords*)
val PCMPGTQ:v2di*v2di->v2di
(*POPCNT, count # of 1's in src, return ans in dest, works on general registers*)
end
