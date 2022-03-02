import std/time_t
from ../types import AVRational, tm

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_parse_ratio* (q: ptr AVRational, str: cstring, max, log_offset: cint, log_ctx: pointer): cint
proc av_parse_video_size* (width_ptr, height_ptr: ptr cint, str: cstring): cint
proc av_parse_video_rate* (rate: ptr AVRational, str: cstring): cint
proc av_parse_color* (rgba_color: ptr uint8, color_string: cstring, slen: cint, log_ctx: pointer): cint
proc av_get_known_color_name* (color_idx: cint, rgb: ptr ptr uint8): cstring
proc av_parse_time* (timeval: ptr int64, timestr: cstring, duration: cint): cint
proc av_find_info_tag* (arg: cstring, arg_size: cint, tag1, info: cstringArray): cint
proc av_small_strptime* (p, fmt: cstring, dt: ptr tm)
proc av_timegm* (`tm`: ptr tm): Time

template av_parse_ratio_quiet* (rate, str, max: untyped): untyped =
  av_parse_ratio(rate, str, max, AV_LOG_MAX_OFFSET, nil)
