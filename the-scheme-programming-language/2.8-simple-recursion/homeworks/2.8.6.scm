(define even?
  (lambda (n)
    (if (= n 0)
        #t
        (odd? (- n 1)))))

(define odd?
  (lambda (n)
    (if (= n 0)
        #f
        (even? (- n 1)))))


(define even?
  (lambda (n)
    (or (= n 0)
        (odd? (- n 1)))))

(define odd?
  (lambda (n)
    (and (not (= n 0))
         (even? (- n 1)))))
