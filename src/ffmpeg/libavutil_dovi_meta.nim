when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

type
  AVDOVIDecoderConfigurationRecord* = object
    dv_version_major: uint8
    dv_version_minor: uint8
    dv_profile: uint8
    dv_level: uint8
    rpu_present_flag: uint8
    el_present_flag: uint8
    bl_present_flag: uint8
    dv_bl_signal_compatibility_id: uint8

proc av_dovi_alloc* (size: ptr csize_t): ptr AVDOVIDecoderConfigurationRecord
