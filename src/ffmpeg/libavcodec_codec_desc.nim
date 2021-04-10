when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

from libavutil_avutil import AVMediaType

type
  AVCodecDescriptor* = object
    id: AVCodecID
    `type`: AVMediaType
    name: ptr cchar
    long_name: ptr cchar
    props: cint
    mime_types: ptr ptr cchar
    profiles: ptr AVProfile
  
const
  AV_CODEC_PROP_INTRA_ONLY* = 1 shl 0
  AV_CODEC_PROP_LOSSY* = 1 shl 1
  AV_CODEC_PROP_LOSSLESS* = 1 shl 2
  AV_CODEC_PROP_REORDER* = 1 shl 3
  AV_CODEC_PROP_BITMAP_SUB* = 1 shl 16
  AV_CODEC_PROP_TEXT_SUB* = 1 shl 17

proc avcodec_descriptor_get* (id: AVCodecID): ptr AVCodecDescriptor
proc avcodec_descriptor_next* (prev: ptr AVCodecDescriptor): ptr AVCodecDescriptor
proc avcodec_descriptor_get_by_name* (name: ptr cchar): ptr AVCodecDescriptor
