(define atom?
  (lambda (x)
    (if (pair? x)
        #f
        #t)))
(display (atom? 1))
(display (atom? '(1 2)))
