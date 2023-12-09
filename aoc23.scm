(define-module (aoc23)
  #:use-module (aoc23 day01))

(define-syntax println
  (syntax-rules ()
    ((println arg)
     (begin
       (display arg)
       (newline)))))

(define (main)
  (println (day01/solution "inputs/day01.txt")))
(main)
