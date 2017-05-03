(define map1
  (lambda (p ls)
    (if (null? ls)
        '()
        (cons (p (car ls))
              (map1 p (cdr ls))))))

; my answer
(define reciprocals-cps
  (lambda (ls)
    (let f ([ls ls] [k (lambda (x) x)])
      (if (null? ls)
          (k '())
          (if (zero? (car ls))
              "zero found"
              (f (cdr ls)
                 (lambda (v)
                    (k (cons (/ 1 (car ls)) v)))))))))

; reference answer
(define map/k
  (lambda (p ls k)
    (if (null? ls)
        (k '())
        (p (car ls)
           (lambda (x)
             (map/k p (cdr ls)
               (lambda (ls)
                 (k (cons x ls)))))))))

(define reciprocals
  (lambda (ls)
    (map/k (lambda (x k) (if (= x 0) "zero found" (k (/ 1 x))))
           ls
           (lambda (x) x))))
