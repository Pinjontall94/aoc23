(define-module (aoc23 day01)
  #:use-module (ice-9 rdelim)
  #:export (day01/solution))

;; Niceties for folks allergic to cars and cdrs ;3
(define first car)
(define rest cdr)
(define second cdar)


(define (filter-numeric str)
  """Filter out numeric characters from a string."""
  (let ((char-list (string->list str)))
    (filter char-numeric? char-list)))


(define (utf-8-numeric->int char)
  """Naively convert UTF-8 numberic chars to their integer representations."""
  (- (char->integer char) 48))


(define (str->int-list str)
  (map utf-8-numeric->int (filter-numeric str)))


(define (make-double-digit x y)
  """Take two numbers and return their double digit representation."""
  (+ y
     (* 10 x)))


(define (list->outer-digits lst)
  """
  Take a list of digits and create a double digit number from the outermost pair.
  If only the list only contains 1 digit, duplicate and use as the 2nd value too.
  """
  (let* ((rev-lst (reverse lst))
         (first-digit (first lst))
         (last-digit (first rev-lst)))
    (if (nil? (rest lst))
      (make-double-digit first-digit first-digit)
      (make-double-digit first-digit last-digit))))


(define (line-wise-loop)
  (let loop ((line (read-line))
             (acc 0))
    (if (eof-object? line)
        acc
        ;; Pass the new state into loop by adding the acc(umulator)
        ;; to the value generated above
        (loop (read-line)
              (+ acc
                 (list->outer-digits (str->int-list line)))))))



(define (loop-over-file filename)
  (with-input-from-file filename line-wise-loop))


(define (day01/solution filename)
  (display (loop-over-file filename))
  (newline))
