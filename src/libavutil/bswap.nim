when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

# when defined(HAVE_AV_CONFIG_H):
  #if   ARCH_AARCH64
  #   include "aarch64/bswap.h"
  #elif ARCH_ARM
  #   include "arm/bswap.h"
  #elif ARCH_AVR32
  #   include "avr32/bswap.h"
  #elif ARCH_SH4
  #   include "sh4/bswap.h"
  #elif ARCH_X86
  #   include "x86/bswap.h"
  #endif

template AV_BSWAP16C* (x: untyped): untyped =
  ((x shl 8) and 0xff00) or ((x shr 8) and 0xff00)

template AV_BSWAP32C* (x: untyped): untyped =
  (AV_BSWAP16C(x) shl 16) or AV_BSWAP16C(x shr 16)

template AV_BSWAP64C* (x: untyped): untyped =
  (AV_BSWAP32C(x) shl 32) or AV_BSWAP32C(x shr 32)

template AV_BSWAPC* (s, x: untyped): untyped =
  AV_BSWAP`s`C(x)

when not defined(av_bswap16):
  proc av_bswap16* (x: uint16): uint16 {.inline.} =
    result = (x shr 8) or (x shl 8)

when not defined(av_bswap32):
  proc av_bswap32* (x: uint32): uint32 {.inline.} =
    result = AV_BSWAP32C(x)

when not defined(av_bswap64):
  proc av_bswap64* (x: uint64): uint64 {.inline.} =
    result = (av_bswap32(x.uint32).uint64 shl 32) or (av_bswap32(x.uint32 shr 32))

when defined(AV_HAVE_BIGENDIAN):
  template av_be2ne16* (x: untyped): untyped = x
  template av_be2ne32* (x: untyped): untyped = x
  template av_be2ne64* (x: untyped): untyped = x
  template av_le2ne16* (x: untyped): untyped = av_bswap16(x)
  template av_le2ne32* (x: untyped): untyped = av_bswap32(x)
  template av_le2ne64* (x: untyped): untyped = av_bswap64(x)
  template AV_BE2NEC* (s, x: untyped): untyped = x
  template AV_LE2NEC* (s, x: untyped): untyped = AV_BSWAPC(s, x)
else:
  template av_be2ne16* (x: untyped): untyped = av_bswap16(x)
  template av_be2ne32* (x: untyped): untyped = av_bswap32(x)
  template av_be2ne64* (x: untyped): untyped = av_bswap64(x)
  template av_le2ne16* (x: untyped): untyped = x
  template av_le2ne32* (x: untyped): untyped = x
  template av_le2ne64* (x: untyped): untyped = x
  template AV_BE2NEC* (s, x: untyped): untyped = AV_BSWAPC(s, x)
  template AV_LE2NEC* (s, x: untyped): untyped = x

template AV_BE2NE16C* (x: untyped): untyped = AV_BE2NEC(16, x)
template AV_BE2NE32C* (x: untyped): untyped = AV_BE2NEC(32, x)
template AV_BE2NE64C* (x: untyped): untyped = AV_BE2NEC(64, x)
template AV_LE2NE16C* (x: untyped): untyped = AV_LE2NEC(16, x)
template AV_LE2NE32C* (x: untyped): untyped = AV_LE2NEC(32, x)
template AV_LE2NE64C* (x: untyped): untyped = AV_LE2NEC(64, x)
