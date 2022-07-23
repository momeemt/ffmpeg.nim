when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|.58|.59|.60|.61|.62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.58|.59|.60|.61|.62)", cdecl.}

proc av_ac3_parse_header* (buf: ptr uint8, size_t: uint8, bitstream_id: ptr uint8, frame_size: ptr uint16): cint
