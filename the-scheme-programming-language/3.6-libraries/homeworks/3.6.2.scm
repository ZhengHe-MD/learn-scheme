(define $distribution
  (lambda (ls)
    (let loop ([ls ls] [a 0] [b 0] [c 0] [d 0] [f 0])
      (if (null? ls)
          (list (list a 'a) (list b 'b) (list c 'c)
            (list d 'd) (list f 'f))
          (case (car ls)
            [(a) (loop (cdr ls) (+ a 1) b c d f)]
            [(b) (loop (cdr ls) a (+ b 1) c d f)]
            [(c) (loop (cdr ls) a b (+ c 1) d f)]
            [(d) (loop (cdr ls) a b c (+ d 1) f)]
            [(f) (loop (cdr ls) a b c d (+ f 1))]
           ; ignore x grades, per preceding exercise
            [(x) (loop (cdr ls) a b c d f)]
            [else (assertion-violation 'distribution
                    "unrecognized grade letter"
                    (car ls))])))))
(define-syntax distribution
  (syntax-rules ()
    [(_ g1 g2 ...)
     ($distribution '(g1 g2 ...))]))
