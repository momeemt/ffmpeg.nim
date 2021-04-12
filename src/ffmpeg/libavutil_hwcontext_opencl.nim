when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

#ifdef __APPLE__
#include <OpenCL/cl.h>
#else
#include <CL/cl.h>
#endif

type
  AVOpenCLFrameDescriptor* = object
    nb_planes: cint
    planes: array[AV_NUM_DATA_POINTERS, cl_mem]
  
  AVOpenCLDeviceContext* = object
    device_id: cl_device_id
    context: cl_context
    command_queue: cl_command_queue
  
  AVOpenCLFramesContext* = object
    command_queue: cl_command_queue
