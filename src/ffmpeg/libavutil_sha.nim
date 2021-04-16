import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

var av_sha_size*: cint

proc av_sha_alloc* (): ptr AVSHA
proc av_sha_init* (context: ptr AVSHA, bits: cint): cint
proc av_sha_final* (context: ptr AVSHA, digest: ptr uint8)

when defined(FF_API_CRYPTO_SIZE_T):
  proc av_sha_update* (ctx: ptr AVSHA, data: ptr uint8, len: cuint)
else:
  proc av_sha_update* (ctx: ptr AVSHA, data: ptr uint8, len: csize_t)
