from ../types import AVExpr

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_expr_parse_and_eval* (res: ptr cdouble, s: cstring, const_names: cstringArray, const_values: ptr cdouble, func1_names: cstringArray, funcs1: proc (a1: pointer, a2: cdouble): cdouble, func2_names: cstringArray, funcs2: proc (a1: pointer, a2: cdouble, a3: cdouble): cdouble, opaque: pointer, log_offset: cint, log_ctx: pointer): cint
proc av_expr_parse* (expr: ptr ptr AVExpr, s: cstring, const_names: cstringArray, const_values: ptr cdouble, func1_names: cstringArray, funcs1: proc (a1: pointer, a2: cdouble): cdouble, func2_names: cstringArray, funcs2: proc (a1: pointer, a2: cdouble, a3: cdouble): cdouble, opaque: pointer, log_offset: cint, log_ctx: pointer): cint
proc av_expr_eval* (e: ptr AVExpr, const_values: ptr cdouble, opaque: pointer): cdouble
proc av_expr_count_vars* (e: ptr AVExpr, counter: ptr cuint, size: cint): cint
proc av_expr_count_func* (e: ptr AVExpr, counter: ptr cuint, size, arg: cint): cint
proc av_expr_free* (e: ptr AVExpr)
proc av_strtod* (numstr: cstring, tail: cstringArray): cdouble
