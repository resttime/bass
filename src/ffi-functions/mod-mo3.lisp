(in-package #:bass)

(defcfun ("BASS_MusicFree" music-free) :bool (handle hmusic))
(defcfun ("BASS_MusicLoad" music-load) hmusic
  (mem :bool) (file :pointer) (offset qword) (length dword) (flags music-load-flags)
  (freq dword)) 
