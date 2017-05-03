(define product
  (lambda (ls)
    (call/cc
      (lambda (break)
        (let f ([ls ls])
          (cond
            [(null? ls) 1]
            [(= (car ls) 0) (break 0)]
            [else (* (car ls) (f (cdr ls)))]))))))

; my answer
(define product-cps
  (lambda (ls C)
    (cond
      [(null? ls) (C 1)]
      [(= (car ls) 0) (C 0)]
      [else (product-cps
              (cdr ls)
              (lambda (result)
                      (C (* (car ls) result))))])))

; answer in book
; this is better because no multiplications will happen
; when there is any 0 in the list
(define product-cps
  (lambda (ls k)
    (let ([break k])
      (let f ([ls ls] [k k])
        (cond
          [(null? ls) (k 1)]
          [(= (car ls) 0) (break 0)]
          [else (f (cdr ls)
                   (lambda (x)
                     (k (* (car ls) x))))])))))
