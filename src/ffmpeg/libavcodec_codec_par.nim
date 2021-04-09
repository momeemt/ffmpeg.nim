when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

from libavcodec_codec_id import AVCodecID
import libavutil_avutil
import libavutil_rational

type
  AVFieldOrder* = enum
    AV_FIELD_UNKNOWN
    AV_FIELD_PROGRESSIVE
    AV_FIELD_TT
    AV_FIELD_BB
    AV_FIELD_TB
    AV_FIELD_BT
  
  AVCodecParameters* = object
    codec_type: AVMediaType
    codec_id: AVCodecID
    codec_tag: cuint
    extradata: ptr uint8
    extradata_size: cint
    format: cint
    bit_rate: int64
    bits_per_coded_sample: cint
    bits_per_raw_sample: cint
    profile: cint
    level: cint
    width: cint
    height: cint
    sample_aspect_ratio: AVRational
    field_order: AVFieldOrder
    color_range: AVColorRange
    color_primaries: AVColorPrimaties
    color_trc: AVColorTransferCharacteristic
    color_space: AVColorSpace
    chroma_location: AVChromaLocation
    video_delay: cint
    channel_layout: uint64
    channels: cint
    sample_rate: cint
    block_align: cint
    frame_size: cint
    initial_padding: cint
    trailing_padding: cint
    seek_preroll: cint

proc avcodec_parameters_alloc* (): ptr AVCodecParameters
proc avcodec_parameters_free* (par: ptr ptr AVCodecParameters)
proc avcodec_parameters_copy* (dst, src: ptr AVCodecParameters): cint
