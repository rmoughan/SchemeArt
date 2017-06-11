;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: 00111111
;;;
;;; Description:
;;;    where the code ends and /
;;;    nature begins, few know. What /
;;;    is reality?

(define (sun paint x y)
  (setpos x y)
  (pendown)
  (color paint)
  (begin_fill)
  (circle 50)
  (end_fill)
  (penup)
)

(define (mountains paint len x y)
  (cond
  ((< x 200)
    (setpos x y)
    (setheading 45)
    (color paint)
    (pendown)
    (begin_fill)
    (fd len)
    (setheading 135)
    (fd len)
    (end_fill)
    (mountains paint len (+ x len) y)
    (penup)
  ))
)

(define (sky paint start len)
    (cond
      ((> start 35)
      (setpos -360 start)
      (begin_fill)
      (color (car paint))
      (pendown)
      (setpos -360 (- start len))
      (setpos 360 (- start len))
      (setpos 360 start)
      (end_fill)
      (sky (cdr paint) (- start len) len)
      )
      (else (penup))
    )
)

(define (meadows x y)
  (cond
    ((<= x 350)
      (setpos x y)
      (setheading 0)
      (color (rgb .078 .78 (+ (/ y 306) 1.124)))
      (if (= (randint 0 2 1) 0) (zero) (one))
      (penup)
      (setpos (- x 2) (+ y 5)) (setheading 0)
      (if (= (randint 0 2 1) 0) (zero) (one))
      (penup)
      (meadows (+ x (- 17 (* 5 (/ -320 y)))) y)
    )
    ((<= y -100)
      (meadows -350 (+ y 15)))
    (else penup))

)

(define sky-paints
  (list "#2BE10F" "#13BF33" "#0F9942" "#0A733F")
)


(define (one)
  (pendown)
  (fd 6)
  (lt 135)
  (fd 4)
)

(define (zero)
  (pendown)
  (circle 3)
)

(define (repeat k fn) (if (> k 0)
                (begin (fn) (repeat (- k 1) fn))
                nil))


(define (draw)

  (bgcolor "#000000") (speed 0)(hideturtle)
  (sky sky-paints 336 100)
  (sun "#FFFFFF" 50 242)
  (sun "#000000" 50 250)
  (meadows -350 -320)
  (mountains "#FFFFFF" 242 -378 -87)
  (mountains "#FFFFFF" 242 -427 -87)
  (mountains "#000000" 240 -425 -92)
  (mountains "#5E5E5E" 240 -375 -92)
  (mountains "#9C9C9C" 100 -350 -93)
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
