{.pragma: xtea, importc, header: "<libavutil/xtea.h>".}

type
  AVXTEA* = object
    key: array[16, uint32]

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_xtea_alloc* (): ptr AVXTEA
proc av_xtea_init* (ctx: ptr AVXTEA, key: array[16, uint8])
proc av_xtea_le_init* (ctx: ptr AVXTEA, key: array[16, uint8])
proc av_xtea_crypt* (ctx: ptr AVXTEA, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
proc av_xtea_le_crypt* (ctx: ptr AVXTEA, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
