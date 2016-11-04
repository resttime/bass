(in-package #:cl-user)
(asdf:defsystem bass
  :description "Bindings for the BASS Audio Library"
  :author "resttime"
  :license "BSD (Keep in mind that BASS has it's own separate license)"
  :version "0.0.2"
  :serial t
  :components
  ((:module "src"
    :components ((:file "package")
                 (:file "library")
                 (:file "constants")
                 (:file "types")
                 (:module "ffi-functions"
                  :components
                  ((:file "config")
                   (:file "plugins")
                   (:file "initialization")
                   (:file "3d-eax")
                   (:file "samples")
                   (:file "streams")
                   (:file "mod-mo3")
                   (:file "recording")
                   (:file "channels")
                   (:file "effects"))))))
  :depends-on (:cffi))
