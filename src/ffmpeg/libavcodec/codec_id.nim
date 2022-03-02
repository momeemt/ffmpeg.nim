from ../types import AVCodecID, AVMediaType, AVSampleFormat

const
  AV_CODEC_ID_IFF_BYTERUN1* = AVCodecID.AV_CODEC_ID_IFF_ILBM
  AV_CODEC_ID_H265* = AVCodecID.AV_CODEC_ID_HEVC
  AV_CODEC_ID_H266* = AVCodecID.AV_CODEC_ID_VVC

when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|-58|-59|-60|-61|-62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|-58|-59|-60|-61|-62)", cdecl.}

proc avcodec_get_type* (codec_id: AVCodecID): AVMediaType
proc avcodec_get_name* (id: AVCodecID): cstring
proc av_get_bits_per_sample* (codec_id: AVCodecID): cint
proc av_get_exact_bits_per_sample* (codec_id: AVCodecID): cint
proc avcodec_profile_name* (codec_id: AVCodecID, profile: cint): ptr cchar
proc av_get_pcm_codec* (fmt: AVSampleFormat, be: cint): AVCodecID
