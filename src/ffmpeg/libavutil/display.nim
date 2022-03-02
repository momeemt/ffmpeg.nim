when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_display_rotation_get* (matrix: ptr int32): cdouble
proc av_display_rotation_set* (matrix: ptr int32, angle: cdouble)
proc av_display_matrix_flip* (matrix: ptr int32, hflip, vflip: cint)
