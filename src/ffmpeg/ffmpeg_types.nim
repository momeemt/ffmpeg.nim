{.pragma: avcodec, importc, header: "<libavcodec/avcodec.h>".}
{.pragma: avdct, importc, header:"<libavcodec/avdct.h>".}
{.pragma: avfft, importc, header:"<libavcodec/avfft.h>".}
{.pragma: bsf, importc, header:"<libavcodec/avbsf.h>".}
{.pragma: codecDesc, importc, header:"<libavcodec/codec_desc.h>".}
{.pragma: codecId, importc, header:"<libavcodec/codec_id.h>".}
{.pragma: codecPar, importc, header:"<libavcodec/codec_par.h>".}
{.pragma: codec, importc, header:"<libavcodec/codec.h>".}
{.pragma: dirac, importc, header:"<libavcodec/dirac.h>".}
{.pragma: dv_profile, importc, header:"<libavcodec/dv_profile.h>".}
{.pragma: mediacodec, importc, header:"<libavcodec/mediacodec.h>".}
{.pragma: packet, importc, header:"<libavcodec/packet.h>".}
{.pragma: vorbis_parser, importc, header: "<libavcodec/vorbis_parser.h>".}
{.pragma: avdevice, importc, header: "<libavdevice/avdevice.h>".}
{.pragma: avfilter, importc, header: "<libavfilter/avfilter.h>".}
{.pragma: buffersrc, importc, header: "<libavfilter/buffersrc.h>".}
{.pragma: avformat, importc, header: "<libavformat_avformat.h>".}
{.pragma: avio, importc, header: "<libavformat/avio.h>".}
{.pragma: avresample, importc, header: "<libavresample/avresample.h>".}
{.pragma: aes_ctr, importc, header: "<libavutil/aes_ctr.h>".}
{.pragma: aes, importc, header: "libavutil_aes".}
{.pragma: audio_fifo, importc, header: "<libavutil/audio_fifo.h>".}
{.pragma: avstring, importc, header: "<libavutil/avstring.h>".}
{.pragma: avutil, importc, header: "<libavutil/avutil.h>".}
{.pragma: blowfish, importc, header: "<libavutil/blowfish.h>".}

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
  
  AVFieldOrder* {.codecPar.} = enum
    AV_FIELD_UNKNOWN
    AV_FIELD_PROGRESSIVE
    AV_FIELD_TT
    AV_FIELD_BB
    AV_FIELD_TB
    AV_FIELD_BT
  
  AVCodecParameters* {.codecPar.} = object
    codec_type*: AVMediaType
    codec_id*: AVCodecID
    codec_tag*: cuint
    extradata*: ptr uint8
    extradata_size*: cint
    format*: cint
    bit_rate*: int64
    bits_per_coded_sample*: cint
    bits_per_raw_sample*: cint
    profile*: cint
    level*: cint
    width*: cint
    height*: cint
    sample_aspect_ratio*: AVRational
    field_order*: AVFieldOrder
    color_range*: AVColorRange
    color_primaries*: AVColorPrimaries
    color_trc*: AVColorTransferCharacteristic
    color_space*: AVColorSpace
    chroma_location*: AVChromaLocation
    video_delay*: cint
    channel_layout*: uint64
    channels*: cint
    sample_rate*: cint
    block_align*: cint
    frame_size*: cint
    initial_padding*: cint
    trailing_padding*: cint
    seek_preroll*: cint
  
  AVProfile* {.codec.} = object
    profile: cint
    name: cstring
  
  AVCodecDefault* {.codec.} = object

  AVCodec* {.codec.} = object
    name*: cstring
    long_name*: cstring
    `type`*: AVMediaType
    id*: AVCodecID
    capabilities*: cint
    supported_framerates*: ptr AVRational
    pix_fmts*: ptr AVPixelFormat
    supported_samplerates*: ptr cint
    sample_fmts*: ptr AVSampleFormat
    channel_layouts*: ptr uint64
    max_lowres*: uint8
    priv_class*: ptr AVClass
    profiles*: ptr AVProfile
    wrapper_name*: cstring
    priv_data_size*: cint
    next*: ptr AVCodec
    update_thread_context*: proc (dst, src: ptr AVCodecContext): cint
    defaults*: ptr AVCodecDefault
    init_static_data*: proc (codec: ptr AVCodec)
    init*: proc (a1: ptr AVCodecContext): cint
    encode_sub*: proc (a1: ptr AVCodecContext, buf: ptr uint8, buf_size: cint, sub: ptr AVSubtitle): cint
    encode2*: proc (avctx: ptr AVCodecContext, avpkt: ptr AVPacket, frame: ptr AVFrame, got_packet_ptr: ptr cint): cint
    decode*: proc (a1: ptr AVCodecContext, outdata: pointer, outdata_size: ptr cint, acpkt: ptr AVPacket): cint
    close*: proc (a1: ptr AVCodecContext): cint
    send_frame*: proc (avctx: ptr AVCodecContext, frame: ptr AVFrame): cint
    receive_packet*: proc (avctx: ptr AVCodecContext, avpkt: ptr AVPacket): cint
    receive_frame*: proc (avctx: ptr AVCodecContext, frame: ptr AVFrame): cint
    flush*: proc (a1: ptr AVCodecContext)
    caps_internal*: cint
    bsfs*: cstring
    hw_configs*: ptr ptr AVCodecHWConfigInternal
    codec_tags*: ptr cuint
  
  AVCodecHWConfig* {.codec.} = object
    pix_fmt*: AVPixelFormat
    methods*: cint
    device_type*: AVHWDeviceType
  
  DiracParseCodes* {.dirac.} = enum
    DIRAC_PCODE_SEQ_HEADER      = 0x00
    DIRAC_PCODE_PICTURE_CODED   = 0x08
    DIRAC_PCODE_INTER_NOREF_CO2 = 0x09
    DIRAC_PCODE_INTER_NOREF_CO1 = 0x0A
    DIRAC_PCODE_INTRA_REF_CO    = 0x0C
    DIRAC_PCODE_INTER_REF_CO1   = 0x0D
    DIRAC_PCODE_INTER_REF_CO2   = 0x0E
    DIRAC_PCODE_END_SEQ         = 0x10
    DIRAC_PCODE_AUX             = 0x20
    DIRAC_PCODE_PAD             = 0x30
    DIRAC_PCODE_PICTURE_RAW     = 0x48
    DIRAC_PCODE_INTRA_REF_RAW   = 0x4C
    DIRAC_PCODE_PICTURE_LOW_DEL = 0xC8
    DIRAC_PCODE_INTRA_REF_PICT  = 0xCC
    DIRAC_PCODE_PICTURE_HQ      = 0xE8
    DIRAC_PCODE_MAGIC           = 0x42424344
  
  DiracVersionInfo* {.dirac.} = object
    major*, minor*: cint

  AVDiracSeqHeader* {.dirac.} = object
    width*: cuint
    height*: cuint
    chroma_format*: uint8
    interlaced*: uint8
    top_field_first*: uint8
    frame_rate_index*: uint8
    aspect_ratio_index*: uint8
    clean_width*: uint16
    clean_height*: uint16
    clean_left_offset*: uint16
    clean_right_offset*: uint16
    pixel_range_index*: uint8
    color_spec_index*: uint8
    profile*: cuint
    level*: cuint
    framerate*: AVRational
    sample_aspect_ratio*: AVRational
    pix_fmt*: AVPixelFormat
    color_range*: AVColorRange
    color_primaries*: AVColorPrimaries
    color_trc*: AVColorTransferCharacteristic
    colorspace*: AVColorSpace
    version*: DiracVersionInfo
    bit_depth*: cint
  
  AVDVProfile* {.dv_profile.} = object
    dsf*: cint
    video_stype*: cint
    frame_size*: cint
    difseg_size*: cint
    n_difchan*: cint
    time_base*: AVRational
    ltc_divisor*: cint
    height*: cint
    width*: cint
    sar*: array[2, AVRational]
    pix_fmt*: AVPixelFormat
    bpm*: cint
    block_sizes*: ptr uint8
    audio_stride*: cint
    audio_min_samples*: array[3, cint]
    audio_samples_dist*: array[5, cint]
    audio_shuffle*: array[9, ptr uint8]
  
  AVMediaCodecContext* {.mediacodec.} = object
    surface: pointer
  
  MediaCodecBuffer* {.mediacodec.} = AVMediaCodecBuffer

  AVPacketSideDataType* {.packet.} = enum
    AV_PKT_DATA_PALETTE
    AV_PKT_DATA_NEW_EXTRADATA
    AV_PKT_DATA_PARAM_CHANGE
    AV_PKT_DATA_H263_MB_INFO
    AV_PKT_DATA_REPLAYGAIN
    AV_PKT_DATA_DISPLAYMATRIX
    AV_PKT_DATA_STEREO3D
    AV_PKT_DATA_AUDIO_SERVICE_TYPE
    AV_PKT_DATA_QUALITY_STATS
    AV_PKT_DATA_FALLBACK_TRACK
    AV_PKT_DATA_CPB_PROPERTIES
    AV_PKT_DATA_SKIP_SAMPLES
    AV_PKT_DATA_JP_DUALMONO
    AV_PKT_DATA_STRINGS_METADATA
    AV_PKT_DATA_SUBTITLE_POSITION
    AV_PKT_DATA_MATROSKA_BLOCKADDITIONAL
    AV_PKT_DATA_WEBVTT_IDENTIFIER
    AV_PKT_DATA_WEBVTT_SETTINGS
    AV_PKT_DATA_METADATA_UPDATE
    AV_PKT_DATA_MPEGTS_STREAM_ID
    AV_PKT_DATA_MASTERING_DISPLAY_METADATA
    AV_PKT_DATA_SPHERICAL
    AV_PKT_DATA_CONTENT_LIGHT_LEVEL
    AV_PKT_DATA_A53_CC
    AV_PKT_DATA_ENCRYPTION_INIT_INFO
    AV_PKT_DATA_ENCRYPTION_INFO
    AV_PKT_DATA_AFD
    AV_PKT_DATA_PRFT
    AV_PKT_DATA_ICC_PROFILE
    AV_PKT_DATA_DOVI_CONF
    AV_PKT_DATA_NB
  
  AVPacketSideData* {.packet.} = object
    data*: ptr uint8
    size*: cint
    `type`*: AVPacketSideDataType
  
  AVPacket* {.packet.} = object
    buf*: ptr AVBufferRef
    pts*: int64
    dts*: int64
    data*: ptr uint8
    size*: cint
    stream_index*: cint
    flags*: cint
    side_data*: ptr AVPacketSideDataType
    side_data_elems*: cint
    duration*: int64
    pos*: int64

    when defined(FF_API_CONVERGENCE_DURATION):
      convergence_duration {.deprecated.} : int64
  
  AVSideDataParamChangeFlags* {.packet.} = enum
    AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_COUNT  = 0x0001
    AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_LAYOUT = 0x0002
    AV_SIDE_DATA_PARAM_CHANGE_SAMPLE_RATE    = 0x0004
    AV_SIDE_DATA_PARAM_CHANGE_DIMENSIONS     = 0x0008AVPacketSideDataType* {.packet.} = enum
    AV_PKT_DATA_PALETTE
    AV_PKT_DATA_NEW_EXTRADATA
    AV_PKT_DATA_PARAM_CHANGE
    AV_PKT_DATA_H263_MB_INFO
    AV_PKT_DATA_REPLAYGAIN
    AV_PKT_DATA_DISPLAYMATRIX
    AV_PKT_DATA_STEREO3D
    AV_PKT_DATA_AUDIO_SERVICE_TYPE
    AV_PKT_DATA_QUALITY_STATS
    AV_PKT_DATA_FALLBACK_TRACK
    AV_PKT_DATA_CPB_PROPERTIES
    AV_PKT_DATA_SKIP_SAMPLES
    AV_PKT_DATA_JP_DUALMONO
    AV_PKT_DATA_STRINGS_METADATA
    AV_PKT_DATA_SUBTITLE_POSITION
    AV_PKT_DATA_MATROSKA_BLOCKADDITIONAL
    AV_PKT_DATA_WEBVTT_IDENTIFIER
    AV_PKT_DATA_WEBVTT_SETTINGS
    AV_PKT_DATA_METADATA_UPDATE
    AV_PKT_DATA_MPEGTS_STREAM_ID
    AV_PKT_DATA_MASTERING_DISPLAY_METADATA
    AV_PKT_DATA_SPHERICAL
    AV_PKT_DATA_CONTENT_LIGHT_LEVEL
    AV_PKT_DATA_A53_CC
    AV_PKT_DATA_ENCRYPTION_INIT_INFO
    AV_PKT_DATA_ENCRYPTION_INFO
    AV_PKT_DATA_AFD
    AV_PKT_DATA_PRFT
    AV_PKT_DATA_ICC_PROFILE
    AV_PKT_DATA_DOVI_CONF
    AV_PKT_DATA_NB
  
  AVPacketSideData* {.packet.} = object
    data*: ptr uint8
    size*: cint
    `type`*: AVPacketSideDataType
  
  AVPacket* {.packet.} = object
    buf*: ptr AVBufferRef
    pts*: int64
    dts*: int64
    data*: ptr uint8
    size*: cint
    stream_index*: cint
    flags*: cint
    side_data*: ptr AVPacketSideDataType
    side_data_elems*: cint
    duration*: int64
    pos*: int64

    when defined(FF_API_CONVERGENCE_DURATION):
      convergence_duration {.deprecated.} : int64
  
  AVSideDataParamChangeFlags* {.packet.} = enum
    AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_COUNT  = 0x0001
    AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_LAYOUT = 0x0002
    AV_SIDE_DATA_PARAM_CHANGE_SAMPLE_RATE    = 0x0004
    AV_SIDE_DATA_PARAM_CHANGE_DIMENSIONS     = 0x0008
  
  AVVorbisParseContext* {.vorbis_parser.} = object

  AVDeviceRect* {.bycopy, avdevice.} = object
    x*: cint
    y*: cint
    width*: cint
    height*: cint
  
  AVAppToDevMessageType* {.avdevice.} = enum
    AV_APP_TO_DEV_MUTE = MKBETAG(' ', 'M', 'U', 'T')
    AV_APP_TO_DEV_WINDOW_SIZE = MKBETAG('G','E','O','M')
    AV_APP_TO_DEV_GET_MUTE = MKBETAG('G', 'M', 'U', 'T')
    AV_APP_TO_DEV_GET_VOLUME = MKBETAG('G', 'V', 'O', 'L')
    AV_APP_TO_DEV_NONE = MKBETAG('N','O','N','E')
    AV_APP_TO_DEV_PAUSE = MKBETAG('P', 'A', 'U', ' ')
    AV_APP_TO_DEV_TOGGLE_PAUSE = MKBETAG('P', 'A', 'U', 'T')
    AV_APP_TO_DEV_PLAY = MKBETAG('P', 'L', 'A', 'Y')
    AV_APP_TO_DEV_WINDOW_REPAINT = MKBETAG('R','E','P','A')
    AV_APP_TO_DEV_SET_VOLUME = MKBETAG('S', 'V', 'O', 'L')
    AV_APP_TO_DEV_TOGGLE_MUTE = MKBETAG('T', 'M', 'U', 'T')
    AV_APP_TO_DEV_UNMUTE = MKBETAG('U', 'M', 'U', 'T')
  
  AVDevToAppMessageType* {.avdevice.} = enum
    AV_DEV_TO_APP_CREATE_WINDOW_BUFFER = MKBETAG('B','C','R','E')
    AV_DEV_TO_APP_DESTROY_WINDOW_BUFFER = MKBETAG('B','D','E','S')
    AV_DEV_TO_APP_DISPLAY_WINDOW_BUFFER = MKBETAG('B','D','I','S')
    AV_DEV_TO_APP_BUFFER_OVERFLOW = MKBETAG('B','O','F','L')
    AV_DEV_TO_APP_PREPARE_WINDOW_BUFFER = MKBETAG('B','P','R','E')
    AV_DEV_TO_APP_BUFFER_READABLE = MKBETAG('B','R','D',' ')
    AV_DEV_TO_APP_BUFFER_UNDERFLOW = MKBETAG('B','U','F','L')
    AV_DEV_TO_APP_BUFFER_WRITABLE = MKBETAG('B','W','R',' ')
    AV_DEV_TO_APP_MUTE_STATE_CHANGED = MKBETAG('C','M','U','T')
    AV_DEV_TO_APP_VOLUME_LEVEL_CHANGED = MKBETAG('C','V','O','L')
    AV_DEV_TO_APP_NONE = MKBETAG('N','O','N','E')
  
  AVDeviceCapabilitiesQuery* {.avdevice.} = object
    av_class*: ptr AVClass
    device_context*: ptr AVFormatContext
    codec*: AVCodecID
    sample_format*: AVSampleFormat
    pixel_format*: AVPixelFormat
    sample_rate*: cint
    channels*: cint
    channel_layout*: int64
    window_width*: cint
    window_height*: cint
    frame_width*: cint
    frame_height*: cint
    fps*: AVRational
  
  AVDeviceInfo* {.avdevice.} = object
    device_name*: cstring
    device_description*: cstring
  
  AVDeviceInfoList* {.avdevice.} = object
    devices*: ptr ptr AVDeviceInfo
    nb_devices*: cint
    default_device*: cint
  
  AVFilterInternal* {.avfilter.} = object
  AVFilterPad* {.avfilter.} = object
  AVFilterFormats* {.avfilter.} = object
  AVFilterGraphInternal* {.avfilter.} = object
  AVFilterChannelLayouts* {.importc: "struct $1", header: "<libavfilter/avfilter.h>".} = object
  AVFilterCommand* {.importc: "struct $1", header: "<libavfilter/avfilter.h>".} = object

  AVFilterContext* {.avfilter.} = object
    av_class*: ptr AVClass
    filter*: ptr AVFilter
    name*: cstring
    input_pads*: ptr AVFilterPad
    inputs*: ptr ptr AVFilterLink
    nb_inputs*: cuint
    output_pads*: ptr AVFilterPad
    outputs*: ptr ptr AVFilterLink
    nb_outputs*: cuint
    priv*: pointer
    graph*: ptr AVFilterGraph
    thread_type*: cint
    internal*: ptr AVFilterInternal
    command_queue*: ptr AVFilterCommand
    enable_str*: cstring
    enable*: pointer
    var_values*: ptr cdouble
    is_disabled*: cint
    hw_device_ctx*: ptr AVBufferRef
    nb_threads*: cint
    ready*: cuint
    extra_hw_frames*: cint

  AVFilterLink* {.avfilter.} = object
    src*: ptr AVFilterContext
    srcpad*: ptr AVFilterPad
    dst*: ptr AVFilterContext
    dstpad*: ptr AVFilterPad
    `type`*: AVMediaType
    w*: cint
    h*: cint
    sample_aspect_ratio*: AVRational
    channel_layout*: uint64
    sample_rate*: cint
    format*: cint
    time_base*: AVRational
    in_formats*: ptr AVFilterFormats
    out_formats*: ptr AVFilterFormats
    in_samplerates*: ptr AVFilterFormats
    out_samplerates*: ptr AVFilterFormats
    in_channel_layouts*: ptr AVFilterChannelLayouts
    out_channel_layouts*: ptr AVFilterChannelLayouts
    request_samples*: cint
    init_state*: AVFilterLinkInitState
    graph*: ptr AVFilterGraph
    current_pts*: int64
    current_pts_us*: int64
    age_index*: cint
    frame_rate*: AVRational
    partial_buf*: ptr AVFrame
    partial_buf_size*: cint
    min_samples*: cint
    max_samples*: cint
    channels*: cint
    flags*: cuint
    frame_count_in*: int64
    frame_count_out*: int64
    frame_pool*: pointer
    frame_wanted_out*: cint
    hw_frames_ctx*: ptr AVBufferRef

    when not defined(FF_INTERNAL_FIELDS):
      reserved*: array[0xF000, cstring]
    else:
      fifo*: FFFrameQueue
      frame_blocked_in*: cint
      status_in*: cint
      status_in_pts*: int64
      status_out*: cint
  
  AVFilterLinkInitState* {.avfilter.} = enum
    AVLINK_UNINIT = 0
    AVLINK_STARTINIT
    AVLINK_INIT

  AVFilter* {.avfilter.} = object
    name*: cstring
    description*: cstring
    inputs*: ptr AVFilterPad
    outputs*: ptr AVFilterPad
    priv_class*: ptr AVClass
    flags*: cint
    preinit*: proc (ctx: ptr AVFilterContext): cint
    init*: proc (ctx: ptr AVFilterContext): cint
    init_dict*: proc (ctx: ptr AVFilterContext, options: ptr ptr AVDictionary): cint
    uninit*: proc (ctx: ptr AVFilterContext)
    query_formats*: proc (a1: ptr AVFilterContext): cint
    priv_size*: cint
    flags_internal*: cint
    next*: ptr AVFilter
    process_command*: proc (a1: ptr AVFilterContext, cmd, arg, res: cstring, res_len, flags: cint): cint
    init_opaque*: proc (ctx: ptr AVFilterContext, opaque: pointer): cint
    activate*: proc (ctx: ptr AVFilterContext): cint

  avfilter_action_func* {.avfilter.} = proc (ctx: ptr AVFilterContext, arg: pointer, jobnr, nb_jobs: cint): cint
  avfilter_execute_func* {.avfilter.} = proc (ctx: ptr AVFilterContext, `func`: ptr avfilter_action_func, arg: pointer, ret: ptr cint, nb_jobs: cint): cint

  AVFilterGraph* {.avfilter.} = object
    av_class*: ptr AVClass
    filters*: ptr ptr AVFilterContext
    nb_filters*: cuint
    scale_sws_opts*: cstring
    thread_type*: cint
    nb_threads*: cint
    internal*: ptr AVFilterGraphInternal
    opaque*: pointer
    execute*: ptr avfilter_execute_func
    aresample_swr_opts*: cstring
    sink_links*: ptr ptr AVFilterLink
    sink_links_count*: cint
    disable_auto_convert*: cuint

    when defined(FF_API_LAVR_OPTS):
      resample_lavr_opts {.deprecated.} : cstring
  
  AVFilterInOut* {.avfilter.} = object
    name*: cstring
    filter_ctx*: ptr AVFilterContext
    pad_idx*: cint
    next*: ptr AVFilterInOut
  
  AVBufferSrcParameters* {.buffersrc.} = object
    format*: cint
    time_base*: AVRational
    width*: cint
    height*: cint
    sample_aspect_ratio*: AVRational
    frame_rate*: AVRational
    hw_frames_ctx*: ptr AVBufferRef
    sample_rate*: cint
    channel_layout*: uint64

  AVFormatContext* {.avformat.} = object
    av_class*: ptr AVClass
    iformat*: ptr AVInputFormat
    oformat*: ptr AVOutputFormat
    priv_data*: pointer
    pb*: ptr AVIOContext
    ctx_flags*: cint
    nb_streams*: cuint
    streams*: ptr ptr AVStream
    url*: cstring
    start_time*: int64
    duration*: int64
    bit_rate*: int64
    packet_size*: cuint
    max_delay*: cint
    flags*: cint
    probesize*: int64
    max_analyze_duration*: int64
    key*: ptr uint8
    keylen*: cint
    nb_programs*: cuint
    programs*: ptr ptr AVProgram
    video_codec_id*: AVCodecID
    audio_codec_id*: AVCodecID
    subtitle_codec_id*: AVCodecID
    max_index_size*: cuint
    max_picture_buffer*: cuint
    nb_chapters*: cuint
    chapters*: ptr ptr AVChapter
    metadata*: ptr AVDictionary
    start_time_realtime*: int64
    fps_probe_size*: cint
    error_recognition*: cint
    interrupt_callback*: AVIOInterruptCB
    debug*: cint
    max_interleave_delta*: int64
    strict_std_compliance*: cint
    event_flags*: cint
    max_ts_probe*: cint
    avoid_negative_ts*: cint
    ts_id*: cint
    audio_preload*: cint
    max_chunk_duration*: cint
    max_chunk_size*: cint
    use_wallclock_as_timestamps*: cint
    avio_flags*: cint
    duration_estimation_method*: AVDurationEstimationMethod
    skip_initial_bytes*: int64
    correct_ts_overflow*: cuint
    seek2any*: cint
    flush_packets*: cint
    probe_score*: cint
    format_probesize*: cint
    codec_whitelist*: cstring
    format_whitelist*: cstring
    internal*: ptr AVFormatInternal
    io_repositioned*: cint
    video_codec*: ptr AVCodec
    audio_codec*: ptr AVCodec
    subtitle_codec*: ptr AVCodec
    data_codec*: ptr AVCodec
    metadata_header_padding*: cint
    opaque*: pointer
    control_message_cb*: av_format_control_message
    output_ts_offset*: int64
    dump_separator*: ptr uint8
    data_codec_id*: AVCodecID
    protocol_whitelist*: cstring
    io_open*: proc (s: ptr AVFormatContext, pb: ptr ptr AVIOContext, url: cstring, flags: cint, options: ptr ptr AVDictionary): cint
    io_close*: proc (s: ptr AVFormatContext, pb: ptr AVIOContext)
    protocol_blacklist*: cstring
    max_streams*: cint
    skip_estimate_duration_from_pts*: cint
    max_probe_packets*: cint

    when defined(FF_API_FORMAT_FILENAME):
      filename {.deprecated.}: array[1024, cstring]
    
    when defined(FF_API_OLD_OPEN_CALLBACKS):
      open_cb {.deprecated.}: proc (s: ptr AVFormatContext, p: ptr ptr AVIOContext, url: cstring, flags: cint, int_cb: ptr AVIOInterruptCB, options: ptr ptr AVDictionary): cint

  AVDeviceInfoList* {.avformat.} = object
  AVDeviceCapabilitiesQuery* {.avformat.} = object
  AVCodecTag* {.avformat.} = object

  AVProbeData* {.avformat.} = object
    filename*: cstring
    buf*: cstring
    buf_size*: cint
    mime_type*: cstring
  
  AVOutputFormat* {.avformat.} = object
    name*: cstring
    long_name*: cstring
    mime_type*: cstring
    extensions*: cstring
    audio_codec*: AVCodecID
    video_codec*: AVCodecID
    subtitle_codec*: AVCodecID
    flags*: cint
    codec_tag*: ptr ptr AVCodecTag
    priv_class*: AVClass
    next*: ptr AVOutputFormat
    priv_data_size*: cint
    write_header*: proc (a1: ptr AVFormatContext): cint
    write_packet*: proc (a1: ptr AVFormatContext, pkt: ptr AVPacket): cint
    write_trailer*: proc (a1: ptr AVFormatContext): cint
    interleave_packet*: proc (a1: ptr AVFormatContext, `out`, `in`: ptr AVPacket, flush: cint): cint
    query_codec*: proc (id: AVCodecID, std_compliance: cint): cint
    get_output_timestamp*: proc (s: ptr AVFormatContext, stream: cint, dts, wall: ptr int64)
    control_message*: proc (s: ptr AVFormatContext, `type`: cint, data: pointer, data_size: csize_t): cint
    write_uncoded_frame*: proc (a1: ptr AVFormatContext, stream_index: cint, frame: ptr ptr AVFrame, flags: cuint): cint
    get_device_list*: proc (s: ptr AVFormatContext, device_list: ptr AVDeviceInfoList): cint
    create_device_capabilities*: proc (s: ptr AVFormatContext, caps: ptr AVDeviceCapabilitiesQuery): cint
    free_device_capabilities*: proc (s: ptr AVFormatContext, caps: ptr AVDeviceCapabilitiesQuery): cint
    data_codec*: AVCodecID
    init*: proc (a1: ptr AVFormatContext): cint
    deinit*: proc (a1: ptr AVFormatContext)
    check_bitstream*: proc (a1: ptr AVFormatContext, pkt: ptr AVPacket): cint
  
  AVInputFormat* {.avformat.} = object
    name*: cstring
    long_name*: cstring
    flags*: cint
    extensions*: cstring
    codec_tag*: ptr ptr AVCodecTag
    priv_class*: ptr AVClass
    mime_type*: cstring
    next*: ptr AVInputFormat
    raw_codec_id*: cint
    priv_data_size*: cint
    read_probe*: proc (a1: ptr AVProbeData): cint
    read_header*: proc (a1: ptr AVFormatContext): cint
    read_packet*: proc (a1: ptr AVFormatContext, pkt: ptr AVPacket): cint
    read_close*: proc (a1: ptr AVFormatContext): cint
    read_seek*: proc (a1: ptr AVFormatContext, stream_index: cint, timestamp: int64, flags: cint): cint
    read_timestamp*: proc (s: ptr AVFormatContext, stream_index: cint, pos: ptr int64, pos_limit: int64): int64
    read_play*: proc (a1: ptr AVFormatContext): cint
    read_pause*: proc (a1: ptr AVFormatContext): cint
    read_seek2*: proc (s: ptr AVFormatContext, stream_index: cint, min_ts, ts, max_ts: int64, flags: cint): cint
    get_device_list*: proc (s: ptr AVFormatContext, device_list: ptr AVDeviceInfoList): cint
    create_device_capabilities*: proc (s: ptr AVFormatContext, caps: ptr AVDeviceCapabilitiesQuery): cint
    free_device_capabilities*: proc (s: ptr AVFormatContext, caps: ptr AVDeviceCapabilitiesQuery): cint
  
  AVStreamParseType* {.avformat.} = enum
    AVSTREAM_PARSE_NONE
    AVSTREAM_PARSE_FULL
    AVSTREAM_PARSE_HEADERS
    AVSTREAM_PARSE_TIMESTAMPS
    AVSTREAM_PARSE_FULL_ONCE
    AVSTREAM_PARSE_FULL_RAW
  
  AVIndexEntry* {.avformat.} = object
    pos*: int64
    timestamp*: int64
    flags* {.bitsize: 2.}: cint
    size* {.bitsize: 30.}: cint
    min_distance*: cint
  
  AVStreamInternal* {.avformat.} = object

  AVStream* {.avformat.} = object
    index*: cint
    id*: cint
    priv_data*: pointer
    time_base*: AVRational
    start_time*: int64
    duration*: int64
    nb_frames*: int64
    disposition*: cint
    `discard`*: AVDiscard
    sample_aspect_ratio*: AVRational
    metadata*: ptr AVDictionary
    avg_frame_rate*: AVRational
    attached_pic*: AVPacket
    side_data*: ptr AVPacketSideData
    nb_side_data*: cint
    event_flags*: cint
    r_frame_rate*: AVRational
    codecpar*: ptr AVCodecParameters
    info*: ptr AVStreamInfo
    pts_wrap_bits*: cint
    first_dts*: int64
    cur_dts*: int64
    last_IP_pts*: int64
    last_IP_duration*: cint
    probe_packets*: cint
    codec_info_nb_frames*: cint
    need_parsing*: AVStreamParseType
    parser*: ptr AVCodecParserContext
    last_in_packet_buffer*: ptr AVPacketList
    pts_buffer*: array[MAX_REORDER_DELAY+1, int64]
    index_entries*: ptr AVIndexEntry
    nb_index_entries*: cint
    index_entries_allocated_size*: cuint
    stream_identifier*: cint
    program_num*: cint
    pmt_version*: cint
    pmt_stream_idx*: cint
    interleaver_chunk_size*: int64
    interleaver_chunk_duration*: int64
    request_probe*: cint
    skip_to_keyframe*: cint
    skip_samples*: cint
    start_skip_samples*: int64
    first_discard_sample*: int64
    last_discard_sample*: int64
    nb_decoded_frames*: cint
    mux_ts_offset*: int64
    pts_wrap_reference*: int64
    pts_wrap_behavior*: cint
    update_initial_durations_done*: cint
    pts_reorder_error*: array[MAX_REORDER_DELAY+1, int64]
    pts_reorder_error_count*: array[MAX_REORDER_DELAY+1, uint8]
    last_dts_for_order_check*: int64
    dts_ordered*: uint8
    dts_misordered*: uint8
    inject_global_side_data*: cint
    display_aspect_ratio*: AVRational
    internal*: ptr AVStreamInternal

    when defined(FF_API_LAVF_AVCTX):
      codec* {.deprecated.}: ptr AVCodecContext
    
    when defined(FF_API_LAVF_FFSERVER):
      recommended_encoder_configuration* {.deprecated.}: cstring
  
  AVStreamInfo* {.avformat.} = object
    last_dts*: int64
    duration_gcd*: int64
    duration_count*: cint
    rfps_duration_sum*: int64
    duration_error*: ptr array[2, array[MAX_STD_TIMEBASES, cdouble]]
    codec_info_duration*: int64
    codec_info_duration_fields*: int64
    frame_delay_evidence: cint
    found_decoder: cint
    last_duration: int64
    fps_first_dts: int64
    fps_first_dts_idx: cint
    fps_last_dts: int64
    fps_last_dts_idx: cint
  
  AVProgram* {.avformat.} = object
    id*: cint
    flags*: cint
    `discard`*: AVDiscard
    stream_index*: ptr cuint
    nb_stream_indexes*: cuint
    metadata*: ptr AVDictionary
    program_num*: cint
    pmt_pid*: cint
    pcr_pid*: cint
    pmt_version*: cint
    start_time*: int64
    end_time*: int64
    pts_wrap_reference*: int64
    pts_wrap_behavior*: cint
  
  AVChapter* {.avformat.} = object
    id*: cint
    time_base*: AVRational
    start*: int64
    `end`*: int64
    metadata*: ptr AVDictionary
  
  av_format_control_message* {.avformat.} = proc (s: ptr AVFormatContext, `type`: cint, data: pointer, data_size: csize_t): cint

  AVOpenCallback* {.avformat.} = proc (s: ptr AVFormatContext, pb: ptr ptr AVIOContext, url: cstring, flags: cint, int_cb: ptr AVIOInterruptCB, options: ptr ptr AVDictionary): cint

  AVDurationEstimationMethod* {.avformat.} = enum
    AVFMT_DURATION_FROM_PTS
    AVFMT_DURATION_FROM_STREAM
    AVFMT_DURATION_FROM_BITRATE
  
  AVFormatInternal* {.avformat.} = object

  AVPacketList* {.avformat.} = object
    pkt*: AVPacket
    next*: ptr AVPacketList
  
  AVTimebaseSource* {.avformat.} = enum
    AVFMT_TBCF_AUTO = -1
    AVFMT_TBCF_DECODER
    AVFMT_TBCF_DEMUXER
    AVFMT_TBCF_R_FRAMERATE # when defined(FF_API_R_FRAME_RATE)
  
  AVIOInterruptCB* {.avio.} = object
    callback*: proc (a1: pointer): cint
    opaque*: pointer
  
  AVIODirEntryType* {.avio.} = enum
    AVIO_ENTRY_UNKNOWN
    AVIO_ENTRY_BLOCK_DEVICE
    AVIO_ENTRY_CHARACTER_DEVICE
    AVIO_ENTRY_DIRECTORY
    AVIO_ENTRY_NAMED_PIPE
    AVIO_ENTRY_SYMBOLIC_LINK
    AVIO_ENTRY_SOCKET
    AVIO_ENTRY_FILE
    AVIO_ENTRY_SERVER
    AVIO_ENTRY_SHARE
    AVIO_ENTRY_WORKGROUP

  AVIODirEntry* {.avio.} = object
    name*: cstring
    `type`*: cint
    uft8*: cint
    size*: int64
    modification_timestamp*: int64
    access_timestamp*: int64
    status_change_timestamp*: int64
    user_id*: int64
    group_id*: int64
    filemode*: int64
  
  URLContext* {.avio.} = object

  AVIODirContext* = object
    url_context*: ptr URLContext
  
  AVIODataMarkerType* = enum
    AVIO_DATA_MARKER_HEADER
    AVIO_DATA_MARKER_SYNC_POINT
    AVIO_DATA_MARKER_BOUNDARY_POINT
    AVIO_DATA_MARKER_UNKNOWN
    AVIO_DATA_MARKER_TRAILER
    AVIO_DATA_MARKER_FLUSH_POINT
  
  AVIOContext* {.avio.} = object
    av_class*: AVClass
    buffer*: ptr cuchar
    buf_ptr*: ptr cuchar
    buf_end*: ptr cuchar
    opaque*: pointer
    read_packet*: proc (opaque: pointer, buf: ptr uint8, buf_size: cint): cint
    write_packet*: proc (opaque: pointer, buf: ptr uint8, buf_size: cint): cint
    seek*: proc (opaque: pointer, offset: int64, whence: cint): int64
    pos*: int64
    eof_reached*: cint
    write_flag*: cint
    max_packet_size*: cint
    checksum*: culong
    checksum_ptr*: ptr cuchar
    update_checksum*: proc (checksum: culong, buf: ptr uint8, size: cuint): culong
    error*: cint
    read_pause*: proc (opaque: pointer, pause: cint): cint
    read_seek*: proc (opaque: pointer, stream_index: cint, timestamp: int64, flags: cint): int64
    seekable*: cint
    maxsize*: int64
    direct*: cint
    bytes_read*: int64
    seek_count*: cint
    writeout_count*: cint
    orig_buffer_size*: cint
    short_seek_threshold*: cint
    protocol_whitelist*: cstring
    protocol_blacklist*: cstring
    write_data_type*: proc (opaque: pointer, buf: uint8, buf_size: cint, `type`: AVIODataMarkerType, time: int64): cint
    ignore_boundary_point*: cint
    current_type*: AVIODataMarkerType
    last_time*: int64
    short_seek_get*: proc (opaque: pointer): cint
    written*: int64
    buf_ptr_max*: ptr cuchar
    min_packet_size*: cint
  
  AVBPrint* {.avio.} = object

  AVAudioResampleContext* {.avresample.} = object

  AVMixCoeffType* {.deprecated, avresample.} = enum
    AV_MIX_COEFF_TYPE_Q8
    AV_MIX_COEFF_TYPE_Q15
    AV_MIX_COEFF_TYPE_FLT
    AV_MIX_COEFF_TYPE_NB
  
  AVResampleFilterType* {.deprecated, avresample.} = enum
    AV_RESAMPLE_FILTER_TYPE_CUBIC
    AV_RESAMPLE_FILTER_TYPE_BLACKMAN_NUTTALL
    AV_RESAMPLE_FILTER_TYPE_KAISER
  
  AVResampleDitherMethod* {.deprecated, avresample.} = enum
    AV_RESAMPLE_DITHER_NONE
    AV_RESAMPLE_DITHER_RECTANGULAR
    AV_RESAMPLE_DITHER_TRIANGULAR
    AV_RESAMPLE_DITHER_TRIANGULAR_HP
    AV_RESAMPLE_DITHER_TRIANGULAR_NS
    AV_RESAMPLE_DITHER_NB
  
  AVAESCTR* {.aes_ctr.} = object

  AVAES* {.aes.} = object

  AVAudioFifo* {.audio_fifo.} = object

  AVEscapeMode* {.avstring.} = enum
    AV_ESCAPE_MODE_AUTO
    AV_ESCAPE_MODE_BACKSLASH
    AV_ESCAPE_MODE_QUOTE
  
  AVMediaType* {.avutil.} = enum
    AVMEDIA_TYPE_UNKNOWN = -1
    AVMEDIA_TYPE_VIDEO
    AVMEDIA_TYPE_AUDIO
    AVMEDIA_TYPE_DATA
    AVMEDIA_TYPE_SUBTITLE
    AVMEDIA_TYPE_ATTACHMENT
    AVMEDIA_TYPE_NB
  
  AVPictureType* {.avutil.} = enum
    AV_PICTURE_TYPE_NONE = 0
    AV_PICTURE_TYPE_I
    AV_PICTURE_TYPE_P
    AV_PICTURE_TYPE_B
    AV_PICTURE_TYPE_S
    AV_PICTURE_TYPE_SI
    AV_PICTURE_TYPE_SP
    AV_PICTURE_TYPE_BI
  
  AVBlowfish* {.blowfish.} = object
    p*: array[AV_BF_ROUNDS + 2, uint32]
    s*: array[4, array[256, uint32]]