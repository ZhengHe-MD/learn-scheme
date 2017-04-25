(define race
  (lambda (hare tortoise)
    (if (pair? hare)
        (let ((hare (cdr hare)))
          (if (pair? hare)
              (and (not (eq? hare tortoise))
                   (race (cdr hare) (cdr tortoise)))
              (null? hare)))
        (null? hare))))

(define list?
  (lambda (x)
    (race x x)))
