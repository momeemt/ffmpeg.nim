{.pragma: rc4, importc, header: "<libavutil/rc4.h>".}

type
  AVRC4* {.rc4.} = object
    state*: array[256, uint8]
    x*, y*: cint

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_rc4_alloc* (): ptr AVRC4
proc av_rc4_init* (d: ptr AVRC4, key: ptr uint8, key_bits, decrypt: cint): cint
proc av_rc4_crypt* (d: ptr AVRC4, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
