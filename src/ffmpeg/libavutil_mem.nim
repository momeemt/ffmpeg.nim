# WIP

# from libavutil_error import AVERROR

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

proc av_malloc* (size: csize_t): pointer
proc av_mallocz* (size: csize_t): pointer
proc av_malloc_array* (nmemb, size: csize_t): pointer
proc av_mallocz_array* (nmemb, size: csize_t): pointer
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

proc av_size_mult* (a, b: csize_t, r: ptr csize_t): cint {.inline.} =
  let t: csize_t = a * b
  if ((a or b) >= (1.csize_t shl (sizeof(csize_t) * 4))) and a != 0 and (t.float / a.float) != b.float:
    # return AVERROR(EINVAL)
    discard # FIXME: what is EINVAL
  r[] = t
  result = 0