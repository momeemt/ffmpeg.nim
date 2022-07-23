from ../types import AVCodecContext, AVFrame

{.pragma: vdpauInclude, importc, header: "<vdpau/vdpau.h>".}
{.pragma: vdpau, importc, header:"<libavcodec/vdpau.h>".}

type
  VdpPictureInfo* {.vdpauInclude.} = object
  VdpBitStreamBuffer* {.vdpauInclude.} = object
  VdpDevice* {.vdpauInclude.} = object
  VdpGetProcAddress* {.vdpauInclude.} = object
  VdpChromaType* {.vdpauInclude.} = object
  VdpDecoder* {.importc: "struct $1", vdpau.} = object
  VdpDecoderRender* {.importc: "struct $1", vdpau.} = object

  AVVDPAU_Render2* {.vdpau.} = proc (a1: ptr AVCodecContext, a2: ptr AVFrame, a3: ptr VdpPictureInfo, a4: cuint, a5: ptr VdpBitstreamBuffer): cint

  AVVDPAUContext* {.vdpau.} = object
    decoder*: VdpDecoder
    render*: ptr VdpDecoderRender
    render2*: AVVDPAU_Render2

when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|.58|.59|.60|.61|.62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.58|.59|.60|.61|.62)", cdecl.}

proc av_alloc_vdpaucontext* (): AVVDPAUContext
proc av_vdpau_hwaccel_get_render2* (a1: ptr AVVDPAUContext): AVVDPAU_Render2
proc av_vdpau_hwaccel_set_render2* (a1: ptr AVVDPAUContext, a2: AVVDPAU_Render2)
proc av_vdpau_bind_context* (avctx: ptr AVCodecContext, device: VdpDevice, get_proc_address: ptr VdpGetProcAddress, flags: cuint): cint
proc av_vdpau_get_surface_parameters* (avctx: ptr AVCodecContext, `type`: ptr VdpChromaType, width, height: ptr cuint): cint
proc av_vdpau_alloc_context* (): AVVDPAUContext
