from libavfilter_avfilter import AVFilterContext
from libavutil_buffer import AVBufferRef
from libavutil_frame import AVFrame
from libavutil_rational import AVRational

{.pragma: buffersrc, importc, header: "<libavfilter/buffersrc.h>".}

type
  AVBufferSrcParameters* {.buffersrc.} = object
    format*: cint
    time_base*: AVRational
    width*: cint
    height*: cint
    sample_aspect_ratio*: AVRational
    frame_rate*: AVRational
    hw_frames_ctx*: ptr AVBufferRef
    sample_rate*: cint
    channel_layout*: uint64

when defined(windows):
  {.push importc, dynlib: "avfilter(|-5|-6|-7|-8).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avfilter(|.5|.6|.7|.8).dylib".}
else:
  {.push importc, dynlib: "avfilter.so(|.5|.6|.7|.8)".}

const
  AV_BUFFERSRC_FLAG_NO_CHECK_FORMAT* = 1
  AV_BUFFERSRC_FLAG_PUSH* = 4
  AV_BUFFERSRC_FLAG_KEEP_REF* = 8

proc av_buffersrc_get_nb_failed_requests* (buffer_src: ptr AVFilterContext): cuint
proc av_buffersrc_parameters_alloc* (): ptr AVBufferSrcParameters
proc av_buffersrc_parameters_set* (ctx: ptr AVFilterContext, param: ptr AVBufferSrcParameters): cint
proc av_buffersrc_write_frame* (ctx: ptr AVFilterContext, frame: ptr AVFrame): cint # warning
proc av_buffersrc_add_frame* (ctx: ptr AVFilterContext, frame: ptr AVFrame): cint # warning
proc av_buffersrc_add_frame_flags* (buffer_src: ptr AVFilterContext, frame: ptr AVFrame, flags: cint): cint # warning
proc av_buffersrc_close* (ctx: ptr AVFilterContext, pts: int64, flags: cuint): cint
