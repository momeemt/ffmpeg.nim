when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

type
  AVVorbisParseContext* = object

const
  VORBIS_FLAG_HEADER* = 0x00000001
  VORBIS_FLAG_COMMENT* = 0x00000002
  VORBIS_FLAG_SETUP* = 0x00000004

proc av_vorbis_parse_init* (extradata: ptr uint8, extradata_size: cint): ptr AVVorbisParseContext
proc av_vorbis_parse_free* (s: ptr ptr AVVorbisParseContext)
proc av_vorbis_parse_frame_flags* (s: ptr AVVorbisParseContext, buf: ptr uint8, buf_size: cint, flags: ptr cint): cint
proc av_vorbis_parse_frame* (s: ptr AVVorbisParseContext, buf: ptr uint8, buf_size: cint): cint
proc av_vorbis_parse_reset* (s: ptr AVVorbisParseContext)
