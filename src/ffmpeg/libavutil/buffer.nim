from ../types import AVBufferRef, AVBufferPool

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

const
  AV_BUFFER_FLAG_READONLY* = 1 shl 0
  
proc av_buffer_alloc* (size: csize_t): ptr AVBufferRef
proc av_buffer_allocz* (size: csize_t): ptr AVBufferRef
proc av_buffer_create* (data: ptr uint8, size: csize_t, free: proc (opaque: pointer, data: ptr uint8), opaque: pointer, flags: cint): ptr AVBufferRef
proc av_buffer_default_free* (opaque: pointer, data: ptr uint8)
proc av_buffer_ref* (buf: ptr AVBufferRef): ptr AVBufferRef
proc av_buffer_unref* (buf: ptr ptr AVBufferRef)
proc av_buffer_is_writable* (buf: ptr AVBufferRef): cint
proc av_buffer_get_opaque* (buf: ptr AVBufferRef)
proc av_buffer_get_ref_count* (ubf: ptr AVBufferRef): cint
proc av_buffer_make_writable* (buf: ptr ptr AVBufferRef): cint
proc av_buffer_realloc* (buf: ptr ptr AVBufferRef, size: csize_t): cint
proc av_buffer_replace* (dst: ptr ptr AVBufferRef, src: ptr AVBufferRef): cint
proc av_buffer_pool_init* (size: csize_t, alloc: proc (size: csize_t): ptr AVBufferRef): AVBufferPool
proc av_buffer_pool_init2* (size: csize_t, opaque: pointer, alloc: proc (opaque: pointer, size: csize_t): ptr AVBufferRef, pool_free: proc (opaque: pointer)): ptr AVBufferPool
proc av_buffer_pool_uninit* (pool: ptr ptr AVBufferPool)
proc av_buffer_pool_get* (pool: ptr AVBufferPool): AVBufferRef
proc av_buffer_pool_buffer_get_opaque* (`ref`: ptr AVBufferRef)
