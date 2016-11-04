(in-package #:bass)

(define-foreign-library bass
  (:darwin "libbass.dylib")
  (:unix "libbass.so")
  (:windows "bass.dll")
  (t (:default (:or "libbass" "bass"))))
(use-foreign-library bass)
