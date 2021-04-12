when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

#include <mfx/mfxvideo.h>

type
  AVQSVDeviceContext* = object
    session: mfxSession
  
  AVQSVFramesContext* = object
    surfaces: ptr mfxFrameSurface1
    nb_surfaces: cint
    frame_type: cint
