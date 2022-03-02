from ../types import AVPixelFormat, AVChromaLocation, AVColorPrimaries, AVColorSpace, AVColorTransferCharacteristic

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

type CFStringRef* = object

#include <VideoToolbox/VideoToolbox.h>
proc av_map_videotoolbox_format_to_pixfmt* (cv_fmt: cuint): AVPixelFormat
proc av_map_videotoolbox_format_from_pixfmt* (pix_fmt: AVPixelFormat): cuint
proc av_map_videotoolbox_format_from_pixfmt2* (pix_fmt: AVPixelFormat, full_range: bool): cuint
proc av_map_videotoolbox_chroma_loc_from_av* (loc: AVChromaLocation): CFStringRef
proc av_map_videotoolbox_color_matrix_from_av* (space: AVColorSpace): CFStringRef
proc av_map_videotoolbox_color_primaries_from_av* (pri: AVColorPrimaries): CFStringRef
proc av_map_videotoolbox_color_trc_from_av* (trc: AVColorTransferCharacteristic): CFStringRef
