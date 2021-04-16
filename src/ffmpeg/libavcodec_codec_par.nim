import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

proc avcodec_parameters_alloc* (): ptr AVCodecParameters
proc avcodec_parameters_free* (par: ptr ptr AVCodecParameters)
proc avcodec_parameters_copy* (dst, src: ptr AVCodecParameters): cint
