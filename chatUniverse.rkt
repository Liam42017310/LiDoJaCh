;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname chatUniverse) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/universe)
(require picturing-programs)

(define-struct verse (state all msgs))

(define (add-verse verse world)
  (make-verse (verse-state verse)
              (cons world (verse-all verse))
              (verse-msgs verse)))

(define (add-msg verse msg)
  (make-verse (verse-state verse)
              (verse-all verse)
              (cons msg (verse-msgs verse))))

(check-expect (add-verse (make-verse 'active (list "d" "l" "c")(list "Hi" "Wow" "Oh")) "j")
              (make-verse 'active (list "j" "d" "l" "c")(list "Hi" "Wow" "Oh")))

(check-expect (add-msg (make-verse 'active (list "d" "l" "c")(list "Hi" "Wow" "Oh")) "Hello")
              (make-verse 'active (list "d" "l" "c")(list "Hello" "Hi" "Wow" "Oh")))