(define factor
  (lambda (n)
    (let f ([n n] [i 2])
      (let ([q (/ n i)])
        (cond
          [(>= i (sqrt n)) (list n)]
          [(integer? q) (cons i (f q i))]
          [else (f n (if (> i 2)
                         (+ i 2)
                         (+ i 1)))])))))

(define factor1
 (lambda (n)
   (let f ((n n) (i 2) (step 1))
     (if (> i (sqrt n))
         (list n)
         (let ((n/i (/ n i)))
           (if (integer? n/i)
               (cons i (f n/i i step))
               (f n (+ i step) 2)))))))

(define factor2
  (lambda (n)
    (let f ([n n] [i 2] [step 1])
      (if (> (* i i) n)
          (list n)
          (let ([n/i (/ n i)])
            (if (integer? n/i)
                (cons i (f n/i i step))
                (f n (+ i step) 2)))))))

(define factor3
  (lambda (n)
    (let f ((n n) (i 2) (step 1))
      (if (> (* i i) n)
          (list n)
          (if (= (gcd n i) 1)
              (f n (+ i step) 2)
              (cons i (f (/ n i) i step)))))))
