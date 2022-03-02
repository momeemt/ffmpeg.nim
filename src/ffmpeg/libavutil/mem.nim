# WIP

# from libavutil_error import AVERROR
from version import FF_API_DECLARE_ALIGNED, FF_API_AV_MALLOCZ_ARRAY

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

when FF_API_DECLARE_ALIGNED:
  discard
  #if defined(__INTEL_COMPILER) && __INTEL_COMPILER < 1110 || defined(__SUNPRO_C)
      #define DECLARE_ALIGNED(n,t,v)      t __attribute__ ((aligned (n))) v
      #define DECLARE_ASM_ALIGNED(n,t,v)  t __attribute__ ((aligned (n))) v
      #define DECLARE_ASM_CONST(n,t,v)    const t __attribute__ ((aligned (n))) v
  #elif defined(__DJGPP__)
      #define DECLARE_ALIGNED(n,t,v)      t __attribute__ ((aligned (FFMIN(n, 16)))) v
      #define DECLARE_ASM_ALIGNED(n,t,v)  t av_used __attribute__ ((aligned (FFMIN(n, 16)))) v
      #define DECLARE_ASM_CONST(n,t,v)    static const t av_used __attribute__ ((aligned (FFMIN(n, 16)))) v
  #elif defined(__GNUC__) || defined(__clang__)
      #define DECLARE_ALIGNED(n,t,v)      t __attribute__ ((aligned (n))) v
      #define DECLARE_ASM_ALIGNED(n,t,v)  t av_used __attribute__ ((aligned (n))) v
      #define DECLARE_ASM_CONST(n,t,v)    static const t av_used __attribute__ ((aligned (n))) v
  #elif defined(_MSC_VER)
      #define DECLARE_ALIGNED(n,t,v)      __declspec(align(n)) t v
      #define DECLARE_ASM_ALIGNED(n,t,v)  __declspec(align(n)) t v
      #define DECLARE_ASM_CONST(n,t,v)    __declspec(align(n)) static const t v
  #else
      #define DECLARE_ALIGNED(n,t,v)      t v
      #define DECLARE_ASM_ALIGNED(n,t,v)  t v
      #define DECLARE_ASM_CONST(n,t,v)    static const t v
  #endif

#if AV_GCC_VERSION_AT_LEAST(3,1)
    #define av_malloc_attrib __attribute__((__malloc__))
#else
    #define av_malloc_attrib
#endif

#if AV_GCC_VERSION_AT_LEAST(4,3)
    #define av_alloc_size(...) __attribute__((alloc_size(__VA_ARGS__)))
#else
    #define av_alloc_size(...)
#endif

proc av_malloc* (size: csize_t): pointer
proc av_mallocz* (size: csize_t): pointer
proc av_malloc_array* (nmemb, size: csize_t): pointer
proc av_calloc* (nmemb, size: csize_t): pointer
proc av_realloc* (`ptr`: pointer, size: csize_t): pointer
proc av_reallocp* (`ptr`: pointer, size: csize_t): cint #warning
proc av_realloc_f* (`ptr`: pointer, nelem, elsize: csize_t): pointer
proc av_realloc_array* (`ptr`: pointer, nmemb, size: csize_t): pointer
proc av_reallocp_array* (`ptr`: pointer, nmemb, size: csize_t): cint
proc av_fast_realloc* (`ptr`: pointer, size: ptr cuint, min_size: csize_t): pointer
proc av_fast_malloc* (`ptr`: pointer, size: ptr cuint, min_size: csize_t)
proc av_fast_mallocz* (`ptr`: pointer, size: ptr cuint, min_size: csize_t)
proc av_free* (`ptr`: pointer)
proc av_freep* (`ptr`: pointer)
proc av_strdup* (s: cstring): cstring
proc av_strndup* (s: cstring, len: csize_t): cstring
proc av_memdup* (p: pointer, size: csize_t): pointer
proc av_memcpy_backptr* (dst: ptr uint8, back, cnt: cint)
proc av_dynarray_add* (tab_ptr: pointer, nb_ptr: ptr cint, elem: pointer)
proc av_dynarray_add_nofree* (tab_ptr: pointer, nb_ptr: ptr cint, elem: pointer): cint
proc av_dynarray2_add* (tab_ptr: ptr pointer, nb_ptr: ptr cint, elem_size: csize_t, elem_data: ptr uint8): pointer
proc av_max_alloc* (max: csize_t)
proc av_size_mult* (a, b: csize_t, r: ptr csize_t): cint

when FF_API_AV_MALLOCZ_ARRAY:
  proc av_mallocz_array* (nmemb, size: csize_t): pointer {.deprecated.}
