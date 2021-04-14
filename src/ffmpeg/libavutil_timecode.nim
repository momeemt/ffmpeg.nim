from libavutil_rational import AVRational

{.pragma: timecode, importc, header: "<libavutil/timecode.h>".}

type
  AVTimecodeFlag* {.timecode.} = enum
    AV_TIMECODE_FLAG_DROPFRAME = 1 shl 0
    AV_TIMECODE_FLAG_24HOURSMAX = 1 shl 1
    AV_TIMECODE_FLAG_ALLOWNEGATIVE = 1 shl 2
  
  AVTimecode* {.timecode.} = object
    start: cint
    flags: uint32
    rate: AVRational
    fps: cuint

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

const
  AV_TIMECODE_STR_SIZE* = 23

proc av_timecode_adjust_ntsc_framenum2* (framenum, fps: cint): cint
proc av_timecode_get_smpte_from_framenum* (tc: ptr AVTimecode, framenum: cint): uint32
proc av_timecode_make_string* (tc: ptr AVTimecode, buf: cstring, framenum: cint): cstring
proc av_timecode_make_smpte_tc_string* (buf: cstring, tcsmpte: uint32, prevent_df: cint): cstring
proc av_timecode_make_mpeg_tc_string* (buf: cstring, tc25bit: uint32): cstring
proc av_timecode_init* (tc: ptr AVTimecode, rate: AVRational, flags, frame_start: cint, log_ctx: pointer): cint
proc av_timecode_init_from_string* (tc: ptr AVTimecode, rate: AVRational, str: cstring, log_ctx: pointer): cint
proc av_timecode_check_frame_rate* (rate: AVRational): cint
