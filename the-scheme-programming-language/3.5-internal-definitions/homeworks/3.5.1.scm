(define-syntax complain
  (syntax-rules ()
    ((_ ek msg exp) (ek (list msg exp)))))
