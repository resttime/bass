(in-package #:bass)

(cl:defmacro defanonenum (cl:&body enums)
   "Converts anonymous enums to defconstants."
  `(cl:progn ,@(cl:loop for value in enums
                        for index = 0 then (cl:1+ index)
                        when (cl:listp value) do (cl:setf index (cl:second value)
                                                          value (cl:first value))
                        collect `(cl:defconstant ,value ,index))))

(cl:defconstant BASS_OK 0)

(cl:defconstant BASS_ERROR_MEM 1)

(cl:defconstant BASS_ERROR_FILEOPEN 2)

(cl:defconstant BASS_ERROR_DRIVER 3)

(cl:defconstant BASS_ERROR_BUFLOST 4)

(cl:defconstant BASS_ERROR_HANDLE 5)

(cl:defconstant BASS_ERROR_FORMAT 6)

(cl:defconstant BASS_ERROR_POSITION 7)

(cl:defconstant BASS_ERROR_INIT 8)

(cl:defconstant BASS_ERROR_START 9)

(cl:defconstant BASS_ERROR_SSL 10)

(cl:defconstant BASS_ERROR_ALREADY 14)

(cl:defconstant BASS_ERROR_NOCHAN 18)

(cl:defconstant BASS_ERROR_ILLTYPE 19)

(cl:defconstant BASS_ERROR_ILLPARAM 20)

(cl:defconstant BASS_ERROR_NO3D 21)

(cl:defconstant BASS_ERROR_NOEAX 22)

(cl:defconstant BASS_ERROR_DEVICE 23)

(cl:defconstant BASS_ERROR_NOPLAY 24)

(cl:defconstant BASS_ERROR_FREQ 25)

(cl:defconstant BASS_ERROR_NOTFILE 27)

(cl:defconstant BASS_ERROR_NOHW 29)

(cl:defconstant BASS_ERROR_EMPTY 31)

(cl:defconstant BASS_ERROR_NONET 32)

(cl:defconstant BASS_ERROR_CREATE 33)

(cl:defconstant BASS_ERROR_NOFX 34)

(cl:defconstant BASS_ERROR_NOTAVAIL 37)

(cl:defconstant BASS_ERROR_DECODE 38)

(cl:defconstant BASS_ERROR_DX 39)

(cl:defconstant BASS_ERROR_TIMEOUT 40)

(cl:defconstant BASS_ERROR_FILEFORM 41)

(cl:defconstant BASS_ERROR_SPEAKER 42)

(cl:defconstant BASS_ERROR_VERSION 43)

(cl:defconstant BASS_ERROR_CODEC 44)

(cl:defconstant BASS_ERROR_ENDED 45)

(cl:defconstant BASS_ERROR_BUSY 46)

(cl:defconstant BASS_ERROR_UNKNOWN -1)

(cl:defconstant BASS_CONFIG_BUFFER 0)

(cl:defconstant BASS_CONFIG_UPDATEPERIOD 1)

(cl:defconstant BASS_CONFIG_GVOL_SAMPLE 4)

(cl:defconstant BASS_CONFIG_GVOL_STREAM 5)

(cl:defconstant BASS_CONFIG_GVOL_MUSIC 6)

(cl:defconstant BASS_CONFIG_CURVE_VOL 7)

(cl:defconstant BASS_CONFIG_CURVE_PAN 8)

(cl:defconstant BASS_CONFIG_FLOATDSP 9)

(cl:defconstant BASS_CONFIG_3DALGORITHM 10)

(cl:defconstant BASS_CONFIG_NET_TIMEOUT 11)

(cl:defconstant BASS_CONFIG_NET_BUFFER 12)

(cl:defconstant BASS_CONFIG_PAUSE_NOPLAY 13)

(cl:defconstant BASS_CONFIG_NET_PREBUF 15)

(cl:defconstant BASS_CONFIG_NET_PASSIVE 18)

(cl:defconstant BASS_CONFIG_REC_BUFFER 19)

(cl:defconstant BASS_CONFIG_NET_PLAYLIST 21)

(cl:defconstant BASS_CONFIG_MUSIC_VIRTUAL 22)

(cl:defconstant BASS_CONFIG_VERIFY 23)

(cl:defconstant BASS_CONFIG_UPDATETHREADS 24)

(cl:defconstant BASS_CONFIG_DEV_BUFFER 27)

(cl:defconstant BASS_CONFIG_VISTA_TRUEPOS 30)

(cl:defconstant BASS_CONFIG_IOS_MIXAUDIO 34)

(cl:defconstant BASS_CONFIG_DEV_DEFAULT 36)

(cl:defconstant BASS_CONFIG_NET_READTIMEOUT 37)

(cl:defconstant BASS_CONFIG_VISTA_SPEAKERS 38)

(cl:defconstant BASS_CONFIG_IOS_SPEAKER 39)

(cl:defconstant BASS_CONFIG_MF_DISABLE 40)

(cl:defconstant BASS_CONFIG_HANDLES 41)

(cl:defconstant BASS_CONFIG_UNICODE 42)

(cl:defconstant BASS_CONFIG_SRC 43)

(cl:defconstant BASS_CONFIG_SRC_SAMPLE 44)

(cl:defconstant BASS_CONFIG_ASYNCFILE_BUFFER 45)

(cl:defconstant BASS_CONFIG_OGG_PRESCAN 47)

(cl:defconstant BASS_CONFIG_MF_VIDEO 48)

(cl:defconstant BASS_CONFIG_AIRPLAY 49)

(cl:defconstant BASS_CONFIG_DEV_NONSTOP 50)

(cl:defconstant BASS_CONFIG_IOS_NOCATEGORY 51)

(cl:defconstant BASS_CONFIG_VERIFY_NET 52)

(cl:defconstant BASS_CONFIG_DEV_PERIOD 53)

(cl:defconstant BASS_CONFIG_FLOAT 54)

(cl:defconstant BASS_CONFIG_NET_SEEK 56)

(cl:defconstant BASS_CONFIG_NET_AGENT 16)

(cl:defconstant BASS_CONFIG_NET_PROXY 17)

(cl:defconstant BASS_CONFIG_IOS_NOTIFY 46)

(cl:defconstant BASS_DEVICE_8BITS 1)

(cl:defconstant BASS_DEVICE_MONO 2)

(cl:defconstant BASS_DEVICE_3D 4)

(cl:defconstant BASS_DEVICE_16BITS 8)

(cl:defconstant BASS_DEVICE_LATENCY #x100)

(cl:defconstant BASS_DEVICE_CPSPEAKERS #x400)

(cl:defconstant BASS_DEVICE_SPEAKERS #x800)

(cl:defconstant BASS_DEVICE_NOSPEAKER #x1000)

(cl:defconstant BASS_DEVICE_DMIX #x2000)

(cl:defconstant BASS_DEVICE_FREQ #x4000)

(cl:defconstant BASS_DEVICE_STEREO #x8000)

(cl:defconstant BASS_OBJECT_DS 1)

(cl:defconstant BASS_OBJECT_DS3DL 2)

(cffi:defcstruct BASS_INFO
  (flags :pointer)
  (hwsize :pointer)
  (hwfree :pointer)
  (freesam :pointer)
  (free3d :pointer)
  (minrate :pointer)
  (maxrate :pointer)
  (eax :int)
  (minbuf :pointer)
  (dsver :pointer)
  (latency :pointer)
  (initflags :pointer)
  (speakers :pointer)
  (freq :pointer))

(cl:defconstant DSCAPS_CONTINUOUSRATE #x00000010)

(cl:defconstant DSCAPS_EMULDRIVER #x00000020)

(cl:defconstant DSCAPS_CERTIFIED #x00000040)

(cl:defconstant DSCAPS_SECONDARYMONO #x00000100)

(cl:defconstant DSCAPS_SECONDARYSTEREO #x00000200)

(cl:defconstant DSCAPS_SECONDARY8BIT #x00000400)

(cl:defconstant DSCAPS_SECONDARY16BIT #x00000800)


(cffi:defcstruct BASS_RECORDINFO
	(flags :pointer)
	(formats :pointer)
	(inputs :pointer)
	(singlein :int)
	(freq :pointer))

(cl:defconstant DSCCAPS_EMULDRIVER #x00000020)

(cl:defconstant DSCCAPS_CERTIFIED #x00000040)

(cl:defconstant WAVE_FORMAT_1M08 #x00000001)

(cl:defconstant WAVE_FORMAT_1S08 #x00000002)

(cl:defconstant WAVE_FORMAT_1M16 #x00000004)

(cl:defconstant WAVE_FORMAT_1S16 #x00000008)

(cl:defconstant WAVE_FORMAT_2M08 #x00000010)

(cl:defconstant WAVE_FORMAT_2S08 #x00000020)

(cl:defconstant WAVE_FORMAT_2M16 #x00000040)

(cl:defconstant WAVE_FORMAT_2S16 #x00000080)

(cl:defconstant WAVE_FORMAT_4M08 #x00000100)

(cl:defconstant WAVE_FORMAT_4S08 #x00000200)

(cl:defconstant WAVE_FORMAT_4M16 #x00000400)

(cl:defconstant WAVE_FORMAT_4S16 #x00000800)

(cffi:defcstruct BASS_SAMPLE
	(freq :pointer)
	(volume :float)
	(pan :float)
	(flags :pointer)
	(length :pointer)
	(max :pointer)
	(origres :pointer)
	(chans :pointer)
	(mingap :pointer)
	(mode3d :pointer)
	(mindist :float)
	(maxdist :float)
	(iangle :pointer)
	(oangle :pointer)
	(outvol :float)
	(vam :pointer)
	(priority :pointer))

(cl:defconstant BASS_SAMPLE_8BITS 1)

(cl:defconstant BASS_SAMPLE_FLOAT 256)

(cl:defconstant BASS_SAMPLE_MONO 2)

(cl:defconstant BASS_SAMPLE_LOOP 4)

(cl:defconstant BASS_SAMPLE_3D 8)

(cl:defconstant BASS_SAMPLE_SOFTWARE 16)

(cl:defconstant BASS_SAMPLE_MUTEMAX 32)

(cl:defconstant BASS_SAMPLE_VAM 64)

(cl:defconstant BASS_SAMPLE_FX 128)

(cl:defconstant BASS_SAMPLE_OVER_VOL #x10000)

(cl:defconstant BASS_SAMPLE_OVER_POS #x20000)

(cl:defconstant BASS_SAMPLE_OVER_DIST #x30000)

(cl:defconstant BASS_STREAM_PRESCAN #x20000)

(cl:defconstant BASS_MP3_SETPOS #x20000)

(cl:defconstant BASS_STREAM_AUTOFREE #x40000)

(cl:defconstant BASS_STREAM_RESTRATE #x80000)

(cl:defconstant BASS_STREAM_BLOCK #x100000)

(cl:defconstant BASS_STREAM_DECODE #x200000)

(cl:defconstant BASS_STREAM_STATUS #x800000)

(cl:defconstant BASS_MUSIC_FLOAT 256)

(cl:defconstant BASS_MUSIC_MONO 2)

(cl:defconstant BASS_MUSIC_LOOP 4)

(cl:defconstant BASS_MUSIC_3D 8)

(cl:defconstant BASS_MUSIC_FX 128)

(cl:defconstant BASS_MUSIC_AUTOFREE #x40000)

(cl:defconstant BASS_MUSIC_DECODE #x200000)

(cl:defconstant BASS_MUSIC_PRESCAN #x20000)

(cl:defconstant BASS_MUSIC_CALCLEN #x20000)

(cl:defconstant BASS_MUSIC_RAMP #x200)

(cl:defconstant BASS_MUSIC_RAMPS #x400)

(cl:defconstant BASS_MUSIC_SURROUND #x800)

(cl:defconstant BASS_MUSIC_SURROUND2 #x1000)

(cl:defconstant BASS_MUSIC_FT2PAN #x2000)

(cl:defconstant BASS_MUSIC_FT2MOD #x2000)

(cl:defconstant BASS_MUSIC_PT1MOD #x4000)

(cl:defconstant BASS_MUSIC_NONINTER #x10000)

(cl:defconstant BASS_MUSIC_SINCINTER #x800000)

(cl:defconstant BASS_MUSIC_POSRESET #x8000)

(cl:defconstant BASS_MUSIC_POSRESETEX #x400000)

(cl:defconstant BASS_MUSIC_STOPBACK #x80000)

(cl:defconstant BASS_MUSIC_NOSAMPLE #x100000)

(cl:defconstant BASS_SPEAKER_FRONT #x1000000)

(cl:defconstant BASS_SPEAKER_REAR #x2000000)

(cl:defconstant BASS_SPEAKER_CENLFE #x3000000)

(cl:defconstant BASS_SPEAKER_REAR2 #x4000000)

(cl:defconstant BASS_SPEAKER_LEFT #x10000000)

(cl:defconstant BASS_SPEAKER_RIGHT #x20000000)

(cl:defconstant BASS_SPEAKER_FRONTLEFT (cl:logior #x1000000 #x10000000))

(cl:defconstant BASS_SPEAKER_FRONTRIGHT (cl:logior #x1000000 #x20000000))

(cl:defconstant BASS_SPEAKER_REARLEFT (cl:logior #x2000000 #x10000000))

(cl:defconstant BASS_SPEAKER_REARRIGHT (cl:logior #x2000000 #x20000000))

(cl:defconstant BASS_SPEAKER_CENTER (cl:logior #x3000000 #x10000000))

(cl:defconstant BASS_SPEAKER_LFE (cl:logior #x3000000 #x20000000))

(cl:defconstant BASS_SPEAKER_REAR2LEFT (cl:logior #x4000000 #x10000000))

(cl:defconstant BASS_SPEAKER_REAR2RIGHT (cl:logior #x4000000 #x20000000))

(cl:defconstant BASS_ASYNCFILE #x40000000)

(cl:defconstant BASS_UNICODE #x80000000)

(cl:defconstant BASS_RECORD_PAUSE #x8000)

(cl:defconstant BASS_RECORD_ECHOCANCEL #x2000)

(cl:defconstant BASS_RECORD_AGC #x4000)

(cl:defconstant BASS_VAM_HARDWARE 1)

(cl:defconstant BASS_VAM_SOFTWARE 2)

(cl:defconstant BASS_VAM_TERM_TIME 4)

(cl:defconstant BASS_VAM_TERM_DIST 8)

(cl:defconstant BASS_VAM_TERM_PRIO 16)

(cffi:defcstruct BASS_CHANNELINFO
	(freq :pointer)
	(chans :pointer)
	(flags :pointer)
	(ctype :pointer)
	(origres :pointer)
	(plugin :pointer)
	(sample :pointer)
	(filename :string))

(cl:defconstant BASS_CTYPE_SAMPLE 1)

(cl:defconstant BASS_CTYPE_RECORD 2)

(cl:defconstant BASS_CTYPE_STREAM #x10000)

(cl:defconstant BASS_CTYPE_STREAM_OGG #x10002)

(cl:defconstant BASS_CTYPE_STREAM_MP1 #x10003)

(cl:defconstant BASS_CTYPE_STREAM_MP2 #x10004)

(cl:defconstant BASS_CTYPE_STREAM_MP3 #x10005)

(cl:defconstant BASS_CTYPE_STREAM_AIFF #x10006)

(cl:defconstant BASS_CTYPE_STREAM_CA #x10007)

(cl:defconstant BASS_CTYPE_STREAM_MF #x10008)

(cl:defconstant BASS_CTYPE_STREAM_WAV #x40000)

(cl:defconstant BASS_CTYPE_STREAM_WAV_PCM #x50001)

(cl:defconstant BASS_CTYPE_STREAM_WAV_FLOAT #x50003)

(cl:defconstant BASS_CTYPE_MUSIC_MOD #x20000)

(cl:defconstant BASS_CTYPE_MUSIC_MTM #x20001)

(cl:defconstant BASS_CTYPE_MUSIC_S3M #x20002)

(cl:defconstant BASS_CTYPE_MUSIC_XM #x20003)

(cl:defconstant BASS_CTYPE_MUSIC_IT #x20004)

(cl:defconstant BASS_CTYPE_MUSIC_MO3 #x00100)

(cffi:defcstruct BASS_PLUGINFORM
	(ctype :pointer)
	(name :string)
	(exts :string))

(cffi:defcstruct BASS_PLUGININFO
	(version :pointer)
	(formatc :pointer)
	(formats :pointer))

(cffi:defcstruct BASS_3DVECTOR
	(x :float)
	(y :float)
	(z :float))

(cl:defconstant BASS_3DMODE_NORMAL 0)

(cl:defconstant BASS_3DMODE_RELATIVE 1)

(cl:defconstant BASS_3DMODE_OFF 2)

(cl:defconstant BASS_3DALG_DEFAULT 0)

(cl:defconstant BASS_3DALG_OFF 1)

(cl:defconstant BASS_3DALG_FULL 2)

(cl:defconstant BASS_3DALG_LIGHT 3)


(defanonenum 
	EAX_ENVIRONMENT_GENERIC
	EAX_ENVIRONMENT_PADDEDCELL
	EAX_ENVIRONMENT_ROOM
	EAX_ENVIRONMENT_BATHROOM
	EAX_ENVIRONMENT_LIVINGROOM
	EAX_ENVIRONMENT_STONEROOM
	EAX_ENVIRONMENT_AUDITORIUM
	EAX_ENVIRONMENT_CONCERTHALL
	EAX_ENVIRONMENT_CAVE
	EAX_ENVIRONMENT_ARENA
	EAX_ENVIRONMENT_HANGAR
	EAX_ENVIRONMENT_CARPETEDHALLWAY
	EAX_ENVIRONMENT_HALLWAY
	EAX_ENVIRONMENT_STONECORRIDOR
	EAX_ENVIRONMENT_ALLEY
	EAX_ENVIRONMENT_FOREST
	EAX_ENVIRONMENT_CITY
	EAX_ENVIRONMENT_MOUNTAINS
	EAX_ENVIRONMENT_QUARRY
	EAX_ENVIRONMENT_PLAIN
	EAX_ENVIRONMENT_PARKINGLOT
	EAX_ENVIRONMENT_SEWERPIPE
	EAX_ENVIRONMENT_UNDERWATER
	EAX_ENVIRONMENT_DRUGGED
	EAX_ENVIRONMENT_DIZZY
	EAX_ENVIRONMENT_PSYCHOTIC
	EAX_ENVIRONMENT_COUNT)

(cl:defconstant BASS_STREAMPROC_END #x80000000)

(cl:defconstant STREAMFILE_NOBUFFER 0)

(cl:defconstant STREAMFILE_BUFFER 1)

(cl:defconstant STREAMFILE_BUFFERPUSH 2)

(cffi:defcstruct BASS_FILEPROCS
	(close :pointer)
	(length :pointer)
	(read :pointer)
	(seek :pointer))

(cl:defconstant BASS_FILEDATA_END 0)

(cl:defconstant BASS_FILEPOS_CURRENT 0)

(cl:defconstant BASS_FILEPOS_DECODE 0)

(cl:defconstant BASS_FILEPOS_DOWNLOAD 1)

(cl:defconstant BASS_FILEPOS_END 2)

(cl:defconstant BASS_FILEPOS_START 3)

(cl:defconstant BASS_FILEPOS_CONNECTED 4)

(cl:defconstant BASS_FILEPOS_BUFFER 5)

(cl:defconstant BASS_FILEPOS_SOCKET 6)

(cl:defconstant BASS_FILEPOS_ASYNCBUF 7)

(cl:defconstant BASS_FILEPOS_SIZE 8)

(cl:defconstant BASS_SYNC_POS 0)

(cl:defconstant BASS_SYNC_END 2)

(cl:defconstant BASS_SYNC_META 4)

(cl:defconstant BASS_SYNC_SLIDE 5)

(cl:defconstant BASS_SYNC_STALL 6)

(cl:defconstant BASS_SYNC_DOWNLOAD 7)

(cl:defconstant BASS_SYNC_FREE 8)

(cl:defconstant BASS_SYNC_SETPOS 11)

(cl:defconstant BASS_SYNC_MUSICPOS 10)

(cl:defconstant BASS_SYNC_MUSICINST 1)

(cl:defconstant BASS_SYNC_MUSICFX 3)

(cl:defconstant BASS_SYNC_OGG_CHANGE 12)

(cl:defconstant BASS_SYNC_MIXTIME #x40000000)

(cl:defconstant BASS_SYNC_ONETIME #x80000000)

(cl:defconstant BASS_ACTIVE_STOPPED 0)

(cl:defconstant BASS_ACTIVE_PLAYING 1)

(cl:defconstant BASS_ACTIVE_STALLED 2)

(cl:defconstant BASS_ACTIVE_PAUSED 3)

(cl:defconstant BASS_ATTRIB_FREQ 1)

(cl:defconstant BASS_ATTRIB_VOL 2)

(cl:defconstant BASS_ATTRIB_PAN 3)

(cl:defconstant BASS_ATTRIB_EAXMIX 4)

(cl:defconstant BASS_ATTRIB_NOBUFFER 5)

(cl:defconstant BASS_ATTRIB_VBR 6)

(cl:defconstant BASS_ATTRIB_CPU 7)

(cl:defconstant BASS_ATTRIB_SRC 8)

(cl:defconstant BASS_ATTRIB_NET_RESUME 9)

(cl:defconstant BASS_ATTRIB_SCANINFO 10)

(cl:defconstant BASS_ATTRIB_NORAMP 11)

(cl:defconstant BASS_ATTRIB_BITRATE 12)

(cl:defconstant BASS_ATTRIB_MUSIC_AMPLIFY #x100)

(cl:defconstant BASS_ATTRIB_MUSIC_PANSEP #x101)

(cl:defconstant BASS_ATTRIB_MUSIC_PSCALER #x102)

(cl:defconstant BASS_ATTRIB_MUSIC_BPM #x103)

(cl:defconstant BASS_ATTRIB_MUSIC_SPEED #x104)

(cl:defconstant BASS_ATTRIB_MUSIC_VOL_GLOBAL #x105)

(cl:defconstant BASS_ATTRIB_MUSIC_ACTIVE #x106)

(cl:defconstant BASS_ATTRIB_MUSIC_VOL_CHAN #x200)

(cl:defconstant BASS_ATTRIB_MUSIC_VOL_INST #x300)

(cl:defconstant BASS_DATA_AVAILABLE 0)

(cl:defconstant BASS_DATA_FIXED #x20000000)

(cl:defconstant BASS_DATA_FLOAT #x40000000)

(cl:defconstant BASS_DATA_FFT256 #x80000000)

(cl:defconstant BASS_DATA_FFT512 #x80000001)

(cl:defconstant BASS_DATA_FFT1024 #x80000002)

(cl:defconstant BASS_DATA_FFT2048 #x80000003)

(cl:defconstant BASS_DATA_FFT4096 #x80000004)

(cl:defconstant BASS_DATA_FFT8192 #x80000005)

(cl:defconstant BASS_DATA_FFT16384 #x80000006)

(cl:defconstant BASS_DATA_FFT32768 #x80000007)

(cl:defconstant BASS_DATA_FFT_INDIVIDUAL #x10)

(cl:defconstant BASS_DATA_FFT_NOWINDOW #x20)

(cl:defconstant BASS_DATA_FFT_REMOVEDC #x40)

(cl:defconstant BASS_DATA_FFT_COMPLEX #x80)

(cl:defconstant BASS_LEVEL_MONO 1)

(cl:defconstant BASS_LEVEL_STEREO 2)

(cl:defconstant BASS_LEVEL_RMS 4)

(cl:defconstant BASS_TAG_ID3 0)

(cl:defconstant BASS_TAG_ID3V2 1)

(cl:defconstant BASS_TAG_OGG 2)

(cl:defconstant BASS_TAG_HTTP 3)

(cl:defconstant BASS_TAG_ICY 4)

(cl:defconstant BASS_TAG_META 5)

(cl:defconstant BASS_TAG_APE 6)

(cl:defconstant BASS_TAG_MP4 7)

(cl:defconstant BASS_TAG_WMA 8)

(cl:defconstant BASS_TAG_VENDOR 9)

(cl:defconstant BASS_TAG_LYRICS3 10)

(cl:defconstant BASS_TAG_CA_CODEC 11)

(cl:defconstant BASS_TAG_MF 13)

(cl:defconstant BASS_TAG_WAVEFORMAT 14)

(cl:defconstant BASS_TAG_RIFF_INFO #x100)

(cl:defconstant BASS_TAG_RIFF_BEXT #x101)

(cl:defconstant BASS_TAG_RIFF_CART #x102)

(cl:defconstant BASS_TAG_RIFF_DISP #x103)

(cl:defconstant BASS_TAG_APE_BINARY #x1000)

(cl:defconstant BASS_TAG_MUSIC_NAME #x10000)

(cl:defconstant BASS_TAG_MUSIC_MESSAGE #x10001)

(cl:defconstant BASS_TAG_MUSIC_ORDERS #x10002)

(cl:defconstant BASS_TAG_MUSIC_AUTH #x10003)

(cl:defconstant BASS_TAG_MUSIC_INST #x10100)

(cl:defconstant BASS_TAG_MUSIC_SAMPLE #x10300)

(cffi:defcstruct TAG_ID3
	(id :pointer :count 3)
	(title :pointer :count 30)
	(artist :pointer :count 30)
	(album :pointer :count 30)
	(year :pointer :count 4)
	(comment :pointer :count 30)
	(genre :pointer))

(cffi:defcstruct TAG_APE_BINARY
	(key :string)
	(data :pointer)
	(length :pointer))

(cffi:defcstruct TAG_BEXT
	(Description :pointer :count 256)
	(Originator :pointer :count 32)
	(OriginatorReference :pointer :count 32)
	(OriginationDate :pointer :count 10)
	(OriginationTime :pointer :count 8)
	(TimeReference :pointer)
	(Version :pointer)
	(UMID :pointer :count 64)
	(Reserved :pointer :count 190)
	(CodingHistory :pointer :count 1))

(cffi:defcstruct TAG_CART_TIMER
	(dwUsage :pointer)
	(dwValue :pointer))

(cffi:defcstruct TAG_CART
	(Version :pointer :count 4)
	(Title :pointer :count 64)
	(Artist :pointer :count 64)
	(CutID :pointer :count 64)
	(ClientID :pointer :count 64)
	(Category :pointer :count 64)
	(Classification :pointer :count 64)
	(OutCue :pointer :count 64)
	(StartDate :pointer :count 10)
	(StartTime :pointer :count 8)
	(EndDate :pointer :count 10)
	(EndTime :pointer :count 8)
	(ProducerAppID :pointer :count 64)
	(ProducerAppVersion :pointer :count 64)
	(UserDef :pointer :count 64)
	(dwLevelReference :pointer)
	(PostTimer :pointer :count 8)
	(Reserved :pointer :count 276)
	(URL :pointer :count 1024)
	(TagText :pointer :count 1))

(cffi:defcstruct TAG_CA_CODEC
	(ftype :pointer)
	(atype :pointer)
	(name :string))

(cffi:defcstruct WAVEFORMATEX
	(wFormatTag :pointer)
	(nChannels :pointer)
	(nSamplesPerSec :pointer)
	(nAvgBytesPerSec :pointer)
	(nBlockAlign :pointer)
	(wBitsPerSample :pointer)
	(cbSize :pointer))

(cl:defconstant BASS_POS_BYTE 0)

(cl:defconstant BASS_POS_MUSIC_ORDER 1)

(cl:defconstant BASS_POS_OGG 3)

(cl:defconstant BASS_POS_INEXACT #x8000000)

(cl:defconstant BASS_POS_DECODE #x10000000)

(cl:defconstant BASS_POS_DECODETO #x20000000)

(cl:defconstant BASS_POS_SCAN #x40000000)

(cl:defconstant BASS_INPUT_OFF #x10000)

(cl:defconstant BASS_INPUT_ON #x20000)

(cl:defconstant BASS_INPUT_TYPE_MASK #xff000000)

(cl:defconstant BASS_INPUT_TYPE_UNDEF #x00000000)

(cl:defconstant BASS_INPUT_TYPE_DIGITAL #x01000000)

(cl:defconstant BASS_INPUT_TYPE_LINE #x02000000)

(cl:defconstant BASS_INPUT_TYPE_MIC #x03000000)

(cl:defconstant BASS_INPUT_TYPE_SYNTH #x04000000)

(cl:defconstant BASS_INPUT_TYPE_CD #x05000000)

(cl:defconstant BASS_INPUT_TYPE_PHONE #x06000000)

(cl:defconstant BASS_INPUT_TYPE_SPEAKER #x07000000)

(cl:defconstant BASS_INPUT_TYPE_WAVE #x08000000)

(cl:defconstant BASS_INPUT_TYPE_AUX #x09000000)

(cl:defconstant BASS_INPUT_TYPE_ANALOG #x0a000000)

(defanonenum 
	BASS_FX_DX8_CHORUS
	BASS_FX_DX8_COMPRESSOR
	BASS_FX_DX8_DISTORTION
	BASS_FX_DX8_ECHO
	BASS_FX_DX8_FLANGER
	BASS_FX_DX8_GARGLE
	BASS_FX_DX8_I3DL2REVERB
	BASS_FX_DX8_PARAMEQ
	BASS_FX_DX8_REVERB)

(cffi:defcstruct BASS_DX8_CHORUS
	(fWetDryMix :float)
	(fDepth :float)
	(fFeedback :float)
	(fFrequency :float)
	(lWaveform :pointer)
	(fDelay :float)
	(lPhase :pointer))

(cffi:defcstruct BASS_DX8_COMPRESSOR
	(fGain :float)
	(fAttack :float)
	(fRelease :float)
	(fThreshold :float)
	(fRatio :float)
	(fPredelay :float))

(cffi:defcstruct BASS_DX8_DISTORTION
	(fGain :float)
	(fEdge :float)
	(fPostEQCenterFrequency :float)
	(fPostEQBandwidth :float)
	(fPreLowpassCutoff :float))

(cffi:defcstruct BASS_DX8_ECHO
	(fWetDryMix :float)
	(fFeedback :float)
	(fLeftDelay :float)
	(fRightDelay :float)
	(lPanDelay :int))

(cffi:defcstruct BASS_DX8_FLANGER
	(fWetDryMix :float)
	(fDepth :float)
	(fFeedback :float)
	(fFrequency :float)
	(lWaveform :pointer)
	(fDelay :float)
	(lPhase :pointer))

(cffi:defcstruct BASS_DX8_GARGLE
	(dwRateHz :pointer)
	(dwWaveShape :pointer))

(cffi:defcstruct BASS_DX8_I3DL2REVERB
	(lRoom :int)
	(lRoomHF :int)
	(flRoomRolloffFactor :float)
	(flDecayTime :float)
	(flDecayHFRatio :float)
	(lReflections :int)
	(flReflectionsDelay :float)
	(lReverb :int)
	(flReverbDelay :float)
	(flDiffusion :float)
	(flDensity :float)
	(flHFReference :float))

(cffi:defcstruct BASS_DX8_PARAMEQ
	(fCenter :float)
	(fBandwidth :float)
	(fGain :float))

(cffi:defcstruct BASS_DX8_REVERB
	(fInGain :float)
	(fReverbMix :float)
	(fReverbTime :float)
	(fHighFreqRTRatio :float))

(cl:defconstant BASS_DX8_PHASE_NEG_180 0)

(cl:defconstant BASS_DX8_PHASE_NEG_90 1)

(cl:defconstant BASS_DX8_PHASE_ZERO 2)

(cl:defconstant BASS_DX8_PHASE_90 3)

(cl:defconstant BASS_DX8_PHASE_180 4)

(cl:defconstant BASS_IOSNOTIFY_INTERRUPT 1)

(cl:defconstant BASS_IOSNOTIFY_INTERRUPT_END 2)
