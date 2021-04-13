{.pragma: motion_vector, importc, header: "<libavutil/motion_vector.h>".}

type
  AVMotionVector* {.motion_vector.} = object
    source*: int32
    w*, h*: uint8
    src_x*, src_y*: int16
    dst_x*, dst_y*: int16
    flags*: uint64
    motion_x*, motion_y*: int32
    motion_scale*: uint16
