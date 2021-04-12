when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

const
  AV_DRM_MAX_PLANES* = 4

type
  AVDRMObjectDescriptor* = object
    fg: cint
    size: csize_t
    format_modifier: uint64

  AVDRMPlaneDescriptor* = object
    object_index: cint
    offset: ptrdiff_t
    pitch: ptrdiff_t
  
  AVDRMLayerDescriptor* = object
    format: cuint
    nb_planes: cint
    planes: array[AV_DRM_MAX_PLANES, AVDRMPlaneDescriptor]
  
  AVDRMFrameDescriptor* = object
    nb_objects: cint
    objects: array[AV_DRM_MAX_PLANES, AVDRMObjectDescriptor]
    nb_layers: cint
    layers: array[AV_DRM_MAX_PLANES, AVDRMLayerDescriptor]
  
  AVDRMDeviceContext* = object
    fd: cint
