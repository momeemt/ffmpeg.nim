when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

const
  AV_DICT_MATCH_CASE* = 1
  AV_DICT_IGNORE_SUFFIX* = 2
  AV_DICT_DONT_STRDUP_KEY* = 4
  AV_DICT_DONT_STRDUP_VAL* = 8
  AV_DICT_DONT_OVERWRITE* = 16
  AV_DICT_APPEND* = 32
  AV_DICT_MULTIKEY* = 64

type
  AVDictionaryEntry* = object
    key: ptr cchar
    value: ptr cchar
  
  AVDictionary* = object

proc av_dict_get* (m: ptr AVDictionary, key: ptr cchar, prev: ptr AVDictionaryEntry, flags: cint): ptr AVDictionaryEntry
proc av_dict_count* (m: ptr AVDictionary): cint
proc av_dict_set* (pm: ptr ptr AVDictionary, key, value: ptr cchar, flags: cint): cint
proc av_dict_set_int* (pm: ptr ptr AVDictionary, key: ptr cchar, value: int64, flags: cint): cint
proc av_dict_parse_string* (pm: ptr ptr AVDictionary, str, key_val_sep, pairs_sep: cchar, flags: cint): cint
proc av_dict_copy* (dst: ptr ptr AVDictionary, src: ptr AVDictionary, flags: cint): cint
proc av_dict_free* (m: ptr ptr AVDictionary)
proc av_dict_get_string* (m: ptr AVDictionary, buffer: ptr ptr cchar, key_val_sep, pairs_sep: cchar)
