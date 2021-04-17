import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

#include <VideoToolbox/VideoToolbox.h>

proc av_map_videotoolbox_format_to_pixfmt* (cv_fmt: cuint): AVPixelFormat
proc av_map_videotoolbox_format_from_pixfmt* (pix_fmt: AVPixelFormat): cuint
proc av_map_videotoolbox_format_from_pixfmt2* (pix_fmt: AVPixelFormat, full_range: bool): cuint
