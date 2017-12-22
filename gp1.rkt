;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname gp1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Here is an example based on an exercise from HtDP/2e:
;
;Design a data representation for the following four kinds of zoo animals:
;
;spiders, whose relevant attributes are the number of remaining legs (we assume that spiders can lose legs in accidents) and the space they need in case of transport;
;elephants, whose only attributes are the space they need in case of transport;
;boa constrictor, whose attributes include length and girth; and
;armadillo, for whom you must determine appropriate attributes; they need to include attributes that determine space needed for transportation.
;Write a data definition for ZooAnimal. Be sure to include:
;
;Representation and Interpretation
;Implementation (structure definitions)
;Constructor Template
;Observer Template
;Examples


;Data definition: An ZooAnimal is represented as following:
;--spiders,elephants,bia cibstructir,armadillo:
;spiders->spider(num-legs,space );elephants(space);boa constrictor(length,girth)
;armadillo(space)

;Constructor template:
;(make-spider num-lges space)
;(make-elephant space)
;(make-boa length girth)
;(make-armadilo space)


;;; INTERPRETATION OF FIELDS:
;; num-legs    : NonNegInt    number of legs of this animal
;; space   : PosReal      volume of shipping container required for
;;                         this animal, in cm^3.
;; length   : PosReal      length of this animal in cm
;; girth    : PosReal      girth of this animal, in cm
;; appetite : PosReal      appetite of this animal (in cm^3 of ants
;;                         per day:)

;Implementation:
(define-struct spider(num-legs space))
(define-struct elephants(space))
(define-struct boa(length girth))
(define-struct armadilo(space length appetite))

;Observer template
 ;za-fnc:ZooAnimal->??
  (define (za-fnc a)
   (cond
     [(spider? a)
      (...
       (spider-num-legs a)
       (spider-space a)
     [(elephant? a)
      (...
       (elephant-space a)
     [(boa? a)
      (...
       (boa-length a)
       (boa-girth a)
     [(armadilo? a)
      (...
       (armadilo-space))])])])]))
       
;Examples one
(define spider1(8 7))
(define elephant2(70000))
(define boa3(7 6.28))
 (define armidilo(12,300,200))
