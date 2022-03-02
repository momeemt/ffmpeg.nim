from ../types import AVDES

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_des_alloc* (): ptr AVDES
proc av_des_init* (d: ptr AVDES, key: ptr uint8, key_bits, decrypt: cint): cint
proc av_des_crypt* (d: ptr AVDES, dst, src: ptr uint8, ccount: cint, iv: ptr uint8, decrypt: cint)
proc av_des_mac* (d: ptr AVDES, dst, src: ptr uint8, count: cint)
