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
  (make-bundle (add-verse (add-msg verse (string-append (iworld-name world) " has entered the chat.")) world)
               (verse-msgs(add-msg verse (string-append (iworld-name world) " has entered the chat.")))))

(check-expect (new-world (make-verse (list "a" "b" "c")
                                     (list "hi" "boo" "why"))
                         iworld1)
              (make-bundle (make-verse (list "iworld" "a" "b" "c")
                                       (list "iworld has entered the chat" "hi" "boo" "why"))
                           (list "iworld has entered the chat" "hi" "boo" "why")
                           (list "iworld" "a" "b" "c")))

