import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_tx_init* (ctx: ptr ptr AVTXContext, tx: ptr av_tx_fn, `type`: AVTXType, inv, len: cint, scale: pointer, flags: uint64): cint
proc av_tx_uninit* (ctx: ptr ptr AVTXContext)
