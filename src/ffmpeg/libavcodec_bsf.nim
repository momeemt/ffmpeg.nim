when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

type
  AVBSFInternal* = object

  AVBSFContext* = object
    av_class: ptr AVClass
    filter: ptr AVBitStreamFilter
    internal: ptr AVBSFInternal
    priv_data: pointer
    par_in: ptr AVCodecParameters
    par_out: ptr AVCodecParameters
    time_base_in: AVRational
    time_base_out: AVRational
  
  AVBitStreamFilter* = object
    name: ptr cchar
    codec_ids: ptr AVCodecID
    priv_class: ptr AVClass
    priv_data_size: cint
    init: proc (ctx: ptr AVBSFContext): cint
    filter: proc (ctx: ptr AVBSFContext, pkt: ptr AVPacket): cint
    close: proc (ctx: AVBSFContext)
    flush: proc (ctx: AVBSFContext)
  
  AVBSFList* = object

proc av_bsf_get_by_name* (name: ptr cchar): ptr AVBitStreamFilter
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
proc av_bsf_list_append2* (lst: ptr AVBSFList, bsf_name: ptr cchar, options: ptr ptr AVDictionary): cint
proc av_bsf_list_finalize* (lst: ptr ptr AVBSFList, bsf: ptr ptr AVBSFContext): cint
proc av_bsf_list_parse_str* (str: ptr cchar, bsf: ptr ptr AVBSFContext): cint
proc av_bsf_get_null_filter* (bsf: ptr ptr AVBSFContext): cint
