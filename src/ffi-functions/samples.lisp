(in-package #:bass)

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
