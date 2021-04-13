when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

{.pragma: hash, importc, header: "<libavutil/hash.h>".}

const
  AV_HASH_MAX_SIZE* = 64

type
  AVHashContext* {.hash.} = object

proc av_hash_alloc* (ctx: ptr ptr AVHashContext, name: ptr cchar): cint
proc av_hash_names* (i: cint): ptr cchar
proc av_hash_get_name* (ctx: ptr AVHashContext): ptr cchar
proc av_hash_get_size* (ctx: ptr AVHashContext): cint
proc av_hash_init* (ctx: ptr AVHashContext)
proc av_hash_final* (ctx: ptr AVHashContext, dst: ptr uint8)
proc av_hash_final_bin* (ctx: ptr AVHashContext, dst: ptr uint8, size: cint)
proc av_hash_final_hex* (ctx: ptr AVHashContext, dst: ptr uint8, size: cint)
proc av_hash_final_b64* (ctx: ptr AVHashContext, dst: ptr uint8, size: cint)
proc av_hash_freep* (ctx: ptr ptr AVHashContext)

when defined(FF_API_CRYPTO_SIZE_T):
  proc av_hash_update* (ctx: ptr AVHashContext, src: ptr uint8, len: cint)
else:
  proc av_hash_update* (ctx: ptr AVHashContext, src: ptr uint8, len: csize_t)
