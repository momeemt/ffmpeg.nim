{.pragma: avcodec, importc, header: "<libavcodec/avcodec.h>".}
{.pragma: avdct, importc, header:"<libavcodec/avdct.h>".}
{.pragma: avfft, importc, header:"<libavcodec/avfft.h>".}
{.pragma: bsf, importc, header:"<libavcodec/avbsf.h>".}
{.pragma: codecDesc, importc, header:"<libavcodec/codec_desc.h>".}

type
  AVDiscard* {.avcodec.} = enum
    AVDISCARD_NONE = -16
    AVDISCARD_DEFAULT = 0
    AVDISCARD_NONREF = 8
    AVDISCARD_BIDIR = 16
    AVDISCARD_NONINTRA = 24
    AVDISCARD_NONKEY = 32
    AVDISCARD_ALL = 48

  AVAudioServiceType* {.avcodec.} = enum
    AV_AUDIO_SERVICE_TYPE_MAIN = 0
    AV_AUDIO_SERVICE_TYPE_EFFECTS = 1
    AV_AUDIO_SERVICE_TYPE_VISUALLY_IMPAIRED = 2
    AV_AUDIO_SERVICE_TYPE_HEARING_IMPAIRED = 3
    AV_AUDIO_SERVICE_TYPE_DIALOGUE = 4
    AV_AUDIO_SERVICE_TYPE_COMMENTARY = 5
    AV_AUDIO_SERVICE_TYPE_EMERGENCY = 6
    AV_AUDIO_SERVICE_TYPE_VOICE_OVER = 7
    AV_AUDIO_SERVICE_TYPE_KARAOKE = 8
    AV_AUDIO_SERVICE_TYPE_NB
  
  RcOverride* {.avcodec.} = object
    start_frame*: cint
    end_frame*: cint
    qscale*: cint
    quality_factor*: cfloat
  
  AVPanScan* {.avcodec.} = object
    id*: cint
    width*: cint
    height*: cint
    position*: array[3, array[2, int16]]

  AVCPBProperties* {.avcodec.} = object

  AVProducerReferenceTime* {.avcodec.} = object
    wallclock*: int64
    flags*: cint
  
  AVCodecInternal* {.avcodec.} = object

  AVCodecContext* {.avcodec.} = object
    av_class*: ptr AVClass
    log_level_offset*: cint
    codec_type*: AVMediaType
    codec*: ptr AVCodec
    codec_id*: AVCodecID
    codec_tag*: cuint
    priv_data*: pointer
    internal*: AVCodecInternal
    opaque*: pointer
    bit_rate*: int64
    bit_rate_tolerance*: cint
    global_quality*: cint
    compression_level*: cint
    flags*: cint
    flags2*: cint
    extradata*: ptr uint8
    extradata_size*: cint
    time_base*: AVRational
    ticks_per_frame*: cint
    delay*: cint
    width*: cint
    height*: cint
    coded_width*: cint
    coded_height*: cint
    gop_size*: cint
    pix_fmt*: AVPixelFormat
    draw_hotiz_band*: proc (s: ptr AVCodecContext, src: ptr AVFrame, offset: array[AV_NUM_DATA_POINTERS, cint], y, `type`, height: cint)
    get_format*: proc (s: ptr AVCodecContext, fmt: ptr AVPixelFormat): AVPixelFormat
    max_b_frames*: cint
    b_quant_factor*: cfloat
    b_quant_offset*: cfloat
    has_b_frames*: cint
    i_quant_factor*: cfloat
    i_quant_offset*: cfloat
    lumi_masking*: cfloat
    temporal_cplx_masking*: cfloat
    spatial_cplx_masking*: cfloat
    p_masking*: cfloat
    dark_masking*: cfloat
    slice_count*: cint
    slice_offset*: ptr cint
    sample_aspect_ratio*: AVRational
    me_cmp*: cint
    me_sub_cmp*: cint
    mb_cmp*: cint
    ildct_cmp*: cint
    dia_size*: cint
    last_predictor_count*: cint
    me_pre_cmp*: cint
    pre_dia_size*: cint
    me_subpel_quality*: cint
    me_range*: cint
    slice_flags*: cint
    mb_decision*: cint
    intra_matrix*: ptr uint16
    inter_matrix*: ptr uint16
    intra_dc_precision*: cint
    skip_top*: cint
    skip_bottom*: cint
    mb_lmin*: cint
    mb_lmax*: cint
    bidir_refine*: cint
    keyint_min*: cint
    refs*: cint
    mv0_threshold*: cint
    color_primaries*: AVColorPrimaries
    color_trc*: AVColorTransferCharacteristic
    colorspace*: AVColorSpace
    color_range*: AVColorRange
    chroma_sample_location*: AVChromaLocation
    slices*: cint
    field_order*: AVFieldOrder
    sample_rate*: cint
    channels*: cint
    sample_fmt*: AVSampleFormat
    frame_size*: cint
    frame_number*: cint
    block_align*: cint
    cutoff*: cint
    channel_layout*: uint64
    request_channel_layout*: uint64
    audio_service_type*: AVAudioServiceType
    request_sample_fmt*: AVSampleFormat
    get_buffer2*: proc (s: ptr AVCodecContext, frame: ptr AVFrame, flags: cint): cint
    refcounted_frames* {.deprecated.}: cint
    qcompress*: cfloat
    qblur*: cfloat
    qmin*: cint
    qmax*: cint
    max_qdiff*: cint
    rc_buffer_size*: cint
    rc_override_count*: cint
    rc_override*: ptr RcOverride
    rc_max_rate*: int64
    rc_min_rate*: int64
    rc_max_available_vbv_use*: cfloat
    rc_min_vbv_overflow_use*: cfloat
    rc_initial_buffer_occupancy*: cint
    trellis*: cint
    stats_out*: ptr cchar
    stats_in*: ptr cchar
    workaround_bugs*: cint
    strict_std_compliance*: cint
    error_concealment*: cint
    debug*: cint
    err_recognition*: cint
    reordered_opaque*: int64
    hwaccel*: ptr AVHWAccel
    hwaccel_context*: pointer
    error*: array[AV_NUM_DATA_POINTERS, uint64]
    dct_algo*: cint
    idct_algo*: cint
    bits_per_coded_sample*: cint
    bits_per_raw_sample*: cint
    thread_count*: cint
    thread_type*: cint
    active_thread_type*: cint
    thread_safe_callbacks*: cint
    execute*: proc (c: ptr AVCodecContext, `func`: proc (c2: ptr AVCodecContext, arg: pointer): cint, arg2: pointer, ret: ptr cint, count: cint, size: cint): cint
    execute2*: proc (c: ptr AVCodecContext, `func`: proc (c2: ptr AVCodecContext, arg: pointer, jobnr: cint, threadnr: cint): cint, arg2: pointer, ret: ptr cint, count: cint): cint
    nsse_weight*: cint
    profile*: cint
    level*: cint
    skip_loop_filter*: AVDiscard
    skip_idct*: AVDiscard
    skip_frame*: AVDiscard
    subtitle_header*: ptr uint8
    subtitle_header_size*: cint
    initial_padding*: cint
    framerate*: AVRational
    sw_pix_fmt*: AVPixelFormat
    pkt_timebase*: AVRational
    codec_descriptor*: ptr AVCodecDescriptor
    pts_correction_num_faulty_pts*: int64
    pts_correction_num_faulty_dts*: int64
    pts_correction_last_pts*: int64
    pts_correction_last_dts*: int64
    sub_charenc*: ptr cchar
    sub_charenc_mode*: cint
    skip_alpha*: cint
    seek_preroll*: cint
    chroma_intra_matrix*: ptr uint16
    dump_separator*: ptr uint8
    codec_whitelist*: ptr cchar
    properties*: uint32 # unsigned == uint32 ?
    coded_side_data*: ptr AVPacketSideData
    nb_coded_side_data*: cint
    hw_frames_ctx*: ptr AVBufferRef
    sub_text_format*: cint
    trailing_padding*: cint
    max_pixels*: int64
    hw_device_ctx*: ptr AVBufferRef
    hwaccel_flags*: cint
    apply_cropping*: cint
    extra_hw_frames*: cint
    discard_damaged_percentage*: cint
    max_samples*: int64
    export_side_data*: cint

    when defined(FF_API_PRIVATE_OPT):
      b_frame_strategy* {.deprecated.}: cint
      mpeg_quant* {.deprecated.}: cint
      prediction_method* {.deprecated.}: cint
      pre_me* {.deprecated.}: cint
      scenechange_threshold* {.deprecated.}: cint
      noise_reduction* {.deprecated.}: cint
      me_penalty_compensation* {.deprecated.}: cint
      brd_scale* {.deprecated.}: cint
      chromaoffset* {.deprecated.}: cint
      b_sensitivity* {.deprecated.}: cint
      coder_type* {.deprecated.}: cint
      context_model* {.deprecated.}: cint
      frame_skip_threshold* {.deprecated.}: cint
      frame_skip_factor* {.deprecated.}: cint
      frame_skip_exp* {.deprecated.}: cint
      frame_skip_cmp* {.deprecated.}: cint
      min_prediction_order* {.deprecated.}: cint
      max_prediction_order* {.deprecated.}: cint
      timecode_frame_start* {.deprecated.}: clonglong
      rtp_payload_size* {.deprecated.}: cint

    when defined(FF_API_RTP_CALLBACK):
      rtp_callback* {.deprecated.}: proc (avctx: ptr AVCodecContext, data: pointer, size: cint, mb_nb: cint)

    when defined(FF_API_STAT_BITS):
      mv_bits* {.deprecated.}: cint
      header_bits* {.deprecated.}: cint
      i_tex_bits* {.deprecated.}: cint
      p_text_bits* {.deprecated.}: cint
      i_count* {.deprecated.}: cint
      p_count* {.deprecated.}: cint
      skip_count* {.deprecated.}: cint
      misc_bits* {.deprecated.}: cint
      frame_bits* {.deprecated.}: cint

    # if: FF_API_DEBUG_MV & else
    debug_mv*: cint

    # if: FF_API_LOWRES & else
    lowres*: cint

    when defined(FF_API_CODED_FRAME):
      coded_frame* {.deprecated.}: ptr AVFrame

    when defined(FF_API_VBV_DELAY):
      vbv_delay* {.deprecated.}: uint64

    when defined(FF_API_SIDEDATA_ONLY_PKT):
      side_data_only_packets*: cint

  AVSubtitle* {.avcodec.} = object
    format*: uint16
    start_display_time*: uint32
    end_display_time*: uint32
    num_rects*: uint32
    rects*: ptr ptr AVSubtitleRect
    pts*: int64

  MpegEncContext* {.avcodec.} = object

  AVHWAccel* {.avcodec.} = object
    name*: ptr cchar
    `type`*: AVMediaType
    id*: AVCodecID
    pix_fmt*: AVPixelFormat
    capabilities*: cint
    alloc_frame*: proc (avctx: ptr AVCodecContext, frame: ptr AVFrame): cint
    start_frame*: proc (avctx: ptr AVCodecContext, buf: ptr uint8, buf_size: uint32): cint
    decode_params*: proc (avctx: ptr AVCodecContext, typ: int, buf: ptr uint8, buf_size: uint32): cint
    decode_slice*: proc (avctx: ptr AVCodecContext, buf: ptr uint8, buf_size: uint32): cint
    end_frame*: proc (avctx: ptr AVCodecContext): cint
    frame_priv_data_size*: cint
    decode_mb*: proc (s: ptr MpegEncContext) # 怪しい
    init*: proc (avctx: ptr AVCodecContext): cint
    uninit*: proc (avctx: ptr AVCodecContext): cint
    priv_data_size*: cint
    caps_internal*: cint
    frame_params*: proc (avctx: ptr AVCodecContext, hw_frames_ctx: ptr AVBufferRef): cint
  
  AVSubtitleType* {.avcodec.} = enum
    SUBTITLE_NONE
    SUBTITLE_BITMAP
    SUBTITLE_TEXT
    SUBTITLE_ASS
  
  AVSubtitleRect* {.avcodec.} = object
    x*: cint
    y*: cint
    w*: cint
    h*: cint
    nb_colors*: cint
    data*: array[4, ptr uint8]
    linesize*: array[4, int]
    `type`*: AVSubtitleType
    text*: ptr cchar
    ass*: ptr cchar
    flags*: cint
    when defined(FF_API_AVPICTURE):
      pict* {.deprecated.}: AVPicture
  
  AVPictureStructure* {.avcodec.} = enum
    AV_PICTURE_STRUCTURE_UNKNOWN
    AV_PICTURE_STRUCTURE_TOP_FIELD
    AV_PICTURE_STRUCTURE_BOTTOM_FIELD
    AV_PICTURE_STRUCTURE_FRAME
  
  AVCodecParserContext* {.avcodec.} = object
    priv_data*: pointer
    parser*: ptr AVCodecParser
    frame_offset*: int64
    cur_offset*: int64
    next_frame_offset*: int64
    pict_type*: int
    repeat_pict*: int
    pts*: int64
    dts*: int64
    last_pts*: int64
    last_dts*: int64
    fetch_timestamp*: int
    cur_frame_start_index*: int
    cur_frame_offset*: array[AV_PARSER_PTS_NB, int64]
    cur_frame_pts*: array[AV_PARSER_PTS_NB, int64]
    cur_frame_dts*: array[AV_PARSER_PTS_NB, int64]
    flags*: int
    offset*: int64
    cur_frame_end*: array[AV_PARSER_PTS_NB, int64]
    key_frame*: int
    dts_sync_point*: int
    dts_ref_dts_delta*: int
    pts_dts_delta*: int
    cur_frame_pos*: array[AV_PARSER_PTS_NB, int64]
    pos*: int64
    last_pos*: int64
    duration*: int
    field_order*: AVFieldOrder
    picture_structure*: AVPictureStructure
    output_picture_number*: int
    width*: int
    height*: int
    coded_width*: int
    coded_height*: int
    format*: int
    when defined(FF_API_CONVERGENCE_DURATION):
      convergence_duration* {.deprecated.}: int64
  
  AVCodecParser* {.avcodec.} = object
    codec_ids*: array[5, int]
    priv_data_size*: int
    parser_init*: proc (s: ptr AVCodecParserContext): int
    parser_parse*: proc (s: ptr AVCodecParserContext, avctx: ptr AVCodecContext, poutbuf: ptr ptr uint8, poutbuf_size: ptr int, buf: ptr uint8, buf_size: int): int
    parser_close*: proc (s: ptr AVCodecParserContext)
    split*: proc (avctx: ptr AVCodecContext, buf: ptr uint8, buf_size: int): int
    next*: ptr AVCodecParser
  
  AVDCT* {.avdct.} = object
    av_class*: ptr AVClass
    idct*: proc (`block`: ptr int16)
    idct_permutation*: array[64, uint8]
    fdct*: proc (`block`: ptr int16)
    dct_algo*: cint
    idct_algo*: cint
    get_pixels*: proc (`block`: ptr int16, pixels: ptr uint8, line_size: csize_t)
    bits_per_sample*: cint
    get_pixels_unaligned*: proc (`block`: ptr int16, pixels: ptr uint8, line_size: csize_t)
  
  FFTSample* {.avfft.} = cfloat

  FFTComplex* {.avfft.} = object
    re, im: FFTSample

  FFTContext* {.avfft.} = object

  RDFTransformType* {.avfft.} = enum
    DFT_R2C
    IDFT_C2R
    IDFT_R2C
    DFT_C2R

  RDFTContext* {.avfft.} = object

  DCTContext* {.avfft.} = object

  DCTTransformType* {.avfft.} = enum
    DCT_II = 0
    DCT_III
    DCT_I
    DST_I
  
  AVBSFInternal* {.bsf.} = object

  AVBSFContext* {.bsf.} = object
    av_class*: ptr AVClass
    filter*: ptr AVBitStreamFilter
    internal*: ptr AVBSFInternal
    priv_data*: pointer
    par_in*: ptr AVCodecParameters
    par_out*: ptr AVCodecParameters
    time_base_in*: AVRational
    time_base_out*: AVRational
  
  AVBitStreamFilter* {.bsf.} = object
    name*: cstring
    codec_ids*: ptr AVCodecID
    priv_class*: ptr AVClass
    priv_data_size*: cint
    init*: proc (ctx: ptr AVBSFContext): cint
    filter*: proc (ctx: ptr AVBSFContext, pkt: ptr AVPacket): cint
    close*: proc (ctx: AVBSFContext)
    flush*: proc (ctx: AVBSFContext)
  
  AVBSFList* {.bsf.} = object

  AVCodecDescriptor* {.codecDesc.} = object
    id*: AVCodecID
    `type`*: AVMediaType
    name*: cstring
    long_name*: cstring
    props*: cint
    mime_types*: cstringArray
    profiles*: ptr AVProfile