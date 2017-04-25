(define count
  (let ([next 0])
    (lambda ()
      (set! next (+ next 1))
      (- next 1))))
