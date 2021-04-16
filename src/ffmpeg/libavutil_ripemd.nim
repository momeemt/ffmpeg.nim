import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

var av_ripemd_size*: cint

proc av_ripemd_alloc* (): ptr AVRIPEMD
proc av_ripemd_init* (context: ptr AVRIPEMD, bits: cint): cint
proc av_ripemd_final* (context: ptr AVRIPEMD, digest: ptr uint8)

when defined(FF_API_CRYPTO_SIZE_T):
  proc av_ripemd_update* (context: ptr AVRIPEMD, data: ptr uint8, len: cuint)
else:
  proc av_ripemd_update* (context: ptr AVRIPEMD, data: ptr uint8, len: csize_t)
