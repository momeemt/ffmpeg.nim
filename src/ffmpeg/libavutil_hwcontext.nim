when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

const
  AV_HWFRAME_MAP_READ* = 1 shl 0
  AV_HWFRAME_MAP_WRITE* = 1 shl 1
  AV_HWFRAME_MAP_OVERWRITE* = 1 shl 2
  AV_HWFRAME_MAP_DIRECT* = 1 shl 3

type
  AVHWDeviceType* = enum
    AV_HWDEVICE_TYPE_NONE
    AV_HWDEVICE_TYPE_VDPAU
    AV_HWDEVICE_TYPE_CUDA
    AV_HWDEVICE_TYPE_VAAPI
    AV_HWDEVICE_TYPE_DXVA2
    AV_HWDEVICE_TYPE_QSV
    AV_HWDEVICE_TYPE_VIDEOTOOLBOX
    AV_HWDEVICE_TYPE_D3D11VA
    AV_HWDEVICE_TYPE_DRM
    AV_HWDEVICE_TYPE_OPENCL
    AV_HWDEVICE_TYPE_MEDIACODEC
    AV_HWDEVICE_TYPE_VULKAN
  
  AVHWDeviceInternal* = object

  AVHWDeviceContext* = object
    av_class: ptr AVClass
    internal: ptr AVHWDeviceInternal
    `type`: AVHWDeviceType
    hwctx: pointer
    free: proc (ctx: ptr AVHWDeviceContext)
    user_opaque: pointer
  
  AVHWFramesInternal* = object

  AVHWFramesContext* = object
    av_class: AVClass
    internal: AVHWFramesInternal
    device_ref: ptr AVBufferRef
    device_ctx: ptr AVHWDeviceContext
    hwctx: pointer
    free: proc (ctx: ptr AVHWFramesContext)
    user_opaque: pointer
    pool: ptr AVBufferPool
    initial_pool_size: cint
    format: AVPixelFormat
    sw_format: AVPixelFormat
    width: cint
    height: cint
  
  AVHWFrameTransferDirection* = enum
    AV_HWFRAME_TRANSFER_DIRECTION_FROM
    AV_HWFRAME_TRANSFER_DIRECTION_TO
  
  AVHWFramesConstraints* = object
    valid_hw_formats: ptr AVPixelFormat
    valid_sw_formats: ptr AVPixelFormat
    min_width: cint
    min_height: cint
    max_width: cint
    max_height: cint

proc av_hwdevice_find_type_by_name* (namme: ptr cchar): AVHWDeviceType
proc av_hwdevice_get_type_name* (`type`: AVHWDeviceType): ptr cchar
proc av_hwdevice_iterate_types* (prev: AVHWDeviceType): AVHWDeviceType
proc av_hwdevice_ctx_alloc* (`type`: AVHWDeviceType): ptr AVBufferRef
proc av_hwdevice_ctx_init* (ref: ptr AVBufferRef): cint
proc av_hwdevice_ctx_create* (device_ctx: ptr ptr AVBufferRef, `type`: AVHWDeviceType, device: ptr cchar, opts: ptr AVDictionary, flags: cint): cint
proc av_hwdevice_ctx_create_derived* (dst_ctx: ptr ptr AVBufferRef, `type`: AVHWDeviceType, src_ctx: ptr AVBufferRef, flags: cint): cint
proc av_hwdevice_ctx_create_derived_opts* (dst_ctx: ptr ptr AVBufferRef, `type`: AVHWDeviceType, src_ctx: ptr AVBufferRef, options: ptr AVDictionary, flags: cint)
proc av_hwframe_ctx_alloc* (device_ctx: ptr AVBufferRef): ptr AVBufferRef
proc av_hwframe_ctx_init* (ref: ptr AVBufferRef): cint
proc av_hwframe_get_buffer* (hwframe_ctx: ptr AVBufferRef, frame: ptr AVFrame, flags: cint): cint
proc av_hwframe_transfer_data* (dst, src: ptr AVFrame, flags: cint): cint
proc av_hwframe_transfer_get_formats* (hwframe_ctx: ptr AVBufferRef, dir: AVHWFrameTransferDirection, formats: ptr ptr AVPixelFormat, flags: cint): cint
proc av_hwdevice_hwconfig_alloc* (device_ctx: ptr AVBufferRef): pointer
proc av_hwdevice_get_hwframe_constraints* (ref: ptr AVBufferRef, hwconfig: pointer): ptr AVHWFramesConstraints
proc av_hwframe_constraints_free* (constraints: ptr ptr AVHWFramesConstraints)
proc av_hwframe_map* (dst, src: ptr AVFrame, flags: cint): cint
proc av_hwframe_ctx_create_derived* (derived_frame_ctx: ptr ptr AVBufferRef, format: AVPixelFormat, derived_device_ctx, source_frame_ctx: ptr AVBufferRef): cint
