from ../types import AVRC4

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_rc4_alloc* (): ptr AVRC4
proc av_rc4_init* (d: ptr AVRC4, key: ptr uint8, key_bits, decrypt: cint): cint
proc av_rc4_crypt* (d: ptr AVRC4, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
