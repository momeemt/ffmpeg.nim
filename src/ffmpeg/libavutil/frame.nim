from ../types import AVColorSpace, AVFrame, AVBufferRef, AVFrameSideDataType, AVFrameSideData
from version import FF_API_COLORSPACE_NAME

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

const
  AV_NUM_DATA_POINTERS* = 8
  AV_FRAME_FLAG_CORRUPT* = 1 shl 0
  AV_FRAME_FLAG_DISCARD* = 1 shr 2
  FF_DECODE_ERROR_INVALID_BITSTREAM* = 1
  FF_DECODE_ERROR_MISSING_REFERENCE* = 2
  FF_DECODE_ERROR_CONCEALMENT_ACTIVE* = 4
  FF_DECODE_ERROR_DECODE_SLICES* = 8
  AV_FRAME_CROP_UNALIGNED* = 1 shl 0

proc av_frame_alloc* (): ptr AVFrame
proc av_frame_free* (frame: ptr ptr AVFrame)
proc av_frame_ref* (dst, src: ptr AVFrame): cint
proc av_frame_clone* (src: ptr AVFrame): ptr AVFrame
proc av_frame_unref* (frame: ptr AVFrame)
proc av_frame_move_ref* (dst, src: ptr AVFrame)
proc av_frame_get_buffer* (frame: ptr AVFrame, align: cint): cint
proc av_frame_is_writable* (frame: ptr AVFrame): cint
proc av_frame_make_writable* (frame: ptr AVFrame): cint
proc av_frame_copy* (dst, src: ptr AVFrame): cint
proc av_frame_copy_props* (dst, src: ptr AVFrame): cint
proc av_frame_get_plane_buffer* (frame: ptr AVFrame, plane: cint): ptr AVBufferRef
proc av_frame_new_side_data* (frame: ptr AVFrame, `type`: AVFrameSideDataType, size: csize_t): ptr AVFrameSideData
proc av_frame_new_side_data_from_buf* (frame: ptr AVFrame, `type`: AVFrameSideDataType, buf: ptr AVBufferRef): ptr AVFrameSideData
proc av_frame_get_side_data* (frame: ptr AVFrame, `type`: AVFrameSideDataType): ptr AVFrameSideData
proc av_frame_remove_side_data* (frame: ptr AVFrame, `type`: AVFrameSideDataType)
proc av_frame_apply_cropping* (frame: ptr AVFrame, flags: cint): cint
proc av_frame_side_data_name* (`type`: AVFrameSideDataType): cstring

when FF_API_COLORSPACE_NAME:
  proc av_get_colorspace_name* (val: AVColorSpace): cstring {.deprecated.}
