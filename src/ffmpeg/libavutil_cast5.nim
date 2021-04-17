import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

var av_cast5_size*: cint

proc av_cast5_alloc* (): ptr AVCAST5
proc av_cast5_init* (ctx: ptr AVCAST5, key: ptr uint8, key_bits: cint): cint
proc av_cast5_crypt* (ctx: ptr AVCAST5, dst, src: ptr uint8, count, decrypt: cint)
proc av_cast5_crypt2* (ctx: ptr AVCAST5, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
