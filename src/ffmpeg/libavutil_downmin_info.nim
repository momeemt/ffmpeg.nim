when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

type
  AVDownmixType* = enum
    AV_DOWNMIX_TYPE_UNKNOWN
    AV_DOWNMIX_TYPE_LORO
    AV_DOWNMIX_TYPE_LTRT
    AV_DOWNMIX_TYPE_DPLII
    AV_DOWNMIX_TYPE_NB

  AVDownmixInfo* = object
    preferred_downmix_type: AVDownmixType
    center_mix_level: cdouble
    center_mix_level_ltrt: cdouble
    surround_mix_level: cdouble
    surround_mix_level_ltrt: cdouble
    lfe_mix_level: cdouble

proc av_downmix_info_update_side_data* (frame: ptr AVFrame): ptr AVDownmixInfo
