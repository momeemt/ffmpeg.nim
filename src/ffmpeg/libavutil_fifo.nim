import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_fifo_alloc* (size: cuint): ptr AVFifoBuffer
proc av_fifo_alloc_array* (nmemb, size: csize_t): ptr AVFifoBuffer
proc av_fifo_free* (f: ptr AVFifoBuffer)
proc av_fifo_freep* (f: ptr ptr AVFifoBuffer)
proc av_fifo_reset* (f: ptr AVFifoBuffer)
proc av_fifo_size* (f: ptr AVFifoBuffer): cint
proc av_fifo_space* (f: ptr AVFifoBuffer): cint
proc av_fifo_generic_peek_at* (f: ptr AVFifoBuffer, dest: pointer, offset, buf_size: cint, `func`: proc (a1, a2: pointer, a3: cint)): cint
proc av_fifo_generic_peek* (f: ptr AVFifoBuffer, dest: pointer, buf_size: cint, `func`: proc (a1, a2: pointer, a3: cint)): cint
proc av_fifo_generic_read* (f: ptr AVFifoBuffer, dest: pointer, buf_size: cint, `func`: proc (a1, a2: pointer, a3: cint)): cint
proc av_fifo_generic_write* (f: ptr AVFifoBuffer, src: pointer, buf_size: cint, `func`: proc (a1, a2: pointer, a3: cint)): cint
proc av_fifo_realloc2* (f: ptr AVFifoBuffer, size: cuint): cint
proc av_fifo_grow* (f: ptr AVFifoBuffer, additional_space: cuint): cint
proc av_fifo_drain* (f: ptr AVFifoBuffer, size: cint)

proc av_fifo_peek2* (f: ptr AVFifoBuffer, offs: cint): ptr uint8 {.inline.} =
  # uint8_t *ptr = f->rptr + offs;
  # if (ptr >= f->end)
  #     ptr = f->buffer + (ptr - f->end);
  # else if (ptr < f->buffer)
  #     ptr = f->end - (f->buffer - ptr);
  # return ptr;
  discard
