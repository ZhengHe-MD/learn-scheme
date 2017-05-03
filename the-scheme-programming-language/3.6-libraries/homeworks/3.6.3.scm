(define histogram
  (lambda (port distr)
    (for-each
      (lambda (n g)
        (put-datum port g)
        (put-string port ": ")
        (let loop ([n n])
          (unless (= n 0)
            (put-char port #\*)
            (loop (- n 1))))
        (put-string port "\n"))
      (map car distr)
      (map cadr distr))))
