(define emptyq?
  (lambda (q)
    (eq? (car q) (cdr q))))

(define getq
  (lambda (q)
    (if (emptyq? q)
        (error 'getq "the queue is empty")
        (car (car q)))))

(define delq!
  (lambda (q)
    (if (emptyq? q)
        (error 'delq! "the queue is empty")
        (set-car! q (cdr (car q))))))
