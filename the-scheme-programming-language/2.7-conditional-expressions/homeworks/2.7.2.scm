(define shorter
  (lambda (lsa lsb)
    (let ([lengtha (length lsa)]
          [lengthb (length lsb)])
          (cond
            [(<= lengtha lengthb) lsa]
            [(> lengtha lengthb) lsb]))))
