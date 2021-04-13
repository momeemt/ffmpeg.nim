when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

{.pragma: hwcontext_drm, importc, header: "<libavutil/hwcontext_drm.h>".}

const
  AV_DRM_MAX_PLANES* = 4

type
  AVDRMObjectDescriptor* {.hwcontext_drm.} = object
    fg*: cint
    size*: csize_t
    format_modifier*: uint64

  AVDRMPlaneDescriptor* {.hwcontext_drm.} = object
    object_index*: cint
    offset*: ByteAddress
    pitch*: ByteAddress
  
  AVDRMLayerDescriptor* {.hwcontext_drm.} = object
    format*: cuint
    nb_planes*: cint
    planes*: array[AV_DRM_MAX_PLANES, AVDRMPlaneDescriptor]
  
  AVDRMFrameDescriptor* {.hwcontext_drm.} = object
    nb_objects*: cint
    objects*: array[AV_DRM_MAX_PLANES, AVDRMObjectDescriptor]
    nb_layers*: cint
    layers*: array[AV_DRM_MAX_PLANES, AVDRMLayerDescriptor]
  
  AVDRMDeviceContext* {.hwcontext_drm.} = object
    fd*: cint
