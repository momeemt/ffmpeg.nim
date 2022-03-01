from ../types import mfxExtBuffer, mfxSession, AVBufferRef

type
  AVQSVContext* {.bycopy.} = object
    session*: mfxSession
    iopattern*: cint
    ext_buffers*: ptr ptr mfxExtBuffer
    nb_ext_buffers*: cint
    opaque_alloc*: cint
    nb_opaque_surfaces*: cint
    opaque_surfaces*: ptr AVBufferRef
    opaque_alloc_type*: cint

when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|-58|-59|-60|-61|-62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|-58|-59|-60|-61|-62)", cdecl.}

proc av_qsv_alloc_context* (): AVQSVContext
