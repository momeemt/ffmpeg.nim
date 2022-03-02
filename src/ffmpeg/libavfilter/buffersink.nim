from ../types import AVFilter, AVFilterContext, AVFrame, AVMediaType, AVRational, AVBuffer, AVBufferRef, AVPixelFormat, AVSampleFormat
from version import FF_API_BUFFERSINK_ALLOC

when FF_API_BUFFERSINK_ALLOC:
  {.pragma: buffersink, importc, header: "<libavfilter/buffersink.h>".}

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
  {.push importc, dynlib: "avfilter(|-7|-8|-9|-10|-11).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavfilter(|.7|.8|.9|.10|.11).dylib", cdecl.}
else:
  {.push importc, dynlib: "avfilter.so(|.7|.8|.9|.10|.11)", cdecl.}

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
