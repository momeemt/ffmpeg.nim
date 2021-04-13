{.pragma: avfft, importc, header:"<libavcodec/avfft.h>".}

type
  FFTSample* {.avfft.} = cfloat

  FFTComplex* {.avfft.} = object
    re, im: FFTSample

  FFTContext* {.avfft.} = object

  RDFTransformType* {.avfft.} = enum
    DFT_R2C
    IDFT_C2R
    IDFT_R2C
    DFT_C2R

  RDFTContext* {.avfft.} = object

  DCTContext* {.avfft.} = object

  DCTTransformType* {.avfft.} = enum
    DCT_II = 0
    DCT_III
    DCT_I
    DST_I

when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

proc av_fft_init* (nbits, inverse: cint): ptr FFTContext
proc av_fft_permute* (s: ptr FFTContext, z: ptr FFTComplex)
proc av_fft_calc* (s: ptr FFTContext, z: ptr FFTComplex)
proc av_fft_end* (s: ptr FFTContext)
proc av_mdct_init* (nbits, inverse: cint, scale: cdouble): ptr FFTContext
proc av_imdct_calc* (s: ptr FFTContext, output, input: ptr FFTSample)
proc av_imdct_half* (s: ptr FFTContext, output, input: ptr FFTSample)
proc av_mdct_calc* (s: ptr FFTContext, output, input: ptr FFTSample)
proc av_mdct_end* (s: ptr FFTContext)
proc av_rdft_init* (nbits: cint, trans: RDFTransformType): ptr RDFTContext
proc av_rdft_calc* (s: ptr RDFTContext, data: ptr FFTSample)
proc av_rdft_end* (s: ptr RDFTContext)
proc av_dct_init* (nbits: cint, `type`: DCTTransformType): ptr DCTContext
proc av_dct_calc* (s: ptr DCTContext, data: ptr FFTSample)
proc av_dct_end* (s: ptr DCTContext)
