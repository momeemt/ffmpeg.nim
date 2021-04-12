when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

type
  AVHMACType* = enum
    AV_HMAC_MD5
    AV_HMAC_SHA1
    AV_HMAC_SHA224
    AV_HMAC_SHA256
    AV_HMAC_SHA384
    AV_HMAC_SHA512

  AVHMAC* = object

proc av_hmac_alloc* (`type`: AVHMACType): ptr AVHMAC
proc av_hmac_free* (ctx: ptr AVHMAC)
proc av_hmac_init* (ctx: ptr AVHMAC, key: ptr uint8, keylen: cuint)
proc av_hmac_update* (ctx: ptr AVHMAC, data: ptr uint8, len: cuint)
proc av_hmac_final* (ctx: ptr AVHMAC, `out`: ptr uint8, outlen: cuint): cint
proc av_hmac_calc* (ctx: ptr AVHMAC, data: ptr uint8, len: cuint, key: ptr uint8, keylen: cuint, `out`: ptr uint8, outlen: cuint): cint
