import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

proc av_tea_alloc* (): ptr AVTEA
proc av_tea_init* (ctx: ptr AVTEA, key: ptr uint8, rounds: cint)
proc av_tea_crypt* (ctx: ptr AVTEA, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
