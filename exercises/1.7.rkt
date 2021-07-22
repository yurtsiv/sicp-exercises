#lang racket

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x)
  )

; Examples of sqrt not working precisely enough:
;
; It stops after 1 or 2 iterations, because it thinks the value is good enough
; due to hardcoded precision (0.001)
(sqrt 0.0001) ; = 0.0323, real value 0.01
(sqrt 0.00001) ; = 0.03156, real value 0.00316


; Examples of sqrt working too long:
; Due to very large numbers, "square" function works
; inprecisely so our "good-enough" test never passes
(sqrt 1000000000000000)


; good enough if guess didn't change by more than 1%
(define (better-good-enough? prev-guess guess)
  (< (/ (abs (- prev-guess guess)) prev-guess) 0.1))

; inefficient, need to store the result of (improve guess x)
(define (better-sqrt-iter guess x)
  (if (better-good-enough? guess (improve guess x))
      guess
      (better-sqrt-iter (improve guess x) x)))

(define (better-sqrt x)
  (better-sqrt-iter 1.0 x)
  )

; Indeed better
(better-sqrt 0.0001) ; = 0.01012, real value 0.01
(better-sqrt 0.00001) ; = 0.00342, real value 0.00316
(better-sqrt 1000000000000000) ; = 32543253.58, real value 31622776.6017