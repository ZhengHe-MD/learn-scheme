(define calc
  (lambda (exp)
    (call/cc
      (lambda (ek)
        (define do-calc
          (lambda (exp)
            (cond
              ((number? exp) exp)
              ((and (list? exp) (= (length exp) 3))
               (let ((op (car exp)) (args (cdr exp)))
                 (case op
                   ((add) (apply-op + args))
                   ((sub) (apply-op - args))
                   ((mul) (apply-op * args))
                   ((div) (apply-op / args))
                   (else (complain "invalid operator" op)))))
              (else (complain "invalid expression" exp)))))
        (define apply-op
          (lambda (op args)
            (op (do-calc (car args)) (do-calc (cadr args)))))
        (define complain
          (lambda (msg exp)
            (ek (list msg exp))))
        (do-calc exp)))))
