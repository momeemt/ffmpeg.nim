from ../types import AVHashContext

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

const
  AV_HASH_MAX_SIZE* = 64

proc av_hash_alloc* (ctx: ptr ptr AVHashContext, name: cstring): cint
proc av_hash_names* (i: cint): cstring
proc av_hash_get_name* (ctx: ptr AVHashContext): cstring
proc av_hash_get_size* (ctx: ptr AVHashContext): cint
proc av_hash_init* (ctx: ptr AVHashContext)
proc av_hash_final* (ctx: ptr AVHashContext, dst: ptr uint8)
proc av_hash_final_bin* (ctx: ptr AVHashContext, dst: ptr uint8, size: cint)
proc av_hash_final_hex* (ctx: ptr AVHashContext, dst: ptr uint8, size: cint)
proc av_hash_final_b64* (ctx: ptr AVHashContext, dst: ptr uint8, size: cint)
proc av_hash_freep* (ctx: ptr ptr AVHashContext)
proc av_hash_update* (ctx: ptr AVHashContext, src: ptr uint8, len: csize_t)
