{.pragma: d3d9, header: "<d3d9.h>".}
{.pragma: dxva2, header: "<dxva2api.h>".}
{.pragma: dxva2Include, importc, d3d9, dxva2.}
{.pragma: hwcontext_dxva2, importc, header: "<libavutil/hwcontext_dxva2.h>".}

type
  IDirect3DDeviceManager9* {.dxva2Include.} = object
  DWORD* {.dxva2Include.} = object
  IDirect3DSurface9* {.dxva2Include.} = object
  IDirectXVideoDecoder* {.dxva2Include.} = object

  AVDXVA2DeviceContext* {.hwcontext_dxva2.} = object
    devmgr*: ptr IDirect3DDeviceManager9
  
  AVDXVA2FramesContext* {.hwcontext_dxva2.} = object
    surface_type*: DWORD
    surfaces*: ptr ptr IDirect3DSurface9
    nb_surfaces*: cint
    decoder_to_release*: ptr IDirectXVideoDecoder
