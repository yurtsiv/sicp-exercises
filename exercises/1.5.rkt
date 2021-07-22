#lang racket

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))
; If an interpreter uses applicative-order evaulation (Scheme uses it)
; it tries to evaluate p first, which is infinitely recursive,
; thus the interpreter halts; 
;
; If an interpreter uses normal-order evaluation
; it's going to substitute params first resulting in
; (if (= 0 0) 0 (p)) which evaulates to 0
