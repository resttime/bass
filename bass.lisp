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

(defun return-type (line)
  (let ((pos (position #\Space line)))
    (subseq line 0 pos)))

;; Define handle types
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

;; Initialization, info, etc...
(defcfun ("BASS_Free" free) :bool)
(defcfun ("BASS_Init" init) :bool
  (device :int) (freq dword) (flags dword) (win :pointer) (dsguid :pointer))
(defcfun ("BASS_SetVolume" set-volume) :bool
  (volume :float))

;; Streams
(defcfun ("BASS_StreamCreateFile" stream-create-file) hstream
  (mem :bool) (file :string) (offset qword) (len qword) (flags dword))
(defcfun ("BASS_StreamCreateURL" stream-create-url) hstream
  (url :string) (offset qword) (flags dword) (proc :pointer) (user :pointer))
(defcfun ("BASS_StreamFree" stream-free) :bool (hstream dword))

;; Channels
(defcfun ("BASS_ChannelBytes2Seconds" channel-bytes-2-seconds) :double
  (handle dword) (pos qword))
(defcfun ("BASS_ChannelGetLength" channel-get-length) qword
  (handle dword) (mode dword))
(defcfun ("BASS_ChannelPlay" channel-play) :bool
  (handle dword) (restart :bool))
(defcfun ("BASS_ChannelSetAttribute" channel-set-attribute) :bool
  (handle dword) (attrib dword) (value :float))

(defun test ()
  (let ((device -1)
        (freq 44100))
    (init device freq 0 (null-pointer) (null-pointer))
    (let ((streaming (stream-create-url "http://stream.r-a-d.io/main.mp3" 0 0
                                        (null-pointer)
                                        (null-pointer))))
      (channel-play streaming nil)
      streaming)))

;(set-volume 0.02)

;(free)


