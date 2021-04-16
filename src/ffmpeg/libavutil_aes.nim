import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

var av_aes_size*: cint 

proc av_aes_alloc* (): ptr AVAES
proc av_aes_init* (a: ptr AVAES, key: ptr uint8, key_bits, decrypt: cint): cint
proc av_aes_crypt* (a: ptr AVAES, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
