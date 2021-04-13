from libavcodec_codec import AVProfile
from libavcodec_codec_id import AVCodecID
from libavutil_avutil import AVMediaType

{.pragma: codecDesc, importc, header:"<libavcodec/codec_desc.h>".}

type
  AVCodecDescriptor* {.codecDesc.} = object
    id*: AVCodecID
    `type`*: AVMediaType
    name*: cstring
    long_name*: cstring
    props*: cint
    mime_types*: cstringArray
    profiles*: ptr AVProfile

when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}
  
const
  AV_CODEC_PROP_INTRA_ONLY* = 1 shl 0
  AV_CODEC_PROP_LOSSY* = 1 shl 1
  AV_CODEC_PROP_LOSSLESS* = 1 shl 2
  AV_CODEC_PROP_REORDER* = 1 shl 3
  AV_CODEC_PROP_BITMAP_SUB* = 1 shl 16
  AV_CODEC_PROP_TEXT_SUB* = 1 shl 17

proc avcodec_descriptor_get* (id: AVCodecID): ptr AVCodecDescriptor
proc avcodec_descriptor_next* (prev: ptr AVCodecDescriptor): ptr AVCodecDescriptor
proc avcodec_descriptor_get_by_name* (name: cstring): ptr AVCodecDescriptor
