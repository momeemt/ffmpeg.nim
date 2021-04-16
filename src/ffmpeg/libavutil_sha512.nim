import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

var av_sha512_size*: cint

proc av_sha512_alloc* (): ptr AVSHA512
proc av_sha512_init* (context: ptr AVSHA512, bits: cint): cint
proc av_sha512_final* (context: ptr AVSHA512, digest: ptr uint8)

when defined(FF_API_CRYPTO_SIZE_T):
  proc av_sha512_update* (context: ptr AVSHA512, data: ptr uint8, len: cuint)
else:
  proc av_sha512_update* (context: ptr AVSHA512, data: ptr uint8, len: csize_t)
