when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)", cdecl.}

const
  AV_ERROR_MAX_STRING_SIZE* = 64

template AVERROR* (e: untyped): untyped = -e
template AVUNERROR* (e: untyped): untyped = -e

# when defined(EDOM):
#   when EDOM > 0:
#     template AVERROR* (e: untyped): untyped = -e
#     template AVUNERROR* (e: untyped): untyped = -e
#   else:
#     template AVERROR* (e: untyped): untyped = e
#     template AVUNERROR* (e: untyped): untyped = e
# else:
#   template AVERROR* (e: untyped): untyped = e
#   template AVUNERROR* (e: untyped): untyped = e

template FFERRTAG* (a, b, c, d: untyped): untyped =
  -(MKTAG(a, b, c, d).int)

template AVERROR_BSF_NOT_FOUND* (): untyped = FFERRTAG(0xF8,'B','S','F')
template AVERROR_BUG* (): untyped = FFERRTAG( 'B','U','G','!')
template AVERROR_BUFFER_TOO_SMALL* (): untyped = FFERRTAG( 'B','U','F','S')
template AVERROR_DECODER_NOT_FOUND* (): untyped = FFERRTAG(0xF8,'D','E','C')
template AVERROR_DEMUXER_NOT_FOUND* (): untyped = FFERRTAG(0xF8,'D','E','M')
template AVERROR_ENCODER_NOT_FOUND* (): untyped = FFERRTAG(0xF8,'E','N','C')
template AVERROR_EOF* (): untyped = FFERRTAG('E','O','F',' ')
template AVERROR_EXIT* (): untyped = FFERRTAG('E','X','I','T')
template AVERROR_EXTERNAL* (): untyped = FFERRTAG('E','X','T',' ')
template AVERROR_FILTER_NOT_FOUND* (): untyped = FFERRTAG(0xF8,'F','I','L')
template AVERROR_INVALIDDATA* (): untyped = FFERRTAG('I','N','D','A')
template AVERROR_MUXER_NOT_FOUND* (): untyped = FFERRTAG(0xF8,'M','U','X')
template AVERROR_OPTION_NOT_FOUND* (): untyped = FFERRTAG(0xF8,'O','P','T')
template AVERROR_PATCHWELCOME* (): untyped = FFERRTAG('P','A','W','E')
template AVERROR_PROTOCOL_NOT_FOUND* (): untyped = FFERRTAG(0xF8,'P','R','O')
template AVERROR_STREAM_NOT_FOUND* (): untyped = FFERRTAG(0xF8,'S','T','R')
template AVERROR_BUG2* (): untyped = FFERRTAG('B','U','G',' ')
template AVERROR_UNKNOWN* (): untyped = FFERRTAG('U','N','K','N')
template AVERROR_EXPERIMENTAL* (): untyped = -0x2bb2afa8
template AVERROR_INPUT_CHANGED* (): untyped = -0x636e6701
template AVERROR_OUTPUT_CHANGED* (): untyped = -0x636e6702
template AVERROR_HTTP_BAD_REQUEST* (): untyped = FFERRTAG(0xF8,'4','0','0')
template AVERROR_HTTP_UNAUTHORIZED* (): untyped = FFERRTAG(0xF8,'4','0','1')
template AVERROR_HTTP_FORBIDDEN* (): untyped = FFERRTAG(0xF8,'4','0','3')
template AVERROR_HTTP_NOT_FOUND* (): untyped = FFERRTAG(0xF8,'4','0','4')
template AVERROR_HTTP_OTHER_4XX* (): untyped = FFERRTAG(0xF8,'4','X','X')
template AVERROR_HTTP_SERVER_ERROR* (): untyped = FFERRTAG(0xF8,'5','X','X')
template av_err2str* (errnum: untyped): untyped =
  av_make_error_string((char[AV_ERROR_MAX_STRING_SIZE]){0}, AV_ERROR_MAX_STRING_SIZE, errnum)

proc av_strerror* (errnum: cint, errbuf: ptr cchar, errbuf_size: csize_t): cint

proc av_make_error_string* (errbuf: ptr cchar, errbuf_size: csize_t, errnum: cint): ptr cchar {.inline.} =
  discard av_strerror(errnum, errbuf, errbuf_size)
  result = errbuf
