(in-package #:cl-user)
(asdf:defsystem bass
  :description "Bindings for the BASS Audio Library"
  :author "resttime"
  :license "BSD (Keep in mind that BASS has it's own separate license)"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "types-constants")
               (:file "bass"))
  :depends-on (:cffi))
