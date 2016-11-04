(in-package #:bass)

(defcfun ("BASS_ChannelBytes2Seconds" channel-bytes-2-seconds) :double
  (handle dword) (pos qword))
(defcfun ("BASS_ChannelFlags" channel-flags) dword
  (handle dword (flags dword) (mask dword)))
(defcfun ("BASS_ChannelGet3DAttributes" channel-get-3d-attributes) :bool
  (handle dword) (mode :pointer) (min :pointer) (max :pointer) (iangle :pointer)
  (oangle :pointer) (outvol :pointer))
(defcfun ("BASS_ChannelGet3DPosition" channel-get-3d-position) :bool
  (handle dword) (pos :pointer) (orient :pointer)
  (vel :pointer))
(defcfun ("BASS_ChannelGetAttribute" channel-get-attribute) :bool
  (handle dword) (attrib dword) (value :pointer))
(defcfun ("BASS_ChannelGetAttributeEx" channel-get-attribute-ex) dword
  (handle dword) (attrib dword) (value :pointer) (size dword))
(defcfun ("BASS_ChannelGetData" channel-get-data) dword
  (handle dword) (buffer :pointer) (length dword))
(defcfun ("BASS_ChannelGetDevice" channel-get-device) dword
  (handle dword))
(defcfun ("BASS_ChannelGetInfo" channel-get-info) :bool
  (handle dword) (info :pointer))
(defcfun ("BASS_ChannelGetLength" channel-get-length) qword
  (handle dword) (mode dword))
(defcfun ("BASS_ChannelGetLevel" channel-get-level) dword
  (handle dword))
(defcfun ("BASS_ChannelGetLevelEx" channel-get-level-ex) :bool
  (handle dword) (levels :pointer) (length :float) (flags dword))
(defcfun ("BASS_ChannelGetPosition" channel-get-position) qword
  (handle dword) (mode dword))
(defcfun ("BASS_ChannelGetTags" channel-get-tags) :string
  (handle dword) (tags dword))
(defcfun ("BASS_ChannelIsActive" channel-is-active) dword
  (handle dword))
(defcfun ("BASS_ChannelIsSliding" channel-is-sliding) :bool
  (handle dword) (attrib dword))
(defcfun ("BASS_ChannelLock" channel-lock) :bool
  (handle dword) (lock :bool))
(defcfun ("BASS_ChannelPause" channel-pause) :bool
  (handle dword))
(defcfun ("BASS_ChannelPlay" channel-play) :bool
  (handle dword) (restart :bool))
(defcfun ("BASS_ChannelRemoveDSP" channel-remove-dsp) :bool
  (handle dword) (dsp hdsp))
(defcfun ("BASS_ChannelRemoveFX" channel-remove-fx) :bool
  (handle dword) (fx hfx))
(defcfun ("BASS_ChannelRemoveLink" channel-remove-link) :bool
  (handle dword) (chan dword))
(defcfun ("BASS_ChannelRemoveSync" channel-remove-sync) :bool
  (handle dword) (sync hsync))
(defcfun ("BASS_ChannelSeconds2Bytes" channel-seconds-2-bytes) qword
  (handle dword) (pos :double))
(defcfun ("BASS_ChannelSet3DAttributes" channel-set-3d-attributes) :bool
  (handle dword) (mode :int) (min :float) (max :float) (iangle :int) (oangle :int)
  (outvol :float))
(defcfun ("BASS_ChannelSet3DPosition" channel-set-3d-position) :bool
  (handle dword) (pos :pointer) (orient :pointer) (vel :pointer))
(defcfun ("BASS_ChannelSetAttribute" channel-set-attribute) :bool
  (handle dword) (attrib dword) (value :float))
(defcfun ("BASS_ChannelSetAttributeEx" channel-set-attribute-ex) :bool
  (handle dword) (attrib dword) (value :pointer) (size dword))
(defcfun ("BASS_ChannelSetDevice" channel-set-device) :bool
  (handle dword (device dword))) 
(defcfun ("BASS_ChannelSetDSP" channel-set-dsp) hdsp
  (handle dword) (proc :pointer) (user :pointer) (priority :int)) 
(defcfun ("BASS_ChannelSetFX" channel-set-fx) hfx
  (handle dword) (type dword) (priority :int))
(defcfun ("BASS_ChannelSetLink" channel-set-link) :bool
  (handle dword) (chan dword))
(defcfun ("BASS_ChannelSetPosition" channel-set-position) :bool
  (handle dword) (pos qword) (mode dword))
(defcfun ("BASS_ChannelSetSync" channel-set-sync) hsync
  (handle dword) (type dword) (param qword) (proc :pointer) (user :pointer))
 (defcfun ("BASS_ChannelSlideAttribute" channel-slide-attribute) :bool
  (handle dword) (attrib dword) (value :float) (time dword)) 
(defcfun ("BASS_ChannelStop" channel-stop) :bool
  (handle dword)) 
(defcfun ("BASS_ChannelUpdate" channel-update) :bool
  (handle dword) (length dword)) 
