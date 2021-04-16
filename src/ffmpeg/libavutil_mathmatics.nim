import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

when not defined(M_E):
  const M_E* = 2.7182818284590452354

when not defined(M_LN2):
  const M_LN2* = 0.69314718055994530942

when not defined(M_LN10):
  const M_LN10* = 2.30258509299404568402

when not defined(M_LOG2_10):
  const M_LOG2_10* = 3.32192809488736234787

when not defined(M_PHI):
  const M_PHI* = 1.61803398874989484820

when not defined(M_PI):
  const M_PI* = 3.14159265358979323846

when not defined(M_PI_2):
  const M_PI_2* = 1.57079632679489661923

when not defined(M_SQRT1_2):
  const M_SQRT1_2* = 0.70710678118654752440

when not defined(M_SQRT2):
  const M_SQRT2* = 1.41421356237309504880

when not defined(NAN):
  const NAN* = av_int2float(0x7fc00000)

when not defined(INFINITY):
  const INFINITY* = av_int2float(0x7f800000)

proc av_gcd* (a, b: int64): int64
proc av_rescale* (a, b, c: int64): int64
proc av_rescale_rnd* (a, b, c: int64, rnd: AVRounding): int64
proc av_rescale_q* (a: int64, bq, cq: AVRational): int64
proc av_rescale_q_rnd* (a: int64, bq, cq: AVRational, rnd: AVRounding): int64
proc av_compare_ts* (ts_a: int64, tb_a: AVRational, ts_b: int64, tb_b: AVRational): cint
proc av_compare_mod* (a, b, `mod`: uint64): int64
proc av_rescale_delta* (in_tb: AVRational, in_ts: int64, fs_tb: AVRational, duration: cint, last: ptr int64, out_tb: AVRational): int64
proc av_add_stable* (ts_tb: AVRational, ts: int64, inc_tb: AVRational, inc: int64): int64
