when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

template AV_TOSTRING* (s: untyped): untyped =
  s.repr

template AV_STRINGIFY* (s: untyped): untyped =
  AV_TOSTRING(s)

template AV_GLUE* (a, b: untyped): untyped =
  `a . b`

template AV_JOIN* (a, b: untyped): untyped =
  AV_GLUE(a, b)

template FFALIGN* (x, a: untyped): untyped =
  (((x) + (a) - 1) and not ((a) - 1))
