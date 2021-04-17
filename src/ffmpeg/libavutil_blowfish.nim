import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

const
  AV_BF_ROUNDS* = 16

proc av_blowfish_alloc* (): AVBlowfish
proc av_blowfish_init* (ctx: ptr AVBlowfish, key: ptr uint8, key_len: cint)
proc av_blowfish_crypt_ecb* (ctx: ptr AVBlowfish, xl, xr: ptr uint32, decrypt: cint)
proc av_blowfish_crypt* (ctx: ptr AVBlowfish, dst, src: ptr uint8, count: cint, iv: ptr uint8, decrypt: cint)
