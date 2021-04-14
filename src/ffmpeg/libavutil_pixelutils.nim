{.pragma: pixelutils, importc, header: "<libavutil/pixelutils.h>".}

type
  av_pixelutils_sad_fn* {.pixelutils.} = proc (src1: ptr uint8, stride1: ByteAddress, src2: ptr uint8, stride2: ByteAddress): cint

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_pixelutils_get_sad_fn* (w_bits, h_bits, aligned: cint, log_ctx: pointer): av_pixelutils_sad_fn
