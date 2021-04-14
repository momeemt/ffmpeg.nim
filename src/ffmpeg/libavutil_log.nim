from libavutil_bprint import va_list
from libavutil_opt import AVOption, AVClassCategory

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

const
  AV_LOG_QUIET* = -8
  AV_LOG_PANIC* = 0
  AV_LOG_FATAL* = 8
  AV_LOG_ERROR* = 16
  AV_LOG_WARNING* = 24
  AV_LOG_INFO* = 32
  AV_LOG_VERBOSE* = 40
  AV_LOG_DEBUG* = 48
  AV_LOG_TRACE* = 56
  AV_LOG_MAX_OFFSET* = AV_LOG_TRACE - AV_LOG_QUIET
  AV_LOG_SKIP_REPEATED* = 1
  AV_LOG_PRINT_LEVEL* = 2

template AV_IS_INPUT_DEVICE* (category: untyped): untyped =
  var
    tmp1 = category == AV_CLASS_CATEGORY_DEVICE_VIDEO_INPUT
    tmp2 = category == AV_CLASS_CATEGORY_DEVICE_AUDIO_INPUT
    tmp3 = category == AV_CLASS_CATEGORY_DEVICE_INPUT
  tmp1 or tmp2 or tmp3

template AV_IS_OUTPUT_DEVICE* (category: untyped): untyped =
  var
    tmp1 = category == AV_CLASS_CATEGORY_DEVICE_VIDEO_OUTPUT
    tmp2 = category == AV_CLASS_CATEGORY_DEVICE_AUDIO_OUTPUT
    tmp3 = category == AV_CLASS_CATEGORY_DEVICE_OUTPUT
  tmp1 or tmp2 or tmp3

template AV_LOG_C* (x: untyped): untyped =
  x shl 8

proc av_log* (avcl: pointer, level: cint, fmt: ptr cchar) {.varargs.}
proc av_log_once* (avcl: pointer, initial_level, subsequent_level: cint, state: ptr cint, fmt: ptr cchar) {.varargs.}
proc av_vlog* (avcl: pointer, level: cint, fmt: ptr cchar, vl: va_list)
proc av_log_get_level* (): cint
proc av_log_set_level* (level: cint)
proc av_log_set_callback* (callback: proc (a1: pointer, a2: cint, a3: ptr cchar, a4: va_list))
proc av_log_default_callback* (avcl: pointer, level: cint, fmt: cchar, vl: va_list)
proc av_default_item_name* (ctx: pointer): ptr cchar
proc av_default_get_category* (`ptr`: pointer): AVClassCategory
proc av_log_format_line* (`ptr`: pointer, level: cint, fmt: ptr cchar, vl: va_list, line: ptr cchar, line_size: cint, print_prefix: ptr cint)
proc av_log_format_line2* (`ptr`: pointer, level: cint, fmt: ptr cchar, vl: va_list, line: ptr cchar, line_size: cint, print_prefix: ptr cint): cint
proc av_log_set_flags* (arg: cint)
proc av_log_get_flags* (): cint
