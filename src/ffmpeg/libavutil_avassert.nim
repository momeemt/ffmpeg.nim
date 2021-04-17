when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

template av_assert0* (cond: untyped): untyped =
  if not cond:
    # av_log(nil, AV_LOG_PANIC, "Assertion %s failed at %s:%d\n", AV_STRINGIFY(cond), __FILE__, __LINE__)
    abort()

proc av_assert0_fpu* ()

when defined(ASSERT_LEVEL):
  when ASSERT_LEVEL > 0:
    template av_assert1* (cond: untyped): untyped = av_assert0(cond)
  else:
    template av_assert1* (cond: untyped): untyped = 0
else:
  template av_assert1* (cond: untyped): untyped = 0

when defined(ASSERT_LEVEL):
  when ASSERT_LEVEL > 1:
    template av_assert2* (cond: untyped): untyped = av_assert0(cond)
    template av_assert2_fpu* (): untyped = av_assert0_fpu()
  else:
    template av_assert2* (cond: untyped): untyped = 0
    template av_assert2_fpu* (): untyped = 0
else:
  template av_assert2* (cond: untyped): untyped = 0
  template av_assert2_fpu* (): untyped = 0
