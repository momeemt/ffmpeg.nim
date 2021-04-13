{.pragma: buffer, importc, header: "<libavutil/buffer.h>".}

type
  AVBuffer* {.buffer.} = object
  AVBufferRef* {.buffer.} = object
    buffer*: ptr AVBuffer
    data*: ptr uint8
    size*: int
  AVBufferPool* {.buffer.} = object

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

const
  AV_BUFFER_FLAG_READONLY* = 1 shl 0
  
proc av_buffer_alloc* (size: int): ptr AVBufferRef
proc av_buffer_allocz* (size: int): ptr AVBufferRef
proc av_buffer_create* (data: ptr uint8, size: int, free: proc (opaque: pointer, data: ptr uint8), opaque: pointer, flags: int): ptr AVBufferRef
proc av_buffer_default_free* (opaque: pointer, data: ptr uint8)
proc av_buffer_ref* (buf: ptr AVBufferRef): ptr AVBufferRef
proc av_buffer_unref* (buf: ptr ptr AVBufferRef)
proc av_buffer_is_writable* (buf: ptr AVBufferRef): int
proc av_buffer_get_opaque* (buf: ptr AVBufferRef)
proc av_buffer_get_ref_count* (ubf: ptr AVBufferRef): int
proc av_buffer_make_writable* (buf: ptr ptr AVBufferRef): int
proc av_buffer_realloc* (buf: ptr ptr AVBufferRef, size: int): int
proc av_buffer_pool_init* (size: int, alloc: proc (size: int): ptr AVBufferRef): AVBufferPool
proc av_buffer_pool_init2* (size: int, opaque: pointer, alloc: proc (opaque: pointer, size: int): ptr AVBufferRef, pool_free: proc (opaque: pointer)): ptr AVBufferPool
proc av_buffer_pool_uninit* (pool: ptr ptr AVBufferPool)
proc av_buffer_pool_get* (pool: ptr AVBufferPool): AVBufferRef
proc av_buffer_pool_buffer_get_opaque* (`ref`: ptr AVBufferRef)