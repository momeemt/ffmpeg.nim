from ../types import AVContentLightMetadata, AVMasteringDisplayMetadata, AVFrame

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_mastering_display_metadata_alloc* (): ptr AVMasteringDisplayMetadata
proc av_mastering_display_metadata_create_side_data* (frame: ptr AVFrame): ptr AVMasteringDisplayMetadata
proc av_content_light_metadata_alloc* (size: ptr csize_t): ptr AVContentLightMetadata
proc av_content_light_metadata_create_side_data* (frame: ptr AVFrame): ptr AVContentLightMetadata
