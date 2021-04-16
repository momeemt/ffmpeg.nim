{.pragma: mfxvideo, importc, header: "<mfx/mfxvideo.h>".}
{.pragma: hwcontext_qsv, importc, header: "<libavutil/hwcontext_qsv.h>".}

type
  mfxSession* {.mfxvideo.} = object
  mfxFrameSurface1* {.mfxvideo.} = object

  AVQSVDeviceContext* {.hwcontext_qsv, bycopy.} = object
    session: mfxSession
  
  AVQSVFramesContext* {.hwcontext_qsv, bycopy.} = object
    surfaces: ptr mfxFrameSurface1
    nb_surfaces: cint
    frame_type: cint
