(define-syntax and
  (syntax-rules ()
    [(_) #t]
    [(_ e) e]
    [(_ e1 e2 e3 ...)
      (if e1 (and e2 e3 ...) #f)]))
