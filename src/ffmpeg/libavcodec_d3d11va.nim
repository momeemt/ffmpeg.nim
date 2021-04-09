when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

#if !defined(_WIN32_WINNT) || _WIN32_WINNT < 0x0602
#undef _WIN32_WINNT
#define _WIN32_WINNT 0x0602
#endif

const
  FF_DXVA2_WORKAROUND_SCALING_LIST_ZIGZAG* = 1
  FF_DXVA2_WORKAROUND_INTEL_CLEARVIDEO* = 2

type
  AVD3D11VAContext* = object
    decoder: ptr ID3D11VideoDecoder
    video_context: ptr ID3D11VideoContext
    cfg: ptr D3D11_VIDEO_DECODER_CONFIG
    surface_count: cuint
    surface: ptr ptr ID3D11VideoDecoderOutputView
    workaround: uint64
    report_id: cuint
    context_mutex: HANDLE

proc av_d3d11va_alloc_context* (): AVD3D11VAContext
