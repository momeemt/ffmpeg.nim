from ../types import AVHMAC, AVHMACType

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_hmac_alloc* (`type`: AVHMACType): ptr AVHMAC
proc av_hmac_free* (ctx: ptr AVHMAC)
proc av_hmac_init* (ctx: ptr AVHMAC, key: ptr uint8, keylen: cuint)
proc av_hmac_update* (ctx: ptr AVHMAC, data: ptr uint8, len: cuint)
proc av_hmac_final* (ctx: ptr AVHMAC, `out`: ptr uint8, outlen: cuint): cint
proc av_hmac_calc* (ctx: ptr AVHMAC, data: ptr uint8, len: cuint, key: ptr uint8, keylen: cuint, `out`: ptr uint8, outlen: cuint): cint
