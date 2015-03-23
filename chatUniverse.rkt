;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname chatUniverse) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/universe)
(require picturing-programs)

(define-struct verse (all msgs))

(define (add-verse verse world)
  (make-verse (cons world (verse-all verse))
              (verse-msgs verse)))

(define (add-msg verse msg)
  (make-verse (verse-all verse)
              (cons msg (verse-msgs verse))))

(check-expect (add-verse (make-verse (list "d" "l" "c")(list "Hi" "Wow" "Oh")) "j")
              (make-verse (list "j" "d" "l" "c")(list "Hi" "Wow" "Oh")))

(check-expect (add-msg (make-verse (list "d" "l" "c")(list "Hi" "Wow" "Oh")) "Hello")
              (make-verse (list "d" "l" "c")(list "Hello" "Hi" "Wow" "Oh")))

(define (new-world verse world)
  (make-bundle (add-verse verse world)                           
                (string-append (iworld-name world) " has joined the chat")))

(check-expect (new-world (make-verse (list "L" "C" "D")
                                     (list "hi" "boo" "bruh")) 
                         iworld1)
              (make-package (make-verse (list iworld1 "L" "C" "D")
                                        (list "hi" "boo" "bruh"))
                            "iworld1 has joined the chat"))
                         