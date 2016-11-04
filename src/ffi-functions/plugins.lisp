(in-package #:bass)

(defcfun ("BASS_PluginFree" plugin-free) :bool (handle hplugin))
(defcfun ("BASS_PluginGetInfo" plugin-get-info) (:pointer (:struct plugin-info)) (handle hplugin))
(defcfun ("BASS_PluginLoad" plugin-load) hplugin (file :string) (flags plugin-flags))
