{.pragma: vdpau, importc, header: "<vdpau/vdpau.h>".}
{.pragma: hwcontext_vdpau, importc, header: "<libavutil/hwcontext_vdpau.h>".}

type
  VdpDevice* {.vdpau.} = object
  VdpGetProcAddress* {.vdpau.} = object

  AVVDPAUDeviceContext* {.hwcontext_vdpau.} = object
    device: VdpDevice
    get_proc_address: ptr VdpGetProcAddress
