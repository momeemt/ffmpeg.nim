when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

type
  AVPacketSideDataType* = enum
    AV_PKT_DATA_PALETTE
    AV_PKT_DATA_NEW_EXTRADATA
    AV_PKT_DATA_PARAM_CHANGE
    AV_PKT_DATA_H263_MB_INFO
    AV_PKT_DATA_REPLAYGAIN
    AV_PKT_DATA_DISPLAYMATRIX
    AV_PKT_DATA_STEREO3D
    AV_PKT_DATA_AUDIO_SERVICE_TYPE
    AV_PKT_DATA_QUALITY_STATS
    AV_PKT_DATA_FALLBACK_TRACK
    AV_PKT_DATA_CPB_PROPERTIES
    AV_PKT_DATA_SKIP_SAMPLES
    AV_PKT_DATA_JP_DUALMONO
    AV_PKT_DATA_STRINGS_METADATA
    AV_PKT_DATA_SUBTITLE_POSITION
    AV_PKT_DATA_MATROSKA_BLOCKADDITIONAL
    AV_PKT_DATA_WEBVTT_IDENTIFIER
    AV_PKT_DATA_WEBVTT_SETTINGS
    AV_PKT_DATA_METADATA_UPDATE
    AV_PKT_DATA_MPEGTS_STREAM_ID
    AV_PKT_DATA_MASTERING_DISPLAY_METADATA
    AV_PKT_DATA_SPHERICAL
    AV_PKT_DATA_CONTENT_LIGHT_LEVEL
    AV_PKT_DATA_A53_CC
    AV_PKT_DATA_ENCRYPTION_INIT_INFO
    AV_PKT_DATA_ENCRYPTION_INFO
    AV_PKT_DATA_AFD
    AV_PKT_DATA_PRFT
    AV_PKT_DATA_ICC_PROFILE
    AV_PKT_DATA_DOVI_CONF
    AV_PKT_DATA_NB
  
  AVPacketSideData* = object
    data: ptr uint8
    size: cint
    `type`: AVPacketSideDataType
  
  AVPacket* = object
    buf: ptr AVBufferRef
    pts: int64
    dts: int64
    data: ptr uint8
    size: cint
    stream_index: cint
    flags: cint
    side_data: ptr AVPacketSideDataType
    side_data_elems: cint
    duration: int64
    pos: int64

    when defined(FF_API_CONVERGENCE_DURATION):
      convergence_duration {.deprecated.} : int64
  
  AVSideDataParamChangeFlags* = enum
    AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_COUNT  = 0x0001
    AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_LAYOUT = 0x0002
    AV_SIDE_DATA_PARAM_CHANGE_SAMPLE_RATE    = 0x0004
    AV_SIDE_DATA_PARAM_CHANGE_DIMENSIONS     = 0x0008

const
  AV_PKT_DATA_QUALITY_FACTOR* {.deprecated.} = AV_PKT_DATA_QUALITY_STATS
  AV_PKT_FLAG_KEY* = 0x0001
  AV_PKT_FLAG_CORRUPT* = 0x0002
  AV_PKT_FLAG_DISCARD* = 0x0004
  AV_PKT_FLAG_TRUSTED* = 0x0008
  AV_PKT_FLAG_DISPOSABLE* = 0x0010

proc av_packet_alloc* (): ptr AVPacket
proc av_packet_clone* (src: ptr AVPacket): ptr AVPacket
proc av_packet_free* (pkt: ptr ptr AVPacket)
proc av_init_packet* (pkt: ptr AVPacket)
proc av_new_packet* (pkt: ptr AVPacket, size: cint): cint
proc av_shrink_packet* (pkt: ptr AVPacket, size: cint)
proc av_grow_packet* (pkt: ptr AVPacket, grow_by: cint): cint
proc av_packet_from_data* (pkt: ptr AVPacket, data: ptr uint8, size: cint): cint
proc av_packet_new_side_data* (pkt: ptr AVPacket, `type`: AVPacketSideDataType, size: cint): ptr uint8
proc av_packet_add_side_data* (pkt: ptr AVPacket, `type`: AVPacketSideDataType, data: ptr uint8, size: csize_t): cint
proc av_packet_shrink_side_data* (pkt: ptr AVPacket, `type`: AVPacketSideDataType, size: cint): cint
proc av_packet_get_side_data* (pkt: ptr AVPacket, `type`: AVPacketSideDataType, size: ptr cint): ptr uint8
proc av_packet_side_data_name* (`type`: AVPacketSideDataType): ptr cchar
proc av_packet_pack_dictionary* (dict: ptr AVDictionary, size: ptr cint): ptr uint8
proc av_packet_unpack_dictionary* (data: ptr uint8, size: cint, dict: ptr ptr AVDictionary): cint
proc av_packet_free_side_data* (pkt: ptr AVPacket)
proc av_packet_ref* (dst, src: ptr AVPacket): cint
proc av_packet_unref* (pkt: ptr AVPacket)
proc av_packet_move_ref* (dst, src: ptr AVPacket)
proc av_packet_copy_props* (dst, src: ptr AVPacket): cint
proc av_packet_make_refcounted* (pkt: ptr AVPacket): cint
proc av_packet_make_writable* (pkt: ptr AVPacket): cint
proc av_packet_rescale_ts* (pkt: ptr AVPacket, tb_src, tb_dst: AVRational)

when defined(FF_API_AVPACKET_OLD_API):
  proc av_dup_packet* (pkt: ptr AVPacket): cint {.deprecated.}
  proc av_copy_packet* (dst, src: ptr AVPacket): cint {.deprecated.}
  proc av_copy_packet_side_data* (dst, src: ptr AVPacket): cint {.deprecated.}
  proc av_free_packet* (pkt: ptr AVPacket) {.deprecated.}

when defined(FF_API_MERGE_SD_API):
  proc av_packet_merge_side_data* (pkt: ptr AVPacket): cint {.deprecated.}
  proc av_packet_split_side_data* (pkt: ptr AVPacket): cint {.deprecated.}
