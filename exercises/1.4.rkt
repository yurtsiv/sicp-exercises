#lang racket

; if b > 0 then it's (a + b), otherwise (a - b)
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
