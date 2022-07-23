from ../types import AVMurMur3

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_murmur3_alloc* (): AVMurMur3
proc av_murmur3_init_seeded* (c: ptr AVMurMur3, seed: uint64)
proc av_murmur3_init* (c: ptr AVMurMur3)
proc av_murmur3_final* (c: ptr AVMurMur3, dst: ptr uint8)
proc av_murmur3_update* (c: ptr AVMurMur3, src: ptr uint8, len: csize_t)
