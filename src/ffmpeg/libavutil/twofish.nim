from ../types import AVTWOFISH

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

var av_twofish_size*: cint

proc av_twofish_alloc* (): ptr AVTWOFISH
proc av_twofish_init* (ctx: ptr AVTWOFISH, key: ptr uint8, key_bits: cint): cint
proc av_twofish_crypt* (ctx: ptr AVTWOFISH, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
