(define lazy
  (lambda (t)
    (let ([val #f] [flag #f])
      (lambda ()
        (if (not flag)
            (begin (set! val (t))
                   (set! flag #t))
            val)))))

(define p
  (lazy (lambda ()
          (display "Ouch!")
          (newline)
          "got me")))
