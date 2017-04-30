(define list?
  (lambda (x)
    (letrec ([race
                (lambda (h t)
                  (if (pair? h)
                      (let ([h (cdr h)])
                        (if (pair? h)
                            (and (not (eq? h t))
                                 (race (cdr h) (cdr t)))
                            (null? h)))
                      (null? h)))])
      (race x x))))
