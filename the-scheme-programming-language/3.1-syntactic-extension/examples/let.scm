(define-syntax newlet
  (syntax-rules ()
    [(_ ((x e) ...) b1 b2 ...)
      ((lambda (x ...) b1 b2 ...) e ...)]))
