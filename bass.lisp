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

;; Config - types 
(defcenum config-options
  (:BUFFER 0) 
  (:UPDATEPERIOD 1) 
  (:GVOL-SAMPLE 4) 
  (:GVOL-STREAM 5) 
  (:GVOL-MUSIC 6) 
  (:CURVE-VOL 7) 
  (:CURVE-PAN 8) 
  (:FLOATDSP 9) 
  (:3DALGORITHM 10) 
  (:NET-TIMEOUT 11) 
  (:NET-BUFFER 12) 
  (:PAUSE-NOPLAY 13) 
  (:NET-PREBUF 15) 
  (:NET-PASSIVE 18) 
  (:REC-BUFFER 19) 
  (:NET-PLAYLIST 21) 
  (:MUSIC-VIRTUAL 22) 
  (:VERIFY 23) 
  (:UPDATETHREADS 24) 
  (:DEV-BUFFER 27) 
  (:VISTA-TRUEPOS 30) 
  (:IOS-MIXAUDIO 34) 
  (:DEV-DEFAULT 36) 
  (:NET-READTIMEOUT 37) 
  (:VISTA-SPEAKERS 38) 
  (:IOS-SPEAKER 39) 
  (:MF-DISABLE 40) 
  (:HANDLES 41) 
  (:UNICODE 42) 
  (:SRC 43) 
  (:SRC-SAMPLE 44) 
  (:ASYNCFILE-BUFFER 45) 
  (:OGG-PRESCAN 47) 
  (:MF-VIDEO 48) 
  (:AIRPLAY 49) 
  (:DEV-NONSTOP 50) 
  (:IOS-NOCATEGORY 51) 
  (:VERIFY-NET 52) 
  (:DEV-PERIOD 53) 
  (:FLOAT 54) 
  (:NET-SEEK 56))

(defcenum config-ptr-options
  (:net-agent 16)
  (:net-proxy 17)
  (:ios-notify 46))

;; Config - Complete
(defcfun ("BASS_GetConfig" get-config) dword (option config-options))
(defcfun ("BASS_GetConfigPtr" get-config-ptr) :pointer (option config-ptr-options))
(defcfun ("BASS_SetConfig" set-config) :bool
  (option config-options) (value dword))
(defcfun ("BASS_SetConfigPtr" set-config-ptr) :bool (option config-ptr-options) (value :pointer))

;; Plugins - Structures
(defcstruct plugin-form
  (ctype dword)
  (name :string)
  (exts :string))
(defcstruct plugin-info
  (version dword)
  (formatc dword)
  (formats (:pointer (:struct plugin-form))))

;; Plugins - Complete
(defcfun ("BASS_PluginFree" plugin-free) :bool (handle hplugin))
(defcfun ("BASS_PluginGetInfo" plugin-get-info) (:pointer (:struct plugin-info)) (handle hplugin))
(defcfun ("BASS_PluginLoad" plugin-load) hplugin (file :string) (flags dword))

;; Initialization, info, etc... - Complete
(defcenum error-codes
  (:OK 0) 
  (:MEM 1) 
  (:FILEOPEN 2) 
  (:DRIVER 3) 
  (:BUFLOST 4) 
  (:HANDLE 5) 
  (:FORMAT 6) 
  (:POSITION 7) 
  (:INIT 8) 
  (:START 9) 
  (:SSL 10) 
  (:ALREADY 14) 
  (:NOCHAN 18) 
  (:ILLTYPE 19) 
  (:ILLPARAM 20) 
  (:NO3D 21) 
  (:NOEAX 22) 
  (:DEVICE 23) 
  (:NOPLAY 24) 
  (:FREQ 25) 
  (:NOTFILE 27) 
  (:NOHW 29) 
  (:EMPTY 31) 
  (:NONET 32) 
  (:CREATE 33) 
  (:NOFX 34) 
  (:NOTAVAIL 37) 
  (:DECODE 38) 
  (:DX 39) 
  (:TIMEOUT 40) 
  (:FILEFORM 41) 
  (:SPEAKER 42) 
  (:VERSION 43) 
  (:CODEC 44) 
  (:ENDED 45) 
  (:BUSY 46) 
  (:UNKNOWN -1))

(defbitfield device-info-flags
  (:ENABLED 1) 
  (:DEFAULT 2) 
  (:INIT 4) 
  (:TYPE-MASK 4278190080) 
  (:TYPE-NETWORK 16777216) 
  (:TYPE-SPEAKERS 33554432) 
  (:TYPE-LINE 50331648) 
  (:TYPE-HEADPHONES 67108864) 
  (:TYPE-MICROPHONE 83886080) 
  (:TYPE-HEADSET 100663296) 
  (:TYPE-HANDSET 117440512) 
  (:TYPE-DIGITAL 134217728) 
  (:TYPE-SPDIF 150994944) 
  (:TYPE-HDMI 167772160) 
  (:TYPE-DISPLAYPORT 1073741824))

(defbitfield device-flags
  (:8BITS 1) 
  (:MONO 2) 
  (:3D 4) 
  (:16BITS 8) 
  (:LATENCY 256) 
  (:CPSPEAKERS 1024) 
  (:SPEAKERS 2048) 
  (:NOSPEAKER 4096) 
  (:DMIX 8192) 
  (:FREQ 16384) 
  (:STEREO 32768))

(defbitfield info-flags
 (:DSCAPS-CONTINUOUSRATE #x00000010)
 (:DSCAPS-EMULDRIVER #x00000020)
 (:DSCAPS-CERTIFIED #x00000040)
 (:DSCAPS-SECONDARYMONO #x00000100)
 (:DSCAPS-SECONDARYSTEREO #x00000200)
 (:DSCAPS-SECONDARY8BIT #x00000400)
 (:DSCAPS-SECONDARY16BIT #x00000800))

(defcstruct device-info
  (name :string)
  (driver :string)
  (flags device-info-flags))

(defcstruct info
  (flags info-flags)
  (hwsize dword)
  (hwfree dword)
  (freesam dword)
  (free3d dword)
  (minrate dword)
  (maxrate dword)
  (eax :bool)
  (minbuf dword)
  (dsver dword)
  (latency dword)
  (initflags dword)
  (speakers dword)
  (freq dword))

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

;; 3D & EAX - Complete

(defcenum eax-environment
  :GENERIC
  :PADDEDCELL
  :ROOM
  :BATHROOM
  :LIVINGROOM
  :STONEROOM
  :AUDITORIUM
  :CONCERTHALL
  :CAVE
  :ARENA
  :HANGAR
  :CARPETEDHALLWAY
  :HALLWAY
  :STONECORRIDOR
  :ALLEY
  :FOREST
  :CITY
  :MOUNTAINS
  :QUARRY
  :PLAIN
  :PARKINGLOT
  :SEWERPIPE
  :UNDERWATER
  :DRUGGED
  :DIZZY
  :PSYCHOTIC
  :COUNT)

(defcstruct 3d-vector
  (x :float)
  (y :float)
  (z :float))

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

;; Samples - Complete
(defbitfield sample-flags
  (:8BITS 1) 
  (:FLOAT 256) 
  (:MONO 2) 
  (:LOOP 4) 
  (:3D 8) 
  (:SOFTWARE 16) 
  (:MUTEMAX 32) 
  (:VAM 64) 
  (:FX 128) 
  (:OVER-VOL 65536) 
  (:OVER-POS 131072) 
  (:OVER-DIST 196608)
  (:UNICODE #x80000000))

(defcstruct sample
  (freq dword)
  (volume :float)
  (pan :float)
  (flags sample-flags)
  (length dword)
  (max dword)
  (origres dword)
  (chans dword)
  (mingap dword)
  (mode3d dword)
  (mindist :float)
  (maxdist :float)
  (iangle dword)
  (oangle dword)
  (outvol :float)
  (vam dword)
  (priority dword))

(defcfun ("BASS_SampleCreate" sample-create) hsample
  (length dword) (freq dword) (chans dword) (max dword) (flags sample-flags))
(defcfun ("BASS_SampleFree" sample-free) :bool (handle hsample))
(defcfun ("BASS_SampleGetChannel" sample-get-channel) hchannel
  (handle hsample) (onlynew :bool))
(defcfun ("BASS_SampleGetChannels" sample-get-channels) dword
  (handle hsample) (*channels hchannel))
(defcfun ("BASS_SampleGetData" sample-get-data) :bool
  (handle hsample) (buffer :pointer))
(defcfun ("BASS_SampleGetInfo" sample-get-info) :bool
  (handle hsample) (info (:pointer (:struct sample))))
(defcfun ("BASS_SampleLoad" sample-load) hsample
  (mem :bool) (file :pointer) (offset qword) (length dword) (max dword)
  (flags sample-flags))
(defcfun ("BASS_SampleSetData" sample-set-data) :bool
  (handle hsample) (buffer :pointer)) 
(defcfun ("BASS_SampleSetInfo" sample-set-info) :bool
  (handle hsample) (info (:pointer (:struct sample))))  
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
