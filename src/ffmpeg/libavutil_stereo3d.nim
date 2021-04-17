import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

const
  AV_STEREO3D_FLAG_INVERT* = 1 shl 0

proc av_stereo3d_alloc* (): AVStereo3D
proc av_stereo3d_create_side_data* (frame: ptr AVFrame): ptr AVStereo3D
proc av_stereo3d_type_name* (`type`: cuint): cstring
proc av_stereo3d_from_name* (name: cstring): cint
