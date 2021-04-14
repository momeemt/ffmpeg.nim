from libavutil_avutil import AVMediaType
from libavutil_buffer import AVBufferRef
from libavutil_dict import AVDictionary
from libavutil_frame import AVFrame
from libavutil_opt import AVClass
from libavutil_rational import AVRational

{.pragma: avfilter, importc, header: "<libavfilter/avfilter.h>".}

type
  AVFilterInternal* {.avfilter.} = object
  AVFilterPad* {.avfilter.} = object
  AVFilterFormats* {.avfilter.} = object
  AVFilterGraphInternal* {.avfilter.} = object
  AVFilterChannelLayouts* {.importc: "struct $1", header: "<libavfilter/avfilter.h>".} = object
  AVFilterCommand* {.importc: "struct $1", header: "<libavfilter/avfilter.h>".} = object

  AVFilterContext* {.avfilter.} = object
    av_class*: ptr AVClass
    filter*: ptr AVFilter
    name*: cstring
    input_pads*: ptr AVFilterPad
    inputs*: ptr ptr AVFilterLink
    nb_inputs*: cuint
    output_pads*: ptr AVFilterPad
    outputs*: ptr ptr AVFilterLink
    nb_outputs*: cuint
    priv*: pointer
    graph*: ptr AVFilterGraph
    thread_type*: cint
    internal*: ptr AVFilterInternal
    command_queue*: ptr AVFilterCommand
    enable_str*: cstring
    enable*: pointer
    var_values*: ptr cdouble
    is_disabled*: cint
    hw_device_ctx*: ptr AVBufferRef
    nb_threads*: cint
    ready*: cuint
    extra_hw_frames*: cint

  AVFilterLink* {.avfilter.} = object
    src*: ptr AVFilterContext
    srcpad*: ptr AVFilterPad
    dst*: ptr AVFilterContext
    dstpad*: ptr AVFilterPad
    `type`*: AVMediaType
    w*: cint
    h*: cint
    sample_aspect_ratio*: AVRational
    channel_layout*: uint64
    sample_rate*: cint
    format*: cint
    time_base*: AVRational
    in_formats*: ptr AVFilterFormats
    out_formats*: ptr AVFilterFormats
    in_samplerates*: ptr AVFilterFormats
    out_samplerates*: ptr AVFilterFormats
    in_channel_layouts*: ptr AVFilterChannelLayouts
    out_channel_layouts*: ptr AVFilterChannelLayouts
    request_samples*: cint
    init_state*: AVFilterLinkInitState
    graph*: ptr AVFilterGraph
    current_pts*: int64
    current_pts_us*: int64
    age_index*: cint
    frame_rate*: AVRational
    partial_buf*: ptr AVFrame
    partial_buf_size*: cint
    min_samples*: cint
    max_samples*: cint
    channels*: cint
    flags*: cuint
    frame_count_in*: int64
    frame_count_out*: int64
    frame_pool*: pointer
    frame_wanted_out*: cint
    hw_frames_ctx*: ptr AVBufferRef

    when not defined(FF_INTERNAL_FIELDS):
      reserved*: array[0xF000, cstring]
    else:
      fifo*: FFFrameQueue
      frame_blocked_in*: cint
      status_in*: cint
      status_in_pts*: int64
      status_out*: cint
  
  AVFilterLinkInitState* {.avfilter.} = enum
    AVLINK_UNINIT = 0
    AVLINK_STARTINIT
    AVLINK_INIT

  AVFilter* {.avfilter.} = object
    name*: cstring
    description*: cstring
    inputs*: ptr AVFilterPad
    outputs*: ptr AVFilterPad
    priv_class*: ptr AVClass
    flags*: cint
    preinit*: proc (ctx: ptr AVFilterContext): cint
    init*: proc (ctx: ptr AVFilterContext): cint
    init_dict*: proc (ctx: ptr AVFilterContext, options: ptr ptr AVDictionary): cint
    uninit*: proc (ctx: ptr AVFilterContext)
    query_formats*: proc (a1: ptr AVFilterContext): cint
    priv_size*: cint
    flags_internal*: cint
    next*: ptr AVFilter
    process_command*: proc (a1: ptr AVFilterContext, cmd, arg, res: cstring, res_len, flags: cint): cint
    init_opaque*: proc (ctx: ptr AVFilterContext, opaque: pointer): cint
    activate*: proc (ctx: ptr AVFilterContext): cint

  avfilter_action_func* {.avfilter.} = proc (ctx: ptr AVFilterContext, arg: pointer, jobnr, nb_jobs: cint): cint
  avfilter_execute_func* {.avfilter.} = proc (ctx: ptr AVFilterContext, `func`: ptr avfilter_action_func, arg: pointer, ret: ptr cint, nb_jobs: cint): cint

  AVFilterGraph* {.avfilter.} = object
    av_class*: ptr AVClass
    filters*: ptr ptr AVFilterContext
    nb_filters*: cuint
    scale_sws_opts*: cstring
    thread_type*: cint
    nb_threads*: cint
    internal*: ptr AVFilterGraphInternal
    opaque*: pointer
    execute*: ptr avfilter_execute_func
    aresample_swr_opts*: cstring
    sink_links*: ptr ptr AVFilterLink
    sink_links_count*: cint
    disable_auto_convert*: cuint

    when defined(FF_API_LAVR_OPTS):
      resample_lavr_opts {.deprecated.} : cstring
  
  AVFilterInOut* {.avfilter.} = object
    name*: cstring
    filter_ctx*: ptr AVFilterContext
    pad_idx*: cint
    next*: ptr AVFilterInOut

when defined(windows):
  {.push importc, dynlib: "avfilter(|-5|-6|-7|-8).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avfilter(|.5|.6|.7|.8).dylib".}
else:
  {.push importc, dynlib: "avfilter.so(|.5|.6|.7|.8)".}

const
  AVFILTER_FLAG_DYNAMIC_INPUTS* = 1 shl 0
  AVFILTER_FLAG_DYNAMIC_OUTPUTS* = 1 shl 1
  AVFILTER_FLAG_SLICE_THREADS* = 1 shl 2
  AVFILTER_FLAG_SUPPORT_TIMELINE_GENERIC* = 1 shl 16
  AVFILTER_FLAG_SUPPORT_TIMELINE_INTERNAL* = 1 shl 17
  AVFILTER_FLAG_SUPPORT_TIMELINE* = AVFILTER_FLAG_SUPPORT_TIMELINE_GENERIC or AVFILTER_FLAG_SUPPORT_TIMELINE_INTERNAL
  AVFILTER_THREAD_SLICE* = 1 shl 0
  AVFILTER_CMD_FLAG_ONE* = 1
  AVFILTER_CMD_FLAG_FAST* = 2
  AVFILTER_AUTO_CONVERT_ALL* = 0
  AVFILTER_AUTO_CONVERT_NONE* = -1

proc avfilter_version* (): cuint
proc avfilter_configuration* (): cstring
proc avfilter_license* (): cstring
proc avfilter_pad_count* (pads: ptr AVFilterPad): cint
proc avfilter_pad_get_name* (pads: ptr AVFilterPad, pad_idx: cint): cstring
proc avfilter_pad_get_type* (pads: ptr AVFilterPad, pad_idx: cint): AVMediaType
proc avfilter_link* (sr: ptr AVFilterContext, srcpad: cuint, dst: ptr AVFilterContext, dstpad: cuint): cint
proc avfilter_link_free* (link: ptr ptr AVFilterLink)
proc avfilter_link_set_closed* (link: ptr AVFilterLink, closed: cint) {.deprecated.}
proc avfilter_config_links* (filter: ptr AVFilterContext): cint
proc avfilter_process_command* (filter: ptr AVFilterContext, cmd, arg, res: cstring, res_len, flags: cint): cint
proc av_filter_iterate* (opaque: pointer): ptr AVFilter
proc avfilter_get_by_name* (name: cstring): ptr AVFilter
proc avfilter_init_str* (ctx: ptr AVFilterContext, args: cstring): cint
proc avfilter_init_dict* (ctx: ptr AVFilterContext, options: ptr ptr AVDictionary): cint
proc avfilter_free* (filter: ptr AVFilterContext)
proc avfilter_insert_filter* (link: ptr AVFilterLink, filt: ptr AVFilterContext, filt_srcpad_idx, filt_dstpad_idx: cuint): cint
proc avfilter_get_class* (): ptr AVClass
proc avfilter_graph_alloc* (): ptr AVFilterGraph
proc avfilter_graph_alloc_filter* (graph: ptr AVFilterGraph, filter: ptr AVFilter, name: cstring): AVFilterContext
proc avfilter_graph_get_filter* (graph: ptr AVFilterGraph, name: cstring): AVFilterContext
proc avfilter_graph_create_filter* (filt_ctx: ptr ptr AVFilterContext, filt: ptr AVFilter, name, args: cstring, opaque: pointer, graph_ctx: ptr AVFilterGraph): cint
proc avfilter_graph_set_auto_convert* (graph: ptr AVFilterGraph, flags: cuint)
proc avfilter_graph_config* (graphctx: ptr AVFilterGraph, log_ctx: pointer): cint
proc avfilter_graph_free* (graph: ptr ptr AVFilterGraph)
proc avfilter_inout_alloc* (): AVFilterInOut
proc avfilter_inout_free* (inout: ptr ptr AVFilterInOut)
proc avfilter_graph_parse* (graph: ptr AVFilterGraph, filters: cstring, inputs, outputs: ptr AVFilterInOut, log_ctx: pointer): cint
proc avfilter_graph_parse_ptr* (graph: ptr AVFilterGraph, filters: cstring, inputs, outputs: ptr ptr AVFilterInOut, log_ctx: pointer): cint
proc avfilter_graph_parse2* (graph: ptr AVFilterGraph, filters: cstring, inputs, outputs: ptr ptr AVFilterInOut): cint
proc avfilter_graph_send_command* (graph: ptr AVFilterGraph, target, cmd, arg, res: cstring, res_len, flags: cint): cint
proc avfilter_graph_queue_command* (graph: ptr AVFilterGraph, target, cmd, arg: cstring, flags: cint, ts: cdouble): cint
proc avfilter_graph_dump* (graph: ptr AVFilterGraph, options: cstring): cstring
proc avfilter_graph_request_oldest* (graph: ptr AVFilterGraph): cint

when defined(FF_API_FILTER_GET_SET):
  proc avfilter_link_get_channels* (link: ptr AVFilterLink): cint {.deprecated.}

when defined(FF_API_NEXT):
  proc avfilter_register_all* () {.deprecated.}
  proc avfilter_register* (filter: ptr AVFilter): cint {.deprecated.}
  proc avfilter_next* (prev: ptr AVFilter): ptr AVFilter {.deprecated.}
