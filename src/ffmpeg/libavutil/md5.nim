from ../types import AVMD5

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

var av_md5_size*: cint

proc av_md5_alloc* (): ptr AVMD5
proc av_md5_init* (ctx: ptr AVMD5)
proc av_md5_final* (ctx: ptr AVMD5, dst: ptr uint8)
proc av_md5_update* (ctx: ptr AVMD5, src: ptr uint8, len: csize_t)
proc av_md5_sum* (dst, src: ptr uint8, len: csize_t)
