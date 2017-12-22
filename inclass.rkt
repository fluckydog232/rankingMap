;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname inclass) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; A Spaceship is represented as one of two structs:
;;; (make-mothership (name crew daughters))
;;; -- which represents a mother ship
;;; (make-drone)
;;; -- which represents a drone
;;; INTERPRETATION:
;;;  name      : String        is the name of the ship
;;;  crew      : MartianList   is the list of crewmembers of the ship
;;;  daughters : SpaceshipList is the list of daughter ships
;
;;; IMPLEMENTATION:
;(define-struct mothership (name crew daughters))
;(define-struct drone ())
;
;;; CONSTRUCTOR TEMPLATES:
;;; (make-mothership String MartianList ShipList)
;;; (make-drone)
;
;(define (make-drone) “drone”)
;(define (drone? s) (and
;                    (string? s)
;                    (string=? S “drone”)))
;
;;; Template
;;; ship-fn : Spaceship -> ??
;#;
;(define (ship-fn s)
;  (cond
;    [(mothership? s) 
;     (... (mothership-name s)
;          (martian-list-fn (mothership-crew s))
;          (ship-list-fn    (mothership-daughters s)))]
;    [(drone? s) 
;     ...]))
;
;
;;; A ShipList is either - 
;;; -- empty
;;; -- (cons Spaceship ShipList)
;
;;; Template
;;; ship-list-fn : ShipList -> ??
;#;
;(require rackunit)
;(require "extras.rkt")
;
;;; A spaceshhip is represented as SpaShip which is either
;;; (make-spaceship name crew daughters)
;;; (make-drone name)
;
;;; INTERP
;;; name: String (any string will do)  --the name of the person or mothership
;;; crew: StringList, list of crew names
;;; daughter: mothershipList, list of daughter spaceships
;;; drone is a special mothership with all fields set to empty
;;; IMPLEMENTATION
;(define-struct mothership(name crew daughters))
;(define-struct drone())
;(define-struct martian(name))
;
;;; CONSTRUCTOR TEMPLATES:
;;; (make-mothership String MartianList ShipList)
;;; (make-drone)
;
;;(define (make-drone) “drone”)
;;(define (drone? s) (and
;;                      (string? s)
;;                      (string=? s “drone”)))
;
;
;;;martian-with-name: String Spaceship-> Number
;(define (martian-with-name name ss)
;  (cond
;    [(empty? (mothership-crew ss))
;     (martian-with-name-l name (mothership-daughters ss))]
;    [else
;     (+ (num-in-crew name (mothership-crew ss))
;        (martian-with-name-l name (mothership-daughters ss)))]))
;
;;; martian-with-name-l: String SpaceshipList -> Number
;(define (martian-with-name-l name ssl)
;  (cond
;    [(empty? ssl) 0]
;    [else
;     (+
;      (martian-with-name name (first ssl)
;                         (martian-with-name-l name (rest ssl))))]))
;
;
;
;(define-struct mothership(name crew daughters))
;(define-struct drone())
;(define-struct martian(name))
;;;;; num-in-crew: String StringList -> Number
;;;(define (num-in-crew name crew)
;;;  (cond
;;;    [(empty? crew) 0]
;;;    [(string=? name (first crew))
;;;     (+ 1
;;;        (num-in-crew name (rest crew)))]
;;;    [else
;;;     (num-in-crew name (rest crew))]))
;
;(define (replace-ship-with-mork name)
;  cond
;  [empty? (mother-ship empty)
;           [remove martian-with-name(mother-ship list) ]      

;; A Spaceship is represented as one of two structs:
;; (make-mothership (name crew daughters))
;; -- which represents a mother ship
;; (make-drone)
;; -- which represents a drone
;; INTERPRETATION:
;;  name      : String        is the name of the ship
;;  crew      : MartianList   is the list of crewmembers of the ship
;;  daughters : SpaceshipList is the list of daughter ships

;; IMPLEMENTATION:
(define-struct mothership (name crew daughters))
(define-struct drone ())

;; CONSTRUCTOR TEMPLATES:
;; (make-mothership String MartianList ShipList)
;; (make-drone)

(define (make-drone) “drone”)
(define (drone? s) (and
                      (string? s)
                      (string=? S “drone”)))

;; Template
;; ship-fn : Spaceship -> ??
#;
(define (ship-fn s)
  (cond
    [(mothership? s) 
     (... (mothership-name s)
          (martian-list-fn (mothership-crew s))
          (ship-list-fn    (mothership-daughters s)))]
    [(drone? s) 
     ...]))


;; A ShipList is either - 
;; -- empty
;; -- (cons Spaceship ShipList)

;; Template
;; ship-list-fn : ShipList -> ??
#;
(define (ship-list-fn los)
  (cond
    [(empty? los) ...]
    [else (... (ship-fn (first los))
               (ship-list-fn (rest los)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; A Martian is represented as a struct
;; (make-martian name)
;; INTERPRETATION
;; name : String   is the name of the martian

;; IMPLEMENTATION
(define-struct martian (name))

;; CONSTRUCTOR TEMPLATE
;; (make-martian String)

;; OBSERVER TEMPLATE
;; martian-fn : Martian -> ??
#;
(define (martian-fn m)
  (... (martian-name m)))


;; A MartianList is one of - 
;; -- empty
;; -- (cons Martian MartianList)
;; Template
;; martian-list-fn : MartianList -> ??
#;
(define (martian-list-fn ms)
  (cond 
    [(empty? ms) ...]
    [else (... (martian-fn (first ms))
               (martian-list-fn (rest ms)))]))


;; an example. 

(define ship1
  (make-mothership "qwerk"
    ;; the crew
    (list
      (make-martian "hork")
      (make-martian "bork")
      (make-martian "quork"))
    ;; the daughters
    (list
      (make-mothership "berk"
        (list
          (make-martian "alfalfa")
          (make-martian "balfalfa")
          (make-martian "mork"))
        (list
          (make-drone)
          (make-mothership "little-berk"
            empty
            empty)
          (make-mothership "little-berk2"
            (list
              (make-martian "jork")
              (make-martian "dork")
              (make-martian "mork"))
            empty)))
      (make-mothership "herk"
        (list
          (make-martian "peon")
          (make-martian "deon"))
        empty))))


(define (after-remove-string fleet str)
 (cond
   [(drone? ship) ship]
   [(mothersihp? ship)(make-mothership (mothership-name ship)
                                       (mothership-crew ship)
    (foldr cons empty
           (filter (lambda (s))
                  (or (drone? s)
                      (not andmap (member? name
                                    (map maritian-name
                                         (mothership-crew s)
                                         (mothership-daughter ship))))