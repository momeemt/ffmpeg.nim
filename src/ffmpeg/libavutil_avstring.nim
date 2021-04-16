import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

const
  AV_ESCAPE_FLAG_WHITESPACE* = 1 shl 0
  AV_ESCAPE_FLAG_STRICT* = 1 shl 1
  AV_UTF8_FLAG_ACCEPT_INVALID_BIG_CODES* = 1
  AV_UTF8_FLAG_ACCEPT_NON_CHARACTERS* = 2
  AV_UTF8_FLAG_ACCEPT_SURROGATES* = 4
  AV_UTF8_FLAG_EXCLUDE_XML_INVALID_CONTROL_CODES* = 8
  AV_UTF8_FLAG_ACCEPT_ALL* = AV_UTF8_FLAG_ACCEPT_INVALID_BIG_CODES or AV_UTF8_FLAG_ACCEPT_NON_CHARACTERS or AV_UTF8_FLAG_ACCEPT_SURROGATES

proc av_strstart* (str, pfx: cstring, `ptr`: cstringArray): cint
proc av_stristart* (str, pfx: cstring, `ptr`: cstringArray): cint
proc av_stristr* (haystack, needle: cstring): cstring
proc av_strnstr* (haystack, needle: cstring, hay_length: csize_t): cstring
proc av_strlcpy* (dst, src: cstring, size: csize_t): csize_t
proc av_strlcat* (dst, src: cstring, size: csize_t): csize_t
proc av_strlcatf* (dst: cstring, size: csize_t, fmt: cstring): csize_t {.varargs.} #132
proc av_asprintf* (fmt: cstring): cstring #156
proc av_d2str* (d: cdouble): cstring
proc av_get_token* (buf: cstringArray, term: cstring): cstring
proc av_strtok* (s, delim: cstring, saveptr: cstringArray): cstring
proc av_strcasecmp* (a, b: cstring): cint
proc av_strncasecmp* (a, b: cstring, n: csize_t): cint
proc av_strireplace* (str, `from`, to: cstring): cstring
proc av_basename* (path: cstring): cstring
proc av_dirname* (path: cstring): cstring
proc av_match_name* (name, names: cstring): cint
proc av_append_path_component* (path, component: cstring): cstring
proc av_escape* (dst: cstringArray, src, special_chars: cstring, mode: AVEscapeMode, flags: cint): cint # warning
proc av_utf8_decode* (codep: ptr int32, bufp: ptr ptr uint8, buf_end: ptr uint8, flags: cuint): cint # warning
proc av_match_list* (name, list: cstring, separator: cstring): cint
proc av_sscanf* (`string`: cstring, format: cstring) {.varargs.}

proc av_strnlen* (s: cstring, len: csize_t): csize_t {.inline.} =
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
