import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

const
  AV_HWFRAME_MAP_READ* = 1 shl 0
  AV_HWFRAME_MAP_WRITE* = 1 shl 1
  AV_HWFRAME_MAP_OVERWRITE* = 1 shl 2
  AV_HWFRAME_MAP_DIRECT* = 1 shl 3

proc av_hwdevice_find_type_by_name* (namme: cstring): AVHWDeviceType
proc av_hwdevice_get_type_name* (`type`: AVHWDeviceType): cstring
proc av_hwdevice_iterate_types* (prev: AVHWDeviceType): AVHWDeviceType
proc av_hwdevice_ctx_alloc* (`type`: AVHWDeviceType): ptr AVBufferRef
proc av_hwdevice_ctx_init* (`ref`: ptr AVBufferRef): cint
proc av_hwdevice_ctx_create* (device_ctx: ptr ptr AVBufferRef, `type`: AVHWDeviceType, device: cstring, opts: ptr AVDictionary, flags: cint): cint
proc av_hwdevice_ctx_create_derived* (dst_ctx: ptr ptr AVBufferRef, `type`: AVHWDeviceType, src_ctx: ptr AVBufferRef, flags: cint): cint
proc av_hwdevice_ctx_create_derived_opts* (dst_ctx: ptr ptr AVBufferRef, `type`: AVHWDeviceType, src_ctx: ptr AVBufferRef, options: ptr AVDictionary, flags: cint)
proc av_hwframe_ctx_alloc* (device_ctx: ptr AVBufferRef): ptr AVBufferRef
proc av_hwframe_ctx_init* (`ref`: ptr AVBufferRef): cint
proc av_hwframe_get_buffer* (hwframe_ctx: ptr AVBufferRef, frame: ptr AVFrame, flags: cint): cint
proc av_hwframe_transfer_data* (dst, src: ptr AVFrame, flags: cint): cint
proc av_hwframe_transfer_get_formats* (hwframe_ctx: ptr AVBufferRef, dir: AVHWFrameTransferDirection, formats: ptr ptr AVPixelFormat, flags: cint): cint
proc av_hwdevice_hwconfig_alloc* (device_ctx: ptr AVBufferRef): pointer
proc av_hwdevice_get_hwframe_constraints* (`ref`: ptr AVBufferRef, hwconfig: pointer): ptr AVHWFramesConstraints
proc av_hwframe_constraints_free* (constraints: ptr ptr AVHWFramesConstraints)
proc av_hwframe_map* (dst, src: ptr AVFrame, flags: cint): cint
proc av_hwframe_ctx_create_derived* (derived_frame_ctx: ptr ptr AVBufferRef, format: AVPixelFormat, derived_device_ctx, source_frame_ctx: ptr AVBufferRef): cint
