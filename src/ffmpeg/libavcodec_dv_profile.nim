when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

const
  DV_PROFILE_BYTES* = 6 * 80

type
  AVDVProfile* = object
    dsf: cint
    video_stype: cint
    frame_size: cint
    difseg_size: cint
    n_difchan: cint
    time_base: AVRational
    ltc_divisor: cint
    height: cint
    width: cint
    sar: array[2, AVRational]
    pix_fmt: AVPixelFormat
    bpm: cint
    block_sizes: ptr uint8
    audio_stride: cint
    audio_min_samples: array[3, cint]
    audio_samples_dist: array[5, cint]
    audio_shuffle: ptr array[9, uint8]

proc av_dv_frame_profile* (sys: ptr AVDVProfile, frame: ptr uint8, buf_size: cuint): ptr AVDVProfile
proc av_dv_codec_profile* (width, height: cint, pix_fmt: AVPixelFormat): ptr AVDVProfile
proc av_dv_codec_profile2* (width, height: cint, pix_fmt: AVPixelFormat, frame_rate: AVRational): ptr AVDVProfile
