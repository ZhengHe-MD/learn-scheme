(define append
  (lambda (ls1 ls2)
    (if (null? ls1)
        ls2
        (append (cdr ls1) (cons (car ls1) ls2)))))
