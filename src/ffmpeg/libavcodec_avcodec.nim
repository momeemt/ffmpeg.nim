when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

from libavcodec_codec import AVCodec, AVPacket
from libavcodec_codec_id import AVCodecID
from libavcodec_codec_par import AVFieldOrder, AVCodecParameters
import libavutil_avutil
import libavutil_buffer
import libavutil_samplefmt
from libavutil_log import AVClass
from libavutil_rational import AVRational

const
  AV_INPUT_BUFFER_PADDING_SIZE* = 64
  AV_INPUT_BUFFER_MIN_SIZE* = 16384
  AV_CODEC_FLAG_UNALIGNED* = 1 shl 0
  AV_CODEC_FLAG_QSCALE* = 1 shl 1
  AV_CODEC_FLAG_4MV* = 1 shl 2
  AV_CODEC_FLAG_OUTPUT_CORRUPT* = 1 shl 3
  AV_CODEC_FLAG_QPEL* = 1 shl 4
  AV_CODEC_FLAG_DROPCHANGED* = 1 shl 5
  AV_CODEC_FLAG_PASS1* = 1 shl 9
  AV_CODEC_FLAG_PASS2* = 1 shl 10
  AV_CODEC_FLAG_LOOP_FILTER* = 1 shl 11
  AV_CODEC_FLAG_GRAY* = 1 shl 13
  AV_CODEC_FLAG_PSNR* = 1 shl 15
  AV_CODEC_FLAG_TRUNCATED* = 1 shl 16
  AV_CODEC_FLAG_INTERLACED_DCT* = 1 shl 18
  AV_CODEC_FLAG_LOW_DELAY* = 1 shl 19
  AV_CODEC_FLAG_GLOBAL_HEADER* = 1 shl 22
  AV_CODEC_FLAG_BITEXACT* = 1 shl 23
  AV_CODEC_FLAG_AC_PRED* = 1 shl 24
  AV_CODEC_FLAG_INTERLACED_ME* = 1 shl 29
  AV_CODEC_FLAG_CLOSED_GOP* = 1.uint shl 31
  AV_CODEC_FLAG2_FAST* = 1 shl 0
  AV_CODEC_FLAG2_NO_OUTPUT* = 1 shl 2
  AV_CODEC_FLAG2_LOCAL_HEADER* = 1 shl 3
  AV_CODEC_FLAG2_DROP_FRAME_TIMECODE* = 1 shl 13
  AV_CODEC_FLAG2_CHUNKS* = 1 shl 15
  AV_CODEC_FLAG2_IGNORE_CROP* = 1 shl 16
  AV_CODEC_FLAG2_SHOW_ALL* = 1 shl 22
  AV_CODEC_FLAG2_EXPORT_MVS* = 1 shl 28
  AV_CODEC_FLAG2_SKIP_MANUAL* = 1 shl 29
  AV_CODEC_FLAG2_RO_FLUSH_NOOP* = 1 shl 30
  AV_CODEC_EXPORT_DATA_MVS* = 1 shl 0
  AV_CODEC_EXPORT_DATA_PRFT* = 1 shl 1
  AV_CODEC_EXPORT_DATA_VIDEO_ENC_PARAMS* = 1 shl 2
  AV_GET_BUFFER_FLAG_REF* = 1 shl 0
  FF_COMPRESSION_DEFAULT* = -1
  FF_CMP_SAD* = 0
  FF_CMP_SSE* = 1
  FF_CMP_SATD* = 2
  FF_CMP_DCT* = 3
  FF_CMP_PSNR* = 4
  FF_CMP_BIT* = 5
  FF_CMP_RD* = 6
  FF_CMP_ZERO* = 7
  FF_CMP_VSAD* = 8
  FF_CMP_VSSE* = 9
  FF_CMP_NSSE* = 10
  FF_CMP_W53* = 11
  FF_CMP_W97* = 12
  FF_CMP_DCTMAX* = 13
  FF_CMP_DCT264* = 14
  FF_CMP_MEDIAN_SAD* = 15
  FF_CMP_CHROMA* = 256
  SLICE_FLAG_CODED_ORDER* = 0x0001
  SLICE_FLAG_ALLOW_FIELD* = 0x0002
  SLICE_FLAG_ALLOW_PLANE* = 0x0004
  FF_MB_DECISION_SIMPLE* = 0
  FF_MB_DECISION_BITS* = 1
  FF_MB_DECISION_RD* = 2
  FF_CODER_TYPE_VLC* = 0
  FF_CODER_TYPE_AC* = 1
  FF_CODER_TYPE_RAW* = 2
  FF_CODER_TYPE_RLE* = 3
  FF_BUG_AUTODETECT* = 1
  FF_BUG_XVID_ILACE* = 4
  FF_BUG_UMP4* = 8
  FF_BUG_NO_PADDING* = 16
  FF_BUG_AMV* = 32
  FF_BUG_QPEL_CHROMA* = 64
  FF_BUG_STD_QPEL* = 128
  FF_BUG_QPEL_CHROMA2* = 256
  FF_BUG_DIRECT_BLOCKSIZE* = 512
  FF_BUG_EDGE* = 1024
  FF_BUG_HPEL_CHROMA* = 2048
  FF_BUG_DC_CLIP* = 4096
  FF_BUG_MS* = 8192
  FF_BUG_TRUNCATED* = 16384
  FF_BUG_IEDGE* = 32768
  FF_COMPLIANCE_VERY_STRICT* = 2
  FF_COMPLIANCE_STRICT* = 1
  FF_COMPLIANCE_NORMAL* = 0
  FF_COMPLIANCE_UNOFFICIAL* = -1
  FF_COMPLIANCE_EXPERIMENTAL* = -2
  FF_EC_GUESS_MVS* = 1
  FF_EC_DEBLOCK* = 2
  FF_EC_FAVOR_INTER* = 256
  FF_DEBUG_PICT_INFO* = 1
  FF_DEBUG_RC* = 2
  FF_DEBUG_BITSTREAM* = 4
  FF_DEBUG_MB_TYPE* = 8
  FF_DEBUG_QP* = 16
  FF_DEBUG_DCT_COEFF* = 0x00000040
  FF_DEBUG_SKIP* = 0x00000080
  FF_DEBUG_STARTCODE* = 0x00000100
  FF_DEBUG_ER* = 0x00000400
  FF_DEBUG_MMCO* = 0x00000800
  FF_DEBUG_BUGS* = 0x00001000
  FF_DEBUG_BUFFERS* = 0x00008000
  FF_DEBUG_THREADS* = 0x00010000
  FF_DEBUG_GREEN_MD* = 0x00800000
  FF_DEBUG_NOMC* = 0x01000000
  FF_DEBUG_VIS_MV_P_FOR* = 0x00000001 # FF_API_DEBUG_MV & else(2138)
  FF_DEBUG_VIS_MV_B_FOR* = 0x00000002 # FF_API_DEBUG_MV & else
  FF_DEBUG_VIS_MV_B_BACK* = 0x00000004 # FF_API_DEBUG_MV & else
  AV_EF_CRCCHECK* = 1 shl 0
  AV_EF_BITSTREAM* = 1 shl 1
  AV_EF_BUFFER* = 1 shl 2
  AV_EF_EXPLODE* = 1 shl 3
  AV_EF_IGNORE_ERR* = 1 shl 15
  AV_EF_CAREFUL* = 1 shl 16
  AV_EF_COMPLIANT* = 1 shl 17
  AV_EF_AGGRESSIVE* = 1 shl 18
  FF_DCT_AUTO* = 0
  FF_DCT_FASTINT* = 1
  FF_DCT_INT* = 2
  FF_DCT_MMX* = 3
  FF_DCT_ALTIVEC* = 5
  FF_DCT_FAAN* = 6
  FF_IDCT_AUTO* = 0
  FF_IDCT_INT* = 1
  FF_IDCT_SIMPLE* = 2
  FF_IDCT_SIMPLEMMX* = 3
  FF_IDCT_ARM* = 7
  FF_IDCT_ALTIVEC* = 8
  FF_IDCT_SIMPLEARM* = 10
  FF_IDCT_XVID* = 14
  FF_IDCT_SIMPLEARMV5TE* = 16
  FF_IDCT_SIMPLEARMV6* = 17
  FF_IDCT_FAAN* = 20
  FF_IDCT_SIMPLENEON* = 22
  FF_IDCT_NONE* = 24
  FF_IDCT_SIMPLEAUTO* = 128
  FF_THREAD_FRAME* = 1
  FF_THREAD_SLICE* = 2
  FF_PROFILE_UNKNOWN* = -99
  FF_PROFILE_RESERVED* = -100
  FF_PROFILE_AAC_MAIN* = 0
  FF_PROFILE_AAC_LOW* = 1
  FF_PROFILE_AAC_SSR* = 2
  FF_PROFILE_AAC_LTP* = 3
  FF_PROFILE_AAC_HE* = 4
  FF_PROFILE_AAC_HE_V2* = 28
  FF_PROFILE_AAC_LD* = 22
  FF_PROFILE_AAC_ELD* = 38
  FF_PROFILE_MPEG2_AAC_LOW* = 128
  FF_PROFILE_MPEG2_AAC_HE* = 131
  FF_PROFILE_DNXHD* = 0
  FF_PROFILE_DNXHR_LB* = 1
  FF_PROFILE_DNXHR_SQ* = 2
  FF_PROFILE_DNXHR_HQ* = 3
  FF_PROFILE_DNXHR_HQX* = 4
  FF_PROFILE_DNXHR_444* = 5
  FF_PROFILE_DTS* = 20
  FF_PROFILE_DTS_ES* = 30
  FF_PROFILE_DTS_96_24* = 40
  FF_PROFILE_DTS_HD_HRA* = 50
  FF_PROFILE_DTS_HD_MA* = 60
  FF_PROFILE_DTS_EXPRESS* = 70
  FF_PROFILE_MPEG2_422* = 0
  FF_PROFILE_MPEG2_HIGH* = 1
  FF_PROFILE_MPEG2_SS* = 2
  FF_PROFILE_MPEG2_SNR_SCALABLE* = 3
  FF_PROFILE_MPEG2_MAIN* = 4
  FF_PROFILE_MPEG2_SIMPLE* = 5
  FF_PROFILE_H264_CONSTRAINED* = 1 shl 9
  FF_PROFILE_H264_INTRA* = 1 shl 11
  FF_PROFILE_H264_BASELINE* = 66
  FF_PROFILE_H264_CONSTRAINED_BASELINE* = 66 or FF_PROFILE_H264_CONSTRAINED
  FF_PROFILE_H264_MAIN* = 77
  FF_PROFILE_H264_EXTENDED* = 88
  FF_PROFILE_H264_HIGH* = 100
  FF_PROFILE_H264_HIGH_10* = 110
  FF_PROFILE_H264_HIGH_10_INTRA* = 110 or FF_PROFILE_H264_INTRA
  FF_PROFILE_H264_MULTIVIEW_HIGH* = 118
  FF_PROFILE_H264_HIGH_422* = 122
  FF_PROFILE_H264_HIGH_422_INTRA* = 122 or FF_PROFILE_H264_INTRA
  FF_PROFILE_H264_STEREO_HIGH* = 128
  FF_PROFILE_H264_HIGH_444* = 144
  FF_PROFILE_H264_HIGH_444_PREDICTIVE* = 244
  FF_PROFILE_H264_HIGH_444_INTRA* = 244 or FF_PROFILE_H264_INTRA
  FF_PROFILE_H264_CAVLC_444* = 44
  FF_PROFILE_VC1_SIMPLE* = 0
  FF_PROFILE_VC1_MAIN* = 1
  FF_PROFILE_VC1_COMPLEX* = 2
  FF_PROFILE_VC1_ADVANCED* = 3
  FF_PROFILE_MPEG4_SIMPLE* = 0
  FF_PROFILE_MPEG4_SIMPLE_SCALABLE* = 1
  FF_PROFILE_MPEG4_CORE* = 2
  FF_PROFILE_MPEG4_MAIN* = 3
  FF_PROFILE_MPEG4_N_BIT* = 4
  FF_PROFILE_MPEG4_SCALABLE_TEXTURE* = 5
  FF_PROFILE_MPEG4_SIMPLE_FACE_ANIMATION* = 6
  FF_PROFILE_MPEG4_BASIC_ANIMATED_TEXTURE* = 7
  FF_PROFILE_MPEG4_HYBRID* = 8
  FF_PROFILE_MPEG4_ADVANCED_REAL_TIME* = 9
  FF_PROFILE_MPEG4_CORE_SCALABLE* = 10
  FF_PROFILE_MPEG4_ADVANCED_CODING* = 11
  FF_PROFILE_MPEG4_ADVANCED_CORE* = 12
  FF_PROFILE_MPEG4_ADVANCED_SCALABLE_TEXTURE* = 13
  FF_PROFILE_MPEG4_SIMPLE_STUDIO* = 14
  FF_PROFILE_MPEG4_ADVANCED_SIMPLE* = 15
  FF_PROFILE_JPEG2000_CSTREAM_RESTRICTION_0* = 1
  FF_PROFILE_JPEG2000_CSTREAM_RESTRICTION_1* = 2
  FF_PROFILE_JPEG2000_CSTREAM_NO_RESTRICTION* = 32768
  FF_PROFILE_JPEG2000_DCINEMA_2K* = 3
  FF_PROFILE_JPEG2000_DCINEMA_4K* = 4
  FF_PROFILE_VP9_0* = 0
  FF_PROFILE_VP9_1* = 1
  FF_PROFILE_VP9_2* = 2
  FF_PROFILE_VP9_3* = 3
  FF_PROFILE_HEVC_MAIN* = 1
  FF_PROFILE_HEVC_MAIN_10* = 2
  FF_PROFILE_HEVC_MAIN_STILL_PICTURE* = 3
  FF_PROFILE_HEVC_REXT* = 4
  FF_PROFILE_AV1_MAIN* = 0
  FF_PROFILE_AV1_HIGH* = 1
  FF_PROFILE_AV1_PROFESSIONAL* = 2
  FF_PROFILE_MJPEG_HUFFMAN_BASELINE_DCT* = 0xc0
  FF_PROFILE_MJPEG_HUFFMAN_EXTENDED_SEQUENTIAL_DCT* = 0xc1
  FF_PROFILE_MJPEG_HUFFMAN_PROGRESSIVE_DCT* = 0xc2
  FF_PROFILE_MJPEG_HUFFMAN_LOSSLESS* = 0xc3
  FF_PROFILE_MJPEG_JPEG_LS* = 0xf7
  FF_PROFILE_SBC_MSBC* = 1
  FF_PROFILE_PRORES_PROXY* = 0
  FF_PROFILE_PRORES_LT* = 1
  FF_PROFILE_PRORES_STANDARD* = 2
  FF_PROFILE_PRORES_HQ* = 3
  FF_PROFILE_PRORES_4444* = 4
  FF_PROFILE_PRORES_XQ* = 5
  FF_PROFILE_ARIB_PROFILE_A* = 0
  FF_PROFILE_ARIB_PROFILE_C* = 1
  FF_PROFILE_KLVA_SYNC* = 0
  FF_PROFILE_KLVA_ASYNC* = 1
  FF_LEVEL_UNKNOWN* = -99
  FF_SUB_CHARENC_MODE_DO_NOTHING* = -1
  FF_SUB_CHARENC_MODE_AUTOMATIC* = 0
  FF_SUB_CHARENC_MODE_PRE_DECODER* = 1
  FF_SUB_CHARENC_MODE_IGNORE* = 2
  FF_CODEC_PROPERTY_LOSSLESS* = 0x00000001
  FF_CODEC_PROPERTY_CLOSED_CAPTIONS* = 0x00000002
  FF_SUB_TEXT_FMT_ASS* = 0
  FF_SUB_TEXT_FMT_ASS_WITH_TIMINGS* = 1 # FF_API_ASS_TIMING
  AV_HWACCEL_CODEC_CAP_EXPERIMENTAL* = 0x0200
  AV_HWACCEL_FLAG_IGNORE_LEVEL* = 1 shl 0
  AV_HWACCEL_FLAG_ALLOW_HIGH_DEPTH* = 1 shl 1
  AV_HWACCEL_FLAG_ALLOW_PROFILE_MISMATCH* = 1 shl 2
  AV_SUBTITLE_FLAG_FORCED* = 0x00000001
  AV_PARSER_PTS_NB* = 4
  PARSER_FLAG_COMPLETE_FRAMES* = 0x0001
  PARSER_FLAG_ONCE* = 0x0002
  PARSER_FLAG_FETCHED_OFFSET* = 0x0004
  PARSER_FLAG_USE_CODEC_TS* = 0x1000

type
  AVDiscard* = enum
    AVDISCARD_NONE = -16
    AVDISCARD_DEFAULT = 0
    AVDISCARD_NONREF = 8
    AVDISCARD_BIDIR = 16
    AVDISCARD_NONINTRA = 24
    AVDISCARD_NONKEY = 32
    AVDISCARD_ALL = 48

  AVAudioServiceType* = enum
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
  
  RcOverride* = object
    start_frame: int
    end_frame: int
    qscale: int
    quality_factor: float
  
  AVPanScan* = object
    id: int
    width: int
    height: int
    position: array[3, array[2, int16]]

  # TODO: 未実装
  AVCPBProperties* = object

  AVProducerReferenceTime* = object
    wallclock: int64
    flags: int
  
  # TODO: 未実装
  AVCodecInternal* = object

  AVCodecContext* = object
    av_class: ptr AVClass
    log_level_offset: int
    codec_type: AVMediaType
    codec: ptr AVCodec
    codec_id: AVCodecID
    codec_tag: uint
    priv_data: pointer
    internal: AVCodecInternal
    opaque: pointer
    bit_rate: int64
    bit_rate_tolerance: int
    global_quality: int
    compression_level: int
    flags: int
    flags2: int
    extradata: ptr uint8
    extradata_size: int
    time_base: AVRational
    ticks_per_frame: int
    delay: int
    width: int
    height: int
    coded_width: int
    coded_height: int
    gop_size: int
    pix_fmt: AVPixelFormat
    draw_hotiz_band: proc (s: ptr AVCodecContext, src: ptr AVFrame, offset: array[AV_NUM_DATA_POINTERS, int], y: int, type1: int, height: int )
    get_format: proc (s: ptr AVCodecContext, fmt: ptr AVPixelFormat): AVPixelFormat
    max_b_frames: int
    b_quant_factor: float
    b_quant_offset: float
    has_b_frames: int
    i_quant_factor: float
    i_quant_offset: float
    lumi_masking: float
    temporal_cplx_masking: float
    spatial_cplx_masking: float
    p_masking: float
    dark_masking: float
    slice_count: int
    slice_offset: ptr int
    sample_aspect_ratio: AVRational
    me_cmp: int
    me_sub_cmp: int
    mb_cmp: int
    ildct_cmp: int
    dia_size: int
    last_predictor_count: int
    me_pre_cmp: int
    pre_dia_size: int
    me_subpel_quality: int
    me_range: int
    slice_flags: int
    mb_decision: int
    intra_matrix: ptr uint16
    inter_matrix: ptr uint16
    intra_dc_precision: int
    skip_top: int
    skip_bottom: int
    mb_lmin: int
    mb_lmax: int
    bidir_refine: int
    keyint_min: int
    refs: int
    mv0_threshold: int
    color_primaries: AVColorPrimaties
    color_trc: AVColorTransferCharacteristic
    colorspace: AVColorSpace
    color_range: AVColorRange
    chroma_sample_location: AVChromaLocation
    slices: int
    field_order: AVFieldOrder
    sample_rate: int
    channels: int
    sample_fmt: AVSampleFormat
    frame_size: int
    frame_number: int
    block_align: int
    cutoff: int
    channel_layout: uint64
    request_channel_layout: uint64
    audio_service_type: AVAudioServiceType
    request_sample_fmt: AVSampleFormat
    get_buffer2: proc (s: ptr AVCodecContext, frame: ptr AVFrame, flags: int): int
    refcounted_frames {.deprecated.} : int
    qcompress: float
    qblur: float
    qmin: int
    qmax: int
    max_qdiff: int
    rc_buffer_size: int
    rc_override_count: int
    rc_override: ptr RcOverride
    rc_max_rate: int64
    rc_min_rate: int64
    rc_max_available_vbv_use: float
    rc_min_vbv_overflow_use: float
    rc_initial_buffer_occupancy: int
    trellis: int
    stats_out: ptr char
    stats_in: ptr char
    workaround_bugs: int
    strict_std_compliance: int
    error_concealment: int
    debug: int
    err_recognition: int
    reordered_opaque: int64
    hwaccel: ptr AVHWAccel
    hwaccel_context: pointer
    error: array[AV_NUM_DATA_POINTERS, uint64]
    dct_algo: int
    idct_algo: int
    bits_per_coded_sample: int
    bits_per_raw_sample: int
    thread_count: int
    thread_type: int
    active_thread_type: int
    thread_safe_callbacks: int
    execute: proc (c: ptr AVCodecContext, `func`: proc (c2: ptr AVCodecContext, arg: pointer): int, arg2: pointer, ret: ptr int, count: int, size: int): int
    execute2: proc (c: ptr AVCodecContext, `func`: proc (c2: ptr AVCodecContext, arg: pointer, jobnr: int, threadnr: int): int, arg2: pointer, ret: ptr int, count: int): int
    nsse_weight: int
    profile: int
    level: int
    skip_loop_filter: AVDiscard
    skip_idct: AVDiscard
    skip_frame: AVDiscard
    subtitle_header: ptr uint8
    subtitle_header_size: int
    initial_padding: int
    framerate: AVRational
    sw_pix_fmt: AVPixelFormat
    pkt_timebase: AVRational
    codec_descriptor: ptr AVCodecDescriptor #const
    pts_correction_num_faulty_pts: int64
    pts_correction_num_faulty_dts: int64
    pts_correction_last_pts: int64
    pts_correction_last_dts: int64
    sub_charenc: ptr char
    sub_charenc_mode: int
    skip_alpha: int
    seek_preroll: int
    chroma_intra_matrix: ptr uint16
    dump_separator: ptr uint8
    codec_whitelist: ptr char
    properties: uint32 # unsigned == uint32 ?
    coded_side_data: ptr AVPacketSideData
    nb_coded_side_data: int
    hw_frames_ctx: ptr AVBufferRef
    sub_text_format: int
    trailing_padding: int
    max_pixels: int64
    hw_device_ctx: ptr AVBufferRef
    hwaccel_flags: int
    apply_cropping: int
    extra_hw_frames: int
    discard_damaged_percentage: int
    max_samples: int64
    export_side_data: int

    when defined(FF_API_PRIVATE_OPT):
      b_frame_strategy {.deprecated.}: cint
      mpeg_quant {.deprecated.}: cint
      prediction_method {.deprecated.}: cint # 謎の定数も定義されてる
      pre_me {.deprecated.}: cint
      scenechange_threshold {.deprecated.}: cint
      noise_reduction {.deprecated.}: cint
      me_penalty_compensation {.deprecated.}: cint
      brd_scale {.deprecated.}: cint
      chromaoffset {.deprecated.}: cint
      b_sensitivity {.deprecated.}: cint
      coder_type {.deprecated.}: cint
      context_model {.deprecated.}: cint
      frame_skip_threshold {.deprecated.}: cint
      frame_skip_factor {.deprecated.}: cint
      frame_skip_exp {.deprecated.}: cint
      frame_skip_cmp {.deprecated.}: cint
      min_prediction_order {.deprecated.}: cint
      max_prediction_order {.deprecated.}: cint
      timecode_frame_start {.deprecated.}: clonglong # int64
      rtp_payload_size {.deprecated.}: cint

    when defined(FF_API_RTP_CALLBACK):
      rtp_callback {.deprecated.}: proc (avctx: ptr AVCodecContext, data: pointer, size: int, mb_nb: int)

    when defined(FF_API_STAT_BITS):
      mv_bits {.deprecated.}: cint
      header_bits {.deprecated.}: cint
      i_tex_bits {.deprecated.}: cint
      p_text_bits {.deprecated.}: cint
      i_count {.deprecated.}: cint
      p_count {.deprecated.}: cint
      skip_count {.deprecated.}: cint
      misc_bits {.deprecated.}: cint
      frame_bits {.deprecated.}: cint

    # if: FF_API_DEBUG_MV & else
    debug_mv: int

    # if: FF_API_LOWRES & else
    lowres: int

    when defined(FF_API_CODED_FRAME):
      coded_frame {.deprecated.}: ptr AVFrame

    when defined(FF_API_VBV_DELAY):
      vbv_delay {.deprecated.}: uint64

    when defined(FF_API_SIDEDATA_ONLY_PKT):
      side_data_only_packets: int

  AVSubtitle* = object
    format: uint16
    start_display_time: uint32
    end_display_time: uint32
    num_rects: uint32 # unsigned
    rects: ptr ptr AVSubtitleRect
    pts: int64

  MpegEncContext* = object

  AVHWAccel* = object
    name: ptr char
    `type`: AVMediaType
    id: AVCodecID
    pix_fmt: AVPixelFormat
    capabilities: int
    alloc_frame: proc (avctx: ptr AVCodecContext, frame: ptr AVFrame): int
    start_frame: proc (avctx: ptr AVCodecContext, buf: ptr uint8, buf_size: uint32): int
    decode_params: proc (avctx: ptr AVCodecContext, typ: int, buf: ptr uint8, buf_size: uint32): int
    decode_slice: proc (avctx: ptr AVCodecContext, buf: ptr uint8, buf_size: uint32): int
    end_frame: proc (avctx: ptr AVCodecContext): int
    frame_priv_data_size: int
    decode_mb: proc (s: ptr MpegEncContext) # 怪しい
    init: proc (avctx: ptr AVCodecContext): int
    uninit: proc (avctx: ptr AVCodecContext): int
    priv_data_size: int
    caps_internal: int
    frame_params: proc (avctx: ptr AVCodecContext, hw_frames_ctx: ptr AVBufferRef): int
  
  AVSubtitleType* = enum
    SUBTITLE_NONE
    SUBTITLE_BITMAP
    SUBTITLE_TEXT
    SUBTITLE_ASS
  
  AVSubtitleRect* = object
    x: int
    y: int
    w: int
    h: int
    nb_colors: int
    data: array[4, ptr uint8]
    linesize: array[4, int]
    `type`: AVSubtitleType
    text: ptr char
    ass: ptr char
    flags: int
    when defined(FF_API_AVPICTURE):
      pict {.deprecated.}: AVPicture
  
  AVPictureStructure* = enum
    AV_PICTURE_STRUCTURE_UNKNOWN
    AV_PICTURE_STRUCTURE_TOP_FIELD
    AV_PICTURE_STRUCTURE_BOTTOM_FIELD
    AV_PICTURE_STRUCTURE_FRAME
  
  AVCodecParserContext* = object
    priv_data: pointer
    parser: ptr AVCodecParser
    frame_offset: int64
    cur_offset: int64
    next_frame_offset: int64
    pict_type: int
    repeat_pict: int
    pts: int64
    dts: int64
    last_pts: int64
    last_dts: int64
    fetch_timestamp: int
    cur_frame_start_index: int
    cur_frame_offset: array[AV_PARSER_PTS_NB, int64]
    cur_frame_pts: array[AV_PARSER_PTS_NB, int64]
    cur_frame_dts: array[AV_PARSER_PTS_NB, int64]
    flags: int
    offset: int64
    cur_frame_end: array[AV_PARSER_PTS_NB, int64]
    key_frame: int
    dts_sync_point: int
    dts_ref_dts_delta: int
    pts_dts_delta: int
    cur_frame_pos: array[AV_PARSER_PTS_NB, int64]
    pos: int64
    last_pos: int64
    duration: int
    field_order: AVFieldOrder
    picture_structure: AVPictureStructure
    output_picture_number: int
    width: int
    height: int
    coded_width: int
    coded_height: int
    format: int
    when defined(FF_API_CONVERGENCE_DURATION):
      convergence_duration {.deprecated.}: int64
  
  AVCodecParser* = object
    codec_ids: array[5, int]
    priv_data_size: int
    parser_init: proc (s: ptr AVCodecParserContext): int
    parser_parse: proc (s: ptr AVCodecParserContext, avctx: ptr AVCodecContext, poutbuf: ptr ptr uint8, poutbuf_size: ptr int, buf: ptr uint8, buf_size: int): int
    parser_close: proc (s: ptr AVCodecParserContext)
    split: proc (avctx: ptr AVCodecContext, buf: ptr uint8, buf_size: int): int
    next: ptr AVCodecParser

proc avcodec_version* (): cuint
proc avcodec_configuration* (): ptr cchar
proc avcodec_license* (): cchar
proc avcodec_alloc_context3* (codec: ptr AVCodec): ptr AVCodecContext
proc avcodec_free_context* (avctx: ptr ptr AVCodecContext)
proc avcodec_get_class* (): ptr AVClass
proc avcodec_parameters_from_context* (par: ptr AVCodecParameters, codec: ptr AVCodecContext): cint
proc avcodec_parameters_to_context* (codec: ptr AVCodecContext, par: ptr AVCodecParameters): int
proc avcodec_open2* (avctx: ptr AVCodecContext, codec: ptr AVCodec, options: ptr ptr AVDictionary): int
proc avcodec_close* (avctx: ptr AVCodecContext): int
proc avsubtitle_free* (sub: ptr AVSubtitle)
proc avcodec_default_get_buffer2* (s: ptr AVCodecContext, frame: ptr AVFrame, flags: int): int
proc avcodec_align_dimensions* (s: ptr AVCodecContext, width: ptr int, height: ptr int)
proc avcodec_align_dimensions2* (s: ptr AVCodecContext, width: ptr int, height: ptr int, linesize_align: array[AV_NUM_DATA_POINTERS, int])
proc avcodec_enum_to_chroma_pos* (xpos: ptr int, ypos: ptr int, pos: AVChromaLocation): int
proc avcodec_chroma_pos_to_enum* (xpos: int, ypos: int): AVChromaLocation
proc avcodec_decode_audio4* (avctx: ptr AVCodecContext, frame: ptr AVFrame, got_frame_ptr: ptr int, avpkt: ptr AVPacket): int {.deprecated.}
proc avcodec_decode_video2* (avctx: ptr AVCodecContext, picture: ptr AVFrame, got_picture_ptr: ptr int, avpkt: ptr AVPacket): int {.deprecated.}
proc avcodec_decode_subtitle2* (avctx: ptr AVCodecContext, sub: ptr AVSubtitle, got_sub_ptr: ptr int, avpkt: ptr AVPacket): int
proc avcodec_send_packet* (avctx: ptr AVCodecContext, avpkt: ptr AVPacket): int
proc avcodec_receive_frame* (avctx: ptr AVCodecContext, frame: ptr AVFrame): int
proc avcodec_send_frame* (avctx: ptr AVCodecContext, frame: ptr AVFrame): int
proc avcodec_receive_packet* (avctx: ptr AVCodecContext, avpkt: ptr AVPacket): int
proc avcodec_get_hw_frames_parameters* (avctx: ptr AVCodecContext, device_ref: ptr AVBufferRef, hw_pix_fmt: AVPixelFormat, out_frames_ref: ptr ptr AVBufferRef): int
proc av_parser_iterate* (opaque: ptr pointer): ptr AVCodecParser
proc av_parser_next* (c: ptr AVCodecParser): ptr AVCodecParser {.deprecated.}
proc av_register_codec_parser* (parser: ptr AVCodecParser) {.deprecated.}
proc av_parser_init* (codec_id: int): ptr AVCodecParserContext
proc av_parser_parse2* (s: ptr AVCodecParserContext, avctx: ptr AVCodecContext, poutbuf: ptr ptr uint8, poutbuf_size: ptr int, buf: ptr uint8, buf_size: int, pts: int64, dts: int64, pos: int64): int
proc av_parser_change* (s: ptr AVCodecParserContext, avctx: ptr AVCodecContext, poutbuf: ptr ptr uint8, poutbuf_size: ptr int, buf: ptr uint8, buf_size: int, keyframe: int): int
proc av_parser_close* (s: ptr AVCodecParserContext)
proc avcodec_encode_audio2* (avctx: ptr AVCodecContext, avpkt: ptr AVPacket, frame: ptr AVFrame, got_packet_ptr: ptr int): int
proc avcodec_encode_video2* (avctx: ptr AVCodecContext, avpkt: ptr AVPacket, frame: ptr AVFrame, got_packet_ptr: ptr int): int
proc avcodec_encode_subtitle* (avctx: ptr AVCodecContext, buf: ptr uint8, buf_size: int, sub: ptr AVSubtitle): int
proc avcodec_pix_fmt_to_codec_tag* (pix_fmt: AVPixelFormat): uint
proc avcodec_get_pix_fmt_loss* (dst_pix_fmt: AVPixelFormat, src_pix_fmt: AVPixelFormat, has_alpha: int): int {.deprecated.}
proc avcodec_find_best_pix_fmt_of_list* (pix_fmt_list: ptr AVPixelFormat, src_pix_fmt: AVPixelFormat, has_alpha: int, loss_ptr: ptr int): AVPixelFormat
proc avcodec_find_best_pix_fmt_of_2* (dst_pix_fmt1: AVPixelFormat, dst_pix_fmt2: AVPixelFormat, src_pix_fmt: AVPixelFormat, has_alpha: int, loss_ptr: ptr int): AVPixelFormat {.deprecated.}
proc avcodec_find_best_pix_fmt2* (dst_pix_fmt1: AVPixelFormat, dst_pix_fmt2: AVPixelFormat, src_pix_fmt: AVPixelFormat, has_alpha: int, loss_ptr: ptr int): AVPixelFormat {.deprecated.}
proc avcodec_default_get_format* (s: ptr AVCodecContext, fmt: ptr AVPixelFormat): AVPixelFormat
proc avcodec_string* (buf: ptr char, buf_size: int, enc: ptr AVCodecContext, encode: int)
proc av_get_profile_name* (codec: ptr AVCodec, profile: int): ptr char
proc avcodec_profile_name* (codec_id: AVCodecID, profile: int): ptr char
proc avcodec_default_execute* (c: ptr AVCodecContext, `func`: proc (c2: ptr AVCodecContext, arg2: pointer): int, arg: pointer, ret: ptr int, count: int, size: int): int
proc avcodec_default_execute2* (c: ptr AVCodecContext, `func`: proc (c2: ptr AVCodecContext, arg2: pointer, a3: int, a4: int): int, arg: pointer, ret: ptr int, count: ptr int): int
proc avcodec_fill_audio_frame* (frame: ptr AVFrame, nb_channels: int, sample_fmt: AVSampleFormat, buf: ptr uint8, buf_size: int, align: int): int
proc avcodec_flush_buffers* (avctx: ptr AVCodecContext)
proc av_get_bits_per_sample* (codec_id: AVCodecID): int
proc av_get_pcm_codec* (fmt: AVSampleFormat, be: int): AVCodecID
proc av_get_exact_bits_per_sample* (codec_id: AVCodecID): int
proc av_get_audio_frame_duration* (avvctx: ptr AVCodecContext, frame_bytes: int): int
proc av_get_audio_frame_duration2* (par: ptr AVCodecParameters, frame_bytes: int): int
proc av_fast_padded_malloc* (`ptr`: pointer, size: ptr uint, min_size: uint)
proc av_fast_padded_mallocz* (`ptr`: pointer, size: ptr uint, min_size: uint)
proc av_xiphlacing* (s: ptr char, v: uint): uint
proc avcodec_is_open* (s: ptr AVCodecContext): int
proc av_cpb_properties_alloc* (size: csize_t): ptr AVCPBProperties

when defined(FF_API_CODEC_GET_SET):
  proc av_codec_get_pkt_timebase* (avctx: ptr AVCodecContext): AVRational {.deprecated.}
  proc av_codec_set_pkt_timebase* (avctx: ptr AVCodecContext, val: AVRational) {.deprecated.}
  # const AVCodecDescriptor *av_codec_get_codec_descriptor(const AVCodecContext *avctx);
  proc av_codec_set_codec_descriptor* (avctx: ptr AVCodecContext, desc: ptr AVCodecDescriptor) {.deprecated.}
  proc av_codec_get_codec_properties* (avctx: ptr AVCodecContext): uint32

  when defined(FF_API_LOWRES):
    proc av_codec_get_lowres* (avctx: ptr AVCodecContext): int {.deprecated.}
    proc av_codec_set_lowres* (avctx: ptr AVCodecContext, val: int) {.deprecated.}
  
  proc av_codec_get_seek_preroll* (avctx: ptr AVCodecContext): int {.deprecated.}
  proc av_codec_set_seek_preroll* (avctx: ptr AVCodecContext, val: int) {.deprecated.}
  # uint16_t *av_codec_get_chroma_intra_matrix(const AVCodecContext *avctx);
  proc av_codec_set_chroma_intra_matrix* (avctx: ptr AVCodecContext, val: ptr uint16) {.deprecated.}
  proc av_codec_get_max_lowres* (codec: ptr AVCodec): int {.deprecated.}

when defined(FF_API_AVPICTURE):
  type
    AVPicture* {.deprecated.} = object
      data {.deprecated.}: array[AV_NUM_DATA_POINTERS, uint8]
      linesize {.deprecated.}: array[AV_NUM_DATA_POINTERS, int]
  
  proc avpicture_alloc* (picture: ptr AVPicture, pix_fmt: AVPixelFormat, width: int, height: int): int {.deprecated.}
  proc avpicture_free* (picture: ptr AVPicture) {.deprecated.}
  proc avpicture_fill* (picture: ptr AVPicture, `ptr`: ptr uint8, pix_fmt: AVPixelFormat, width: int, height: int): int {.deprecated.}
  proc avpicture_layout* (src: ptr AVPicture, pix_fmt: AVPixelFormat, width: int, height: int, dest: ptr char, dest_size: int): int {.deprecated.}
  proc avpicture_get_size* (pix_fmt: AVPixelFormat, width: int, height: int): int {.deprecated.}
  proc av_picture_copy* (dst: ptr AVPicture, src: ptr AVPicture, pix_fmt: AVPixelFormat, width: int, height: int) {.deprecated.}
  proc av_picture_crop* (dst: ptr AVPicture, src: ptr AVPicture, pix_fmt: AVPixelFormat, top_band: int, left_band: int): int {.deprecated.}
  proc av_picture_pad* (dst: ptr AVPicture, src: ptr AVPicture, height: int, width: innt, pix_fmt: AVPixelFormat, padtop: int, padbottom: int, padleft: int, padright: int, color: ptr int): int {.deprecated.}

when defined(FF_API_NEXT):
  # AVCodec *av_codec_next(const AVCodec *c); deprecated
  proc avcodec_register* (codec: ptr AVCodec) {.deprecated.}
  proc avcodec_register_all* () {.deprecated.}
  # const AVBitStreamFilter *av_bsf_next(void **opaque); deprecated

when defined(FF_API_GET_CONTEXT_DEFAULTS):
  proc avcodec_get_context_defaults3* (s: ptr AVCodecContext, codec: ptr AVCodec): int

when defined(FF_API_COPY_CONTEXT):
  # const AVClass *avcodec_get_frame_class(void);
  # const AVClass *avcodec_get_subtitle_rect_class(void);
  proc avcodec_copy_context* (dest: ptr AVCodecContext, src: ptr AVCodecContext): int {.deprecated.}

when defined(FF_API_GETCHROMA):
  proc avcodec_get_chroma_sub_sample(pix_fmt: AVPixelFormat, h_shift: ptr int, v_shift: ptr int) {.deprecated.}

when defined(FF_API_TAG_STRING):
  proc av_get_codec_tag_string* (buf: ptr char, buf_size: uint #[size_t]#, codec_tag: uint): uint #[size_t]# {.deprecated.}

when defined(FF_API_OLD_BSF):
  type
    AVBitStreamFilterContext* = object
      priv_data: ptr void
      filter: ptr AVBitStreamFilter
      parser: ptr AVCodecParserContext
      next: ptr AVBitStreamFilterContext
      args: ptr char
  
  proc av_register_bitstream_filter* (bsf: ptr AVBitStreamFilter) {.deprecated.}
  # AVBitStreamFilterContext *av_bitstream_filter_init(const char *name);
  proc av_bitstream_filter_filter* (bsfc: ptr AVBitStreamFilterContext, avctx: ptr AVCodecContext, args: ptr char, poutbuf: ptr ptr uint8, poutbuf_size: int, buf: ptr uint8, buf_size: int, keyframe: int): int {.deprecated.}
  proc av_bitstream_filter_close* (bsf: ptr AVBitStreamFilterContext) {.deprecated.}
  # const AVBitStreamFilter *av_bitstream_filter_next(const AVBitStreamFilter *f);

when defined(FF_API_USER_VISIBLE_AVHWACCEL):
  proc av_register_hwaccel* (hwaccel: ptr AVHWAccel) {.deprecated.}
  # AVHWAccel *av_hwaccel_next(const AVHWAccel *hwaccel); {.deprecated.}

when defined(FF_API_LOCKMGR):
  type
    AVLockOp* {.deprecated.} = enum
      AV_LOCK_CREATE
      AV_LOCK_OBTAIN
      AV_LOCK_RELEASE
      AV_LOCK_DESTROY
  
  proc av_lockmgr_register* (cb: proc (mutex: ptr ptr void, op: AVLockOp)): int

when defined(FF_API_DEBUG_MV):
  const
    FF_DEBUG_MV* {.deprecated.} = 32
    FF_DEBUG_VIS_QP* = 0x00002000
    FF_DEBUG_VIS_MB_TYPE* = 0x00004000
    FF_DEBUG_VIS_MV_P_FOR* = 0x00000001
    FF_DEBUG_VIS_MV_B_FOR* = 0x00000002
    FF_DEBUG_VIS_MV_B_BACK* = 0x00000004