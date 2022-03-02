{.pragma: xtea, importc, header: "<libavutil/xtea.h>".}

type
  AVXTEA* {.xtea, bycopy.} = object
    key: ptr uint32

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_xtea_alloc* (): ptr AVXTEA
proc av_xtea_init* (ctx: ptr AVXTEA, key: ptr uint8)
proc av_xtea_le_init* (ctx: ptr AVXTEA, key: ptr uint8)
proc av_xtea_crypt* (ctx: ptr AVXTEA, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
proc av_xtea_le_crypt* (ctx: ptr AVXTEA, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
