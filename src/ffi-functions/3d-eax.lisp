(in-package #:bass)

(defcfun ("BASS_Apply3D" apply-3d) :void)
(defcfun ("BASS_Get3DFactors" get-3d-factors) :bool
  (distf :pointer) (rollf :pointer) (doppf :pointer))
(defcfun ("BASS_Get3DPosition" get-3d-position) :bool
  (pos (:pointer (:struct 3d-vector))) (vel (:pointer (:struct 3d-vector)))
  (front (:pointer (:struct 3d-vector))) (top (:pointer (:struct 3d-vector))))
(defcfun ("BASS_Set3DFactors" set-3d-factors) :bool
  (distf :float) (rollf :float) (doppf :float))
(defcfun ("BASS_Set3DPosition" set-3d-position) :bool
  (pos (:pointer (:struct 3d-vector))) (vel (:pointer (:struct 3d-vector)))
  (front (:pointer (:struct 3d-vector))) (top (:pointer (:struct 3d-vector)))) 
(defcfun ("BASS_SetEAXParameters" set-eax-parameters) :bool
  (env eax-environment) (vol :float) (decay :float) (damp :float)) 
