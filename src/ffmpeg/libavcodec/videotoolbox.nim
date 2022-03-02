from ../types import AVCodecContext

{.pragma: videoToolBox, importc, header: "<libavcodec/videotoolbox.h>".}
{.pragma: videoToolBoxInclude, importc, header: "<VideoToolbox/VideoToolbox.h>".}

type
  QuickdrawPicture* {.videoToolBoxInclude.} = object
  Picture* {.videoToolBox.} = QuickdrawPicture
  VTDecompressionSessionRef* {.videoToolBoxInclude.} = object
  VTDecompressionOutputCallback* {.videoToolBoxInclude.} = object
  CMVideoFormatDescriptionRef* {.videoToolBoxInclude.} = object
  OSType* = object

  AVVideotoolboxContext* {.bycopy, videoToolBox.} = object
    session*: VTDecompressionSessionRef
    output_callback*: VTDecompressionOutputCallback
    cv_pix_fmt_type*: OSType
    cm_fmt_desc*: CMVideoFormatDescriptionRef
    cm_codec_type*: cint

when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|-58|-59|-60|-61|-62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|-58|-59|-60|-61|-62)", cdecl.}

proc av_videotoolbox_alloc_context* (): AVVideotoolboxContext
proc av_videotoolbox_default_init* (avctx: ptr AVCodecContext): cint
proc av_videotoolbox_default_init2* (avctx: ptr AVCodecContext, vtctx: ptr AVVideotoolboxContext): cint
proc av_videotoolbox_default_free* (avctx: ptr AVCodecContext)
