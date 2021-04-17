import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|.55|.56|.57|.58|.59).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)", cdecl.}

proc av_mediacodec_alloc_context* (): AVMediaCodecContext
proc av_mediacodec_default_init* (avctx: ptr AVCodecContext, ctx: ptr AVMediaCodecContext, surface: pointer): cint
proc av_mediacodec_default_free* (avctx: ptr AVCodecContext)
proc av_mediacodec_release_buffer* (buffer: ptr AVMediaCodecContext, render: cint): cint
proc av_mediacodec_render_buffer_at_time* (buffer: ptr AVMediaCodecContext, time: int64): cint
