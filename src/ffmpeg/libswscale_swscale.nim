import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "swscale(|-4|-5|-6).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libswscale(|.4|.5|.6).dylib", cdecl.}
else:
  {.push importc, dynlib: "libswscale.so(|.4|.5|.6)", cdecl.}

const
  SWS_FAST_BILINEAR* = 1
  SWS_BILINEAR* = 2
  SWS_BICUBIC* = 4
  SWS_X* = 8
  SWS_POINT* = 0x10
  SWS_AREA* = 0x20
  SWS_BICUBLIN* = 0x40
  SWS_GAUSS* = 0x80
  SWS_SINC* = 0x100
  SWS_LANCZOS* = 0x200
  SWS_SPLINE* = 0x400
  SWS_PARAM_DEFAULT* = 123456
  SWS_PRINT_INFO* = 0x1000
  SWS_FULL_CHR_H_INT* = 0x2000
  SWS_FULL_CHR_H_INP* = 0x4000
  SWS_DIRECT_BGR* = 0x8000
  SWS_ACCURATE_RND* = 0x40000
  SWS_BITEXACT* = 0x80000
  SWS_ERROR_DIFFUSION* = 0x800000
  SWS_MAX_REDUCE_CUTOFF* = 0.002
  SWS_CS_ITU709* = 1
  SWS_CS_FCC* = 4
  SWS_CS_ITU601* = 5
  SWS_CS_ITU624* = 5
  SWS_CS_SMPTE170M* = 5
  SWS_CS_SMPTE240M* = 7
  SWS_CS_DEFAULT* = 5
  SWS_CS_BT2020* = 9

proc swscale_version* (): cuint
proc swscale_configuration* (): cstring
proc swscale_license* (): cstring
proc sws_getCoefficients* (colorspace: cint): ptr cint
proc sws_isSupportedInput* (pix_fmt: AVPixelFormat): cint
proc sws_isSupportedOutput* (pix_fmt: AVPixelFormat): cint
proc sws_isSupportedEndiannessConversion* (pix_fmt: AVPixelFormat): cint
proc sws_alloc_context* (): ptr SwsContext
proc sws_init_context* (sws_context: ptr SwsContext, srcFilter, dstFilter: ptr SwsFilter): cint # warning
proc sws_freeContext* (swsContext: ptr SwsContext)
proc sws_getContext* (srcW, srcH: cint, srcFormat: AVPixelFormat, dstW, dstH: cint, dstFormat: AVPixelFormat, flags: cint, srcFilter, dstFilter: ptr SwsFilter, param: ptr cdouble): ptr SwsContext
proc sws_scale* (c: ptr SwsContext, srcSlice: ptr ptr uint8, srcStride: ptr cint, srcSliceY, srcSliceH: cint, dst: ptr ptr uint8, dstStride: ptr cint): cint
proc sws_setColorspaceDetails* (c: ptr SwsContext, inv_table: ptr cint, srcRange: cint, table: ptr cint, dstRange, brightness, contrast, saturation: cint): cint
proc sws_getColorspaceDetails* (c: ptr SwsContext, inv_table: ptr ptr cint, srcRange: ptr cint, table: ptr ptr cint, dstRange, brightness, contrast, saturation: ptr cint): cint
proc sws_allocVec* (length: cint): ptr SwsVector
proc sws_getGaussianVec* (variance, quality: cdouble): ptr SwsVector
proc sws_scaleVec* (a: ptr SwsVector, scalar: cdouble)
proc sws_normalizeVec* (a: ptr SwsVector, height: cdouble)
proc sws_freeVec* (a: ptr SwsVector)
proc sws_getDefaultFilter* (lumaGBlur, chromaGBlur, lumaSharpen, chromaSharpen, chromaHShift, chromaVShift: cfloat, verbose: cint): ptr SwsFilter
proc sws_freeFilter* (filter: ptr SwsFilter)
proc sws_getCachedContext* (context: ptr SwsContext, srcW, srcH: cint, srcFormat: AVPixelFormat, dstW, dstH: cint, dstFormmat: AVPixelFormat, flags: cint, srcFilter, dstFilter: ptr SwsFilter, param: ptr cdouble): ptr SwsContext
proc sws_convertPalette8ToPacked32* (src, dst: ptr uint8, num_pixels: cint, palette: ptr uint8)
proc sws_convertPalette8ToPacked24* (src, dst: ptr uint8, num_pixels: cint, palette: ptr uint8)
proc sws_get_class* (): ptr AVClass

when defined(FF_API_SWS_VECTOR):
  proc sws_getConstVec* (c: cdouble, length: cint): ptr SwsVector {.deprecated.}
  proc sws_getIdentityVec* (): ptr SwsVector {.deprecated.}
  proc sws_convVec* (a, b: ptr SwsVector) {.deprecated.}
  proc sws_addVec* (a, b: ptr SwsVector) {.deprecated.}
  proc sws_subVec* (a, b: ptr SwsVector) {.deprecated.}
  proc sws_shiftVec* (a: ptr SwsVector, shift: cint) {.deprecated.}
  proc sws_cloneVec* (a: ptr SwsVector): ptr SwsVector {.deprecated.}
  proc sws_printVec2* (a: ptr SwsVector, log_ctx: ptr AVClass, log_level: cint) {.deprecated.}
