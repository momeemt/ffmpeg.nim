import ffmpeg_types

const
  DV_PROFILE_BYTES* = 6 * 80

when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)", cdecl.}

proc av_dv_frame_profile* (sys: ptr AVDVProfile, frame: ptr uint8, buf_size: cuint): ptr AVDVProfile
proc av_dv_codec_profile* (width, height: cint, pix_fmt: AVPixelFormat): ptr AVDVProfile
proc av_dv_codec_profile2* (width, height: cint, pix_fmt: AVPixelFormat, frame_rate: AVRational): ptr AVDVProfile
