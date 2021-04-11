when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

const
  AV_BPRINT_SIZE_UNLIMITED* = 1 # FIXME: (unsigned)-1
  AV_BPRINT_SIZE_AUTOMATIC* = 1
  AV_BPRINT_SIZE_COUNT_ONLY* = 0

type
  ff_pad_helper_AVBPrint* = object
    str: ptr cchar
    len: cuint
    size: cuint
    size_max: cuint
    reserved_internal_buffer: array[1, cchar]

  AVBPrint* = object
    str: ptr cchar
    len: cuint
    size: cuint
    size_max: cuint
    reserved_internal_buffer: array[1, cchar]
    reserved_padding: array[1024 - sizeof(ff_pad_helper_AVBPrint), cchar]
  
  tm* = object
  
proc av_bprint_init* (buf: ptr AVBPrint, size_init, size_max: cuint)
proc av_bprint_init_for_buffer* (buf: ptr AVBPrint, buffer: ptr cchar, size: cuint)
proc av_bprintf* (buf: ptr AVBPrint, fmt: ptr cchar) {.varargs.} # 127
proc av_vbprintf* (buf: ptr AVBPrint, fmt: ptr cchar, vl_arg: va_list)
proc av_bprint_chars* (buf: ptr AVBPrint, c: cchar, n: cuint)
proc av_bprint_append_data* (buf: ptr AVBPrint, data: ptr cchar, size: cuint)
proc av_bprint_strftime* (buf: ptr AVBPrint, fmt: ptr cchar, `tm`: ptr tm)
proc av_bprint_get_buffer* (buf: ptr AVBPrint, size: cuint, mem: ptr ptr cuchar, actual_size: ptr cuint)
proc av_bprint_clear* (buf: ptr AVBPrint)
proc av_bprint_finalize* (buf: ptr AVBPrint, ret_str: ptr ptr cchar): cint
proc av_bprint_escape* (dstbuf: ptr AVBPrint, src, special_chars: ptr cchar, mode: AVEscapeMode, flags: cint)

# FIXME: 185
proc av_bprint_is_complete* (buf: ptr AVBPrint): cint {.inline.} =
  # buf->len < buf->size
  discard
