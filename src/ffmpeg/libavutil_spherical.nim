import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_spherical_alloc* (size: ptr csize_t): ptr AVSphericalMapping
proc av_spherical_tile_bounds* (map: ptr AVSphericalMapping, width, height: csize_t, left, top, right, bottom: ptr csize_t)
proc av_spherical_projection_name* (projection: AVSphericalProjection): cstring
proc av_spherical_from_name* (name: cstring): cint
