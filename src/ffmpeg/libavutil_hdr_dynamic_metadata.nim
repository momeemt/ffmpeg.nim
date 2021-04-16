import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_dynamic_hdr_plus_alloc* (size: ptr csize_t): ptr AVDynamicHDRPlus
proc av_dynamic_hdr_plus_create_side_data* (frame: ptr AVFrame): ptr AVDynamicHDRPlus
