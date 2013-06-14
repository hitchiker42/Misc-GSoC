(require 'dash)
(require 'cl)
(defmacro vp (&rest vals)
  `(format "Vector.app printReal (Vector.fromList[%f,%f,%f,%f])" ,@vals))
(defmacro vp-var (var)
  `(format "Vector.app printReal %s" ,var))
(defun vp-fn (a b c d)
  (vp a b c d))
(defmacro vset (name &rest vals)
  `(format "val %s = Vector.fromList[%f,%f,%f,%f]" ,name ,@vals))
(defun vset-fn (a b c d e)
  (vset a b c d e))
(defmacro with-debug-on-error (&rest body)
  `(let ((setq debug-on-error t))
     ,@body))
(setf simple '(1.0 2.0 3.0 4.0))
(setf rev-simple (reverse simple))
(setf rand1 '(3.7 2.4 9.9 100.0))
(setf rand2 '(5.5 8.6 7.5 0.01))
(setf funct "addps")
(setf nl ";print \"\\n\"")
(defun simd (fun list1 list2) 
  (-zip-with fun list1 list2))
(apply #'vp-fn (simd #'+ simple rev-simple))
(simd '+ rand1 rand2)
(with-temp-file "temp-C.sml"
  (insert (concat
"val print = TextIO.print
fun printReal x = print (Real32.toString x ^ \" \")
local 
  open Sse_Cvector
in\n"
(format "%s\n%s\n%s\n%s\n"
        (apply #'vset-fn (cons "a" simple))
        (apply #'vset-fn (cons "b" rev-simple))
        (apply #'vset-fn (cons "x" rand1))
        (apply #'vset-fn (cons "y" rand2)))))
  (dolist (funs '(("addps" +) ("subps" -) ("mulps" *) ("divps" /)))
                (let ((funct (first funs))
                      (op (second funs)))
    (insert
(format "(*%s*)\n%s\n%s\nval _ = (%s\n\t%s\n\t;%s\n\t%s\n\t;%s\n\t%s\n\t;%s\n\t%s)\n"
        (upcase funct)
        (format "val z = %s(x,y)"(upcase funct))
        (format "val c = %s(a,b)" (upcase funct))
        (replace-regexp-in-string "-" "~" (apply #'vp-fn (simd op simple rev-simple))) nl
        (vp-var "c") nl
        (replace-regexp-in-string "-" "~" (apply #'vp-fn (simd op rand1 rand2)) )nl
        (vp-var "z") nl))))
(insert "end"))

