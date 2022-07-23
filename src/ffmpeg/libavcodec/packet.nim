from ../types import AVPacketSideDataType, AVPacket, AVRational
from ../libavutil/dict import AVDictionary
from version import FF_API_INIT_PACKET

const
  AV_PKT_DATA_QUALITY_FACTOR* {.deprecated.} = AVPacketSideDataType.AV_PKT_DATA_QUALITY_STATS
  AV_PKT_FLAG_KEY* = 0x0001
  AV_PKT_FLAG_CORRUPT* = 0x0002
  AV_PKT_FLAG_DISCARD* = 0x0004
  AV_PKT_FLAG_TRUSTED* = 0x0008
  AV_PKT_FLAG_DISPOSABLE* = 0x0010

when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|.58|.59|.60|.61|.62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.58|.59|.60|.61|.62)", cdecl.}

proc av_packet_alloc* (): ptr AVPacket
proc av_packet_clone* (src: ptr AVPacket): ptr AVPacket
proc av_packet_free* (pkt: ptr ptr AVPacket)
proc av_new_packet* (pkt: ptr AVPacket, size: cint): cint
proc av_shrink_packet* (pkt: ptr AVPacket, size: cint)
proc av_grow_packet* (pkt: ptr AVPacket, grow_by: cint): cint
proc av_packet_from_data* (pkt: ptr AVPacket, data: ptr uint8, size: cint): cint
proc av_packet_new_side_data* (pkt: ptr AVPacket, `type`: AVPacketSideDataType, size: csize_t): ptr uint8
proc av_packet_add_side_data* (pkt: ptr AVPacket, `type`: AVPacketSideDataType, data: ptr uint8, size: csize_t): cint
proc av_packet_shrink_side_data* (pkt: ptr AVPacket, `type`: AVPacketSideDataType, size: csize_t): cint
proc av_packet_get_side_data* (pkt: ptr AVPacket, `type`: AVPacketSideDataType, size: ptr csize_t): ptr uint8
proc av_packet_side_data_name* (`type`: AVPacketSideDataType): cstring
proc av_packet_pack_dictionary* (dict: ptr AVDictionary, size: ptr csize_t): ptr uint8
proc av_packet_unpack_dictionary* (data: ptr uint8, size: csize_t, dict: ptr ptr AVDictionary): cint
proc av_packet_free_side_data* (pkt: ptr AVPacket)
proc av_packet_ref* (dst, src: ptr AVPacket): cint
proc av_packet_unref* (pkt: ptr AVPacket)
proc av_packet_move_ref* (dst, src: ptr AVPacket)
proc av_packet_copy_props* (dst, src: ptr AVPacket): cint
proc av_packet_make_refcounted* (pkt: ptr AVPacket): cint
proc av_packet_make_writable* (pkt: ptr AVPacket): cint
proc av_packet_rescale_ts* (pkt: ptr AVPacket, tb_src, tb_dst: AVRational)

proc av_packet_merge_side_data* (pkt: ptr AVPacket): cint {.deprecated.}
proc av_packet_split_side_data* (pkt: ptr AVPacket): cint {.deprecated.}

when FF_API_INIT_PACKET:
  proc av_init_packet* (pkt: ptr AVPacket) {.deprecated.}
