(define factor
  (lambda (x)
    (letrec ([fact
              (lambda (n i)
                (cond
                  [(>= i n) (list n)]
                  [(integer? (/ n i))
                    (cons i (fact (/ n i) i))]
                  [else (fact n (+ i 1))]))])
      (fact x 2))))
