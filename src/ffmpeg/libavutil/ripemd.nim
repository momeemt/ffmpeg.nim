from ../types import AVRIPEMD

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

var av_ripemd_size*: cint

proc av_ripemd_alloc* (): ptr AVRIPEMD
proc av_ripemd_init* (context: ptr AVRIPEMD, bits: cint): cint
proc av_ripemd_final* (context: ptr AVRIPEMD, digest: ptr uint8)
proc av_ripemd_update* (context: ptr AVRIPEMD, data: ptr uint8, len: csize_t)
