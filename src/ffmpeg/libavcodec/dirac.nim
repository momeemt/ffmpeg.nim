from ../types import AVDiracSeqHeader

const
  MAX_DWT_LEVELS* = 5

when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|-58|-59|-60|-61|-62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|-58|-59|-60|-61|-62)", cdecl.}

proc av_dirac_parse_sequence_header* (dsh: ptr ptr AVDiracSeqHeader, buf: ptr uint8, buf_size: csize_t, log_ctx: pointer): cint
