when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

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
  LIBAVUTIL_VERSION_MAJOR* = 56
  LIBAVUTIL_VERSION_MINOR* = 51
  LIBAVUTIL_VERSION_MICRO* = 100
  LIBAVUTIL_VERSION_INT* = AV_VERSION_INT(LIBAVUTIL_VERSION_MAJOR, LIBAVUTIL_VERSION_MINOR, LIBAVUTIL_VERSION_MICRO)
  LIBAVUTIL_VERSION* = AV_VERSION(LIBAVUTIL_VERSION_MAJOR, LIBAVUTIL_VERSION_MINOR, LIBAVUTIL_VERSION_MICRO)
  LIBAVUTIL_BUILD* = LIBAVUTIL_VERSION_INT
  LIBAVUTIL_IDENT* = "Lavu"

when not defined(FF_API_VAAPI):
  const FF_API_VAAPI* = LIBAVUTIL_VERSION_MAJOR < 57

when not defined(FF_API_FRAME_QP):
  const FF_API_FRAME_QP* = LIBAVUTIL_VERSION_MAJOR < 57

when not defined(FF_API_PLUS1_MINUS1):
  const FF_API_PLUS1_MINUS1* = LIBAVUTIL_VERSION_MAJOR < 57

when not defined(FF_API_ERROR_FRAME):
  const FF_API_ERROR_FRAME* = LIBAVUTIL_VERSION_MAJOR < 57

when not defined(FF_API_PKT_PTS):
  const FF_API_PKT_PTS* = LIBAVUTIL_VERSION_MAJOR < 57

when not defined(FF_API_CRYPTO_SIZE_T):
  const FF_API_CRYPTO_SIZE_T* = LIBAVUTIL_VERSION_MAJOR < 57

when not defined(FF_API_FRAME_GET_SET):
  const FF_API_FRAME_GET_SET* = LIBAVUTIL_VERSION_MAJOR < 57

when not defined(FF_API_PSEUDOPAL):
  const FF_API_PSEUDOPAL* = LIBAVUTIL_VERSION_MAJOR < 57
