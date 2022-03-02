from ../types import AVSHA512

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

var av_sha512_size*: cint

proc av_sha512_alloc* (): ptr AVSHA512
proc av_sha512_init* (context: ptr AVSHA512, bits: cint): cint
proc av_sha512_final* (context: ptr AVSHA512, digest: ptr uint8)
proc av_sha512_update* (context: ptr AVSHA512, data: ptr uint8, len: csize_t)
