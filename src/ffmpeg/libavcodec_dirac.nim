import ffmpeg_types

const
  MAX_DWT_LEVELS* = 5

when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|.55|.56|.57|.58|.59).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)", cdecl.}

proc av_dirac_parse_sequence_header* (dsh: ptr ptr AVDiracSeqHeader, buf: ptr uint8, buf_size: csize_t, log_ctx: pointer): cint
