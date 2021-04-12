when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

type
  AVDXVA2DeviceContext* = object
    devmgr: ptr IDirect3DDeviceManager9
  
  AVDXVA2FramesContext* = object
    surface_type: DWORD
    surfaces: ptr ptr IDirect3DSurface9
    nb_surfaces: cint
    decoder_to_release: ptr IDirectXVideoDecoder
