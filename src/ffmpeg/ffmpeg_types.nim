{.pragma: avcodec, importc, header: "<libavcodec/avcodec.h>".}
{.pragma: avdct, importc, header:"<libavcodec/avdct.h>".}
{.pragma: avfft, importc, header:"<libavcodec/avfft.h>".}
{.pragma: bsf, importc, header:"<libavcodec/avbsf.h>".}
{.pragma: codecDesc, importc, header:"<libavcodec/codec_desc.h>".}
{.pragma: codecId, importc, header:"<libavcodec/codec_id.h>".}

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

  AVCodecID* {.codecId.} = enum
    AV_CODEC_ID_NONE
    AV_CODEC_ID_MPEG1VIDEO
    AV_CODEC_ID_MPEG2VIDEO
    AV_CODEC_ID_H261
    AV_CODEC_ID_H263
    AV_CODEC_ID_RV10
    AV_CODEC_ID_RV20
    AV_CODEC_ID_MJPEG
    AV_CODEC_ID_MJPEGB
    AV_CODEC_ID_LJPEG
    AV_CODEC_ID_SP5X
    AV_CODEC_ID_JPEGLS
    AV_CODEC_ID_MPEG4
    AV_CODEC_ID_RAWVIDEO
    AV_CODEC_ID_MSMPEG4V1
    AV_CODEC_ID_MSMPEG4V2
    AV_CODEC_ID_MSMPEG4V3
    AV_CODEC_ID_WMV1
    AV_CODEC_ID_WMV2
    AV_CODEC_ID_H263P
    AV_CODEC_ID_H263I
    AV_CODEC_ID_FLV1
    AV_CODEC_ID_SVQ1
    AV_CODEC_ID_SVQ3
    AV_CODEC_ID_DVVIDEO
    AV_CODEC_ID_HUFFYUV
    AV_CODEC_ID_CYUV
    AV_CODEC_ID_H264
    AV_CODEC_ID_INDEO3
    AV_CODEC_ID_VP3
    AV_CODEC_ID_THEORA
    AV_CODEC_ID_ASV1
    AV_CODEC_ID_ASV2
    AV_CODEC_ID_FFV1
    AV_CODEC_ID_4XM
    AV_CODEC_ID_VCR1
    AV_CODEC_ID_CLJR
    AV_CODEC_ID_MDEC
    AV_CODEC_ID_ROQ
    AV_CODEC_ID_INTERPLAY_VIDEO
    AV_CODEC_ID_XAN_WC3
    AV_CODEC_ID_XAN_WC4
    AV_CODEC_ID_RPZA
    AV_CODEC_ID_CINEPAK
    AV_CODEC_ID_WS_VQA
    AV_CODEC_ID_MSRLE
    AV_CODEC_ID_MSVIDEO1
    AV_CODEC_ID_IDCIN
    AV_CODEC_ID_8BPS
    AV_CODEC_ID_SMC
    AV_CODEC_ID_FLIC
    AV_CODEC_ID_TRUEMOTION1
    AV_CODEC_ID_VMDVIDEO
    AV_CODEC_ID_MSZH
    AV_CODEC_ID_ZLIB
    AV_CODEC_ID_QTRLE
    AV_CODEC_ID_TSCC
    AV_CODEC_ID_ULTI
    AV_CODEC_ID_QDRAW
    AV_CODEC_ID_VIXL
    AV_CODEC_ID_QPEG
    AV_CODEC_ID_PNG
    AV_CODEC_ID_PPM
    AV_CODEC_ID_PBM
    AV_CODEC_ID_PGM
    AV_CODEC_ID_PGMYUV
    AV_CODEC_ID_PAM
    AV_CODEC_ID_FFVHUFF
    AV_CODEC_ID_RV30
    AV_CODEC_ID_RV40
    AV_CODEC_ID_VC1
    AV_CODEC_ID_WMV3
    AV_CODEC_ID_LOCO
    AV_CODEC_ID_WNV1
    AV_CODEC_ID_AASC
    AV_CODEC_ID_INDEO2
    AV_CODEC_ID_FRAPS
    AV_CODEC_ID_TRUEMOTION2
    AV_CODEC_ID_BMP
    AV_CODEC_ID_CSCD
    AV_CODEC_ID_MMVIDEO
    AV_CODEC_ID_ZMBV
    AV_CODEC_ID_AVS
    AV_CODEC_ID_SMACKVIDEO
    AV_CODEC_ID_NUV
    AV_CODEC_ID_KMVC
    AV_CODEC_ID_FLASHSV
    AV_CODEC_ID_CAVS
    AV_CODEC_ID_JPEG2000
    AV_CODEC_ID_VMNC
    AV_CODEC_ID_VP5
    AV_CODEC_ID_VP6
    AV_CODEC_ID_VP6F
    AV_CODEC_ID_TARGA
    AV_CODEC_ID_DSICINVIDEO
    AV_CODEC_ID_TIERTEXSEQVIDEO
    AV_CODEC_ID_TIFF
    AV_CODEC_ID_GIF
    AV_CODEC_ID_DXA
    AV_CODEC_ID_DNXHD
    AV_CODEC_ID_THP
    AV_CODEC_ID_SGI
    AV_CODEC_ID_C93
    AV_CODEC_ID_BETHSOFTVID
    AV_CODEC_ID_PTX
    AV_CODEC_ID_TXD
    AV_CODEC_ID_VP6A
    AV_CODEC_ID_AMV
    AV_CODEC_ID_VB
    AV_CODEC_ID_PCX
    AV_CODEC_ID_SUNRAST
    AV_CODEC_ID_INDEO4
    AV_CODEC_ID_INDEO5
    AV_CODEC_ID_MIMIC
    AV_CODEC_ID_RL2
    AV_CODEC_ID_ESCAPE124
    AV_CODEC_ID_DIRAC
    AV_CODEC_ID_BFI
    AV_CODEC_ID_CMV
    AV_CODEC_ID_MOTIONPIXELS
    AV_CODEC_ID_TGV
    AV_CODEC_ID_TGQ
    AV_CODEC_ID_TQI
    AV_CODEC_ID_AURA
    AV_CODEC_ID_AURA2
    AV_CODEC_ID_V210X
    AV_CODEC_ID_TMV
    AV_CODEC_ID_V210
    AV_CODEC_ID_DPX
    AV_CODEC_ID_MAD
    AV_CODEC_ID_FRWU
    AV_CODEC_ID_FLASHSV2
    AV_CODEC_ID_CDGRAPHICS
    AV_CODEC_ID_R210
    AV_CODEC_ID_ANM
    AV_CODEC_ID_BINKVIDEO
    AV_CODEC_ID_IFF_ILBM
    AV_CODEC_ID_KGV1
    AV_CODEC_ID_YOP
    AV_CODEC_ID_VP8
    AV_CODEC_ID_PICTOR
    AV_CODEC_ID_ANSI
    AV_CODEC_ID_A64_MULTI
    AV_CODEC_ID_A64_MULTI5
    AV_CODEC_ID_R10K
    AV_CODEC_ID_MXPEG
    AV_CODEC_ID_LAGARITH
    AV_CODEC_ID_PRORES
    AV_CODEC_ID_JV
    AV_CODEC_ID_DFA
    AV_CODEC_ID_WMV3IMAGE
    AV_CODEC_ID_VC1IMAGE
    AV_CODEC_ID_UTVIDEO
    AV_CODEC_ID_BMV_VIDEO
    AV_CODEC_ID_VBLE
    AV_CODEC_ID_DXTORY
    AV_CODEC_ID_V410
    AV_CODEC_ID_XWD
    AV_CODEC_ID_CDXL
    AV_CODEC_ID_XBM
    AV_CODEC_ID_ZEROCODEC
    AV_CODEC_ID_MSS1
    AV_CODEC_ID_MSA1
    AV_CODEC_ID_TSCC2
    AV_CODEC_ID_MTS2
    AV_CODEC_ID_CLLC
    AV_CODEC_ID_MSS2
    AV_CODEC_ID_VP9
    AV_CODEC_ID_AIC
    AV_CODEC_ID_ESCAPE130
    AV_CODEC_ID_G2M
    AV_CODEC_ID_WEBP
    AV_CODEC_ID_HNM4_VIDEO
    AV_CODEC_ID_HEVC
    AV_CODEC_ID_FIC
    AV_CODEC_ID_ALIAS_PIX
    AV_CODEC_ID_BRENDER_PIX
    AV_CODEC_ID_PAF_VIDEO
    AV_CODEC_ID_EXR
    AV_CODEC_ID_VP7
    AV_CODEC_ID_SANM
    AV_CODEC_ID_SGIRLE
    AV_CODEC_ID_MVC1
    AV_CODEC_ID_MVC2
    AV_CODEC_ID_HQX
    AV_CODEC_ID_TDSC
    AV_CODEC_ID_HQ_HQA
    AV_CODEC_ID_HAP
    AV_CODEC_ID_DDS
    AV_CODEC_ID_DXV
    AV_CODEC_ID_SCREENPRESSO
    AV_CODEC_ID_RSCC
    AV_CODEC_ID_AVS2
    AV_CODEC_ID_Y41P = 0x8000
    AV_CODEC_ID_AVRP
    AV_CODEC_ID_012V
    AV_CODEC_ID_AVUI
    AV_CODEC_ID_AYUV
    AV_CODEC_ID_TARGA_Y216
    AV_CODEC_ID_V308
    AV_CODEC_ID_V408
    AV_CODEC_ID_YUV4
    AV_CODEC_ID_AVRN
    AV_CODEC_ID_CPIA
    AV_CODEC_ID_XFACE
    AV_CODEC_ID_SNOW
    AV_CODEC_ID_SMVJPEG
    AV_CODEC_ID_APNG
    AV_CODEC_ID_DAALA
    AV_CODEC_ID_CFHD
    AV_CODEC_ID_TRUEMOTION2RT
    AV_CODEC_ID_M101
    AV_CODEC_ID_MAGICYUV
    AV_CODEC_ID_SHEERVIDEO
    AV_CODEC_ID_YLC
    AV_CODEC_ID_PSD
    AV_CODEC_ID_PIXLET
    AV_CODEC_ID_SPEEDHQ
    AV_CODEC_ID_FMVC
    AV_CODEC_ID_SCPR
    AV_CODEC_ID_CLEARVIDEO
    AV_CODEC_ID_XPM
    AV_CODEC_ID_AV1
    AV_CODEC_ID_BITPACKED
    AV_CODEC_ID_MSCC
    AV_CODEC_ID_SRGC
    AV_CODEC_ID_SVG
    AV_CODEC_ID_GDV
    AV_CODEC_ID_FITS
    AV_CODEC_ID_IMM4
    AV_CODEC_ID_PROSUMER
    AV_CODEC_ID_MWSC
    AV_CODEC_ID_WCMV
    AV_CODEC_ID_RASC
    AV_CODEC_ID_HYMT
    AV_CODEC_ID_ARBC
    AV_CODEC_ID_AGM
    AV_CODEC_ID_LSCR
    AV_CODEC_ID_VP4
    AV_CODEC_ID_IMM5
    AV_CODEC_ID_MVDV
    AV_CODEC_ID_MVHA
    AV_CODEC_ID_CDTOONS
    AV_CODEC_ID_MV30
    AV_CODEC_ID_NOTCHLC
    AV_CODEC_ID_PFM
    AV_CODEC_ID_FIRST_AUDIO = 0x10000
    AV_CODEC_ID_PCM_S16LE # = 0x10000
    AV_CODEC_ID_PCM_S16BE
    AV_CODEC_ID_PCM_U16LE
    AV_CODEC_ID_PCM_U16BE
    AV_CODEC_ID_PCM_S8
    AV_CODEC_ID_PCM_U8
    AV_CODEC_ID_PCM_MULAW
    AV_CODEC_ID_PCM_ALAW
    AV_CODEC_ID_PCM_S32LE
    AV_CODEC_ID_PCM_S32BE
    AV_CODEC_ID_PCM_U32LE
    AV_CODEC_ID_PCM_U32BE
    AV_CODEC_ID_PCM_S24LE
    AV_CODEC_ID_PCM_S24BE
    AV_CODEC_ID_PCM_U24LE
    AV_CODEC_ID_PCM_U24BE
    AV_CODEC_ID_PCM_S24DAUD
    AV_CODEC_ID_PCM_ZORK
    AV_CODEC_ID_PCM_S16LE_PLANAR
    AV_CODEC_ID_PCM_DVD
    AV_CODEC_ID_PCM_F32BE
    AV_CODEC_ID_PCM_F32LE
    AV_CODEC_ID_PCM_F64BE
    AV_CODEC_ID_PCM_F64LE
    AV_CODEC_ID_PCM_BLURAY
    AV_CODEC_ID_PCM_LXF
    AV_CODEC_ID_S302M
    AV_CODEC_ID_PCM_S8_PLANAR
    AV_CODEC_ID_PCM_S24LE_PLANAR
    AV_CODEC_ID_PCM_S32LE_PLANAR
    AV_CODEC_ID_PCM_S16BE_PLANAR
    AV_CODEC_ID_PCM_S64LE = 0x10800
    AV_CODEC_ID_PCM_S64BE
    AV_CODEC_ID_PCM_F16LE
    AV_CODEC_ID_PCM_F24LE
    AV_CODEC_ID_PCM_VIDC
    AV_CODEC_ID_ADPCM_IMA_QT = 0x11000
    AV_CODEC_ID_ADPCM_IMA_WAV
    AV_CODEC_ID_ADPCM_IMA_DK3
    AV_CODEC_ID_ADPCM_IMA_DK4
    AV_CODEC_ID_ADPCM_IMA_WS
    AV_CODEC_ID_ADPCM_IMA_SMJPEG
    AV_CODEC_ID_ADPCM_MS
    AV_CODEC_ID_ADPCM_4XM
    AV_CODEC_ID_ADPCM_XA
    AV_CODEC_ID_ADPCM_ADX
    AV_CODEC_ID_ADPCM_EA
    AV_CODEC_ID_ADPCM_G726
    AV_CODEC_ID_ADPCM_CT
    AV_CODEC_ID_ADPCM_SWF
    AV_CODEC_ID_ADPCM_YAMAHA
    AV_CODEC_ID_ADPCM_SBPRO_4
    AV_CODEC_ID_ADPCM_SBPRO_3
    AV_CODEC_ID_ADPCM_SBPRO_2
    AV_CODEC_ID_ADPCM_THP
    AV_CODEC_ID_ADPCM_IMA_AMV
    AV_CODEC_ID_ADPCM_EA_R1
    AV_CODEC_ID_ADPCM_EA_R3
    AV_CODEC_ID_ADPCM_EA_R2
    AV_CODEC_ID_ADPCM_IMA_EA_SEAD
    AV_CODEC_ID_ADPCM_IMA_EA_EACS
    AV_CODEC_ID_ADPCM_EA_XAS
    AV_CODEC_ID_ADPCM_EA_MAXIS_XA
    AV_CODEC_ID_ADPCM_IMA_ISS
    AV_CODEC_ID_ADPCM_G722
    AV_CODEC_ID_ADPCM_IMA_APC
    AV_CODEC_ID_ADPCM_VIMA
    AV_CODEC_ID_ADPCM_AFC = 0x11800
    AV_CODEC_ID_ADPCM_IMA_OKI
    AV_CODEC_ID_ADPCM_DTK
    AV_CODEC_ID_ADPCM_IMA_RAD
    AV_CODEC_ID_ADPCM_G726LE
    AV_CODEC_ID_ADPCM_THP_LE
    AV_CODEC_ID_ADPCM_PSX
    AV_CODEC_ID_ADPCM_AICA
    AV_CODEC_ID_ADPCM_IMA_DAT4
    AV_CODEC_ID_ADPCM_MTAF
    AV_CODEC_ID_ADPCM_AGM
    AV_CODEC_ID_ADPCM_ARGO
    AV_CODEC_ID_ADPCM_IMA_SSI
    AV_CODEC_ID_ADPCM_ZORK
    AV_CODEC_ID_ADPCM_IMA_APM
    AV_CODEC_ID_ADPCM_IMA_ALP
    AV_CODEC_ID_ADPCM_IMA_MTF
    AV_CODEC_ID_ADPCM_IMA_CUNNING
    AV_CODEC_ID_AMR_NB = 0x12000
    AV_CODEC_ID_AMR_WB
    AV_CODEC_ID_RA_144 = 0x13000
    AV_CODEC_ID_RA_288
    AV_CODEC_ID_ROQ_DPCM = 0x14000
    AV_CODEC_ID_INTERPLAY_DPCM
    AV_CODEC_ID_XAN_DPCM
    AV_CODEC_ID_SOL_DPCM
    AV_CODEC_ID_SDX2_DPCM = 0x14800
    AV_CODEC_ID_GREMLIN_DPCM
    AV_CODEC_ID_DERF_DPCM
    AV_CODEC_ID_MP2 = 0x15000
    AV_CODEC_ID_MP3
    AV_CODEC_ID_AAC
    AV_CODEC_ID_AC3
    AV_CODEC_ID_DTS
    AV_CODEC_ID_VORBIS
    AV_CODEC_ID_DVAUDIO
    AV_CODEC_ID_WMAV1
    AV_CODEC_ID_WMAV2
    AV_CODEC_ID_MACE3
    AV_CODEC_ID_MACE6
    AV_CODEC_ID_VMDAUDIO
    AV_CODEC_ID_FLAC
    AV_CODEC_ID_MP3ADU
    AV_CODEC_ID_MP3ON4
    AV_CODEC_ID_SHORTEN
    AV_CODEC_ID_ALAC
    AV_CODEC_ID_WESTWOOD_SND1
    AV_CODEC_ID_GSM
    AV_CODEC_ID_QDM2
    AV_CODEC_ID_COOK
    AV_CODEC_ID_TRUESPEECH
    AV_CODEC_ID_TTA
    AV_CODEC_ID_SMACKAUDIO
    AV_CODEC_ID_QCELP
    AV_CODEC_ID_WAVPACK
    AV_CODEC_ID_DSICINAUDIO
    AV_CODEC_ID_IMC
    AV_CODEC_ID_MUSEPACK7
    AV_CODEC_ID_MLP
    AV_CODEC_ID_GSM_MS
    AV_CODEC_ID_ATRAC3
    AV_CODEC_ID_APE
    AV_CODEC_ID_NELLYMOSER
    AV_CODEC_ID_MUSEPACK8
    AV_CODEC_ID_SPEEX
    AV_CODEC_ID_WMAVOICE
    AV_CODEC_ID_WMAPRO
    AV_CODEC_ID_WMALOSSLESS
    AV_CODEC_ID_ATRAC3P
    AV_CODEC_ID_EAC3
    AV_CODEC_ID_SIPR
    AV_CODEC_ID_MP1
    AV_CODEC_ID_TWINVQ
    AV_CODEC_ID_TRUEHD
    AV_CODEC_ID_MP4ALS
    AV_CODEC_ID_ATRAC1
    AV_CODEC_ID_BINKAUDIO_RDFT
    AV_CODEC_ID_BINKAUDIO_DCT
    AV_CODEC_ID_AAC_LATM
    AV_CODEC_ID_QDMC
    AV_CODEC_ID_CELT
    AV_CODEC_ID_G723_1
    AV_CODEC_ID_G729
    AV_CODEC_ID_8SVX_EXP
    AV_CODEC_ID_8SVX_FIB
    AV_CODEC_ID_BMV_AUDIO
    AV_CODEC_ID_RALF
    AV_CODEC_ID_IAC
    AV_CODEC_ID_ILBC
    AV_CODEC_ID_OPUS
    AV_CODEC_ID_COMFORT_NOISE
    AV_CODEC_ID_TAK
    AV_CODEC_ID_METASOUND
    AV_CODEC_ID_PAF_AUDIO
    AV_CODEC_ID_ON2AVC
    AV_CODEC_ID_DSS_SP
    AV_CODEC_ID_CODEC2
    AV_CODEC_ID_FFWAVESYNTH = 0x15800
    AV_CODEC_ID_SONIC
    AV_CODEC_ID_SONIC_LS
    AV_CODEC_ID_EVRC
    AV_CODEC_ID_SMV
    AV_CODEC_ID_DSD_LSBF
    AV_CODEC_ID_DSD_MSBF
    AV_CODEC_ID_DSD_LSBF_PLANAR
    AV_CODEC_ID_DSD_MSBF_PLANAR
    AV_CODEC_ID_4GV
    AV_CODEC_ID_INTERPLAY_ACM
    AV_CODEC_ID_XMA1
    AV_CODEC_ID_XMA2
    AV_CODEC_ID_DST
    AV_CODEC_ID_ATRAC3AL
    AV_CODEC_ID_ATRAC3PAL
    AV_CODEC_ID_DOLBY_E
    AV_CODEC_ID_APTX
    AV_CODEC_ID_APTX_HD
    AV_CODEC_ID_SBC
    AV_CODEC_ID_ATRAC9
    AV_CODEC_ID_HCOM
    AV_CODEC_ID_ACELP_KELVIN
    AV_CODEC_ID_MPEGH_3D_AUDIO
    AV_CODEC_ID_SIREN
    AV_CODEC_ID_HCA
    AV_CODEC_ID_FIRST_SUBTITLE = 0x17000
    AV_CODEC_ID_DVD_SUBTITLE # = 0x17000
    AV_CODEC_ID_DVB_SUBTITLE
    AV_CODEC_ID_TEXT
    AV_CODEC_ID_XSUB
    AV_CODEC_ID_SSA
    AV_CODEC_ID_MOV_TEXT
    AV_CODEC_ID_HDMV_PGS_SUBTITLE
    AV_CODEC_ID_DVB_TELETEXT
    AV_CODEC_ID_SRT
    AV_CODEC_ID_MICRODVD = 0x17800
    AV_CODEC_ID_EIA_608
    AV_CODEC_ID_JACOSUB
    AV_CODEC_ID_SAMI
    AV_CODEC_ID_REALTEXT
    AV_CODEC_ID_STL
    AV_CODEC_ID_SUBVIEWER1
    AV_CODEC_ID_SUBVIEWER
    AV_CODEC_ID_SUBRIP
    AV_CODEC_ID_WEBVTT
    AV_CODEC_ID_MPL2
    AV_CODEC_ID_VPLAYER
    AV_CODEC_ID_PJS
    AV_CODEC_ID_ASS
    AV_CODEC_ID_HDMV_TEXT_SUBTITLE
    AV_CODEC_ID_TTML
    AV_CODEC_ID_ARIB_CAPTION
    AV_CODEC_ID_FIRST_UNKNOWN = 0x18000
    AV_CODEC_ID_TTF # = 0x18000
    AV_CODEC_ID_SCTE_35
    AV_CODEC_ID_EPG
    AV_CODEC_ID_BINTEXT = 0x18800
    AV_CODEC_ID_XBIN
    AV_CODEC_ID_IDF
    AV_CODEC_ID_OTF
    AV_CODEC_ID_SMPTE_KLV
    AV_CODEC_ID_DVD_NAV
    AV_CODEC_ID_TIMED_ID3
    AV_CODEC_ID_BIN_DATA
    AV_CODEC_ID_PROBE = 0x19000
    AV_CODEC_ID_MPEG2TS = 0x20000
    AV_CODEC_ID_MPEG4SYSTEMS = 0x20001
    AV_CODEC_ID_FFMETADATA = 0x21000
    AV_CODEC_ID_WRAPPED_AVFRAME = 0x21001