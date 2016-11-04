(in-package #:bass)

(defcfun ("BASS_RecordFree" record-free) :bool)
(defcfun ("BASS_RecordGetDevice" record-get-device) dword)
(defcfun ("BASS_RecordGetDeviceInfo" record-get-device-info) :bool
  (device dword) (info :pointer)) 
(defcfun ("BASS_RecordGetInfo" record-get-info) :bool
  (info :pointer))
(defcfun ("BASS_RecordGetInput" record-get-input) dword
  (input :int) (volume :pointer))
(defcfun ("BASS_RecordGetInputName" record-get-input-name) :string
  (input :int))
(defcfun ("BASS_RecordInit" record-init) :bool
  (device :int)) 
(defcfun ("BASS_RecordSetDevice" record-set-device) :bool
  (device dword)) 
(defcfun ("BASS_RecordSetInput" record-set-input) :bool
  (input :int) (flags dword) (volume :float)) 
(defcfun ("BASS_RecordStart" record-start) hrecord
  (freq dword) (chans dword) (flags dword) (proc :pointer) (user :pointer))
