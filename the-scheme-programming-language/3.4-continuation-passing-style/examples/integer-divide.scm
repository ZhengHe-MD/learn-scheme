(define integer-divide
  (lambda (x y success failure)
    (if (= y 0)
        (failure "divide by zero")
        (let ([q (quotient x y)])
          (success q (- x (* q y)))))))

(integer-divide 10 3 list (lambda (x) x))
(integer-divide 10 0 list (lambda (x) x))
