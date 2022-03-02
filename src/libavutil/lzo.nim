when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

const
  AV_LZO_INPUT_DEPLETED* = 1
  AV_LZO_OUTPUT_FULL* = 2
  AV_LZO_INVALID_BACKPTR* = 4
  AV_LZO_ERROR* = 8
  AV_LZO_INPUT_PADDING* = 8
  AV_LZO_OUTPUT_PADDING* = 12

proc av_lzo1x_decode* (`out`: pointer, outlen: ptr cint, `in`: pointer, inlen: ptr cint): cint
