from ../types import FFTContext, FFTComplex, FFTSample, RDFTContext, RDFTransformType, DCTContext, DCTTransformType

when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|.58|.59|.60|.61|.62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.58|.59|.60|.61|.62)", cdecl.}

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
