when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

#define Picture QuickdrawPicture
#include <VideoToolbox/VideoToolbox.h>
#undef Picture

type
  AVVideotoolboxContext* = object
    session: VTDecompressionSessionRef
    output_callback: VTDecompressionOutputCallback
    cv_pix_fmt_type: OSType
    cm_fmt_desc: CMVideoFormatDescriptionRef
    cm_codec_type: cint

proc av_videotoolbox_alloc_context* (): AVVideotoolboxContext
proc av_videotoolbox_default_init* (avctx: ptr AVCodecContext): cint
proc av_videotoolbox_default_init2* (avctx: ptr AVCodecContext, vtctx: ptr AVVideotoolboxContext): cint
proc av_videotoolbox_default_free* (avctx: ptr AVCodecContext)
