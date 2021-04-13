from libavutil_buffer import AVBufferRef
from undefined_symbol import mfxSession, mfxExtBuffer

type
  AVQSVContext* = object
    session*: mfxSession
    iopattern*: cint
    ext_buffers*: ptr ptr mfxExtBuffer
    nb_ext_buffers*: cint
    opaque_alloc*: cint
    nb_opaque_surfaces*: cint
    opaque_surfaces*: ptr AVBufferRef
    opaque_alloc_type*: cint

when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

proc av_qsv_alloc_context* (): AVQSVContext
