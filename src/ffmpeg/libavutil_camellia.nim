import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

var av_camellia_size*: cint

proc av_camellia_alloc* (): ptr AVCAMELLIA
proc av_camellia_init* (ctx: ptr AVCAMELLIA, key: ptr uint8, key_bits: cint): cint
proc av_camellia_crypt* (ctx: ptr AVCAMELLIA, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
