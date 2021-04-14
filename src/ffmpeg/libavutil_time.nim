when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_gettime* (): int64
proc av_gettime_relative* (): int64
proc av_gettime_relative_is_monotonic* (): cint
proc av_usleep* (usec: cuint): cint
