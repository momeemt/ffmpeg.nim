import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avformat(|-55|-56|-57|-58).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavformat(|.55|.56|.57|.58).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavformat.so(|.55|.56|.57|.58)", cdecl.}

const
  AVIO_SEEKABLE_NORMAL* = 1 shl 0
  AVIO_SEEKABLE_TIME* = 1 shl 1
  AVSEEK_SIZE* = 0x10000
  AVSEEK_FORCE* = 0x20000
  AVIO_FLAG_READ* = 1
  AVIO_FLAG_WRITE* = 2
  AVIO_FLAG_READ_WRITE* = AVIO_FLAG_READ or AVIO_FLAG_WRITE
  AVIO_FLAG_NONBLOCK* = 8
  AVIO_FLAG_DIRECT* = 0x8000
  SEEK_CUR* = 0
  
proc avio_find_protocol_name* (url: cstring): cstring
proc avio_check* (url: cstring, flags: cint): cint
proc avpriv_io_move* (url_src, url_dst: cstring): cint
proc avpriv_io_delete* (url: cstring): cint
proc avio_open_dir* (s: ptr ptr AVIODirContext, url: cstring, options: ptr ptr AVDictionary): cint
proc avio_read_dir* (s: ptr AVIODirContext, next: ptr ptr AVIODirEntry): cint
proc avio_close_dir* (s: ptr ptr AVIODirContext): cint
proc avio_free_directory_entry* (entry: ptr ptr AVIODirEntry)
proc avio_alloc_context* (buffer: ptr cuchar, buffer_size, write_flag: cint, opaque: pointer, read_packet: proc (opaque: pointer, buf: ptr uint8, buf_size: cint): cint, write_packet: proc (opaque: pointer, buf: uint8, buf_size: cint): cint, seek: proc (opaque: pointer, offset: int64, whence: cint): int64): ptr AVIOContext
proc avio_context_free* (s: ptr ptr AVIOContext)
proc avio_w8* (s: ptr AVIOContext, b: cint)
proc avio_write* (s: ptr AVIOContext, buf: ptr cuchar, size: cint)
proc avio_wl64* (s: ptr AVIOContext, val: uint64)
proc avio_wb64* (s: ptr AVIOContext, val: uint64)
proc avio_wl32* (s: ptr AVIOContext, val: cuint)
proc avio_wb32* (s: ptr AVIOContext, val: cuint)
proc avio_wl24* (s: ptr AVIOContext, val: cuint)
proc avio_wb24* (s: ptr AVIOContext, val: cuint)
proc avio_wl16* (s: ptr AVIOContext, val: cuint)
proc avio_wb16* (s: ptr AVIOContext, val: cuint)
proc avio_put_str* (s: ptr AVIOContext, str: cstring): cint
proc avio_put_str16le* (s: ptr AVIOContext, str: cstring): cint
proc avio_put_str16be* (s: ptr AVIOContext, str: cstring): cint
proc avio_write_marker* (s: ptr AVIOContext, time: int64, `type`: AVIODataMarkerType)
proc avio_seek* (s: ptr AVIOContext, offset: int64, whence: cint): int64
proc avio_skip* (s: ptr AVIOContext, offset: int64): int64
proc avio_size* (s: ptr AVIOContext): int64
proc avio_feof* (s: ptr AVIOContext): cint
proc avio_printf* (s: ptr AVIOContext, fmt: cstring): cint {.varargs.} # TODO: 578
proc avio_print_string_array* (s: ptr AVIOContext, strings: cstringArray)
proc avio_flush* (s: ptr AVIOContext)
proc avio_read* (s: ptr AVIOContext, buf: ptr cuchar, size: cint): cint
proc avio_read_partial* (s: ptr AVIOContext, buf: ptr cuchar, size: cint): cint
proc avio_r8* (s: AVIOContext): cint
proc avio_rl16* (s: AVIOContext): cuint
proc avio_rl24* (s: AVIOContext): cuint
proc avio_rl32* (s: AVIOContext): cuint
proc avio_rl64* (s: AVIOContext): uint64
proc avio_rb16* (s: AVIOContext): cuint
proc avio_rb24* (s: AVIOContext): cuint
proc avio_rb32* (s: AVIOContext): cuint
proc avio_rb64* (s: AVIOContext): cuint
proc avio_get_str* (pb: ptr AVIOContext, maxlen: cint, buf: cstring, buflen: cint): cint
proc avio_get_str16le* (pb: ptr AVIOContext, maxlen: cint, buf: cstring, buflen: cint): cint
proc avio_get_str16be* (pb: ptr AVIOContext, maxlen: cint, buf: cstring, buflen: cint): cint
proc avio_open* (s: ptr ptr AVIOContext, url: cstring, flags: cint): cint
proc avio_open2* (s: ptr ptr AVIOContext, url: cstring, flags: cint, int_cb: ptr AVIOInterruptCB, options: ptr ptr AVDictionary): cint
proc avio_close* (s: ptr AVIOContext): cint
proc avio_closep* (s: ptr ptr AVIOContext): cint
proc avio_open_dyn_buf* (s: ptr ptr AVIOContext): cint
proc avio_get_dyn_buf* (s: ptr AVIOContext, pbuffer: ptr ptr uint8): cint
proc avio_close_dyn_buf* (s: ptr AVIOContext, pbuffer: ptr uint8): cint
proc avio_enum_protocols* (opaque: pointer, output: cint): cstring
proc avio_protocol_get_class* (name: cstring): ptr AVClass
proc avio_pause* (h: ptr AVIOContext, pause: cint): cint
proc avio_seek_time* (h: ptr AVIOContext, stream_index: cint, timestamp: int64, flags: cint): int64
proc avio_read_to_bprint* (h: ptr AVIOContext, pb: ptr AVBPrint, max_size: csize_t): cint
proc avio_accept* (s: ptr AVIOContext, c: ptr ptr AVIOContext): cint
proc avio_handshake* (c: ptr AVIOContext): cint

proc avio_tell* (s: ptr AVIOContext): int64 {.inline.} =
  result = avio_seek(s, 0, SEEK_CUR)

# TODO: 594
template avio_print* (s: varargs[untyped]): untyped =
  # avio_print_string_array(s, (const char*[]){__VA_ARGS__, NULL})
  discard
