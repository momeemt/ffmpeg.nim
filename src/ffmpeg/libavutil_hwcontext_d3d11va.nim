when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

{.pragma: d3d11va, importc, header: "<d3d11.h>".}
{.pragma: hwcontext_d3d11va, importc, header: "<libavutil/hwcontext/d3d11va.h>".}

type
  ID3D11Device* {.d3d11va.} = object
  ID3D11DeviceContext* {.d3d11va.} = object
  ID3D11VideoDevice* {.d3d11va.} = object
  ID3D11VideoContext* {.d3d11va.} = object
  ID3D11Texture2D* {.d3d11va.} = object

  AVD3D11VADeviceContext* {.hwcontext_d3d11va.} = object
    device*: ptr ID3D11Device
    device_context*: ptr ID3D11DeviceContext
    video_device*: ptr ID3D11VideoDevice
    video_context*: ptr ID3D11VideoContext
    lock*: proc (lock_ctx: pointer)
    unlock*: proc (lock_ctx: pointer)
    lock_ctx*: pointer
  
  AVD3D11FrameDescriptor* {.hwcontext_d3d11va.} = object
    texture*: ptr ID3D11Texture2D
    index*: cint #intptr_t
  
  AVD3D11VAFramesContext* {.hwcontext_d3d11va.} = object
    texture*: ptr ID3D11Texture2D
    BindFlags*: cuint # UINT
    MiscFlags*: cuint # UINT
