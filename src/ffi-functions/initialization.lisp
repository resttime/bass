(in-package #:bass)

(defcfun ("BASS_ErrorGetCode" error-get-code) error-codes)
(defcfun ("BASS_Free" free) :bool)
(defcfun ("BASS_GetCPU" get-cpu) :float)
(defcfun ("BASS_GetDevice" get-device) dword)
(defcfun ("BASS_GetDeviceInfo" get-device-info) :bool
  (device dword) (info (:pointer (:struct device-info))))
(defcfun ("BASS_GetDSoundObject" get-dsound-object) :pointer
  (object dword))
(defcfun ("BASS_GetInfo" get-info) :bool (info (:pointer (:struct info))))
(defcfun ("BASS_GetVersion" get-version) dword)
(defcfun ("BASS_GetVolume" get-volume) :float)
(defcfun ("BASS_Init" init) :bool
  (device :int) (freq dword) (flags device-flags) (win :pointer) (dsguid :pointer))
(defcfun ("BASS_Pause" pause) :bool)
(defcfun ("BASS_SetDevice" set-device) :bool (device dword)) 
(defcfun ("BASS_SetVolume" set-volume) :bool (volume :float))
(defcfun ("BASS_Start" start) :bool)
(defcfun ("BASS_Stop" Stop) :bool)
(defcfun ("BASS_Update" update) :bool (length dword))
