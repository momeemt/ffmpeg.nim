{.pragma: spherical, importc, header: "<libavutil/spherical.h>".}

type
  AVSphericalProjection* = enum
    AV_SPHERICAL_EQUIRECTANGULAR
    AV_SPHERICAL_CUBEMAP
    AV_SPHERICAL_EQUIRECTANGULAR_TILE
  
  AVSphericalMapping* = object
    projection*: AVSphericalProjection
    yaw*: int32
    pitch*: int32
    roll*: int32
    bound_left*: uint32
    bound_top*: uint32
    bound_right*: uint32
    bound_bottom*: uint32
    padding*: uint32

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
