when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_file_map* (filename: cstring, bufptr: ptr ptr uint8, size: ptr csize_t, log_offset: cint, log_ctx: pointer): cint # warning
proc av_file_unmap* (bufptr: ptr uint8, size: csize_t)
proc av_tempfile* (prefix: cstring, filename: cstringArray, log_offset: cuint, log_ctx: pointer): cint
