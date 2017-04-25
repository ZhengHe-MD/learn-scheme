(define make-counter
  (let ([next 0])
    (lambda (start step)
      (set! next start)
      (lambda ()
        (set! next (+ next step))
        (- next step)))))
