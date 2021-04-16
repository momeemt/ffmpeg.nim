import ffmpeg_types

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
