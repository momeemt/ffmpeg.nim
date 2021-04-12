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

type
  AVFrameSideDataType* = enum
    AV_FRAME_DATA_PANSCAN
    AV_FRAME_DATA_A53_CC
    AV_FRAME_DATA_STEREO3D
    AV_FRAME_DATA_MATRIXENCODING
    AV_FRAME_DATA_DOWNMIX_INFO
    AV_FRAME_DATA_REPLAYGAIN
    AV_FRAME_DATA_DISPLAYMATRIX
    AV_FRAME_DATA_AFD
    AV_FRAME_DATA_MOTION_VECTORS
    AV_FRAME_DATA_SKIP_SAMPLES
    AV_FRAME_DATA_AUDIO_SERVICE_TYPE
    AV_FRAME_DATA_MASTERING_DISPLAY_METADATA
    AV_FRAME_DATA_GOP_TIMECODE
    AV_FRAME_DATA_SPHERICAL
    AV_FRAME_DATA_CONTENT_LIGHT_LEVEL
    AV_FRAME_DATA_ICC_PROFILE
    AV_FRAME_DATA_S12M_TIMECODE
    AV_FRAME_DATA_DYNAMIC_HDR_PLUS
    AV_FRAME_DATA_REGIONS_OF_INTEREST
    AV_FRAME_DATA_VIDEO_ENC_PARAMS
    AV_FRAME_DATA_QP_TABLE_PROPERTIES # if FF_API_FRAME_QP
    AV_FRAME_DATA_QP_TABLE_DATA # if FF_API_FRAME_QP

  AVActiveFormatDescription* = enum
    AV_AFD_SAME = 8
    AV_AFD_4_3 = 9
    AV_AFD_16_9 = 10
    AV_AFD_14_9 = 11
    AV_AFD_4_3_SP_14_9 = 13
    AV_AFD_16_9_SP_14_9 = 14
    AV_AFD_SP_4_3 = 15
  
  AVFrameSideData* = object
    `type`: AVFrameSideDataType
    data: ptr uint8
    size: cint
    metadata: ptr AVDictionary
    buf: ptr AVBufferRef
  
  AVRegionOfInterest* = object
    self_size: cuint
    top: cint
    bottom: cint
    left: cint
    right: cint
    qoffset: AVRational
  
  AVFrame* = object
    data: ptr array[AV_NUM_DATA_POINTERS, uint8]
    line: array[AV_NUM_DATA_POINTERS, cint]
    extended_data: ptr ptr uint8
    width: cint
    height: cint
    nb_samples: cint
    format: cint
    key_frame: cint
    pict_type: AVPictureType
    sample_aspect_ratio: AVRational
    pts: int64
    pkt_dts: int64
    coded_picture_number: cint
    display_picture_number: cint
    quality: cint
    opaque: pointer
    repeat_pict: cint
    interlaced_frame: cint
    top_field_first: cint
    palette_has_changed: cint
    reordered_opaque: int64
    sample_rate: cint
    channel_layout: uint64
    buf: ptr array[AV_NUM_DATA_POINTERS, AVBufferRef]
    extended_buf: ptr ptr AVBufferRef
    nb_extended_buf: cint
    side_data: ptr ptr AVFrameSideDataType
    nb_side_data: cint
    flags: cint
    color_range: AVColorRange
    color_primaries: AVColorPrimaries
    color_trc: AVColorTransferCharacteristic
    colorspace: AVColorSpace
    chroma_location: AVChromaLocation
    best_effort_timestamp: int64
    pkt_pos: int64
    pkt_duration: int64
    metadata: ptr AVDictionary
    decode_error_flags: cint
    channels: cint
    pkt_size: cint
    hw_frames_ctx: ptr AVBufferRef
    opaque_ref: ptr AVBufferRef
    crop_top: csize_t
    crop_bottom: csize_t
    crop_left: csize_t
    crop_right: csize_t
    private_ref: ptr AVBufferRef

    when defined(FF_API_PKT_PTS):
      pkt_pts {.deprecated.}: int64

    when defined(FF_API_ERROR_FRAME):
      error {.deprecated.}: array[AV_NUM_DATA_POINTERS, uint64]

    when defined(FF_API_FRAME_QP):
      qscale_table {.deprecated.}: ptr int8
      qstride {.deprecated.}: cint
      qscale_type {.deprecated.}: cint
      qp_table_buf {.deprecated.}: ptr AVBufferRef

proc av_get_colorspace_name* (val: AVColorSpace): ptr cchar
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
proc av_frame_side_data_name* (`type`: AVFrameSideDataType): ptr cchar

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
