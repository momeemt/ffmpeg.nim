import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

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
