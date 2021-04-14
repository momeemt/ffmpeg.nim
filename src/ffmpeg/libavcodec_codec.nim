from libavcodec_codec_id import AVCodecID
from libavutil_avutil import AVMediaType
from libavutil_frame import AVFrame
from libavutil_hwcontext import AVHWDeviceType
from libavutil_opt import AVClass
from libavutil_pixfmt import AVPixelFormat
from libavutil_rational import AVRational
from libavutil_samplefmt import AVSampleFormat
from undefined_symbol import AVCodecHWConfigInternal

{.pragma: codec, importc, header:"<libavcodec/codec.h>".}

const
  AV_CODEC_CAP_DRAW_HORIZ_BAND* = 1 shl 0
  AV_CODEC_CAP_DR1* = 1 shl 1
  AV_CODEC_CAP_TRUNCATED* = 1 shl 3
  AV_CODEC_CAP_DELAY* = 1 shl 5
  AV_CODEC_CAP_SMALL_LAST_FRAME* = 1 shl 6
  AV_CODEC_CAP_SUBFRAMES* = 1 shl 8
  AV_CODEC_CAP_EXPERIMENTAL* = 1 shl 9
  AV_CODEC_CAP_CHANNEL_CONF* = 1 shl 10
  AV_CODEC_CAP_FRAME_THREADS* = 1 shl 12
  AV_CODEC_CAP_SLICE_THREADS* = 1 shl 13
  AV_CODEC_CAP_PARAM_CHANGE* = 1 shl 14
  AV_CODEC_CAP_AUTO_THREADS* = 1 shl 15
  AV_CODEC_CAP_VARIABLE_FRAME_SIZE* = 1 shl 16
  AV_CODEC_CAP_AVOID_PROBING* = 1 shl 17
  AV_CODEC_CAP_HARDWARE* = 1 shl 18
  AV_CODEC_CAP_HYBRID* = 1 shl 19
  AV_CODEC_CAP_ENCODER_REORDERED_OPAQUE* = 1 shl 20
  AV_CODEC_CAP_ENCODER_FLUSH* = 1 shl 21
  AV_CODEC_HW_CONFIG_METHOD_HW_DEVICE_CTX* = 0x01
  AV_CODEC_HW_CONFIG_METHOD_HW_FRAMES_CTX* = 0x02
  AV_CODEC_HW_CONFIG_METHOD_INTERNAL* = 0x04
  AV_CODEC_HW_CONFIG_METHOD_AD_HOC* = 0x08

type
  AVProfile* {.codec.} = object
    profile: cint
    name: cstring
  
  AVCodecDefault* {.codec.} = object
  AVCodecContext* {.codec.} = object
  AVSubtitle* {.codec.} = object
  AVPacket* {.codec.} = object

  AVCodec* = object
    name*: cstring
    long_name*: cstring
    `type`*: AVMediaType
    id*: AVCodecID
    capabilities*: cint
    supported_framerates*: ptr AVRational
    pix_fmts*: ptr AVPixelFormat
    supported_samplerates*: ptr cint
    sample_fmts*: ptr AVSampleFormat
    channel_layouts*: ptr uint64
    max_lowres*: uint8
    priv_class*: ptr AVClass
    profiles*: ptr AVProfile
    wrapper_name*: cstring
    priv_data_size*: cint
    next*: ptr AVCodec
    update_thread_context*: proc (dst, src: ptr AVCodecContext): cint
    defaults*: ptr AVCodecDefault
    init_static_data*: proc (codec: ptr AVCodec)
    init*: proc (a1: ptr AVCodecContext): cint
    encode_sub*: proc (a1: ptr AVCodecContext, buf: ptr uint8, buf_size: cint, sub: ptr AVSubtitle): cint
    encode2*: proc (avctx: ptr AVCodecContext, avpkt: ptr AVPacket, frame: ptr AVFrame, got_packet_ptr: ptr cint): cint
    decode*: proc (a1: ptr AVCodecContext, outdata: pointer, outdata_size: ptr cint, acpkt: ptr AVPacket): cint
    close*: proc (a1: ptr AVCodecContext): cint
    send_frame*: proc (avctx: ptr AVCodecContext, frame: ptr AVFrame): cint
    receive_packet*: proc (avctx: ptr AVCodecContext, avpkt: ptr AVPacket): cint
    receive_frame*: proc (avctx: ptr AVCodecContext, frame: ptr AVFrame): cint
    flush*: proc (a1: ptr AVCodecContext)
    caps_internal*: cint
    bsfs*: cstring
    hw_configs*: ptr ptr AVCodecHWConfigInternal
    codec_tags*: ptr cuint
  
  AVCodecHWConfig* = object
    pix_fmt*: AVPixelFormat
    methods*: cint
    device_type*: AVHWDeviceType

when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

proc av_codec_iterate* (opaque: ptr pointer): ptr AVCodec
proc avcodec_find_decoder* (id: AVCodecID): ptr AVCodec
proc avcodec_find_decoder_by_name* (name: cstring): ptr AVCodec
proc avcodec_find_encoder* (id: AVCodecID): ptr AVCodec
proc avcodec_find_encoder_by_name* (name: cstring): ptr AVCodec
proc av_codec_is_encoder* (codec: ptr AVCodec): cint
proc av_codec_is_decoder* (codec: ptr AVCodec): cint
proc avcodec_get_hw_config* (codec: ptr AVCodec, index: cint): ptr AVCodecHWConfig

when defined(FF_API_UNUSED_CODEC_CAPS):
  const
    AV_CODEC_CAP_INTRA_ONLY* = 0x40000000
    AV_CODEC_CAP_LOSSLESS* = 0x80000000
