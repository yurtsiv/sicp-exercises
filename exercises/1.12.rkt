#lang racket

; n - row, k - index in row
; assumes that n & k are valid
(define (pascal-num n k)
  (if (or (= n 0) (= k 0) (= n k)) 1
      (+ (pascal-num (- n 1) (- k 1)) (pascal-num (- n 1) k)) 
      )
  )