import ffmpeg_types

const
  AV_CODEC_ID_IFF_BYTERUN1* = AVCodecID.AV_CODEC_ID_IFF_ILBM
  AV_CODEC_ID_H265* = AVCodecID.AV_CODEC_ID_HEVC

when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

proc avcodec_get_type* (codec_id: AVCodecID): AVMediaType
proc avcodec_get_name* (id: AVCodecID): cstring
