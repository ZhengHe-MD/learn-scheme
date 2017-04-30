(define fabonacci
  (lambda (n)
    (if (= n 0)
      0
      (let fib ([i n] [a1 0] [a2 1])
        (if (= i 1)
            a2
            (fib (- i 1) a2 (+ a1 a2)))))))
