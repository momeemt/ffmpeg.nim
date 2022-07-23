from ../types import AVCodecID, AVCodecDescriptor

when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|.58|.59|.60|.61|.62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.58|.59|.60|.61|.62)", cdecl.}
  
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
