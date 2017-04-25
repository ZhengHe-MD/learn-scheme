(define make-stack
  (lambda (n)
    (let ([v (make-vector n)] [i -1])
      (lambda (msg .args)
        (case msg
          [(empty? mt) (= i -1)]
          [(push!)
            (if (eqv? i (- n 1))
                (display "stack is full")
                (begin (set! i (+ i 1))
                       (vector-set! v i (car args))))]
          [(set!) (vector-set! v (- i (car args)) (cdar args))]
          [(top) (vect-ref v i)]
          [(ref) (vect-ref v (- i (car args)))]
          [(pop!) (begin
                    ((set! i (- i 1))
                     (vector-ref v (+ i 1))))]
          [else "oops"])))))
