{.pragma: tx, importc, header: "<libavutil/tx.h>".}

type
  AVTXContext* {.tx.} = object

  AVComplexFloat* {.tx.} = object
    re*, im*: cfloat
  
  AVComplexDouble* {.tx.} = object
    re*, im*: cdouble
  
  AVComplexInt32* {.tx.} = object
    re*, im*: int32
  
  AVTXType* {.tx.} = enum
    AV_TX_FLOAT_FFT = 0
    AV_TX_FLOAT_MDCT = 1
    AV_TX_DOUBLE_FFT = 2
    AV_TX_DOUBLE_MDCT = 3
    AV_TX_INT32_FFT = 4
    AV_TX_INT32_MDCT = 5
  
  av_tx_fn* {.tx.} = proc (s: ptr AVTXContext, `out`, `in`: pointer, stride: ByteAddress)

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_tx_init* (ctx: ptr ptr AVTXContext, tx: ptr av_tx_fn, `type`: AVTXType, inv, len: cint, scale: pointer, flags: uint64): cint
proc av_tx_uninit* (ctx: ptr ptr AVTXContext)
