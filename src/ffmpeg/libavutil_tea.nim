{.pragma: tea, importc, header: "<libavutil/tea.h>".}

type
  AVTEA* {.tea.} = object

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_tea_alloc* (): ptr AVTEA
proc av_tea_init* (ctx: ptr AVTEA, key: array[16, uint8], rounds: cint)
proc av_tea_crypt* (ctx: ptr AVTEA, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
