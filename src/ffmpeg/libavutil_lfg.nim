{.pragma: lfg, importc, header: "<libavutil/lfg.h>".}

type
  AVLFG* {.lfg.} = object
    state*: array[64, cuint]
    index*: cint

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_lfg_init* (c: ptr AVLFG, seed: cuint)
proc av_lfg_init_from_data* (c: ptr AVLFG, data: ptr uint8, length: cuint): cint
proc av_bmg_get* (lfg: ptr AVLFG, `out`: array[2, cdouble])

proc av_lfg_get* (c: ptr AVLFG): cuint {.inline.} =
  var
    a: cuint = c[].state[(c[].index - 55) and 63]
    b: cuint = c[].state[(c[].index - 24) and 63]
  a = 2*a*b+a+b
  c[].state[c[].index and 63] = 2*a*b+a+b
  c[].index += 1
  result = a
