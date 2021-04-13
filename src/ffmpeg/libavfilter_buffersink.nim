from libavfilter_avfilter import AVFilterContext
from libavutil_avutil import AVMediaType
from libavutil_buffer import AVBufferRef
from libavutil_frame import AVFrame
from libavutil_rational import AVRational

when defined(FF_API_NEXT):
  {.pragma: buffersink, importc, header: "<libavfilter/buffersink.h>".}
  from libavutil_pixfmt import AVPixelFormat
  from libavutil_samplefmt import AVSampleFormat

  type
    AVBufferSinkParams* {.buffersink.} = object
      pixel_fmts*: ptr AVPixelFormat
    
    AVABufferSinkParams* {.buffersink.} = object
      sample_fmts*: ptr AVSampleFormat
      channel_layouts*: ptr int64
      channel_counts*: ptr cint
      all_channel_counts*: cint
      sample_rates*: ptr cint

when defined(windows):
  {.push importc, dynlib: "avfilter(|-5|-6|-7|-8).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avfilter(|.5|.6|.7|.8).dylib".}
else:
  {.push importc, dynlib: "avfilter.so(|.5|.6|.7|.8)".}

const
  AV_BUFFERSINK_FLAG_PEEK* = 1
  AV_BUFFERSINK_FLAG_NO_REQUEST* = 2
  
proc av_buffersink_get_frame_flags* (ctx: ptr AVFilterContext, frame: ptr AVFrame, flags: cint): cint
proc av_buffersink_set_frame_size* (ctx: ptr AVFilterContext, frame_size: cuint)
proc av_buffersink_get_type* (ctx: ptr AVFilterContext): AVMediaType
proc av_buffersink_get_time_base* (ctx: ptr AVFilterContext): AVRational
proc av_buffersink_get_format* (ctx: ptr AVFilterContext): cint
proc av_buffersink_get_frame_rate* (ctx: ptr AVFilterContext): AVRational
proc av_buffersink_get_w* (ctx: ptr AVFilterContext): cint
proc av_buffersink_get_h* (ctx: ptr AVFilterContext): cint
proc av_buffersink_get_sample_aspect_ratio* (ctx: ptr AVFilterContext): AVRational
proc av_buffersink_get_channels* (ctx: ptr AVFilterContext): cint
proc av_buffersink_get_channel_layout* (ctx: ptr AVFilterContext): uint64
proc av_buffersink_get_sample_rate* (ctx: ptr AVFilterContext): cint
proc av_buffersink_get_hw_frames_ctx* (ctx: ptr AVFilterContext): AVBufferRef
proc av_buffersink_get_frame* (ctx: ptr AVFilterContext, frame: ptr AVFrame): cint
proc av_buffersink_get_samples* (ctx: ptr AVFilterContext, frame: ptr AVFrame, nb_samples: cint): cint

when defined(FF_API_NEXT):
  proc av_buffersink_params_alloc* (): AVBufferSinkParams {.deprecated.}
  proc av_abuffersink_params_alloc* (): AVABufferSinkParams {.deprecated.}
