import ffmpeg_types

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

when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|.55|.56|.57|.58|.59).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)", cdecl.}

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
