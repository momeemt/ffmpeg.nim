import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

const
  AV_NUM_DATA_POINTERS* = 8
  AV_FRAME_FLAG_CORRUPT* = 1 shl 0
  AV_FRAME_FLAG_DISCARD* = 1 shr 2
  FF_DECODE_ERROR_INVALID_BITSTREAM* = 1
  FF_DECODE_ERROR_MISSING_REFERENCE* = 2
  FF_DECODE_ERROR_CONCEALMENT_ACTIVE* = 4
  FF_DECODE_ERROR_DECODE_SLICES* = 8
  AV_FRAME_CROP_UNALIGNED* = 1 shl 0

proc av_get_colorspace_name* (val: AVColorSpace): cstring
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
proc av_frame_new_side_data* (frame: ptr AVFrame, `type`: AVFrameSideDataType, size: cint): ptr AVFrameSideData
proc av_frame_new_side_data_from_buf* (frame: ptr AVFrame, `type`: AVFrameSideDataType, buf: ptr AVBufferRef): ptr AVFrameSideData
proc av_frame_get_side_data* (frame: ptr AVFrame, `type`: AVFrameSideDataType): ptr AVFrameSideData
proc av_frame_remove_side_data* (frame: ptr AVFrame, `type`: AVFrameSideDataType)
proc av_frame_apply_cropping* (frame: ptr AVFrame, flags: cint): cint
proc av_frame_side_data_name* (`type`: AVFrameSideDataType): cstring

when defined(FF_API_FRAME_GET_SET):
  proc av_frame_get_best_effort_timestamp* (frame: ptr AVFrame): int64 {.deprecated.}
  proc av_frame_set_best_effort_timestamp* (frame: ptr AVFrame, val: int64) {.deprecated.}
  proc av_frame_get_pkt_duration* (frame: ptr AVFrame): int64 {.deprecated.}
  proc av_frame_set_pkt_duration* (frame: ptr AVFrame, val: int64) {.deprecated.}
  proc av_frame_get_pkt_pos* (frame: ptr AVFrame): int64 {.deprecated.}
  proc av_frame_set_pkt_pos* (frame: ptr AVFrame, val: int64) {.deprecated.}
  proc av_frame_get_channel_layout* (frame: ptr AVFrame): int64 {.deprecated.}
  proc av_frame_set_channel_layout* (frame: ptr AVFrame, val: int64) {.deprecated.}
  proc av_frame_get_channels* (frame: ptr AVFrame): cint {.deprecated.}
  proc av_frame_set_channels* (frame: ptr AVFrame, val: cint) {.deprecated.}
  proc av_frame_get_sample_rate* (frame: ptr AVFrame): cint {.deprecated.}
  proc av_frame_set_sample_rate* (frame: ptr AVFrame, val: cint) {.deprecated.}
  proc av_frame_get_metadata* (frame: ptr AVFrame): ptr AVDictionary {.deprecated.}
  proc av_frame_set_metadata* (fra,e: ptr AVFrame, val: ptr AVDictionary) {.deprecated.}
  proc av_frame_get_decode_error_flags* (frame: ptr AVFrame): cint {.deprecated.}
  proc av_frame_set_decode_error_flags* (frame: ptr AVFrame, val: cint) {.deprecated.}
  proc av_frame_get_pkt_size* (frame: ptr AVFrame): cint {.deprecated.}
  proc av_frame_set_pkt_size* (frame: ptr AVFrame, val: cint) {.deprecated.}
  proc av_frame_get_colorspace* (frame: ptr AVFrame): AVColorSpace {.deprecated.}
  proc av_frame_set_colorspace* (frame: ptr AVFrame, val: AVColorSpace) {.deprecated.}
  proc av_frame_get_color_range* (frame: ptr AVFrame): AVColorRange {.deprecated.}
  proc av_frame_set_color_range* (frame: ptr AVFrame, val: AVColorRange) {.deprecated.}

  when defined(FF_API_FRAME_QP):
    proc av_frame_get_qp_table* (f: ptr AVFrame, stride, `type`: ptr cint): ptr int8 {.deprecated.}
    proc av_frame_set_qp_table* (f: ptr AVFrame, buf: ptr AVBufferRef, stride, `type`: cint): cint {.deprecated.}
