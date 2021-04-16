when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

proc av_file_map* (filename: ptr cchar, bufptr: ptr ptr uint8, size: ptr csize_t, log_offset: cint, log_ctx: pointer): cint # warning
proc av_file_unmap* (bufptr: ptr uint8, size: csize_t)
proc av_tempfile* (prefix: ptr cchar, filename: ptr ptr cchar, log_offset: cuint, log_ctx: pointer): cint
