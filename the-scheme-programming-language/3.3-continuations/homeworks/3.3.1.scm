; use call/cc write a program that loops indefinitely

(let ([k.n (call/cc (lambda (k) (cons k 0)))])
  (let ([k (car k.n)] [n (cdr k.n)])
    (write n)
    (newline)
    (k (cons k (+ n 1)))))


(call-with-values
  (lambda () (call/cc (lambda (k) (values k 0))))
  (lambda (k n)
    (write n)
    (newline)
    (k k (+ n 1))))
