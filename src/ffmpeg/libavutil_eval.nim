import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

proc av_expr_parse_and_eval* (res: ptr cdouble, s: ptr cchar, const_names: ptr ptr cchar, const_values: ptr cdouble, func1_names: ptr ptr cchar, funcs1: proc (a1: pointer, a2: cdouble): cdouble, func2_names: ptr ptr cchar, funcs2: proc (a1: pointer, a2: cdouble, a3: cdouble): cdouble, opaque: pointer, log_offset: cint, log_ctx: pointer): cint
proc av_expr_parse* (expr: ptr ptr AVExpr, s: ptr cchar, const_names: ptr ptr cchar, const_values: ptr cdouble, func1_names: ptr ptr cchar, funcs1: proc (a1: pointer, a2: cdouble): cdouble, func2_names: ptr ptr cchar, funcs2: proc (a1: pointer, a2: cdouble, a3: cdouble): cdouble, opaque: pointer, log_offset: cint, log_ctx: pointer): cint
proc av_expr_eval* (e: ptr AVExpr, const_values: ptr cdouble, opaque: pointer): cdouble
proc av_expr_count_vars* (e: ptr AVExpr, counter: ptr cuint, size: cint): cint
proc av_expr_count_func* (e: ptr AVExpr, counter: ptr cuint, size, arg: cint): cint
proc av_expr_free* (e: ptr AVExpr)
proc av_strtod* (numstr: ptr cchar, tail: ptr ptr cchar): cdouble
