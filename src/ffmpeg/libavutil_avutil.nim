import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

const
  FF_LAMBDA_SHIFT* = 7
  FF_LAMBDA_SCALE* = 1 shl FF_LAMBDA_SHIFT
  FF_QP2LAMBDA* = 118
  FF_LAMBDA_MAX* = 256 * 128 - 1
  FF_QUALITY_SCALE* = FF_LAMBDA_SCALE # FIXME: maybe remove
  AV_NOPTS_VALUE* = cast[uint64](0x8000000000000000).int64
  AV_TIME_BASE* = 1000000
  #define AV_TIME_BASE_Q          (AVRational){1, AV_TIME_BASE}
  AV_FOURCC_MAX_STRING_SIZE* = 32

proc avutil_version* (): cuint
proc av_version_info* (): cstring
proc avutil_configuration* (): cstring
proc avutil_license* (): cstring
proc av_get_media_type_string* (media_type: AVMediaType): cstring
proc av_get_picture_type_char* (pict_type: AVPictureType): cchar
proc av_int_list_length_for_size* (elsize: cuint, list: pointer, term: uint64): cuint
proc av_fopen_utf8* (path, mode: cstring): ptr File
proc av_get_time_base_q* (): AVRational
proc av_fourcc_make_string* (buf: cstring, fourcc: uint32): cstring

proc av_x_if_null* (p, x: pointer): pointer {.inline.} =
  if p.isNil: x
  else: p

template av_int_list_length* (list, term: untyped): untyped =
  av_int_list_length_for_size(sizeof(((list)[])), list, term)

# template av_fourcc2str* (fourcc: untyped): untyped =
  # av_fourcc_make_string((char[AV_FOURCC_MAX_STRING_SIZE]){0}, fourcc)