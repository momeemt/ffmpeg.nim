import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll, cdecl".}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|.55|.56|.57|.58|.59).dylib, cdecl".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59), cdecl".}

proc avcodec_dct_alloc* (): ptr AVDCT
proc avcodec_dct_init* (a1: ptr AVDCT): cint
proc avcodec_dct_get_class* (): ptr AVClass
