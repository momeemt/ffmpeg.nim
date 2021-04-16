when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)", cdecl.}

proc av_display_rotation_get* (matrix: array[9, int32]): cdouble
proc av_display_rotation_set* (matrix: array[9, int32], angle: cdouble)
proc av_display_matrix_flip* (matrix: array[9, int32], hflip, vflip: cint)
