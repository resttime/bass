(in-package #:cl-user)
(asdf:defsystem bass
  :description "Bindings for the BASS Audio Library"
  :version "0.1"
  :serial t
  :components ((:file "bass"))
  :depends-on (:cffi))
