from libavutil_frame import AVFrame

{.pragma: stereo3d, importc, header: "<libavutil/stereo3d.h>".}

type
  AVStereo3DType* {.stereo3d.} = enum
    AV_STEREO3D_2D
    AV_STEREO3D_SIDEBYSIDE
    AV_STEREO3D_TOPBOTTOM
    AV_STEREO3D_FRAMESEQUENCE
    AV_STEREO3D_CHECKERBOARD
    AV_STEREO3D_SIDEBYSIDE_QUINCUNX
    AV_STEREO3D_LINES
    AV_STEREO3D_COLUMNS
  
  AVStereo3DView* {.stereo3d.} = enum
    AV_STEREO3D_VIEW_PACKED
    AV_STEREO3D_VIEW_LEFT
    AV_STEREO3D_VIEW_RIGHT
  
  AVStereo3D* {.stereo3d.} = object
    `type`*: AVStereo3DType
    flags*: cint
    view*: AVStereo3DView

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

const
  AV_STEREO3D_FLAG_INVERT* = 1 shl 0

proc av_stereo3d_alloc* (): AVStereo3D
proc av_stereo3d_create_side_data* (frame: ptr AVFrame): ptr AVStereo3D
proc av_stereo3d_type_name* (`type`: cuint): cstring
proc av_stereo3d_from_name* (name: cstring): cint
