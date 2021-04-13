from libavutil_frame import AVFrame

{.pragma: downmin_info, importc, header: "<libavutil/downmin_info.h>".}

type
  AVDownmixType* {.downmin_info.} = enum
    AV_DOWNMIX_TYPE_UNKNOWN
    AV_DOWNMIX_TYPE_LORO
    AV_DOWNMIX_TYPE_LTRT
    AV_DOWNMIX_TYPE_DPLII
    AV_DOWNMIX_TYPE_NB

  AVDownmixInfo* {.downmin_info.} = object
    preferred_downmix_type*: AVDownmixType
    center_mix_level*: cdouble
    center_mix_level_ltrt*: cdouble
    surround_mix_level*: cdouble
    surround_mix_level_ltrt*: cdouble
    lfe_mix_level*: cdouble

when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

proc av_downmix_info_update_side_data* (frame: ptr AVFrame): ptr AVDownmixInfo
