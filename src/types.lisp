(in-package #:bass)

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

;; Plugins

(defcstruct plugin-form
  (ctype dword)
  (name :string)
  (exts :string))

(defcstruct plugin-info
  (version dword)
  (formatc dword)
  (formats (:pointer (:struct plugin-form))))

;; Initialization, info, etc...

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

;; 3D & EAX

(defcstruct 3d-vector
  (x :float)
  (y :float)
  (z :float))

;; Samples

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

;; Streams

(defcstruct file-procs
  (close :pointer)
  (length :pointer)
  (read :pointer)
  (seek :pointer))
