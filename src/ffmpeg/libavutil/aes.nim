from ../types import AVAES

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

var av_aes_size*: cint 

proc av_aes_alloc* (): ptr AVAES
proc av_aes_init* (a: ptr AVAES, key: ptr uint8, key_bits, decrypt: cint): cint
proc av_aes_crypt* (a: ptr AVAES, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
