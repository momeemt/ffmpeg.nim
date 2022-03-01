when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|-58|-59|-60|-61|-62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|-58|-59|-60|-61|-62)", cdecl.}

{.pragma: defs, importc, header: "<libavcodec/defs.h>".}
{.pragma: defsEnum, importc: "enum $1", header: "<libavcodec/defs.h>".}

type
  AVDiscard* {.defsEnum.} = enum
    AVDISCARD_NONE = -16
    AVDISCARD_DEFAULT = 0
    AVDISCARD_NONREF = 8
    AVDISCARD_BIDIR = 16
    AVDISCARD_NONINTRA = 24
    AVDISCARD_NONKEY = 32
    AVDISCARD_ALL = 48
  
  AVAudioServiceType* {.defsEnum.} = enum
    AV_AUDIO_SERVICE_TYPE_MAIN = 0
    AV_AUDIO_SERVICE_TYPE_EFFECTS = 1
    AV_AUDIO_SERVICE_TYPE_VISUALLY_IMPAIRED = 2
    AV_AUDIO_SERVICE_TYPE_HEARING_IMPAIRED = 3
    AV_AUDIO_SERVICE_TYPE_DIALOGUE = 4
    AV_AUDIO_SERVICE_TYPE_COMMENTARY = 5
    AV_AUDIO_SERVICE_TYPE_EMERGENCY = 6
    AV_AUDIO_SERVICE_TYPE_VOICE_OVER = 7
    AV_AUDIO_SERVICE_TYPE_KARAOKE = 8
    AV_AUDIO_SERVICE_TYPE_NB

  AVPanScan* {.defs.} = object
    id*: cint
    width*: cint
    height*: cint
    position*: array[3, array[2, int16]]
  
  AVCPBProperties* {.defs.} = object
    max_bitrate*: int64
    min_bitrate*: int64
    avg_bitrate*: int64
    buffer_size*: int64
    vbv_delay*: uint64
  
  AVProducerReferenceTime* {.defs.} = object
    wallclock*: int64
    flags*: cint

const
  AV_INPUT_BUFFER_PADDING_SIZE* = 64

proc av_cpb_properties_alloc* (size: ptr csize_t): ptr AVCPBProperties
proc av_xiphlacing* (s: ptr cuchar, v: cuint): cuint
