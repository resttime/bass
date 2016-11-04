(in-package #:bass)

(defcfun ("BASS_FXGetParameters" fx-get-parameters) :bool
  (handle hfx) (params :pointer)) 
(defcfun ("BASS_FXReset" fx-reset) :bool
  (handle hfx))
(defcfun ("BASS_FXSetParameters" fx-set-parameters) :bool
  (handle hfx) (params :pointer))
(defcfun ("BASS_FXSetPriority" fx-set-priority) :bool
  (handle hfx) (priority :int)) 
