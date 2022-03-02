from ../types import AVLFG

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_lfg_init* (c: ptr AVLFG, seed: cuint)
proc av_lfg_init_from_data* (c: ptr AVLFG, data: ptr uint8, length: cuint): cint
proc av_bmg_get* (lfg: ptr AVLFG, `out`: ptr cdouble)

proc av_lfg_get* (c: ptr AVLFG): cuint {.inline.} =
  var
    a: cuint = c[].state[(c[].index - 55) and 63]
    b: cuint = c[].state[(c[].index - 24) and 63]
  a = 2*a*b+a+b
  c[].state[c[].index and 63] = 2*a*b+a+b
  c[].index += 1
  result = a
