(in-package #:bass)

(defcfun ("BASS_GetConfig" get-config) dword (option config-options))
(defcfun ("BASS_GetConfigPtr" get-config-ptr) :pointer (option config-ptr-options))
(defcfun ("BASS_SetConfig" set-config) :bool (option config-options) (value dword))
(defcfun ("BASS_SetConfigPtr" set-config-ptr) :bool (option config-ptr-options) (value :pointer))
