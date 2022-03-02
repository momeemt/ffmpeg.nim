when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

template AV_VERSION_INT* (a, b, c: untyped): untyped =
  (a shl 16) or (b shl 8) or c

template AV_VERSION_DOT* (a, b, c: untyped): untyped =
  a.repr & "." & b.repr & "." & c.repr

template AV_VERSION* (a, b, c: untyped): untyped =
  AV_VERSION_DOT(a, b, c)

template AV_VERSION_MAJOR* (a: untyped): untyped =
  a shr 16

template AV_VERSION_MINOR* (a: untyped): untyped =
  (a and 0x00ff00) shr 8

template AV_VERSION_MICRO* (a: untyped): untyped =
  a and 0xff

const
  LIBAVUTIL_VERSION_MAJOR* = 57
  LIBAVUTIL_VERSION_MINOR* = 17
  LIBAVUTIL_VERSION_MICRO* = 100
  LIBAVUTIL_VERSION_INT* = AV_VERSION_INT(LIBAVUTIL_VERSION_MAJOR, LIBAVUTIL_VERSION_MINOR, LIBAVUTIL_VERSION_MICRO)
  LIBAVUTIL_VERSION* = AV_VERSION(LIBAVUTIL_VERSION_MAJOR, LIBAVUTIL_VERSION_MINOR, LIBAVUTIL_VERSION_MICRO)
  LIBAVUTIL_BUILD* = LIBAVUTIL_VERSION_INT
  LIBAVUTIL_IDENT* = "Lavu"
  FF_API_D2STR* = LIBAVUTIL_VERSION_MAJOR < 58
  FF_API_DECLARE_ALIGNED* = LIBAVUTIL_VERSION_MAJOR < 58
  FF_API_COLORSPACE_NAME* = LIBAVUTIL_VERSION_MAJOR < 58
  FF_API_AV_MALLOCZ_ARRAY* = LIBAVUTIL_VERSION_MAJOR < 58
