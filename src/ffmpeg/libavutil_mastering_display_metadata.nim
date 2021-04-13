from libavutil_frame import AVFrame
from libavutil_rational import AVRational

{.pragma: mastering_display_metadata, importc, header: "<libavutil/mastering_display_metadata.h>".}

type
  AVMasteringDisplayMetadata* {.mastering_display_metadata.} = object
    display_primaries*: array[3, array[2, AVRational]]
    white_point*: array[2, AVRational]
    min_luminance*: AVRational
    max_luminance*: AVRational
    has_primaries*: cint
    has_luminance*: cint
  
  AVContentLightMetadata* {.mastering_display_metadata.} = object
    MaxCLL*: cuint
    MaxFALL*: cuint

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_mastering_display_metadata_alloc* (): ptr AVMasteringDisplayMetadata
proc av_mastering_display_metadata_create_side_data* (frame: ptr AVFrame): ptr AVMasteringDisplayMetadata
proc av_content_light_metadata_alloc* (size: ptr csize_t): ptr AVContentLightMetadata
proc av_content_light_metadata_create_side_data* (frame: ptr AVFrame): ptr AVContentLightMetadata
