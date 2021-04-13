{.pragma: md5, importc, header: "<libavutil/md5.h>".}

type
  AVMD5* {.md5.} = object

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

var av_md5_size*: cint

proc av_md5_alloc* (): ptr AVMD5
proc av_md5_init* (ctx: ptr AVMD5)
proc av_md5_final* (ctx: ptr AVMD5, dst: ptr uint8)


when defined(FF_API_CRYPTO_SIZE_T):
  proc av_md5_update* (ctx: ptr AVMD5, src: ptr uint8, len: cint)
  proc av_md5_sum* (dst, src: ptr uint8, len: cint)
else:
  proc av_md5_update* (ctx: ptr AVMD5, src: ptr uint8, len: csize_t)
  proc av_md5_sum* (dst, src: ptr uint8, len: csize_t)
