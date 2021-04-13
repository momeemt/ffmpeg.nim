from libavutil_frame import AV_NUM_DATA_POINTERS

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

when defined(macosx):
  {.pragma: hwcontext_opencl_include, importc, header: "<OpenCL/cl.h>".}
else:
  {.pragma: hwcontext_opencl_include, importc, header: "<CL/cl.h>".}

{.pragma: hwcontext_opencl, importc, header: "<libavutil/hwcontext_opencl.h>".}

type
  cl_mem* {.hwcontext_opencl_include.} = object
  cl_device_id* {.hwcontext_opencl_include.} = object
  cl_context* {.hwcontext_opencl_include.} = object
  cl_command_queue* {.hwcontext_opencl_include.} = object

  AVOpenCLFrameDescriptor* {.hwcontext_opencl.} = object
    nb_planes: cint
    planes: array[AV_NUM_DATA_POINTERS, cl_mem]
  
  AVOpenCLDeviceContext* {.hwcontext_opencl.} = object
    device_id: cl_device_id
    context: cl_context
    command_queue: cl_command_queue
  
  AVOpenCLFramesContext* {.hwcontext_opencl.} = object
    command_queue: cl_command_queue
