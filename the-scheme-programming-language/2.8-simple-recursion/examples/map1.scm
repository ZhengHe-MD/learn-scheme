(define map1
  (lambda (fn ls)
    (if (null? ls)
        '()
        (cons (fn (car ls))
              (map1 fn (cdr ls))))))
