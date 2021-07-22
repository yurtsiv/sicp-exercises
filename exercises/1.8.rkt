#lang racket

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3 )
  )

(define (good-enough? prev-guess guess)
  (< (/ (abs (- prev-guess guess)) prev-guess) 0.1))

; inefficient, need to store the result of (improve guess x)
(define (cube-root-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (cube-root-iter (improve guess x) x)))

(define (cube-root x)
  (cube-root-iter 1.0 x)
  )
