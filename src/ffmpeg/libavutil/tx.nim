from ../types import AVTXContext, AVTXType, av_tx_fn

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_tx_init* (ctx: ptr ptr AVTXContext, tx: ptr av_tx_fn, `type`: AVTXType, inv, len: cint, scale: pointer, flags: uint64): cint
proc av_tx_uninit* (ctx: ptr ptr AVTXContext)
