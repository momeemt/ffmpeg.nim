import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

proc av_image_fill_max_pixsteps* (max_pixsteps, max_pixstep_comps: ptr cint, pixdesc: ptr AVPixFmtDescriptor)
proc av_image_get_linesize* (pix_fmt: AVPixelFormat, width, plane: cint): cint
proc av_image_fill_linesizes* (linesizes: ptr cint, pix_fmt: AVPixelFormat, width: cint): cint
proc av_image_fill_pointers* (data: ptr ptr uint8, pix_fmt: AVPixelFormat, height: cint, `ptr`: ptr uint8, linesizes: ptr cint): cint
proc av_image_alloc* (pointers: ptr ptr uint8, linesizes: ptr cint, w, h: cint
, pix_ffmt: AVPixelFormat, align: cint): cint
proc av_image_copy_plane* (dst: ptr uint8, dst_linesize: cint, src: ptr uint8, src_linesize, byrewidth, height: cint)
proc av_image_copy* (dst_data: ptr ptr uint8, dst_linesizes: ptr cint, src_data: ptr ptr uint8, src_linesizes: ptr cint, pix_fmt: AVPixelFormat, width, height: cint)
proc av_image_copy_uc_from* (dst_data: ptr ptr uint8, dst_linesizes: ptr ByteAddress, src_data: ptr ptr uint8, src_linesizes: ptr ByteAddress, pix_fmt: AVPixelFormat, width, height: cint)
proc av_image_fill_arrays* (dst_data: ptr ptr uint8, dst_linesizes: ptr cint, src: ptr uint8, pix_fmt: AVPixelFormat, width, height, align: cint): cint
proc av_image_get_buffer_size* (pix_fmt: AVPixelFormat, width, height, align: cint): cint
proc av_image_copy_to_buffer* (dst: ptr uint8, dst_size: cint, src_data: ptr ptr uint8, src_linesize: ptr cint, pix_fmt: AVPixelFormat, width, height, align: cint): cint
proc av_image_check_size* (w, h: cuint, log_offset: cint, log_ctx: pointer): cint
proc av_image_check_size2* (w, h: cuint, max_pixels: int64, pix_fmt: AVPixelFormat, log_offset: cint, log_ctx: pointer): cint
proc av_image_check_sar* (w, h: cuint, sar: AVRational): cint
proc av_image_fill_black* (dst_data: ptr ptr uint8, dst_linesizes: ptr ByteAddress, pix_fmt: AVPixelFormat, range: AVColorRange, width, height: cint): cint
