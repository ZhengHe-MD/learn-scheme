(define remv
    (lambda (x ls)
      (cond
        [(null? ls) '()]
        [(eqv? x (car ls)) (remv x (cdr ls))]
        [else (cons (car ls) (remv x (cdr ls)))])))
