when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|-58|-59|-60|-61|-62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|-58|-59|-60|-61|-62)", cdecl.}

const
  AV_AAC_ADTS_HEADER_SIZE* = 7

proc av_adts_header_parse* (buf: ptr uint8, samples: ptr uint32, frames: ptr uint8): cint
