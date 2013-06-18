(require 'dash)
(require 'cl)
(defmacro vp (&rest vals)
  `(format "Vector.app printReal (Vector.fromList[%f,%f,%f,%f])" ,@vals))
(defun vp-var (var)
  (format "Vector.app printReal %s" var))
(defun vp-fn (a b c d)
  (format "Vector.app printReal (Vector.fromList[%f,%f,%f,%f])" a b c d))
(defmacro vset (name &rest vals)
  `(format "val %s = Vector.fromList[%f,%f,%f,%f]" ,name ,@vals))
(defun vset-fn (a b c d e)
  (format "val %s = Vector.fromList[%f,%f,%f,%f]" a b c d e))
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
(with-temp-file "temp-C.sml"
  (insert (concat
;;toplevel definitons
"val print = TextIO.print
fun printReal x = print (Real32.toString x ^ \" \")
local 
  open SSE_Cvector
in\n"
(format "%s\n%s\n%s\n%s\n"
;;set values of arguements
        (apply #'vset-fn (cons "a" simple))
        (apply #'vset-fn (cons "b" rev-simple))
        (apply #'vset-fn (cons "x" rand1))
        (apply #'vset-fn (cons "y" rand2)))))
;;assoicate elisp functions with sml functions and start looping
  (dolist (funs '(("addps" +) ("subps" -) ("mulps" *) ("divps" /)))
                (let ((funct (first funs))
                      (op (second funs)))
    (insert
;;create per-function sml code, first run actual sml simd functions and set the results
;;to variables. Then write code to print results, first print fxn name, then results
;;as calculated via elisp, then sml results, for both sets of data. then loop 
;;over all functions. Newlines are inserted after every line(when printed from sml)
(format "(*%s*)\n%s\n%s
val _ = (%s\n\t;%s\n\t%s\n\t;%s\n\t%s\n\t;%s\n\t%s\n\t;%s\n\t%s)\n"
;;put function in sml comment
        (upcase funct)
;;run functions in sml
        (format "val z = %s(x,y)"(upcase funct))
        (format "val c = %s(a,b)" (upcase funct))
;;print from sml program the name of the function
        (format "print (\"%s\" ^ \"\\n\")" (upcase funct))
;;run lisp function, insert into sml code as the expected value(and set it to print)
        (replace-regexp-in-string "-" "~" (apply #'vp-fn (simd op simple rev-simple))) nl
;;set sml calculates value to print
        (vp-var "c") nl
;;again run lisp function, ditto above
        (replace-regexp-in-string "-" "~" (apply #'vp-fn (simd op rand1 rand2)) )nl
;;again set sml vals to print
        (vp-var "z") nl))))
(insert "end"))

