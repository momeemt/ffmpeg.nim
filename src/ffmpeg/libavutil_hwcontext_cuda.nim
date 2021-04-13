when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

when not defined(CUDA_VERSION):
  {.pragma: cuda, importc, header: "<cuda.h>".}

{.pragma: hwcontext_cuda, importc, header: "<libavutil/hwcontext_cuda.h>".}

const
  AV_CUDA_USE_PRIMARY_CONTEXT* = 1 shl 0

type
  CUcontext* {.cuda.} = object
  CUstream* {.cuda.} = object
  AVCUDADeviceContextInternal* {.hwcontext_cuda.} = object

  AVCUDADeviceContext* {.hwcontext_cuda.} = object
    cuda_ctx*: CUcontext
    stream*: CUstream
    internal*: ptr AVCUDADeviceContextInternal
