(define reciprocal
  (lambda (n)
    (if (zero? n)
        "oops!"
        (/ 1 n))))

(define reciprocal-cps
  (lambda (n success fail)
    (if (zero? n)
        (fail "oops!")
        (success (/ 1 n)))))
