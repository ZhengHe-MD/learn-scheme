(let ()
  (define do-calc
    (lambda (ek exp)
      (cond
        ((number? exp) exp)
        ((and (list? exp) (= (length exp) 2))
         (let ((op (car exp)) (args (cdr exp)))
           (case op
             ((minus) (apply-op1 ek - args))
             ((sqrt) (apply-op1 ek sqrt args))
             (else (complain ek "invalid unary operator" op)))))
        ((and (list? exp) (= (length exp) 3))
         (let ((op (car exp)) (args (cdr exp)))
           (case op
             ((add) (apply-op2 ek + args))
             ((sub) (apply-op2 ek - args))
             ((mul times) (apply-op2 ek * args))
             ((div) (apply-op2 ek / args))
             ((expt) (apply-op2 ek expt args))
             (else (complain ek "invalid binary operator" op)))))
        (else (complain ek "invalid expression" exp)))))
  (define apply-op1
    (lambda (ek op args)
      (op (do-calc ek (car args)))))
  (define apply-op2
    (lambda (ek op args)
      (op (do-calc ek (car args)) (do-calc ek (cadr args)))))
  (define complain
    (lambda (ek msg exp)
      (ek (list msg exp))))
  (set! calc
    (lambda (exp)
      (call/cc
        (lambda (ek)
          (do-calc ek exp))))))
