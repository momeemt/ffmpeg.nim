when defined(windows):
  {.push importc, dynlib: "avformat(|-55|-56|-57|-58).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avformat(|.55|.56|.57|.58).dylib".}
else:
  {.push importc, dynlib: "libavformat.so(|.55|.56|.57|.58)".}

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

type
  AVIOInterruptCB* = object
    callback: proc (a1: pointer): cint
    opaque: pointer
  
  AVIODirEntryType* = enum
    AVIO_ENTRY_UNKNOWN
    AVIO_ENTRY_BLOCK_DEVICE
    AVIO_ENTRY_CHARACTER_DEVICE
    AVIO_ENTRY_DIRECTORY
    AVIO_ENTRY_NAMED_PIPE
    AVIO_ENTRY_SYMBOLIC_LINK
    AVIO_ENTRY_SOCKET
    AVIO_ENTRY_FILE
    AVIO_ENTRY_SERVER
    AVIO_ENTRY_SHARE
    AVIO_ENTRY_WORKGROUP

  AVIODirEntry* = object
    name: ptr cchar
    `type`: cint
    uft8: cint
    size: int64
    modification_timestamp: int64
    access_timestamp: int64
    status_change_timestamp: int64
    user_id: int64
    group_id: int64
    filemode: int64

  AVIODirContext* = object
    url_context: ptr URLContext
  
  AVIODataMarkerType* = enum
    AVIO_DATA_MARKER_HEADER
    AVIO_DATA_MARKER_SYNC_POINT
    AVIO_DATA_MARKER_BOUNDARY_POINT
    AVIO_DATA_MARKER_UNKNOWN
    AVIO_DATA_MARKER_TRAILER
    AVIO_DATA_MARKER_FLUSH_POINT
  
  AVIOContext* = object
    av_class: AVClass
    buffer: ptr cuchar
    buf_ptr: ptr cuchar
    buf_end: ptr cuchar
    opaque: pointer
    read_packet: proc (opaque: pointer, buf: ptr uint8, buf_size: cint): cint
    write_packet: proc (opaque: pointer, buf: ptr uint8, buf_size: cint): cint
    seek: proc (opaque: pointer, offset: int64, whence: cint): int64
    pos: int64
    eof_reached: cint
    write_flag: cint
    max_packet_size: cint
    checksum: culong
    checksum_ptr: ptr cuchar
    update_checksum: proc (checksum: culong, buf: ptr uint8, size: cuint): culong
    error: cint
    read_pause: proc (opaque: pointer, pause: cint): cint
    read_seek: proc (opaque: pointer, stream_index: cint, timestamp: int64, flags: cint): int64
    seekable: cint
    maxsize: int64
    direct: cint
    bytes_read: int64
    seek_count: cint
    writeout_count: cint
    orig_buffer_size: cint
    short_seek_threshold: cint
    protocol_whitelist: ptr cchar
    protocol_blacklist: ptr cchar
    write_data_type: proc (opaque: pointer, buf: uint8, buf_size: cint, `type`: AVIODataMarkerType, time: int64): cint
    ignore_boundary_point: cint
    current_type: AVIODataMarkerType
    last_time: int64
    short_seek_get: proc (opaque: pointer): cint
    written: int64
    buf_ptr_max: ptr cuchar
    min_packet_size: cint
  
  AVBPrint* = object
  
proc avio_find_protocol_name* (url: ptr cchar): ptr cchar
proc avio_check* (url: ptr cchar, flags: cint): cint
proc avpriv_io_move* (url_src, url_dst: ptr cchar): cint
proc avpriv_io_delete* (url: ptr cchar): cint
proc avio_open_dir* (s: ptr ptr AVIODirContext, url: ptr cchar, options: ptr ptr AVDictionary): cint
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
proc avio_put_str* (s: ptr AVIOContext, str: ptr cchar): cint
proc avio_put_str16le* (s: ptr AVIOContext, str: ptr cchar): cint
proc avio_put_str16be* (s: ptr AVIOContext, str: ptr cchar): cint
proc avio_write_marker* (s: ptr AVIOContext, time: int64, `type`: AVIODataMarkerType)
proc avio_seek* (s: ptr AVIOContext, offset: int64, whence: cint): int64
proc avio_skip* (s: ptr AVIOContext, offset: int64): int64
proc avio_size* (s: ptr AVIOContext): int64
proc avio_feof* (s: ptr AVIOContext): cint
proc avio_printf* (s: ptr AVIOContext, fmt: ptr cchar): cint {.varargs.} # TODO: 578
proc avio_print_string_array* (s: ptr AVIOContext, strings: ptr cstring)
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
proc avio_get_str* (pb: ptr AVIOContext, maxlen: cint, buf: ptr cchar, buflen: cint): cint
proc avio_get_str16le* (pb: ptr AVIOContext, maxlen: cint, buf: ptr cchar, buflen: cint): cint
proc avio_get_str16be* (pb: ptr AVIOContext, maxlen: cint, buf: ptr cchar, buflen: cint): cint
proc avio_open* (s: ptr ptr AVIOContext, url: ptr cchar, flags: cint): cint
proc avio_open2* (s: ptr ptr AVIOContext, url: ptr cchar, flags: cint, int_cb: ptr AVIOInterruptCB, options: ptr ptr AVDictionary): cint
proc avio_close* (s: ptr AVIOContext): cint
proc avio_closep* (s: ptr ptr AVIOContext): cint
proc avio_open_dyn_buf* (s: ptr ptr AVIOContext): cint
proc avio_get_dyn_buf* (s: ptr AVIOContext, pbuffer: ptr ptr uint8): cint
proc avio_close_dyn_buf* (s: ptr AVIOContext, pbuffer: ptr uint8): cint
proc avio_enum_protocols* (opaque: pointer, output: cint): ptr cchar
proc avio_protocol_get_class* (name: ptr cchar): ptr AVClass
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
