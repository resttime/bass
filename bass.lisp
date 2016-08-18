(in-package #:cl-user)
(defpackage #:bass
  (:use #:cl #:cffi))
(in-package #:bass)

(define-foreign-library bass
  (:darwin "libbass.dylib")
  (:unix "libbass.so")
  (:windows "bass.dll")
  (t (:default (:or "libbass" "bass"))))
(use-foreign-library bass)

;; Define types
(defctype dword :unsigned-long)
(defctype qword :unsigned-long-long)
(defctype hmusic dword)
(defctype hsample dword)
(defctype hchannel dword)
(defctype hstream dword)
(defctype hrecord dword)
(defctype hsync dword)
(defctype hdsp dword)
(defctype hfx dword)
(defctype hplugin dword)

;; Config - Complete
(defcfun ("BASS_GetConfig" get-config) dword (option dword))
(defcfun ("BASS_GetConfigPtr" get-config-ptr) :pointer (option dword))
(defcfun ("BASS_SetConfig" set-config) :bool
  (option dword) (value dword))
(defcfun ("BASS_SetConfigPtr" set-config-ptr) :bool (option dword) (value :pointer))

;; Plugins - Complete
(defcfun ("BASS_PluginFree" plugin-free) :bool (handle hplugin))
(defcfun ("BASS_PluginGetInfo" plugin-get-info) :pointer (handle hplugin))
(defcfun ("BASS_PluginLoad" plugin-load) hplugin (file :string) (flags dword))

;; Initialization, info, etc... - Complete
(defcfun ("BASS_ErrorGetCode" error-get-code) :int)
(defcfun ("BASS_Free" free) :bool)
(defcfun ("BASS_GetCPU" get-cpu) :float)
(defcfun ("BASS_GetDevice" get-device) dword)
(defcfun ("BASS_GetDeviceInfo" get-device-info) :bool
  (device dword) (info :pointer))
(defcfun ("BASS_GetDSoundObject" get-dsound-object) :pointer
  (object dword))
(defcfun ("BASS_GetInfo" get-info) :bool (info :pointer))
(defcfun ("BASS_GetVersion" get-version) dword)
(defcfun ("BASS_GetVolume" get-volume) :float)
(defcfun ("BASS_Init" init) :bool
  (device :int) (freq dword) (flags dword) (win :pointer) (dsguid :pointer))
(defcfun ("BASS_Pause" pause) :bool)
(defcfun ("BASS_SetDevice" set-device) :bool (device dword)) 
(defcfun ("BASS_SetVolume" set-volume) :bool (volume :float))
(defcfun ("BASS_Start" start) :bool)
(defcfun ("BASS_Stop" Stop) :bool)
(defcfun ("BASS_Update" update) :bool (length dword))

;; 3D & EAX - Complete
(defcfun ("BASS_Apply3D" apply-3d) :void)
(defcfun ("BASS_Get3DFactors" get-3d-factors) :bool
  (distf :pointer) (rollf :pointer) (doppf :pointer))
(defcfun ("BASS_Get3DPosition" get-3d-position) :bool
  (pos :pointer) (vel :pointer) (front :pointer)
  (top :pointer))
(defcfun ("BASS_GetEAXParameters" get-eax-parameters) :bool
  (env :pointer) (vol :pointer) (decay :pointer) (damp :pointer))
(defcfun ("BASS_Set3DFactors" set-3d-factors) :bool
  (distf :float) (rollf :float) (doppf :float))
(defcfun ("BASS_Set3DPosition" set-3d-position) :bool
  (pos :pointer) (vel :pointer) (front :pointer) (top :pointer)) 
(defcfun ("BASS_SetEAXParameters" set-eax-parameters) :bool
  (env :int) (vol :float) (decay :float) (damp :float)) 

;; Samples - Complete
(defcfun ("BASS_SampleCreate" sample-create) hsample
  (length dword) (freq dword) (chans dword) (max dword) (flags dword))
(defcfun ("BASS_SampleFree" sample-free) :bool (handle hsample))
(defcfun ("BASS_SampleGetChannel" sample-get-channel) hchannel
  (handle hsample) (onlynew :bool))
(defcfun ("BASS_SampleGetChannels" sample-get-channels) dword
  (handle hsample) (*channels hchannel))
(defcfun ("BASS_SampleGetData" sample-get-data) :bool
  (handle hsample) (buffer :pointer))
(defcfun ("BASS_SampleGetInfo" sample-get-info) :bool
  (handle hsample) (info :pointer))
(defcfun ("BASS_SampleLoad" sample-load) hsample
  (mem :bool) (file :pointer) (offset qword) (length dword) (max dword)
  (flags dword))
(defcfun ("BASS_SampleSetData" sample-set-data) :bool
  (handle hsample) (buffer :pointer)) 
(defcfun ("BASS_SampleSetInfo" sample-set-info) :bool
  (handle hsample) (info :pointer))  
(defcfun ("BASS_SampleStop" sample-stop) :bool (handle hsample))

;; Streams - Complete
(defcfun ("BASS_StreamCreate" stream-create) hstream
  (freq dword) (chans dword) (flags dword) (proc :pointer) (user :pointer))
(defcfun ("BASS_StreamCreateFile" stream-create-file) hstream
  (mem :bool) (file :string) (offset qword) (len qword) (flags dword))
(defcfun ("BASS_StreamCreateFileUser" stream-create-file-user) hstream
  (system dword) (flags dword) (procs :pointer) (user :pointer))
(defcfun ("BASS_StreamCreateURL" stream-create-url) hstream
  (url :string) (offset dword) (flags dword) (proc :pointer) (user :pointer))
(defcfun ("BASS_StreamFree" stream-free) :bool (handle hstream))
(defcfun ("BASS_StreamGetFilePosition" stream-get-file-position) qword
  (handle hstream) (mode dword)) 
(defcfun ("BASS_StreamPutData" stream-put-data) dword
  (handle hstream) (buffer :pointer) (length dword)) 
(defcfun ("BASS_StreamPutFileData" stream-put-file-data) dword
  (handle hstream) (buffer :pointer) (length dword))

;; MOD/MO3 music - Complete
(defcfun ("BASS_MusicFree" music-free) :bool (handle hmusic))
(defcfun ("BASS_MusicLoad" music-load) hmusic
  (mem :bool) (file :pointer) (offset qword) (length dword) (flags dword)
  (freq dword)) 

;; Recording - Complete
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

;; Channels - Complete
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

;; Effects - Complete
(defcfun ("BASS_FXGetParameters" fx-get-parameters) :bool
  (handle hfx) (params :pointer)) 
(defcfun ("BASS_FXReset" fx-reset) :bool
  (handle hfx))
(defcfun ("BASS_FXSetParameters" fx-set-parameters) :bool
  (handle hfx) (params :pointer))
(defcfun ("BASS_FXSetPriority" fx-set-priority) :bool
  (handle hfx) (priority :int)) 

(defun make-music-streamer (url)
  (init -1 44100 0 (null-pointer) (null-pointer))
  (let ((stream (stream-create-url url 0 0 (null-pointer) (null-pointer)))
        (active t)) 
    (defun control (msg &rest args)
      (when active
        (ecase msg
          (:play (channel-play stream nil))
          (:pause (channel-pause stream))
          (:stop (channel-stop stream))
          (:volume (apply #'channel-set-attribute stream 2 args))
          (:free (stream-free stream) (setf active nil)))))))
