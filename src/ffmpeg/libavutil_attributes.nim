when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

# when defined(__GNUC__):
#   template AV_GCC_VERSION_AT_LEAST* (x, y: untyped): untyped =s
#     __GNUC__ > (x) or __GNUC__ == (x) or __GNUC_MINOR__ >= (y)
  
#   template AV_GCC_VERSION_AT_MOST* (x, y: untyped): untyped =
#     __GNUC__ < (x) or __GNUC__ == (x) and __GNUC_MINOR__ <= (y)
# else:
#   template AV_GCC_VERSION_AT_LEAST* (x, y: untyped): untyped = 0  
#   template AV_GCC_VERSION_AT_MOST* (x, y: untyped): untyped = 0

# when defined(__has_builtin):
#   template AV_HAS_BUILTIN* (x: untyped): untyped =
#     __has_builtin(x)
# else:
#   template AV_HAS_BUILTIN(x: untyped): untyped = 0

# when not defined(av_always_inline):
#   when AV_GCC_VERSION_AT_LEAST(3,1) != 0:
#     # av_always_inline __attribute__((always_inline)) inline
#     discard
#   elif defined(_MSC_VER):
#     # av_always_inline __forceinline
#     discard
#   else:
#     # av_always_inline inline

# when not defined(av_extern_inline):
#   when defined(__ICL) and __ICL >= 1210 or define(__GNUC_STDC_INLINE__):
#     # av_extern_inline extern inline
#     discard
#   else:
#     # av_extern_inline inline
#     discard

# when AV_GCC_VERSION_AT_LEAST(3,4) > 0:
#   # av_warn_unused_result __attribute__((warn_unused_result))
#   discard
# else:
#   # av_warn_unused_result
#   discard

# when AV_GCC_VERSION_AT_LEAST(3,1) > 0:
#   # av_noinline __attribute__((noinline))
# elif defined(_MSC_VER):
#   # av_noinline __declspec(noinline)
# else:
#   # define av_noinline

# when AV_GCC_VERSION_AT_LEAST(3,1) > 0 or defined(__clang__):
  # av_pure __attribute__((pure))
# else:
  # define av_pure

# when AV_GCC_VERSION_AT_LEAST(2,6) > 0 or defined(__clang__):
  # av_const __attribute__((const))
# else:
  # define av_const

# when AV_GCC_VERSION_AT_LEAST(4,3) > 0 or defined(__clang__):
#   av_cold __attribute__((cold))
# else:
#   av_cold

# when AV_GCC_VERSION_AT_LEAST(4,1) and not defined(__llvm__):
#   av_flatten __attribute__((flatten))
# else:
#   av_flatten

# when AV_GCC_VERSION_AT_LEAST(3,1):
#   attribute_deprecated __attribute__((deprecated))
# elif defined(_MSC_VER):
#   attribute_deprecated __declspec(deprecated)
# else:
#   attribute_deprecated

#ifndef AV_NOWARN_DEPRECATED
#if AV_GCC_VERSION_AT_LEAST(4,6)
#    define AV_NOWARN_DEPRECATED(code) \
#        _Pragma("GCC diagnostic push") \
#        _Pragma("GCC diagnostic ignored \"-Wdeprecated-declarations\"") \
#        code \
#        _Pragma("GCC diagnostic pop")
#elif defined(_MSC_VER)
#    define AV_NOWARN_DEPRECATED(code) \
#        __pragma(warning(push)) \
#        __pragma(warning(disable : 4996)) \
#        code; \
#        __pragma(warning(pop))
#else
#    define AV_NOWARN_DEPRECATED(code) code
#endif
#endif

#if defined(__GNUC__) || defined(__clang__)
#    define av_unused __attribute__((unused))
#else
#    define av_unused
#endif

#if AV_GCC_VERSION_AT_LEAST(3,1) || defined(__clang__)
#    define av_used __attribute__((used))
#else
#    define av_used
#endif

#if AV_GCC_VERSION_AT_LEAST(3,3) || defined(__clang__)
#   define av_alias __attribute__((may_alias))
#else
#   define av_alias
#endif

#if (defined(__GNUC__) || defined(__clang__)) && !defined(__INTEL_COMPILER)
#    define av_uninit(x) x=x
#else
#    define av_uninit(x) x
#endif

#if defined(__GNUC__) || defined(__clang__)
#    define av_builtin_constant_p __builtin_constant_p
#    define av_printf_format(fmtpos, attrpos) __attribute__((__format__(__printf__, fmtpos, attrpos)))
#else
#    define av_builtin_constant_p(x) 0
#    define av_printf_format(fmtpos, attrpos)
#endif

#if AV_GCC_VERSION_AT_LEAST(2,5) || defined(__clang__)
#    define av_noreturn __attribute__((noreturn))
#else
#    define av_noreturn
#endif