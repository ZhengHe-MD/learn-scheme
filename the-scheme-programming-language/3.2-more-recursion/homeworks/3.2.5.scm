(define-syntax let
  (syntax-rules ()
    [(_ ((x e) ...) b1 b2 ...)
      ((lambda (x ...) b1 b2 ...) e ...)]
    [(_ name ((x e) ...) b1 b2 ...)
      (letrec ([name (lambda (x ...) b1 b2 ...)]) (name e ...)]))


(define-syntax let
  (syntax-rules ()
    [(_ ((x v) ...) e1 e2 ...)
     ((lambda (x ...) e1 e2 ...) v ...)]
    [(_ f ((x v) ...) e1 e2 ...)
     ((letrec ([f (lambda (x ...) e1 e2 ...)]) f) v ...)]))
