(define make-stack
  (lambda ()
    (let ([ls '()])
      (lambda (msg . args)
        (case msg
          [(empty? mt) (null? ls)]
          [(push!) (set! ls (cons (car args) ls))]
          [(set!) (set-car! (list-tail ls (car args)) (car (cdr args)))]
          [(top) (car ls)]
          [(ref) (list-ref ls (car args))]
          [(pop!) (set! ls (cdr ls))]
          [else "oops"])))))
