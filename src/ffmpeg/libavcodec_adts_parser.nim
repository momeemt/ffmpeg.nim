when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

const
  AV_AAC_ADTS_HEADER_SIZE* = 7

proc av_adts_header_parse* (buf: ptr uint8, samples: ptr uint32, frames: ptr uint8): int