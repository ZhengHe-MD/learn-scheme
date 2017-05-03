(define car&cdr
  (lambda (p k)
    (k (car p) (cdr p))))

(car&cdr '(a b c)
  (lambda (x y)
    (list y x)))

(car&cdr '(a b c) cons)
(car&cdr '(a b c a d) memv)
