(define factorial
  (lambda (n)
    (let fact ([i n])
      (if (= i 0)
          1
          (* i (fact (- i 1)))))))
