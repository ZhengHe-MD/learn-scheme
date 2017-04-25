(define make-counter
  (lambda ()
    (let ([next 0])
      (lambda ()
        (set! next (+ next 1))
        (- next 1)))))
