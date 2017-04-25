(define make-queue
  (lambda ()
    (cons '() '())))

(define putq!
  (lambda (q v)
    (let ((p (cons v '())))
      (if (null? (car q))
          (begin
            (set-car! q p)
            (set-cdr! q p))
          (begin
            (set-cdr! (cdr q) p)
            (set-cdr! q p))))))

(define getq
  (lambda (q)
    (car (car q))))

(define delq!
  (lambda (q)
    (if (eq? (car q) (cdr q))
        (begin
          (set-car! q '())
          (set-cdr! q '()))
        (set-car! q (cdr (car q))))))
