(define-syntax gpa
  (syntax-rules ()
    [(_ g1 g2 ...)
     (let ([ls (map letter->number (remq 'x '(g1 g2 ...)))])
       (if (null? ls)
           'x
           (/ (apply + ls) (length ls))))]))
