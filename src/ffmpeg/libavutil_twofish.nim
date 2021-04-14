{.pragma: twofish, importc, header: "<libavutil/twofish.h>".}

type
  AVTWOFISH* {.twofish.} = object

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

var av_twofish_size*: cint

proc av_twofish_alloc* (): ptr AVTWOFISH
proc av_twofish_init* (ctx: ptr AVTWOFISH, key: ptr uint8, key_bits: cint): cint
proc av_twofish_crypt* (ctx: ptr AVTWOFISH, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
