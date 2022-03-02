when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_base64_decode* (`out`: ptr uint8, `in`: cstring, out_size: cint): cint
proc av_base64_encode* (`out`: cstring, out_size: cint, `in`: ptr uint8, in_size: cint): cstring

template AV_BASE64_DECODE_SIZE* (x: untyped): untyped = x * 3 / 4
template AV_BASE64_SIZE* (x: untyped): untyped = (x + 2) / 3 * 4 + 1
