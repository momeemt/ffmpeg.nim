from avconfig import AV_HAVE_BIGENDIAN

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

when AV_HAVE_BIGENDIAN != 0:
  template AV_NE* (be, le: untyped): untyped = be
else:
  template AV_NE* (be, le: untyped): untyped = le

template FFDIFFSIGN* (x, y: untyped): untyped =
  (x > y) - (x < y)

template FFMAX* (a, b: untyped): untyped =
  if a > b: a
  else: b

template FFMAX3* (a, b, c: untyped): untyped =
  FFMAX(FFMAX(a, b), c)

template FFMIN* (a, b: untyped): untyped =
  if a > b: b
  else: a

template FFMIN3* (a, b, c: untyped): untyped =
  FFMIN(FFMIN(a, b), c)

# template FFSWAP* (`type`, a, b: untyped): untyped =
#   # do{type SWAP_tmp= b; b= a; a= SWAP_tmp;}while(0)
#   let tmp: `type` = b
#   b = a
#   a = tmp

template FF_ARRAY_ELEMS* (a: untyped): untyped =
  sizeof(a) / sizeof(a[0])

template MKTAG* (a, b, c, d: untyped): untyped =
  a or b.shl(8) or c.shl(16) or (cast[cuint](d)).shl(24)

template MKBETAG* (a, b, c, d: untyped): untyped =
  d or c.shl(8) or b.shl(16) or (cast[cuint](a)).shl(24)

template AV_TOSTRING* (s: untyped): untyped =
  s.repr

template AV_STRINGIFY* (s: untyped): untyped =
  AV_TOSTRING(s)

template AV_GLUE* (a, b: untyped): untyped =
  `a . b`

template AV_JOIN* (a, b: untyped): untyped =
  AV_GLUE(a, b)

template FFALIGN* (x, a: untyped): untyped =
  (((x) + (a) - 1) and not ((a) - 1))
