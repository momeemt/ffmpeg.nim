import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

proc av_murmur3_alloc* (): AVMurMur3
proc av_murmur3_init_seeded* (c: ptr AVMurMur3, seed: uint64)
proc av_murmur3_init* (c: ptr AVMurMur3)
proc av_murmur3_final* (c: ptr AVMurMur3, dst: ptr uint8)

when defined(FF_API_CRYPTO_SIZE_T):
  proc av_murmur3_update* (c: ptr AVMurMur3, src: ptr uint8, len: cint)
else:
  proc av_murmur3_update* (c: ptr AVMurMur3, src: ptr uint8, len: csize_t)
