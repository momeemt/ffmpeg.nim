from ../types import AVBitStreamFilter, AVPacket, AVBSFContext, AVClass, AVBSFList
from ../libavutil/dict import AVDictionary

when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|.58|.59|.60|.61|.62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.58|.59|.60|.61|.62)", cdecl.}

proc av_bsf_get_by_name* (name: cstring): ptr AVBitStreamFilter
proc av_bsf_iterate* (opaque: ptr pointer): ptr AVBitStreamFilter
proc av_bsf_alloc* (filter: ptr AVBitStreamFilter, ctx: ptr ptr AVBSFContext): cint
proc av_bsf_init* (ctx: ptr AVBSFContext): cint
proc av_bsf_send_packet* (ctx: ptr AVBSFContext, pkt: ptr AVPacket): cint
proc av_bsf_receive_packet* (ctx: ptr AVBSFContext, pkt: ptr AVPacket): cint
proc av_bsf_flush* (ctx: ptr AVBSFContext)
proc av_bsf_free* (ctx: ptr ptr AVBSFContext)
proc av_bsf_get_class* (): ptr AVClass
proc av_bsf_list_alloc* (): ptr AVBSFList
proc av_bsf_list_free* (lst: ptr ptr AVBSFList)
proc av_bsf_list_append* (lst: ptr AVBSFList, bsf: ptr AVBSFContext): cint
proc av_bsf_list_append2* (lst: ptr AVBSFList, bsf_name: cstring, options: ptr ptr AVDictionary): cint
proc av_bsf_list_finalize* (lst: ptr ptr AVBSFList, bsf: ptr ptr AVBSFContext): cint
proc av_bsf_list_parse_str* (str: cstring, bsf: ptr ptr AVBSFContext): cint
proc av_bsf_get_null_filter* (bsf: ptr ptr AVBSFContext): cint
