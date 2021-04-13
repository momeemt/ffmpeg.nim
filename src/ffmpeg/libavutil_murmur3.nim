{.pragma: murmur3, importc, header: "<libavutil/murmur3.h>".}

type
  AVMurMur3* {.murmur3.} = object

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_murmur3_alloc* (): AVMurMur3
proc av_murmur3_init_seeded* (c: ptr AVMurMur3, seed: uint64)
proc av_murmur3_init* (c: ptr AVMurMur3)
proc av_murmur3_final* (c: ptr AVMurMur3, dst: array[16, uint8])

when defined(FF_API_CRYPTO_SIZE_T):
  proc av_murmur3_update* (c: ptr AVMurMur3, src: ptr uint8, len: cint)
else:
  proc av_murmur3_update* (c: ptr AVMurMur3, src: ptr uint8, len: csize_t)
