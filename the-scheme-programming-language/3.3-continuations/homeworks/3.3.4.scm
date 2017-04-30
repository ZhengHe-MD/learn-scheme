(define lwp-queue (make-queue))
(define lwp
  (lambda (thunk)
    (putq! lwp-queue thunk)))
(define start
  (lambda ()
    (let ((p (getq lwp-queue)))
      (delq! lwp-queue)
      (p))))
(define pause
  (lambda ()
    (call/cc
      (lambda (k)
        (lwp (lambda () (k #f)))
        (start)))))
