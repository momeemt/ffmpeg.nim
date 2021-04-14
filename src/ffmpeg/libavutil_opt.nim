from libavutil_dict import AVDictionary
from libavutil_pixfmt import AVPixelFormat
from libavutil_rational import AVRational
from libavutil_samplefmt import AVSampleFormat

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

{.pragma: opt, importc, header: "<libavutil/opt.h>".}
{.pragma: log, importc, header: "<libavutil/log.h>".}

const
  AV_OPT_FLAG_ENCODING_PARAM* = 1
  AV_OPT_FLAG_DECODING_PARAM* = 2
  AV_OPT_FLAG_AUDIO_PARAM* = 8
  AV_OPT_FLAG_VIDEO_PARAM* = 16
  AV_OPT_FLAG_SUBTITLE_PARAM* = 32
  AV_OPT_FLAG_EXPORT* = 64
  AV_OPT_FLAG_READONLY* = 128
  AV_OPT_FLAG_BSF_PARAM* = 1 shl 8
  AV_OPT_FLAG_RUNTIME_PARAM* = 1 shl 15
  AV_OPT_FLAG_FILTERING_PARAM* = 1 shl 16
  AV_OPT_FLAG_DEPRECATED* = 1 shl 17
  AV_OPT_FLAG_CHILD_CONSTS* = 1 shl 18
  AV_OPT_FLAG_IMPLICIT_KEY* = 1
  AV_OPT_SEARCH_CHILDREN* = 1 shl 0
  AV_OPT_SEARCH_FAKE_OBJ* = 1 shl 1
  AV_OPT_ALLOW_NULL* = 1 shl 2
  AV_OPT_MULTI_COMPONENT_RANGE* = 1 shl 12
  AV_OPT_SERIALIZE_SKIP_DEFAULTS* = 0x00000001
  AV_OPT_SERIALIZE_OPT_FLAGS_EXACT* = 0x00000002

type
  AVClassCategory* {.log.} = enum
    AV_CLASS_CATEGORY_NA = 0
    AV_CLASS_CATEGORY_INPUT
    AV_CLASS_CATEGORY_OUTPUT
    AV_CLASS_CATEGORY_MUXER
    AV_CLASS_CATEGORY_DEMUXER
    AV_CLASS_CATEGORY_ENCODER
    AV_CLASS_CATEGORY_DECODER
    AV_CLASS_CATEGORY_FILTER
    AV_CLASS_CATEGORY_BITSTREAM_FILTER
    AV_CLASS_CATEGORY_SWSCALER
    AV_CLASS_CATEGORY_SWRESAMPLER
    AV_CLASS_CATEGORY_DEVICE_VIDEO_OUTPUT = 40
    AV_CLASS_CATEGORY_DEVICE_VIDEO_INPUT
    AV_CLASS_CATEGORY_DEVICE_AUDIO_OUTPUT
    AV_CLASS_CATEGORY_DEVICE_AUDIO_INPUT
    AV_CLASS_CATEGORY_DEVICE_OUTPUT
    AV_CLASS_CATEGORY_DEVICE_INPUT
    AV_CLASS_CATEGORY_NB

  AVClass* {.log.} = object
    class_name*: cstring
    item_name*: proc (ctx: pointer): cstring
    option*: ptr AVOption
    version*: cint
    log_level_offset_offset*: cint
    parent_log_context_offset*: cint
    child_next*: proc (obj, prev: pointer): pointer
    child_class_next*: proc (prev: ptr AVClass): ptr AVClass
    category*: AVClassCategory
    get_category*: proc (ctx: pointer): AVClassCategory
    query_ranges*: proc (a1: ptr ptr AVOptionRanges, obj: pointer, key: cstring, flags: cint): cint

  AVOptionType* {.opt.} = enum
    AV_OPT_TYPE_FLAGS
    AV_OPT_TYPE_INT
    AV_OPT_TYPE_INT64
    AV_OPT_TYPE_DOUBLE
    AV_OPT_TYPE_FLOAT
    AV_OPT_TYPE_STRING
    AV_OPT_TYPE_RATIONAL
    AV_OPT_TYPE_BINARY
    AV_OPT_TYPE_DICT
    AV_OPT_TYPE_UINT64
    AV_OPT_TYPE_CONST
    AV_OPT_TYPE_IMAGE_SIZE
    AV_OPT_TYPE_PIXEL_FMT
    AV_OPT_TYPE_SAMPLE_FMT
    AV_OPT_TYPE_VIDEO_RATE
    AV_OPT_TYPE_DURATION
    AV_OPT_TYPE_COLOR
    AV_OPT_TYPE_CHANNEL_LAYOUT
    AV_OPT_TYPE_BOOL
  
  AVOption* {.opt.} = object
    name*: cstring
    help*: cstring
    offset*: cint
    `type`*: AVOptionType
    default_val*: AVOptionUnion
    min*, max*: cdouble
    flags*: cint
    unit*: cstring
  
  AVOptionUnion* {.union, opt.} = object
    i64*: int64
    dbl*: cdouble
    str*: cstring
    q*: AVRational
  
  AVOptionRange* {.opt.} = object
    str*: cstring
    value_min*, value_max*: cdouble
    component_min*, component_max*: cdouble
    is_range*: cint
  
  AVOptionRanges* {.opt.} = object
    `range`*: ptr ptr AVOptionRange
    nb_ranges*: cint
    nb_components*: cint

proc av_opt_show2* (obj, av_log_obj: pointer, req_flags, rej_flags: cint): cint
proc av_opt_set_defaults* (s: pointer)
proc av_opt_set_defaults2* (s: pointer, mask, flags: cint)
proc av_set_options_string* (ctx: pointer, opts, key_val_sep, pairs_sep: cstring): cint
proc av_opt_set_from_string* (ctx: pointer, opts: cstring, shorthand: cstringArray, key_val_sep, pairs_sep: cstring): cint
proc av_opt_free* (obj: pointer)
proc av_opt_flag_is_set* (obj: pointer, field_name, flag_name: cstring): cint
proc av_opt_set_dict* (obj: pointer, options: ptr ptr AVDictionary): cint
proc av_opt_set_dict2* (obj: pointer, options: ptr ptr AVDictionary, search_flags: cint): cint
proc av_opt_get_key_value* (ropts: cstringArray, key_val_sep, pairs_sep: cstring, flags: cuint, rkey, rval: cstringArray): cint
proc av_opt_eval_flags* (obj: pointer, o: ptr AVOption, val: cstring, flags_out: ptr cint): cint
proc av_opt_eval_int* (obj: pointer, o: ptr AVOption, val: cstring, int_out: ptr cint): cint
proc av_opt_eval_int64* (obj: pointer, o: ptr AVOption, val: cstring, int64_out: ptr int64): cint
proc av_opt_eval_float* (obj: pointer, o: ptr AVOption, val: cstring, float_out: ptr cfloat): cint
proc av_opt_eval_double* (obj: pointer, o: ptr AVOption, val: cstring, double_out: ptr cdouble): cint
proc av_opt_eval_q* (obj: pointer, o: ptr AVOption, val: cstring, q_out: ptr AVRational): cint
proc av_opt_find* (obj: pointer, name, unit: cstring, opt_flags, search_flags: cint): ptr AVOption
proc av_opt_find2* (obj: pointer, name, unit: cstring, opt_flags, search_flags: cint, target_obj: ptr pointer): ptr AVOption
proc av_opt_next* (obj: pointer, prev: ptr AVOption): ptr AVOption
proc av_opt_child_next* (obj, prev: pointer): pointer
proc av_opt_child_class_next* (parent, prev: ptr AVClass): ptr AVClass
proc av_opt_set* (obj: pointer, name, val: cstring, search_flags: cint): cint
proc av_opt_set_int* (obj: pointer, name: cstring, val: int64, search_flags: cint): cint
proc av_opt_set_double* (obj: pointer, name: cstring, val: cdouble, search_flags: cint): cint
proc av_opt_set_q* (obj: pointer, name: cstring, val: AVRational, search_flags: cint): cint
proc av_opt_set_bin* (obj: pointer, name: cstring, val: ptr uint8, size, search_flags: cint): cint
proc av_opt_set_image_size* (obj: pointer, name: cstring, w, h, search_flags: cint): cint
proc av_opt_set_pixel_fmt* (obj: pointer, name: cstring, fmt: AVPixelFormat, search_flags: cint): cint
proc av_opt_set_sample_fmt* (obj: pointer, name: cstring, fmt: AVSampleFormat, search_flags: cint): cint
proc av_opt_set_video_rate* (obj: pointer, name: cstring, val: AVRational, search_flags: cint): cint
proc av_opt_set_channel_layout* (obj: pointer, name: cstring, val: ptr AVDictionary, search_flags: cint): cint
proc av_opt_get* (obj: pointer, name: cstring, search_flags: cint, out_val: ptr ptr uint8): cint
proc v_opt_get_int* (obj: pointer, name: cstring, search_flags: cint, out_val: ptr int64): cint
proc av_opt_get_double* (obj: pointer, name: cstring, search_flags: cint, out_val: ptr cdouble): cint
proc av_opt_get_q* (obj: pointer, name: cstring, search_flags: cint, out_val: ptr AVRational): cint
proc av_opt_get_image_size* (obj: pointer, name: cstring, search_flags: cint, w_out, h_out: ptr cint): cint
proc av_opt_get_pixel_fmt* (obj: pointer, name: cstring, search_flags: cint, out_fmt: ptr AVPixelFormat): cint
proc av_opt_get_sample_fmt* (obj: pointer, name: cstring, search_flags: cint, out_val: ptr AVSampleFormat): cint
proc av_opt_get_video_rate* (obj: pointer, name: cstring, search_flags: cint, out_val: ptr AVRational): cint
proc av_opt_get_channel_layout* (obj: pointer, name: cstring, search_flags: cint, ch_layout: ptr int64): cint
proc av_opt_get_dict_val* (obj: pointer, name: cstring, search_flags: cint, out_val: ptr ptr AVDictionary): cint
proc av_opt_ptr* (avclass: ptr AVClass, obj: pointer, name: cstring): pointer
proc av_opt_freep_ranges* (ranges: ptr ptr AVOptionRanges)
proc av_opt_query_ranges* (a1: ptr ptr AVOptionRanges, obj: pointer, key: ptr ptr cchar, flags: cint): cint
proc av_opt_copy* (dest, src: pointer): cint
proc av_opt_query_ranges_default* (a1: ptr ptr AVOptionRanges, obj: pointer, key: cstring, flags: cint): cint
proc av_opt_is_set_to_default* (obj: pointer, o: ptr AVOption): cint
proc av_opt_is_set_to_default_by_name* (obj: pointer, name: cstring, search_flags: cint): cint
proc av_opt_serialize* (obj: pointer, opt_flags: cint, flags: cint, buffer: cstringArray, key_val_sep, pairs_sep: cstring): cint

# template av_opt_set_int_list* (obj, name, val, term, flags: untyped): untyped =
#   if av_int_list_length(val, term) > high(int) / sizeof(ptr val):
#     AVERROR(EINVAL)
#   else:
#     av_opt_set_bin(obj, name, (const uint8_t *)(val), av_int_list_length(val, term) * sizeof(*(val)), flags))