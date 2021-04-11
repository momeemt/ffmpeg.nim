when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_base64_decode* (`out`: ptr uint8, `in`: ptr cchar, out_size: cint): cint
proc av_base64_encode* (`out`: ptr cchar, out_size: cint, `in`: ptr uint8, in_size: cint): ptr cchar

template AV_BASE64_DECODE_SIZE* (x: untyped): untyped = x * 3 / 4
template AV_BASE64_SIZE* (x: untyped): untyped = (x + 2) / 3 * 4 + 1
