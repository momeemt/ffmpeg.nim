from ../types import AVCAMELLIA

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

var av_camellia_size*: cint

proc av_camellia_alloc* (): ptr AVCAMELLIA
proc av_camellia_init* (ctx: ptr AVCAMELLIA, key: ptr uint8, key_bits: cint): cint
proc av_camellia_crypt* (ctx: ptr AVCAMELLIA, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
