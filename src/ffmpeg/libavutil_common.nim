when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

#if defined(__cplusplus) && !defined(__STDC_CONSTANT_MACROS) && !defined(UINT64_C)
#error missing -D__STDC_CONSTANT_MACROS / #define __STDC_CONSTANT_MACROS

when defined(AV_HAVE_BIGENDIAN):
  template AV_NE* (be, le: untyped): untyped = be
else:
  template AV_NE* (be, le: untyped): untyped = le

template RSHIFT* (a, b: untyped): untyped =
  if a > 0:
    a + (((1 shl b) shr 1) shr b)
  else:
    (a + ((1 shl b) shr 1 - 1)) shr b

template ROUNDED_DIV* (a, b: untyped): untyped =
  if a >= 0:
    a + (b shr 1)
  else:
    a - (b shr 1) / b

template AV_CEIL_RSHIFT* (a, b: untyped): untyped =
  if not av_builtin_constant_p(b):
    -(-a shr b)
  else:
    (a + (1 shl b) - 1) shr b

template FF_CEIL_RSHIFT* (a, b: untyped): untyped = AV_CEIL_RSHIFT(a, b)

template FFUDIV* (a, b: untyped): untyped =
  if a > 0:
    a / b
  else:
    (a - b + 1) / b

template FFUMOD* (a, b: untyped): untyped =
  a - b * FFUDIV(a, b)

template FFABS* (a: untyped): untyped =
  if a >= 0:
    a
  else:
    -a

template FFSIGN* (a: untyped): untyped =
  if a > 0:
    1
  else:
    -1

template FFNABS* (a: untyped): untyped =
  if a <= 0:
    a
  else:
    -a

template FFDIFFSIGN*(x, y: untyped): untyped =
  if x > y: 1
  elif x < y: -1
  else: 0

template FFMAX*(a, b: untyped): untyped =
  if a > b: a
  else: b

template FFMAX3*(a, b, c: untyped): untyped =
  FFMAX(FFMAX(a, b), c)

template FFMIN*(a, b: untyped): untyped =
  if a > b: b
  else: a

template FFMIN3*(a, b, c: untyped): untyped =
  FFMIN(FFMIN(a, b), c)

template FFSWAP*(_: typedesc, a, b: untyped) =
  swap a, b

template FE_ARRAY_ELEMS*[T](a: ptr T): csize_t =
  (sizeof a) div (sizeof T)

template FE_ARRAY_ELEMS*[T](a: openArray[T]): csize_t =
  a.len

when not defined(av_log2):
  proc av_log2* (v: cuint): cint

when not defined(av_log2_16bit):
  proc av_log2_16bit* (v: cuint): cint

proc av_clip_c* (a, amin, amax: cint): cint {.inline.} =
  when defined(HAVE_AV_CONFIG_H) and defined(ASSERT_LEVEL):
    when ASSERT_LEVEL >= 2:
      if amin > amax:
        abort()
    else:
      if a < amin:
        result = amin
      elif a > amax:
        result = amax
      else:
        result = a
  else:
    if a < amin:
      result = amin
    elif a > amax:
      result = amax
    else:
      result = a

proc av_clip64_c* (a, amin, amax: int64): int64 {.inline.} =
  when defined(HAVE_AV_CONFIG_H) and defined(ASSERT_LEVEL):
    when ASSERT_LEVEL >= 2:
      if amin > amax:
        abort()
    else:
      if a < amin:
        result = amin
      elif a > amax:
        result = amax
      else:
        result = a
  else:
    if a < amin:
      result = amin
    elif a > amax:
      result = amax
    else:
      result = a

proc av_clip_uint8_c* (a: cint): uint8 {.inline.} =
  if (a and (not 0x000000FF)) != 0:
    result = ((not a) shr 31).uint8
  else:
    result = a.byte

proc av_clip_int8_c* (a: cint): int8 {.inline.} =
  if ((a + 0x00000080) and not 0x000000FF) == 0:
    result = int8((a shr 31) xor 0x0000007F)
  else:
    result = a.int8

proc av_clip_uint16_c* (a: cint): uint16 {.inline.} =
  if (a and (not 0x0000FFFF)) != 0:
    return uint16((not a) shr 31)
  else:
    result = a.uint16

proc av_clip_int16_c* (a: cint): int16 {.inline.} =
  if ((a + 0x00008000) and not 0x0000FFFF) != 0:
    result = int16((a shr 31) xor 0x00007FFF)
  else:
    result = a.int16

proc av_clipl_int32_c* (a: int64): int32 {.inline.} =
  if ((a + 0x80000000).uint64 and not uint64(0xFFFFFFFF)) != 0:
    result = (int32)((a shr 63) xor 0x7FFFFFFF)
  else:
    result = cast[int32](a)

proc av_clip_intp2_c* (a: cint; p: cint): cint {.inline.} =
  if ((cast[cuint](a) + (1.cuint shl p)) and not ((2.cuint shl p) - 1)) != 0:
    result = cint((a shr 31) xor ((1 shl p) - 1))
  else:
    result = a

proc av_clip_uintp2_c* (a: cint; p: cint): cuint {.inline.} =
  if a != 0 and not (((1 shl p) - 1) != 0):
    result = cuint((not a) shr 31.int and ((1.cuint shl p) - 1).int)
  else:
    result = a.cuint

proc av_mod_uintp2_c* (a, p: cuint): cuint {.inline.} =
  result = a and ((1.cuint shl p) - 1)

proc av_sat_add32_c* (a, b: cint): cint {.inline.} =
  result = av_clipl_int32_c(cast[int64](a) + b)

proc av_sat_dadd32_c* (a, b: cint): cint {.inline.} =
  result = av_sat_add32_c(a, av_sat_add32_c(b, b))

proc av_sat_sub32_c* (a, b: cint): cint {.inline.} =
  result = av_clipl_int32_c(cast[int64](a) - b)

proc av_sat_dsub32_c* (a, b: cint): cint {.inline.} =
  result = av_sat_sub32_c(a, av_sat_add32_c(b, b))

# TODO: あとで実装する (301~)
proc av_sat_add64_c* (a, b: int64): int64 {.inline.}
proc av_sat_sub64_c* (a, b: int64): int64 {.inline.}

proc av_clipf_c* (a: cfloat; amin: cfloat; amax: cfloat): cfloat {.inline.} =
  when defined(HAVE_AV_CONFIG_H) and defined(ASSERT_LEVEL):
    when ASSERT_LEVEL >= 2:
      if amin > amax:
        abort()
  if a < amin:
    result = amin
  elif a > amax:
    result = amax
  else:
    result = a

proc av_clipd_c* (a: cdouble; amin: cdouble; amax: cdouble): cdouble {.inline.} =
  when defined(HAVE_AV_CONFIG_H) and defined(ASSERT_LEVEL):
    when ASSERT_LEVEL >= 2:
      if amin > amax:
        abort()
  if a < amin:
    result = amin
  elif a > amax:
    result = amax
  else:
    result = a

proc av_ceil_log2_c* (x: cint): cint {.inline.} =
  result = av_log2((x - 1).cuint shl 1)

proc av_popcount_c* (x: uint32): cint {.inline.} =
  var y: int = x.int
  dec(y, (y shr 1) and 0x55555555)
  y = (y and 0x33333333) + ((y shr 2) and 0x33333333)
  y = (y + (y shr 4)) and 0x0F0F0F0F
  inc(y, y shr 8)
  result = cint((y + (y shr 16)) and 0x0000003F)

proc av_popcount64_c* (x: uint64): cint {.inline.} =
  result = av_popcount_c(cast[uint32](x)) + av_popcount_c((uint32)(x shr 32))

proc av_parity_c* (v: uint32): cint {.inline.} =
  result = av_popcount_c(v) and 1

template MKTAG* (a, b, c, d: untyped): untyped =
  (a.int or (b.int shl 8) or (c.int shl 16) or (d.int shl 24))

template MKBETAG* (a, b, c, d: untyped): untyped =
  (d.int or (c.int shl 8) or (b.int shl 16) or (a.int shl 24))

template GET_UTF8* (val, GET_BYTE, ERROR: untyped): untyped =
  val = GET_BYTE
  block:
    var top: uint32 = (val and 128) shr 1
    if ((val and 0xc0) == 0x80) or (val >= 0xFE) != 0:
      ERROR
    while (val and top) != 0:
      var tmp: cuint = GET_BYTE - 128
      if (tmp shr 6) != 0:
        ERROR
      val = (val shl 6) + tmp
      top = top shl 5
    val = val and (top shl 1) - 1

template GET_UTF16* (cal, GET_16BIT, ERROR: untyped): untyped =
  val = GET_16BIT
  var hi: cuint = val - 0xD800
  if hi < 0x800:
    val = GET_16BIT - 0xDC00
    if (val > 0x3FF) or (hi > 0x3FF):
      ERROR
    val += (hi shl 10) + 0x10000

template PUT_UTF8* (val, tmp, PUT_BYTE: untyped): untyped =
  var
    bytes: cint
    shift: cint
    `in`: uint32 = val
  if `in` < 0x80:
    tmp = `in`
    PUT_BYTE
  else:
    bytes = (av_log2(`in`) + 4) / 5
    shift = (bytes - 1) * 6
    tmp = (256 - (256 shr bytes)) or (in shr shift)
    PUT_BYTE
    while shift >= 6:
      shift -= 6
      tmp = 0x80 or ((`in` shr shift) and 0x3f)
      PUT_BYTE

template PUT_UTF16* (val, tmp, PUT_16BIT: untyped): untyped =
  var `in`: uint32 = val
  if `in` < 0x10000:
    tmp = `in`
    PUT_16BIT
  else:
    tmp = 0xD800 or ((`in` - 0x10000) shl 10)
    PUT_16BIT
    tmp = 0xDC00 or ((`in` - 0x10000) and 0x3FF)
    PUT_16BIT

when not defined(av_ceil_log2):
  proc av_ceil_log2* (x: cint): cint = av_ceil_log2_c(x)

when not defined(av_clip):
  proc av_clip* (a, amin, amax: cint): cint = avclip_c(a, amin, amax)

when not defined(av_clip64):
  proc av_clip64* (a, amin, amax: int64): int64 = av_clip64_c(a, amin, amax)

when not defined(av_clip_uint8):
  proc av_clip_uint8* (a: cint): uint8 = av_clip_uint8_c(a)

when not defined(av_clip_int8):
  proc av_clip_int8* (a: cint): int8 = av_clip_int8_c(a)

when not defined(av_clip_uint16):
  proc av_clip_uint16* (a: cint): uint16 = av_clip_uint16_c(a)

when not defined(av_clip_int16):
  proc av_clip_int16* (a: cint): int16 = av_clip_int16_c(a)

when not defined(av_clipl_int32):
  proc av_clipl_int32* (a: int64): int32 = av_clipl_int32_c(a)

when not defined(av_clip_intp2):
  proc av_clip_intp2* (a, p: cint): cint = av_clip_intp2_c(a, p)

when not defined(av_clip_uintp2):
  proc av_clip_uintp2* (a, p: cint): cuint = av_clip_uintp2_c(a, p)

when not defined(av_mod_uintp2):
  proc av_mod_uintp2* (a, p: cuint): cuint = av_mod_uintp2_c(a, p)

when not defined(av_sat_add32):
  proc av_sat_add32* (a, b: cint): cint = av_sat_add32_c(a, b)

when not defined(av_sat_dadd32):
  proc av_sat_dadd32* (a, b: cint): cint = av_sat_dadd32_c(a, b)

when not defined(av_sat_sub32):
  proc av_sat_sub32* (a, b: cint): cint = av_sat_sub32_c(a, b)

when not defined(av_sat_dsub32):
  proc av_sat_dsub32* (a, b: cint): cint = av_sat_dsub32_c(a, b)

when not defined(av_sat_add64):
  proc av_sat_add64* (a, b: int64): int64 = av_sat_add64_c(a, b)

when not defined(av_sat_sub64):
  proc av_sat_sub64* (a, b: int64): int64 = av_sat_sub64_c(a, b)

when not defined(av_clipf):
  proc av_clipf* (a, b, c: cfloat): cfloat = av_clipf_c(a, b, c)

when not defined(av_clipd):
  proc av_clipd* (a, b, c: cdouble): cdouble = av_clipd_c(a, b, c)

when not defined(av_popcount):
  proc av_popcount* (a: uint32): cint = av_popcount_c(a)

when not defined(av_popcount64):
  proc av_popcount64* (a: uint64): cint = av_popcount64_c(a)

when not defined(av_parity):
  proc av_parity* (a: uint32): cint = av_parity_c(a)
