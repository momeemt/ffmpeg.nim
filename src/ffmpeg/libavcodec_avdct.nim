when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

from libavutil_log import AVClass

type
  AVDCT* = object
    av_class: ptr AVClass
    idct: proc (`block`: ptr int16)
    idct_permutation: array[64, uint8]
    fdct: proc (`block`: ptr int16)
    dct_algo: cint
    idct_algo: cint
    # get_pixels: proc (`block`: ptr int16, pixels: ptr uint8, line_size: ptrdiff_t)
    bits_per_sample: cint
    # get_pixels_unaligned: proc (`block`: ptr int16, pixels: ptr uint8, line_size: ptrdiff_t)

proc avcodec_dct_alloc* (): ptr AVDCT
proc avcodec_dct_init* (a1: ptr AVDCT): cint
proc avcodec_dct_get_class* (): ptr AVClass
