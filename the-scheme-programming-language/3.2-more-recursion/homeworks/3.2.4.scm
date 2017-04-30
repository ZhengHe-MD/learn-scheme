(define count1 0)

(define fibonacci-double-recursive-count
  (lambda (n)
    (let fib ([i n])
      (set! count1 (+ count1 1))
      (cond
        [(= i 0) 0]
        [(= i 1) 1]
        [else (+ (fib (- i 1))
                 (fib (- i 2)))]))))
(define count2 0)
(define fibonacci-single-recursive-count
  (lambda (n)
    (set! count2 (+ count2 1))
    (if (= n 0)
      (begin (set! count2 (+ count2 1)) 0)
      (let fib ([i n] [a1 0] [a2 1])
        (set! count2 (+ count2 1))
        (if (= i 1)
            a2
            (fib (- i 1) a2 (+ a1 a2)))))))
