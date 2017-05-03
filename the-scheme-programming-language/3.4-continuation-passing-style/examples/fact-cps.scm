(define fact-cps
  (lambda (n C)
    (if (zero? n)
        (C 1)
        (fact-cps
          (- n 1)
          (lambda (result_n-1)
            (C (* n result_n-1)))))))
