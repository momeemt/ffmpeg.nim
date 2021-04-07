when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

type
  AVRational* = object
    num: cint
    den: cint

proc av_reduce* (dst_num, dst_den: ptr cint, num, denn, max: int64): cint
proc av_mul_q* (b, c: AVRational): AVRational
proc av_div_q* (b, c: AVRational): AVRational
proc av_add_q* (b, c: AVRational): AVRational
proc av_sub_q* (b, c: AVRational): AVRational
proc av_d2q* (d: cdouble, max: cint): AVRational
proc av_nearer_q* (q, q1, q2: AVRational): cint
proc av_find_nearest_q_idx* (q: AVRational, q_list: ptr AVRational): cint
proc av_q2intfloat* (q: AVRational): uint32
proc av_gcd_q* (a, b: AVRational, max_den: cint, def: AVRational): AVRational

proc av_make_q* (num: cint, den: cint): AVRational {.inline.} =
  result = AVRational(num: num, den: den)

proc av_cmp_q* (a, b: AVRational): cint {.inline.} =
  let tmp = a.num * b.den.int64 - b.num * a.den.int64
  # if(tmp) return (int)((tmp ^ a.den ^ b.den)>>63)|1;
  #   else if(b.den && a.den) return 0;
  #   else if(a.num && b.num) return (a.num>>31) - (b.num>>31);
  #   else                    return INT_MIN;

proc av_q2d* (a: AVRational): cdouble {.inline.} =
  result = a.num.cdouble / a.den.cdouble

proc av_inv_q* (q: AVRational): AVRational {.inline.} =
  result = AVRational(num: q.den, den: q.num)
