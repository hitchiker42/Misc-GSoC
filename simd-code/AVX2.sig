signature AVX2 =
sig
  include AVX_TYPES
end
(*(defun avx-fun (name in out &optional bin)
  (if (null bin)
    (insert (format "val %s:%s->%s\n" (upcase name) in out))
  (insert (format "val %s:%s*%s->%s\n" (upcase name) in in out))))
(defun make-avx-sig (names)
  (dolist (op names) (apply #'avx-fun op)))
*)
