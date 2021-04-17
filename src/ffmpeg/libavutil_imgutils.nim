import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

proc av_image_fill_max_pixsteps* (max_pixsteps, max_pixstep_comps: array[4, cint], pixdesc: ptr AVPixFmtDescriptor)
proc av_image_get_linesize* (pix_fmt: AVPixelFormat, width, plane: cint): cint
proc av_image_fill_linesizes* (linesizes: array[4, cint], pix_fmt: AVPixelFormat, width: cint): cint
proc av_image_fill_pointers* (data: array[4, ptr uint8], pix_fmt: AVPixelFormat, height: cint, `ptr`: ptr uint8, linesizes: array[4, cint]): cint
proc av_image_alloc* (pointers: array[4, ptr uint8], linesizes: array[4, cint], w, h: cint
, pix_ffmt: AVPixelFormat, align: cint): cint
proc av_image_copy_plane* (dst: ptr uint8, dst_linesize: cint, src: ptr uint8, src_linesize, byrewidth, height: cint)
proc av_image_copy* (dst_data: array[4, ptr uint8], dst_linesizes: array[4, cint], src_data: array[4, ptr uint8], src_linesizes: array[4, cint], pix_fmt: AVPixelFormat, width, height: cint)
proc av_image_copy_uc_from* (dst_data: array[4, ptr uint8], dst_linesizes: array[4, ByteAddress], src_data: array[4, ptr uint8], src_linesizes: array[4, ByteAddress], pix_fmt: AVPixelFormat, width, height: cint)
proc av_image_fill_arrays* (dst_data: array[4, ptr uint8], dst_linesizes: array[4, cint], src: ptr uint8, pix_fmt: AVPixelFormat, width, height, align: cint): cint
proc av_image_get_buffer_size* (pix_fmt: AVPixelFormat, width, height, align: cint): cint
proc av_image_copy_to_buffer* (dst: ptr uint8, dst_size: cint, src_data: array[4, ptr uint8], src_linesize: array[4, cint], pix_fmt: AVPixelFormat, width, height, align: cint): cint
proc av_image_check_size* (w, h: cuint, log_offset: cint, log_ctx: pointer): cint
proc av_image_check_size2* (w, h: cuint, max_pixels: int64, pix_fmt: AVPixelFormat, log_offset: cint, log_ctx: pointer): cint
proc av_image_check_sar* (w, h: cuint, sar: AVRational): cint
proc av_image_fill_black* (dst_data: array[4, ptr uint8], dst_linesizes: array[4, ByteAddress], pix_fmt: AVPixelFormat, range: AVColorRange, width, height: cint): cint
