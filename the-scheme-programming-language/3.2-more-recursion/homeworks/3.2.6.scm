(letrec ([even?
          (lambda (x)
            (or (= x 0)
              (odd? (- x 1))))]
         [odd?
          (lambda (x)
            (and (not (= x 0))
              (even? (- x 1))))]))

(define-syntax or
  (syntax-rules ()
    [(_) #f]
    [(_ e1 e2 ...)
     (let ([t e1])
       (if t t (or e2 ...)))]))

(letrec ([even?
            (lambda (x)
              (let ([t (= x 0)])
                (if t
                    t
                    (let ([t (odd? (- x 1))])
                      (if t
                          t
                          (or))))))]
         [odd?
          (lambda (x)
            (and (not (= x 0))
              (even? (- x 1))))]))

(define-syntax or
  (syntax-rules ()
    [(_) #f]
    [(_ e1) e1]
    [(_ e1 e2 ...)
      (let ([t e1])
        (if t t (or e2 ...)))]))

(letrec ([even?
            (lambda (x)
              (let ([t (= x 0)])
                (if t
                    t
                    (odd? (- x 1)))))]
         [odd?
          (lambda (x)
            (and (not (= x 0))
              (even? (- x 1))))]))
; A call in the last subexpression of an or expression in
; tail position would not be a tail call with the modified
; definition of or. For the even?/odd? example, the resulting
; definition of even? would no longer be tail recursive and for
; very large inputs might exhaust available space.
