import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

const
  AV_PIX_FMT_FLAG_BE* = 1 shl 0
  AV_PIX_FMT_FLAG_PAL* = 1 shl 1
  AV_PIX_FMT_FLAG_BITSTREAM* = 1 shl 2
  AV_PIX_FMT_FLAG_HWACCEL* = 1 shl 3
  AV_PIX_FMT_FLAG_PLANAR* = 1 shl 4
  AV_PIX_FMT_FLAG_RGB* = 1 shl 5
  AV_PIX_FMT_FLAG_PSEUDOPAL* {.deprecated.} = 1 shl 6
  AV_PIX_FMT_FLAG_ALPHA* = 1 shl 7
  AV_PIX_FMT_FLAG_BAYER* = 1 shl 8
  AV_PIX_FMT_FLAG_FLOAT* = 1 shl 9
  FF_LOSS_RESOLUTION* = 0x0001
  FF_LOSS_DEPTH* = 0x0002
  FF_LOSS_COLORSPACE* = 0x0004
  FF_LOSS_ALPHA* = 0x0008
  FF_LOSS_COLORQUANT* = 0x0010
  FF_LOSS_CHROMA* = 0x0020

proc av_get_bits_per_pixel* (pixdesc: ptr AVPixFmtDescriptor): cint
proc av_get_padded_bits_per_pixel* (pixdesc: ptr AVPixFmtDescriptor): cint
proc av_pix_fmt_desc_get* (pix_fmt: AVPixelFormat): ptr AVPixFmtDescriptor
proc av_pix_fmt_desc_next* (prev: ptr AVPixFmtDescriptor): ptr AVPixFmtDescriptor
proc av_pix_fmt_desc_get_id* (desc: ptr AVPixFmtDescriptor): AVPixelFormat
proc av_pix_fmt_get_chroma_sub_sample* (pix_fmt: AVPixelFormat, h_shift, v_shift: ptr cint): cint
proc av_pix_fmt_count_planes* (pix_fmt: AVPixelFormat): cint
proc av_color_range_name* (`range`: AVColorRange): cstring
proc av_color_range_from_name* (name: cstring): cint
proc av_color_primaries_name* (primaries: AVColorPrimaries): cstring
proc av_color_primaries_from_name* (name: cstring): cint
proc av_color_transfer_name* (transfer: AVColorTransferCharacteristic): cstring
proc av_color_transfer_from_name* (name: cstring): cint
proc av_color_space_name* (space: AVColorSpace): cstring
proc av_color_space_from_name* (name: cstring): cint
proc av_chroma_location_name* (lovation: AVChromaLocation): cstring
proc av_chroma_location_from_name* (name: cstring): cint
proc av_get_pix_fmt* (name: cstring): AVPixelFormat
proc av_get_pix_fmt_name* (pix_fmt: AVPixelFormat): cstring
proc av_get_pix_fmt_string* (buf: cstring, buf_size: cint, pix_fmt: AVPixelFormat): cstring
proc av_read_image_line2* (dst: pointer, data: array[4, ptr uint8], linesize: array[4, cint], desc: ptr AVPixFmtDescriptor, x, y, c, w, read_pal_component, dst_element_size: cint)
proc av_read_image_line* (dst: ptr uint16, data: array[4, ptr uint8], linesize: array[4, cint], desc: ptr AVPixFmtDescriptor, x, y, c, w, read_pal_componnent: cint)
proc av_write_image_line2* (src: pointer, data: array[4, ptr uint8], linesize: array[4, cint], desc: ptr AVPixFmtDescriptor, x, y, c, w: cint)
proc av_write_image_line* (src: ptr uint16, data: array[4, ptr uint8], linesize: array[4, cint], desc: ptr AVPixFmtDescriptor, x, y, c, w: cint)
proc av_pix_fmt_swap_endianness* (pix_fmt: AVPixelFormat): AVPixelFormat
proc av_get_pix_fmt_loss* (dst_pix_fmt, src_pix_fmt: AVPixelFormat, has_alpha: cint): cint
proc av_find_best_pix_fmt_of_2* (dst_pix_fmt1, dst_pix_fmt2, srcc_pix_fmt: AVPixelFormat, has_alpha: cint, loss_ptr: ptr cint): AVPixelFormat
