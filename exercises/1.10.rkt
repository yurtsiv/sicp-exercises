#lang racket

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

; What are the values of the following expressions?
;
; (A 1 10)  -> 2 ^ (10)
; (A 2 4)   -> 2 ^ 16
; (A 3 3)   -> same as (A 2 4)

(define (f n) (A 0 n))   ; 2 * n
(define (g n) (A 1 n))   ; 2 ^ n
(define (h n) (A 2 n))   ; 2 ^ (2 ^ (2 ^ (...))) n times
(define (k n) (* 5 n n)) ; 5 * (n ^ 2)