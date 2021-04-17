import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

proc av_dynamic_hdr_plus_alloc* (size: ptr csize_t): ptr AVDynamicHDRPlus
proc av_dynamic_hdr_plus_create_side_data* (frame: ptr AVFrame): ptr AVDynamicHDRPlus
