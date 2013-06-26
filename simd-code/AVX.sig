signature AVX =
sig
  include AVX_TYPES
  val ADDPD256:v4df*v4df->v4df
  val ADDPS256:v8sf*v8sf->v8sf
  val ADDSUBPD:v4df*v4df->v4df
  val ADDSUBPS:v8sf*v8sf->v8sf
  val ANDPD256:v4df*v4df->v4df
  val ANDPS256:v8sf*v8sf->v8sf
  val BLENDPD256:v4df*4vdf*Word8.word->v4df
  val BLENDPS256:v8sf*v8sf*Word8.word->v8sf
  val BLENDVPD256:v4df*4vdf*v4df->v4df
  val BLENDVPS256:v8sf*v8sf*v8sf->v8sf
  val CMPPD:v2df*v2df*Word8.word->v2df
  val CMPPS:v4sf*v4sf*Word8.word->v4sf
  val CMPPD256:v4df*v4df*Word8.word->v4df
  val CMPPD256:v8sf*v8sf*Word8.word->v8sf
  val DIVPD256:v4df*v4df->v4df
  val DIVPS256:v8sf*v8sf->v8sf
  val HADDPD256:v4df*v4df->v4df
  val HADDPS256:v8sf*v8sf->v8sf
  val HSUBPD256:v4df*v4df->v4df
  val HSUBPS256:v8sf*v8sf->v8sf
  val DPPS256:v8sf*v8sf*Word8.word->Real32.real
  val MINPD:v4df*v4df->v4df
  val MINPS:v8sf*v8sf->v8sf
  val MAXPD:v4df*v4df->v4df
  val MINPS:v8sf*v8sf->v8sf
  val ORPD256:v4df*v4df->v4df
  val ORPS256:v8sf*v8sf->v8sf
  val RCPPS256:v8sf->v8sf
  val ROUNDPD256:v4df*Word8.word->v4df
  val ROUNDPS256:v8sf*Word8.word->v8sf
  val RSQRTPS256:v8sf->v8sf
  val SQRTPD256:v4df->v4df
  val SQRTPS256:v8sf->v8sf
  val SUBPD256:v4df*v4df->v4df
  val SUBPS256:v8sf*v8sf->v8sf
  val XORPD256:v4df*v4df->v4df
  val XORPS256:v8sf*v8sf->v8sf
end



(*
(defun avx-fun (name in out &optional bin)
  (if (null bin)
    (insert (format "val %s:%s->%s\n" (upcase name) in out))
  (insert (format "val %s:%s*%s->%s\n" (upcase name) in in out))))
(defun make-avx-sig (names)
  (dolist (op names) (apply #'avx-fun op)))
(make-avx-sig '(("addpd256" "v4df" "v4df" t)
               ("addps256" "v8sf" "v8sf" t)
               ("addsubpd" "v4df" "v4df" t)
               ("addsubps" "v8sf" "v8sf" t)
               ("andpd256" "v4df" "v4df" t)
               ("andps256" "v8sf" "v8sf" t)
               ("blendpd256" "v4df*4vdf*Word8.word" "v4df")
               ("blendps256" "v8sf*v8sf*Word8.word" "v8sf")
               ("blendvpd256" "v4df*4vdf*v4df" "v4df")
               ("blendvps256" "v8sf*v8sf*v8sf" "v8sf")
               ("cmppd" "v2df*v2df*Word8.word" "v2df")
               ("cmpps" "v4sf*v4sf*Word8.word" "v4sf")
               ("cmppd256" "v4df*v4df*Word8.word" "v4df")
               ("cmppd256" "v8sf*v8sf*Word8.word" "v8sf")
               ("divpd256" "v4df" "v4df" t)
               ("divps256" "v8sf" "v8sf" t)
               ("haddpd256" "v4df" "v4df" t)
               ("haddps256" "v8sf" "v8sf" t)
               ("hsubpd256" "v4df" "v4df" t)
               ("hsubps256" "v8sf" "v8sf" t)
               ("dpps256" "v8sf*v8sf*Word8.word" "Real32.real")
               ("minpd" "v4df" "v4df" t)
               ("minps" "v8sf" "v8sf" t)
               ("maxpd" "v4df" "v4df" t)
               ("minps" "v8sf" "v8sf" t)
               ("orpd256" "v4df" "v4df" t)
               ("orps256" "v8sf" "v8sf" t)
               ("rcpps256" "v8sf" "v8sf")
               ("roundpd256" "v4df*Word8.word" "v4df")
               ("roundps256" "v8sf*Word8.word" "v8sf")
               ("rsqrtps256" "v8sf" "v8sf")
               ("sqrtpd256" "v4df" "v4df")
               ("sqrtps256" "v8sf" "v8sf")
               ("subpd256" "v4df" "v4df" t)
               ("subps256" "v8sf" "v8sf" t)
               ("xorpd256" "v4df" "v4df" t)
               ("xorps256" "v8sf" "v8sf" t)))*)
