#lang racket

(define (square x)
  (* x x))

(define (sum-of-squares-of-two-largest x y z)
  (cond ((and (>= y x) (>= z x)) (+ (square y) (square z)))
        ((and (>= x y) (>= z y)) (+ (square x) (square z)))
        (else (+ (square x) (square y)))))
