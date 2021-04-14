#if defined(__cplusplus) && !defined(__STDC_FORMAT_MACROS) && !defined(PRId64)
#error missing -D__STDC_FORMAT_MACROS / #define __STDC_FORMAT_MACROS
#endif

const
  AV_TS_MAX_STRING_SIZE* = 32

# proc av_ts_make_string* (buf: cstring, ts: int64): cstring {.inline.} =
#   if ts == AV_NOPTS_VALUE:
#     snprintf(buf, AV_TS_MAX_STRING_SIZE, "NOPTS")
#   else:
#     snprintf(buf, AV_TS_MAX_STRING_SIZE, "%" PRId64, ts)
#   result = buf

# TODO
template av_ts2str* (ts: untyped): untyped =
  av_ts_make_string((char[AV_TS_MAX_STRING_SIZE]){0}, ts)

# proc av_ts_make_time_string* (buf: cstring, ts: int64, tb: ptr AVRational): cstring {.inline.} =
#   if ts == AV_NOPTS_VALUE:
#     snprintf(buf, AV_TS_MAX_STRING_SIZE, "NOPTS")
#   else:
#     snprintf(buf, AV_TS_MAX_STRING_SIZE, "%.6g", av_q2d(*tb) * ts)

template av_ts2timestr* (ts, tb: untyped): untyped =
  av_ts_make_time_string((char[AV_TS_MAX_STRING_SIZE]){0}, ts, tb)
