when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

#include <vdpau/vdpau.h>

type
  AVVDPAUDeviceContext* = object
    device: VdpDevice
    get_proc_address: ptr VdpGetProcAddress
