when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

#include <va/va.h>

const
  AV_VAAPI_DRIVER_QUIRK_USER_SET* = 1 shl 0
  AV_VAAPI_DRIVER_QUIRK_RENDER_PARAM_BUFFERS* = 1 shl 1
  AV_VAAPI_DRIVER_QUIRK_ATTRIB_MEMTYPE* = 1 shl 2
  AV_VAAPI_DRIVER_QUIRK_SURFACE_ATTRIBUTES* = 1 shl 3

type
  AVVAAPIDeviceContext* = object
    display: VADisplay
    driver_quirks: cuint
  
  AVVAAPIFramesContext* = object
    attributes: ptr VASurfaceAttrib
    nb_attributes: cint
    surface_ids: ptr VASurfaceID
    nb_surfaces: cint
  
  AVVAAPIHWConfig* = object
    config_id: VAConfigID
