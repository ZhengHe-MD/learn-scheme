(define retry #f)
(define factorial
  (lambda (x)
    (if (zero? x)
        (call/cc (lambda (k) (set! retry k) 1))
        (* x (factorial (- x 1))))))

; CPS style
(define retry #f)
(define factorial
  (lambda (x)
    (let f ((x x) (k (lambda (x) x)))
      (if (= x 0)
          (begin (set! retry k) (k 1))
          (f (- x 1) (lambda (y) (k (* x y))))))))
