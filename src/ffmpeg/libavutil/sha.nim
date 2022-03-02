from ../types import AVSHA

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

var av_sha_size*: cint

proc av_sha_alloc* (): ptr AVSHA
proc av_sha_init* (context: ptr AVSHA, bits: cint): cint
proc av_sha_final* (context: ptr AVSHA, digest: ptr uint8)
proc av_sha_update* (ctx: ptr AVSHA, data: ptr uint8, len: csize_t)
