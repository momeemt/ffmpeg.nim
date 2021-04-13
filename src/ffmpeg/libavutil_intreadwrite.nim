{.pragma: intreadwrite, importc, header: "<libavutil/intreadwrite.h>".}

type
  av_alias64* {.intreadwrite, union.} = object
    u64*: uint64
    u32*: array[2, uint32]
    u16*: array[4, uint16]
    u8*: array[8, uint8]
    f64*: cdouble
    f32*: array[2, cfloat]
  
  av_alias32* {.intreadwrite, union.} = object
    u32*: uint32
    u16*: array[2, uint16]
    u8*: array[4, uint8]
    f32*: cfloat
  
  av_alias16* {.intreadwrite, union.} = object
    u16*: uint16
    u8*: array[2, uint8]

# WIP