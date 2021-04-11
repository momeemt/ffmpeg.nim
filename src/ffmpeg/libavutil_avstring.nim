when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

const
  AV_ESCAPE_FLAG_WHITESPACE* = 1 shl 0
  AV_ESCAPE_FLAG_STRICT* = 1 shl 1
  AV_UTF8_FLAG_ACCEPT_INVALID_BIG_CODES* = 1
  AV_UTF8_FLAG_ACCEPT_NON_CHARACTERS* = 2
  AV_UTF8_FLAG_ACCEPT_SURROGATES* = 4
  AV_UTF8_FLAG_EXCLUDE_XML_INVALID_CONTROL_CODES* = 8
  AV_UTF8_FLAG_ACCEPT_ALL* = AV_UTF8_FLAG_ACCEPT_INVALID_BIG_CODES or AV_UTF8_FLAG_ACCEPT_NON_CHARACTERS or AV_UTF8_FLAG_ACCEPT_SURROGATES

type
  AVEscapeMode* = enum
    AV_ESCAPE_MODE_AUTO
    AV_ESCAPE_MODE_BACKSLASH
    AV_ESCAPE_MODE_QUOTE

proc av_strstart* (str, pfx: ptr cchar, `ptr`: ptr ptr cchar): cint
proc av_stristart* (str, pfx: ptr cchar, `ptr`: ptr ptr cchar): cint
proc av_stristr* (haystack, needle: ptr cchar): ptr cchar
proc av_strnstr* (haystack, needle: ptr cchar, hay_length: csize_t): ptr cchar
proc av_strlcpy* (dst, src: ptr cchar, size: csize_t): csize_t
proc av_strlcat* (dst, src: ptr cchar, size: csize_t): csize_t
proc av_strlcatf* (dst: ptr cchar, size: csize_t, fmt: ptr cchar): csize_t {.varargs.} #132
proc av_asprintf* (fmt: ptr cchar): ptr cchar #156
proc av_d2str* (d: cdouble): ptr cchar
proc av_get_token* (buf: ptr ptr cchar, term: ptr cchar): ptr cchar
proc av_strtok* (s, delim: ptr cchar, saveptr: ptr ptr cchar): ptr cchar
proc av_strcasecmp* (a, b: ptr cchar): cint
proc av_strncasecmp* (a, b: ptr cchar, n: csize_t): cint
proc av_strireplace* (str, `from`, to: ptr cchar): ptr cchar
proc av_basename* (path: ptr cchar): ptr cchar
proc av_dirname* (path: ptr cchar): ptr cchar
proc av_match_name* (name, names: ptr cchar): cint
proc av_append_path_component* (path, component: ptr cchar): cchar
proc av_escape* (dst: ptr ptr cchar, src, special_chars: ptr cchar, mode: AVEscapeMode, flags: cint): cint # warning
proc av_utf8_decode* (codep: ptr int32, bufp: ptr ptr uint8, buf_end: ptr uint8, flags: cuint): cint # warning
proc av_match_list* (name, list: ptr cchar, separator: cchar): cint
proc av_sscanf* (`string`: ptr cchar, format: ptr cchar) {.varargs.}

proc av_strnlen* (s: ptr cchar, len: csize_t): csize_t {.inline.} =
  var i: csize_t = 0
  # while i < len and s[i]:
  #   i += 1
  result = i

proc av_isdigit* (c: cint): cint {.inline.} =
  # result = c >= '0' and c <= '9'
  discard

proc av_isgraph* (c: cint): cint {.inline.} =
  result = if c > 32 and c < 127: 1 else: 0

proc av_isspace* (c: cint): cint {.inline.} =
  # result = c == ' ' || c == '\f' || c == '\n' || c == '\r' || c == '\t' || c == '\v'
  discard

proc av_toupper* (c: cint): cint {.inline.} =
  # if (c >= 'a' && c <= 'z')
  #       c ^= 0x20;
  # return c;
  discard

proc av_tolower* (c: cint): cint {.inline.} =
  # if (c >= 'A' && c <= 'Z')
  #       c ^= 0x20;
  # return c;
  discard

proc av_isxdigit* (c: cint): cint {.inline.} =
  # c = av_tolower(c);
  # return av_isdigit(c) || (c >= 'a' && c <= 'f');
  discard
