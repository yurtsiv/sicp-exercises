#lang scheme

; recursive process
(define (f-rec n)
  (if (< n 3) n
      (+ (f-rec (- n 1)) (* 2 (f-rec (- n 2))) (* 3 (f-rec (- n 3))))
      )
  )

; iterative process
(define (f-iter n)
  ; a = f(n - 3), b = f(n - 2), c = f(n - 1)
  (define (help count a b c)
    (if (= count 1) c
        (help (- count 1) b c (+ c (* 2 b) (* 3 a)) )
        ))
  (if (< n 3) n
      (help (- n 1) 0 1 2)))