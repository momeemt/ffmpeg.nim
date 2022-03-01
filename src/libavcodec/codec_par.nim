from ../types import AVCodecParameters

when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|-58|-59|-60|-61|-62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|-58|-59|-60|-61|-62)", cdecl.}

proc avcodec_parameters_alloc* (): ptr AVCodecParameters
proc avcodec_parameters_free* (par: ptr ptr AVCodecParameters)
proc avcodec_parameters_copy* (dst, src: ptr AVCodecParameters): cint
proc av_get_audio_frame_duration2* (par: ptr AVCodecParameters, frame_bytes: cint): cint
