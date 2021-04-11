when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

type
  AVDES* = object
    round_keys: array[3, array[16, uint64]]
    triple_des: cint
  

proc av_des_alloc* (): ptr AVDES
proc av_des_init* (d: ptr AVDES, key: ptr uint8, key_bits, decrypt: cint): cint
proc av_des_crypt* (d: ptr AVDES, dst, src: ptr uint8, ccount: cint, iv: ptr uint8, decrypt: cint)
proc av_des_mac* (d: ptr AVDES, dst, src: ptr uint8, count: cint)
