(in-package #:bass)

(defcfun ("BASS_StreamCreate" stream-create) hstream
  (freq dword) (chans dword) (flags stream-create-flags) (proc :pointer) (user :pointer))
(defcfun ("BASS_StreamCreateFile" stream-create-file) hstream
  (mem :bool) (file :string) (offset qword) (len qword) (flags stream-create-file-flags))
(defcfun ("BASS_StreamCreateFileUser" stream-create-file-user) hstream
  (system dword) (flags stream-create-file-user-flags) (procs :pointer) (user :pointer))
(defcfun ("BASS_StreamCreateURL" stream-create-url) hstream
  (url :string) (offset dword) (flags stream-create-url-flags) (proc :pointer) (user :pointer))
(defcfun ("BASS_StreamFree" stream-free) :bool (handle hstream))
(defcfun ("BASS_StreamGetFilePosition" stream-get-file-position) qword
  (handle hstream) (mode file-pos-mode)) 
(defcfun ("BASS_StreamPutData" stream-put-data) dword
  (handle hstream) (buffer :pointer) (length dword)) 
(defcfun ("BASS_StreamPutFileData" stream-put-file-data) dword
  (handle hstream) (buffer :pointer) (length dword))
