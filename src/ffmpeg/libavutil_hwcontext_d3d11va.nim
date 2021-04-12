when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

type
  AVD3D11VADeviceContext* = object
    device: ptr ID3D11Device
    device_context: ptr ID3D11DeviceContext
    video_device: ptr ID3D11VideoDevice
    video_context: ptr ID3D11VideoContext
    lock: proc (lock_ctx: pointer)
    unlock: proc (lock_ctx: pointer)
    lock_ctx: pointer
  
  AVD3D11FrameDescriptor* = object
    texture: ptr ID3D11Texture2D
    index: intptr_t
  
  AVD3D11VAFramesContext* = object
    texture: ptr ID3D11Texture2D
    BindFlags: cuint # UINT
    MiscFlags: cuint # UINT
