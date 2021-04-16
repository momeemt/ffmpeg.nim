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
{.pragma: avformat, importc, header: "<libavformat/avformat.h>".}
{.pragma: avio, importc, header: "<libavformat/avio.h>".}
{.pragma: avresample, importc, header: "<libavresample/avresample.h>".}
{.pragma: aes_ctr, importc, header: "<libavutil/aes_ctr.h>".}
{.pragma: aes, importc, header: "<libavutil/aes.h>".}
{.pragma: audio_fifo, importc, header: "<libavutil/audio_fifo.h>".}
{.pragma: avstring, importc, header: "<libavutil/avstring.h>".}
{.pragma: avutil, importc, header: "<libavutil/avutil.h>".}
{.pragma: blowfish, importc, header: "<libavutil/blowfish.h>".}
{.pragma: bprint, importc, header: "<libavutil/bprint.h>".}
{.pragma: buffer, importc, header: "<libavutil/buffer.h>".}
{.pragma: camellia, importc, header: "<libavutil/camellia.h>".}
{.pragma: cast5, importc, header: "<libavutil/cast5.h>".}
{.pragma: channel_layout, importc, header: "<libavutil/channel_layout.h>".}
{.pragma: crc, importc, header: "<libavutil/crc.h>".}
{.pragma: des, importc, header: "<libavutil/des.h>".}
{.pragma: dict, importc, header: "<libavutil/dict.h>".}
{.pragma: dovi_meta, header: "<libavutil/dovi_meta.h>".}
{.pragma: downmin_info, importc, header: "<libavutil/downmin_info.h>".}
{.pragma: encryption_info, importc, header: "<libavutil/encryption_info.h>".}
{.pragma: eval, importc, header: "<libavutil/eval.h>".}
{.pragma: fifo, importc, header: "<libavutil/fifo.h>".}
{.pragma: frame, importc, header: "<libavutil/frame.h>".}
{.pragma: hash, importc, header: "<libavutil/hash.h>".}
{.pragma: hdr_dynamic_metadata, importc, header: "<libavutil/hdr_dynamic_metadata.h>".}
{.pragma: hmac, importc, header: "<libavutil/hmac.h>".}
{.pragma: cuda, importc, header: "<cuda.h>".}
{.pragma: hwcontext_cuda, importc, header: "<libavutil/hwcontext_cuda.h>".}
{.pragma: hwcontext_drm, importc, header: "<libavutil/hwcontext_drm.h>".}
{.pragma: hwcontext_mediacodec, importc, header: "libavutil/hwcontext_mediacodec.h".}

when defined(macosx):
  {.pragma: hwcontext_opencl_include, importc, header: "<OpenCL/cl.h>".}
else:
  {.pragma: hwcontext_opencl_include, importc, header: "<CL/cl.h>".}

{.pragma: hwcontext_opencl, importc, header: "<libavutil/hwcontext_opencl.h>".}
{.pragma: vulkan, importc, header: "<vulkan/vulkan.h>".}
{.pragma: hwcontext_vulkan, importc, header: "<libavutil/hwcontext_vulkan.h>".}
{.pragma: hwcontext, importc, header: "<libavutil/hwcontext.h>".}
{.pragma: intfloat, importc, header: "<libavutil/intfloat.h>".}
{.pragma: intreadwrite, importc, header: "<libavutil/intreadwrite.h>".}
{.pragma: lfg, importc, header: "<libavutil/lfg.h>".}
{.pragma: mastering_display_metadata, importc, header: "<libavutil/mastering_display_metadata.h>".}
{.pragma: mathmatics, importc, header: "<libavutil/mathmatics.h>".}
{.pragma: md5, importc, header: "<libavutil/md5.h>".}
{.pragma: motion_vector, importc, header: "<libavutil/motion_vector.h>".}
{.pragma: murmur3, importc, header: "<libavutil/murmur3.h>".}
{.pragma: opt, importc, header: "<libavutil/opt.h>".}
{.pragma: log, importc, header: "<libavutil/log.h>".}
{.pragma: pixdesc, importc, header: "<libavutil/pixdesc.h>".}
{.pragma: pixelutils, importc, header: "<libavutil/pixelutils.h>".}
{.pragma: pixfmt, importc, header: "<libavutil/pixfmt.h>".}
{.pragma: rational, importc, header: "<libavutil/rational.h>".}
{.pragma: rc4, importc, header: "<libavutil/rc4.h>".}
{.pragma: replaygain, importc, header: "<libavutil/replaygain.h>".}
{.pragma: ripemd, importc, header: "<libavutil/ripemd.h>".}
{.pragma: samplefmt, importc, header: "<libavutil/samplefmt.h>".}
{.pragma: sha, importc, header: "<libavutil/sha.h>".}
{.pragma: sha512, importc, header: "<libavutil/sha512.h>".}
{.pragma: spherical, importc, header: "<libavutil/spherical.h>".}
{.pragma: stereo3d, importc, header: "<libavutil/stereo3d.h>".}
{.pragma: tea, importc, header: "<libavutil/tea.h>".}
{.pragma: threadmessage, importc, header: "<libavutil/threadmessage.h>".}
{.pragma: timecode, importc, header: "<libavutil/timecode.h>".}
{.pragma: tree, importc, header: "<libavutil/tree.h>".}
{.pragma: twofish, importc, header: "<libavutil/twofish.h>".}
{.pragma: tx, importc, header: "<libavutil/tx.h>".}
{.pragma: video_enc_params, importc, header: "<libavutil/video_enc_params.h>".}
{.pragma: postprocess, importc, header: "<libpostproc/postprocess.h>".}
{.pragma: swresample, importc, header: "<libswresample/swresample.h>".}
{.pragma: swscale, importc, header: "<libswscale/swscale.h>".}

template MKBETAG (a, b, c, d: untyped): untyped =
  (d.int or (c.int shl 8) or (b.int shl 16) or (a.int shl 24))

const
  AV_NUM_DATA_POINTERS = 8
  AV_PARSER_PTS_NB = 4
  MAX_REORDER_DELAY= 16
  MAX_STD_TIMEBASES = 30 * 12 + 30 + 3 + 6
  AV_BF_ROUNDS = 16
  AV_DRM_MAX_PLANES = 4

# undefined symbol
type
  AVCodecHWConfigInternal* = object
  ID3D11VideoDecoder* = object
  ID3D11VideoContext* = object
  D3D11_VIDEO_DECODER_CONFIG* = object
  ID3D11VideoDecoderOutputView* = object
  HANDLE* = object
  IDirectXVideoDecoder* = object
  DXVA2_ConfigPictureDecode* = object
  LPDIRECT3DSURFACE9* = object
  AVMediaCodecBuffer* = object
  mfxSession* = object
  mfxExtBuffer* = object

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

  AVCodecContext* {.avcodec, bycopy.} = object
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
    draw_hotiz_band*: proc (s: ptr AVCodecContext, src: ptr AVFrame, offset: array[AV_NUM_DATA_POINTERS, cint], y, `type`, height: cint) {.cdecl.}
    get_format*: proc (s: ptr AVCodecContext, fmt: ptr AVPixelFormat): AVPixelFormat {.cdecl.}
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
    get_buffer2*: proc (s: ptr AVCodecContext, frame: ptr AVFrame, flags: cint): cint {.cdecl.}
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
    execute*: proc (c: ptr AVCodecContext, `func`: proc (c2: ptr AVCodecContext, arg: pointer): cint, arg2: pointer, ret: ptr cint, count: cint, size: cint): cint {.cdecl.}
    execute2*: proc (c: ptr AVCodecContext, `func`: proc (c2: ptr AVCodecContext, arg: pointer, jobnr: cint, threadnr: cint): cint, arg2: pointer, ret: ptr cint, count: cint): cint {.cdecl.}
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
      rtp_callback* {.deprecated.}: proc (avctx: ptr AVCodecContext, data: pointer, size: cint, mb_nb: cint) {.cdecl.}

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

  MpegEncContext* {.avcodec, bycopy.} = object

  AVHWAccel* {.avcodec, bycopy.} = object
    name*: ptr cchar
    `type`*: AVMediaType
    id*: AVCodecID
    pix_fmt*: AVPixelFormat
    capabilities*: cint
    alloc_frame*: proc (avctx: ptr AVCodecContext, frame: ptr AVFrame): cint {.cdecl.}
    start_frame*: proc (avctx: ptr AVCodecContext, buf: ptr uint8, buf_size: uint32): cint {.cdecl.}
    decode_params*: proc (avctx: ptr AVCodecContext, typ: cint, buf: ptr uint8, buf_size: uint32): cint {.cdecl.}
    decode_slice*: proc (avctx: ptr AVCodecContext, buf: ptr uint8, buf_size: uint32): cint {.cdecl.}
    end_frame*: proc (avctx: ptr AVCodecContext): cint {.cdecl.}
    frame_priv_data_size*: cint
    decode_mb*: proc (s: ptr MpegEncContext) {.cdecl.} # 怪しい
    init*: proc (avctx: ptr AVCodecContext): cint {.cdecl.}
    uninit*: proc (avctx: ptr AVCodecContext): cint {.cdecl.}
    priv_data_size*: cint
    caps_internal*: cint
    frame_params*: proc (avctx: ptr AVCodecContext, hw_frames_ctx: ptr AVBufferRef): cint {.cdecl.}
  
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
    linesize*: array[4, cint]
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
    pict_type*: cint
    repeat_pict*: cint
    pts*: int64
    dts*: int64
    last_pts*: int64
    last_dts*: int64
    fetch_timestamp*: cint
    cur_frame_start_index*: cint
    cur_frame_offset*: array[AV_PARSER_PTS_NB, int64]
    cur_frame_pts*: array[AV_PARSER_PTS_NB, int64]
    cur_frame_dts*: array[AV_PARSER_PTS_NB, int64]
    flags*: cint
    offset*: int64
    cur_frame_end*: array[AV_PARSER_PTS_NB, int64]
    key_frame*: cint
    dts_sync_point*: cint
    dts_ref_dts_delta*: cint
    pts_dts_delta*: cint
    cur_frame_pos*: array[AV_PARSER_PTS_NB, int64]
    pos*: int64
    last_pos*: int64
    duration*: cint
    field_order*: AVFieldOrder
    picture_structure*: AVPictureStructure
    output_picture_number*: cint
    width*: cint
    height*: cint
    coded_width*: cint
    coded_height*: cint
    format*: cint
    when defined(FF_API_CONVERGENCE_DURATION):
      convergence_duration* {.deprecated.}: int64
  
  AVCodecParser* {.avcodec.} = object
    codec_ids*: array[5, cint]
    priv_data_size*: cint
    parser_init*: proc (s: ptr AVCodecParserContext): cint {.cdecl.}
    parser_parse*: proc (s: ptr AVCodecParserContext, avctx: ptr AVCodecContext, poutbuf: ptr ptr uint8, poutbuf_size: ptr cint, buf: ptr uint8, buf_size: cint): cint {.cdecl.}
    parser_close*: proc (s: ptr AVCodecParserContext) {.cdecl.}
    split*: proc (avctx: ptr AVCodecContext, buf: ptr uint8, buf_size: cint): cint {.cdecl.}
    next*: ptr AVCodecParser
  
  AVDCT* {.avdct, bycopy.} = object
    av_class*: ptr AVClass
    idct*: proc (`block`: ptr int16) {.cdecl.}
    idct_permutation*: array[64, uint8]
    fdct*: proc (`block`: ptr int16) {.cdecl.}
    dct_algo*: cint
    idct_algo*: cint
    get_pixels*: proc (`block`: ptr int16, pixels: ptr uint8, line_size: csize_t) {.cdecl.}
    bits_per_sample*: cint
    get_pixels_unaligned*: proc (`block`: ptr int16, pixels: ptr uint8, line_size: csize_t) {.cdecl.}
  
  FFTSample* {.avfft.} = cfloat

  FFTComplex* {.avfft, bycopy.} = object
    re, im: FFTSample

  FFTContext* {.avfft.} = object

  RDFTransformType* {.avfft, size: sizeof(cint).} = enum
    DFT_R2C
    IDFT_C2R
    IDFT_R2C
    DFT_C2R

  RDFTContext* {.avfft.} = object

  DCTContext* {.avfft.} = object

  DCTTransformType* {.avfft, size: sizeof(cint).} = enum
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
    init*: proc (ctx: ptr AVBSFContext): cint {.cdecl.}
    filter*: proc (ctx: ptr AVBSFContext, pkt: ptr AVPacket): cint {.cdecl.}
    close*: proc (ctx: AVBSFContext) {.cdecl.}
    flush*: proc (ctx: AVBSFContext) {.cdecl.}
  
  AVBSFList* {.bsf.} = object

  AVCodecDescriptor* {.codecDesc.} = object
    id*: AVCodecID
    `type`*: AVMediaType
    name*: cstring
    long_name*: cstring
    props*: cint
    mime_types*: cstringArray
    profiles*: ptr AVProfile

  AVCodecID* {.codecId, size: sizeof(cint).} = enum
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
  
  AVProfile* {.codec, bycopy.} = object
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
    update_thread_context*: proc (dst, src: ptr AVCodecContext): cint {.cdecl.}
    defaults*: ptr AVCodecDefault
    init_static_data*: proc (codec: ptr AVCodec) {.cdecl.}
    init*: proc (a1: ptr AVCodecContext): cint {.cdecl.}
    encode_sub*: proc (a1: ptr AVCodecContext, buf: ptr uint8, buf_size: cint, sub: ptr AVSubtitle): cint {.cdecl.}
    encode2*: proc (avctx: ptr AVCodecContext, avpkt: ptr AVPacket, frame: ptr AVFrame, got_packet_ptr: ptr cint): cint {.cdecl.}
    decode*: proc (a1: ptr AVCodecContext, outdata: pointer, outdata_size: ptr cint, acpkt: ptr AVPacket): cint {.cdecl.}
    close*: proc (a1: ptr AVCodecContext): cint {.cdecl.}
    send_frame*: proc (avctx: ptr AVCodecContext, frame: ptr AVFrame): cint {.cdecl.}
    receive_packet*: proc (avctx: ptr AVCodecContext, avpkt: ptr AVPacket): cint {.cdecl.}
    receive_frame*: proc (avctx: ptr AVCodecContext, frame: ptr AVFrame): cint {.cdecl.}
    flush*: proc (a1: ptr AVCodecContext) {.cdecl.}
    caps_internal*: cint
    bsfs*: cstring
    hw_configs*: ptr ptr AVCodecHWConfigInternal
    codec_tags*: ptr cuint
  
  AVCodecHWConfig* {.codec.} = object
    pix_fmt*: AVPixelFormat
    methods*: cint
    device_type*: AVHWDeviceType
  
  DiracParseCodes* {.dirac, size: sizeof(cint).} = enum
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
  
  DiracVersionInfo* {.dirac, bycopy.} = object
    major*, minor*: cint

  AVDiracSeqHeader* {.dirac, bycopy.} = object
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
  
  AVDVProfile* {.dv_profile, bycopy.} = object
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
  
  AVMediaCodecContext* {.mediacodec, bycopy.} = object
    surface: pointer
  
  MediaCodecBuffer* {.mediacodec.} = AVMediaCodecBuffer

  AVPacketSideDataType* {.packet, size: sizeof(cint).} = enum
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
    preinit*: proc (ctx: ptr AVFilterContext): cint {.cdecl.}
    init*: proc (ctx: ptr AVFilterContext): cint {.cdecl.}
    init_dict*: proc (ctx: ptr AVFilterContext, options: ptr ptr AVDictionary): cint {.cdecl.}
    uninit*: proc (ctx: ptr AVFilterContext) {.cdecl.}
    query_formats*: proc (a1: ptr AVFilterContext): cint {.cdecl.}
    priv_size*: cint
    flags_internal*: cint
    next*: ptr AVFilter
    process_command*: proc (a1: ptr AVFilterContext, cmd, arg, res: cstring, res_len, flags: cint): cint {.cdecl.}
    init_opaque*: proc (ctx: ptr AVFilterContext, opaque: pointer): cint {.cdecl.}
    activate*: proc (ctx: ptr AVFilterContext): cint {.cdecl.}

  avfilter_action_func* {.avfilter.} = proc (ctx: ptr AVFilterContext, arg: pointer, jobnr, nb_jobs: cint): cint {.cdecl.}
  avfilter_execute_func* {.avfilter.} = proc (ctx: ptr AVFilterContext, `func`: ptr avfilter_action_func, arg: pointer, ret: ptr cint, nb_jobs: cint): cint {.cdecl.}

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
    io_open*: proc (s: ptr AVFormatContext, pb: ptr ptr AVIOContext, url: cstring, flags: cint, options: ptr ptr AVDictionary): cint {.cdecl.}
    io_close*: proc (s: ptr AVFormatContext, pb: ptr AVIOContext) {.cdecl.}
    protocol_blacklist*: cstring
    max_streams*: cint
    skip_estimate_duration_from_pts*: cint
    max_probe_packets*: cint

    when defined(FF_API_FORMAT_FILENAME):
      filename {.deprecated.}: array[1024, cstring]
    
    when defined(FF_API_OLD_OPEN_CALLBACKS):
      open_cb {.deprecated.}: proc (s: ptr AVFormatContext, p: ptr ptr AVIOContext, url: cstring, flags: cint, int_cb: ptr AVIOInterruptCB, options: ptr ptr AVDictionary): cint {.cdecl.}

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
    write_header*: proc (a1: ptr AVFormatContext): cint {.cdecl.} 
    write_packet*: proc (a1: ptr AVFormatContext, pkt: ptr AVPacket): cint {.cdecl.}
    write_trailer*: proc (a1: ptr AVFormatContext): cint {.cdecl.}
    interleave_packet*: proc (a1: ptr AVFormatContext, `out`, `in`: ptr AVPacket, flush: cint): cint {.cdecl.}
    query_codec*: proc (id: AVCodecID, std_compliance: cint): cint {.cdecl.}
    get_output_timestamp*: proc (s: ptr AVFormatContext, stream: cint, dts, wall: ptr int64) {.cdecl.}
    control_message*: proc (s: ptr AVFormatContext, `type`: cint, data: pointer, data_size: csize_t): cint {.cdecl.}
    write_uncoded_frame*: proc (a1: ptr AVFormatContext, stream_index: cint, frame: ptr ptr AVFrame, flags: cuint): cint {.cdecl.}
    get_device_list*: proc (s: ptr AVFormatContext, device_list: ptr AVDeviceInfoList): cint 
    create_device_capabilities*: proc (s: ptr AVFormatContext, caps: ptr AVDeviceCapabilitiesQuery): cint {.cdecl.}
    free_device_capabilities*: proc (s: ptr AVFormatContext, caps: ptr AVDeviceCapabilitiesQuery): cint {.cdecl.}
    data_codec*: AVCodecID
    init*: proc (a1: ptr AVFormatContext): cint {.cdecl.}
    deinit*: proc (a1: ptr AVFormatContext) {.cdecl.}
    check_bitstream*: proc (a1: ptr AVFormatContext, pkt: ptr AVPacket): cint {.cdecl.}
  
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
    read_probe*: proc (a1: ptr AVProbeData): cint {.cdecl.}
    read_header*: proc (a1: ptr AVFormatContext): cint {.cdecl.}
    read_packet*: proc (a1: ptr AVFormatContext, pkt: ptr AVPacket): cint {.cdecl.}
    read_close*: proc (a1: ptr AVFormatContext): cint {.cdecl.} 
    read_seek*: proc (a1: ptr AVFormatContext, stream_index: cint, timestamp: int64, flags: cint): cint {.cdecl.}
    read_timestamp*: proc (s: ptr AVFormatContext, stream_index: cint, pos: ptr int64, pos_limit: int64): int64 {.cdecl.}
    read_play*: proc (a1: ptr AVFormatContext): cint {.cdecl.}
    read_pause*: proc (a1: ptr AVFormatContext): cint {.cdecl.}
    read_seek2*: proc (s: ptr AVFormatContext, stream_index: cint, min_ts, ts, max_ts: int64, flags: cint): cint {.cdecl.}
    get_device_list*: proc (s: ptr AVFormatContext, device_list: ptr AVDeviceInfoList): cint {.cdecl.}
    create_device_capabilities*: proc (s: ptr AVFormatContext, caps: ptr AVDeviceCapabilitiesQuery): cint {.cdecl.}
    free_device_capabilities*: proc (s: ptr AVFormatContext, caps: ptr AVDeviceCapabilitiesQuery): cint {.cdecl.}
  
  AVStreamParseType* {.avformat, size: sizeof(cint).} = enum
    AVSTREAM_PARSE_NONE
    AVSTREAM_PARSE_FULL
    AVSTREAM_PARSE_HEADERS
    AVSTREAM_PARSE_TIMESTAMPS
    AVSTREAM_PARSE_FULL_ONCE
    AVSTREAM_PARSE_FULL_RAW
  
  AVIndexEntry* {.avformat, bycopy.} = object
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
  
  av_format_control_message* {.avformat.} = proc (s: ptr AVFormatContext, `type`: cint, data: pointer, data_size: csize_t): cint {.cdecl.}

  AVOpenCallback* {.avformat.} = proc (s: ptr AVFormatContext, pb: ptr ptr AVIOContext, url: cstring, flags: cint, int_cb: ptr AVIOInterruptCB, options: ptr ptr AVDictionary): cint {.cdecl.}

  AVDurationEstimationMethod* {.avformat, size: sizeof(cint).} = enum
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
  
  AVIOInterruptCB* {.avio, bycopy.} = object
    callback*: proc (a1: pointer): cint {.cdecl.}
    opaque*: pointer
  
  AVIODirEntryType* {.avio, size: sizeof(cint).} = enum
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

  AVIODirEntry* {.avio, bycopy.} = object
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

  AVIODirContext* {.avio, bycopy.} = object
    url_context*: ptr URLContext
  
  AVIODataMarkerType* {.avio, size: sizeof(cint).} = enum
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
    read_packet*: proc (opaque: pointer, buf: ptr uint8, buf_size: cint): cint {.cdecl.}
    write_packet*: proc (opaque: pointer, buf: ptr uint8, buf_size: cint): cint {.cdecl.}
    seek*: proc (opaque: pointer, offset: int64, whence: cint): int64 {.cdecl.}
    pos*: int64
    eof_reached*: cint
    write_flag*: cint
    max_packet_size*: cint
    checksum*: culong
    checksum_ptr*: ptr cuchar
    update_checksum*: proc (checksum: culong, buf: ptr uint8, size: cuint): culong {.cdecl.}
    error*: cint
    read_pause*: proc (opaque: pointer, pause: cint): cint {.cdecl.}
    read_seek*: proc (opaque: pointer, stream_index: cint, timestamp: int64, flags: cint): int64 {.cdecl.}
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
    write_data_type*: proc (opaque: pointer, buf: uint8, buf_size: cint, `type`: AVIODataMarkerType, time: int64): cint {.cdecl.}
    ignore_boundary_point*: cint
    current_type*: AVIODataMarkerType
    last_time*: int64
    short_seek_get*: proc (opaque: pointer): cint {.cdecl.}
    written*: int64
    buf_ptr_max*: ptr cuchar
    min_packet_size*: cint

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
  
  AVAESCTR* {.aes_ctr, bycopy.} = object

  AVAES* {.aes, bycopy.} = object

  AVAudioFifo* {.audio_fifo.} = object

  AVEscapeMode* {.avstring.} = enum
    AV_ESCAPE_MODE_AUTO
    AV_ESCAPE_MODE_BACKSLASH
    AV_ESCAPE_MODE_QUOTE
  
  AVMediaType* {.avutil, size: sizeof(cint).} = enum
    AVMEDIA_TYPE_UNKNOWN = -1
    AVMEDIA_TYPE_VIDEO
    AVMEDIA_TYPE_AUDIO
    AVMEDIA_TYPE_DATA
    AVMEDIA_TYPE_SUBTITLE
    AVMEDIA_TYPE_ATTACHMENT
    AVMEDIA_TYPE_NB
  
  AVPictureType* {.avutil, size: sizeof(cint).} = enum
    AV_PICTURE_TYPE_NONE = 0
    AV_PICTURE_TYPE_I
    AV_PICTURE_TYPE_P
    AV_PICTURE_TYPE_B
    AV_PICTURE_TYPE_S
    AV_PICTURE_TYPE_SI
    AV_PICTURE_TYPE_SP
    AV_PICTURE_TYPE_BI
  
  AVBlowfish* {.blowfish, bycopy.} = object
    p*: array[AV_BF_ROUNDS + 2, uint32]
    s*: array[4, array[256, uint32]]
  
  ff_pad_helper_AVBPrint* = object
    str*: cstring
    len*: cuint
    size*: cuint
    size_max*: cuint
    reserved_internal_buffer*: array[1, cstring]

  AVBPrint* {.bprint, bycopy.} = object
    str*: cstring
    len*: cuint
    size*: cuint
    size_max*: cuint
    reserved_internal_buffer*: array[1, cstring]
    reserved_padding*: array[1024 - sizeof(ff_pad_helper_AVBPrint), cstring]
  
  tm* {.bprint.} = object

  va_list* {.importc, header: "<stdarg.h>".} = object

  AVBuffer* {.buffer.} = object
  AVBufferRef* {.buffer, bycopy.} = object
    buffer*: ptr AVBuffer
    data*: ptr uint8
    size*: cint
  
  AVBufferPool* {.buffer.} = object

  AVCAMELLIA* {.camellia, bycopy.} = object

  AVCAST5* {.cast5, bycopy.} = object

  AVMatrixEncoding* {.channel_layout, size: sizeof(cint).} = enum
    AV_MATRIX_ENCODING_NONE
    AV_MATRIX_ENCODING_DOLBY
    AV_MATRIX_ENCODING_DPLII
    AV_MATRIX_ENCODING_DPLIIX
    AV_MATRIX_ENCODING_DPLIIZ
    AV_MATRIX_ENCODING_DOLBYEX
    AV_MATRIX_ENCODING_DOLBYHEADPHONE
    AV_MATRIX_ENCODING_NB
  
  AVCRC* {.crc.} = uint32

  AVCRCId* {.crc, size: sizeof(cint).} = enum
    AV_CRC_8_ATM
    AV_CRC_16_ANSI
    AV_CRC_16_CCITT
    AV_CRC_32_IEEE
    AV_CRC_32_IEEE_LE
    AV_CRC_16_ANSI_LE
    AV_CRC_24_IEEE
    AV_CRC_8_EBU
    AV_CRC_MAX
  
  AVDES* {.des, bycopy.} = object
    round_keys*: array[3, array[16, uint64]]
    triple_des*: cint
  
  AVDictionaryEntry* {.dict, bycopy.} = object
    key*: ptr cchar
    value*: ptr cchar
  
  AVDictionary* {.dict.} = object

  AVDOVIDecoderConfigurationRecord* {.dovi_meta.} = object
    dv_version_major*: uint8
    dv_version_minor*: uint8
    dv_profile*: uint8
    dv_level*: uint8
    rpu_present_flag*: uint8
    el_present_flag*: uint8
    bl_present_flag*: uint8
    dv_bl_signal_compatibility_id*: uint8
  
  AVDownmixType* {.downmin_info, size: sizeof(cint).} = enum
    AV_DOWNMIX_TYPE_UNKNOWN
    AV_DOWNMIX_TYPE_LORO
    AV_DOWNMIX_TYPE_LTRT
    AV_DOWNMIX_TYPE_DPLII
    AV_DOWNMIX_TYPE_NB

  AVDownmixInfo* {.downmin_info, bycopy.} = object
    preferred_downmix_type*: AVDownmixType
    center_mix_level*: cdouble
    center_mix_level_ltrt*: cdouble
    surround_mix_level*: cdouble
    surround_mix_level_ltrt*: cdouble
    lfe_mix_level*: cdouble
  
  AVSubsampleEncryptionInfo* {.encryption_info.} = object
    bytes_of_clear_data*: cuint
    bytes_of_protected_data*: cuint
  
  AVEncryptionInfo* {.encryption_info.} = object
    scheme*: cuint
    crypt_byte_block*: cuint
    skip_byte_block*: cuint
    key_id*: ptr uint8
    key_id_size*: cuint
    iv*: ptr uint8
    iv_size*: cuint
    subsamples*: ptr AVSubsampleEncryptionInfo
    subsample_count*: cuint

  AVEncryptionInitInfo* {.encryption_info.} = object
    system_id*: ptr uint8
    system_id_size*: cuint
    key_ids*: ptr ptr uint8
    num_key_ids*: cuint
    key_id_size*: cuint
    data*: ptr uint8
    data_size*: cuint
    next*: ptr AVEncryptionInitInfo
  
  AVExpr* {.eval.} = object

  AVFifoBuffer* {.fifo, bycopy.} = object
    buffer*: ptr uint8
    rptr*: ptr uint8
    wptr*: ptr uint8
    `end`*: ptr uint8
    rndx*: uint32
    wndx*: uint32
  
  AVFrameSideDataType* {.frame, size: sizeof(cint).} = enum
    AV_FRAME_DATA_PANSCAN
    AV_FRAME_DATA_A53_CC
    AV_FRAME_DATA_STEREO3D
    AV_FRAME_DATA_MATRIXENCODING
    AV_FRAME_DATA_DOWNMIX_INFO
    AV_FRAME_DATA_REPLAYGAIN
    AV_FRAME_DATA_DISPLAYMATRIX
    AV_FRAME_DATA_AFD
    AV_FRAME_DATA_MOTION_VECTORS
    AV_FRAME_DATA_SKIP_SAMPLES
    AV_FRAME_DATA_AUDIO_SERVICE_TYPE
    AV_FRAME_DATA_MASTERING_DISPLAY_METADATA
    AV_FRAME_DATA_GOP_TIMECODE
    AV_FRAME_DATA_SPHERICAL
    AV_FRAME_DATA_CONTENT_LIGHT_LEVEL
    AV_FRAME_DATA_ICC_PROFILE
    AV_FRAME_DATA_S12M_TIMECODE
    AV_FRAME_DATA_DYNAMIC_HDR_PLUS
    AV_FRAME_DATA_REGIONS_OF_INTEREST
    AV_FRAME_DATA_VIDEO_ENC_PARAMS
    AV_FRAME_DATA_QP_TABLE_PROPERTIES # if FF_API_FRAME_QP
    AV_FRAME_DATA_QP_TABLE_DATA # if FF_API_FRAME_QP

  AVActiveFormatDescription* {.frame, size: sizeof(cint).} = enum
    AV_AFD_SAME = 8
    AV_AFD_4_3 = 9
    AV_AFD_16_9 = 10
    AV_AFD_14_9 = 11
    AV_AFD_4_3_SP_14_9 = 13
    AV_AFD_16_9_SP_14_9 = 14
    AV_AFD_SP_4_3 = 15
  
  AVFrameSideData* {.frame, bycopy.} = object
    `type`*: AVFrameSideDataType
    data*: ptr uint8
    size*: cint
    metadata*: ptr AVDictionary
    buf*: ptr AVBufferRef
  
  AVRegionOfInterest* {.frame.} = object
    self_size*: cuint
    top*: cint
    bottom*: cint
    left*: cint
    right*: cint
    qoffset*: AVRational
  
  AVFrame* {.frame, bycopy.} = object
    data*: array[AV_NUM_DATA_POINTERS, ptr uint8]
    line*: array[AV_NUM_DATA_POINTERS, cint]
    extended_data*: ptr ptr uint8
    width*: cint
    height*: cint
    nb_samples*: cint
    format*: cint
    key_frame*: cint
    pict_type*: AVPictureType
    sample_aspect_ratio*: AVRational
    pts*: int64
    pkt_dts*: int64
    coded_picture_number*: cint
    display_picture_number*: cint
    quality*: cint
    opaque*: pointer
    repeat_pict*: cint
    interlaced_frame*: cint
    top_field_first*: cint
    palette_has_changed*: cint
    reordered_opaque*: int64
    sample_rate*: cint
    channel_layout*: uint64
    buf*: array[AV_NUM_DATA_POINTERS, ptr AVBufferRef]
    extended_buf*: ptr ptr AVBufferRef
    nb_extended_buf*: cint
    side_data*: ptr ptr AVFrameSideDataType
    nb_side_data*: cint
    flags*: cint
    color_range*: AVColorRange
    color_primaries*: AVColorPrimaries
    color_trc*: AVColorTransferCharacteristic
    colorspace*: AVColorSpace
    chroma_location*: AVChromaLocation
    best_effort_timestamp*: int64
    pkt_pos*: int64
    pkt_duration*: int64
    metadata*: ptr AVDictionary
    decode_error_flags*: cint
    channels*: cint
    pkt_size*: cint
    hw_frames_ctx*: ptr AVBufferRef
    opaque_ref*: ptr AVBufferRef
    crop_top*: csize_t
    crop_bottom*: csize_t
    crop_left*: csize_t
    crop_right*: csize_t
    private_ref*: ptr AVBufferRef

    when defined(FF_API_PKT_PTS):
      pkt_pts {.deprecated.}: int64

    when defined(FF_API_ERROR_FRAME):
      error {.deprecated.}: array[AV_NUM_DATA_POINTERS, uint64]

    when defined(FF_API_FRAME_QP):
      qscale_table {.deprecated.}: ptr int8
      qstride {.deprecated.}: cint
      qscale_type {.deprecated.}: cint
      qp_table_buf {.deprecated.}: ptr AVBufferRef
  
  AVHashContext* {.hash, bycopy.} = object

  AVHDRPlusOverlapProcessOption* {.hdr_dynamic_metadata.} = enum
    AV_HDR_PLUS_OVERLAP_PROCESS_WEIGHTED_AVERAGING = 0
    AV_HDR_PLUS_OVERLAP_PROCESS_LAYERING = 1
  
  AVHDRPlusPercentile* {.hdr_dynamic_metadata.} = object
    percentage*: uint8
    percentile*: AVRational
  
  AVHDRPlusColorTransformParams* {.hdr_dynamic_metadata.} = object
    window_upper_left_corner_x*: AVRational
    window_upper_left_corner_y*: AVRational
    window_lower_right_corner_x*: AVRational
    window_lower_right_corner_y*: AVRational
    center_of_ellipse_x*: uint16
    center_of_ellipse_y*: uint16
    rotation_angle*: uint8
    semimajor_axis_internal_ellipse*: uint16
    semimajor_axis_external_ellipse*: uint16
    semiminor_axis_external_ellipse*: uint16
    overlap_process_option*: AVHDRPlusOverlapProcessOption
    maxscl*: array[3, AVRational]
    average_maxrgb*: AVRational
    num_distribution_maxrgb_percentiles*: uint8
    distribution_maxrgb*: array[15, AVHDRPlusPercentile]
    fraction_bright_pixels*: AVRational
    tone_mapping_flag*: uint8
    knee_point_x*: AVRational
    knee_point_y*: AVRational
    num_bezier_curve_anchors*: uint8
    bezier_curve_anchors*: array[15, AVRational]
    color_saturation_mapping_flag*: uint8
    color_saturation_weight*: AVRational
  
  AVDynamicHDRPlus* {.hdr_dynamic_metadata.} = object
    itu_t_t35_country_code*: uint8
    application_version*: uint8
    num_windows*: uint8
    params*: array[3, AVHDRPlusColorTransformParams]
    targeted_system_display_maximum_luminance*: AVRational
    targeted_system_display_actual_peak_luminance_flag*: uint8
    num_rows_targeted_system_display_actual_peak_luminance*: uint8
    num_cols_targeted_system_display_actual_peak_luminance*: uint8
    targeted_system_display_actual_peak_luminance*: array[25, array[25, AVRational]]
    mastering_display_actual_peak_luminance_flag*: uint8
    num_rows_mastering_display_actual_peak_luminance*: uint8
    num_cols_mastering_display_actual_peak_luminance*: uint8
    mastering_display_actual_peak_luminance*: array[25, array[25, AVRational]]
  
  AVHMACType* {.hmac, size: sizeof(cint).} = enum
    AV_HMAC_MD5
    AV_HMAC_SHA1
    AV_HMAC_SHA224
    AV_HMAC_SHA256
    AV_HMAC_SHA384
    AV_HMAC_SHA512

  AVHMAC* {.hmac.} = object

  CUcontext* {.cuda.} = object
  CUstream* {.cuda.} = object
  AVCUDADeviceContextInternal* {.hwcontext_cuda.} = object

  AVCUDADeviceContext* {.hwcontext_cuda, bycopy.} = object
    cuda_ctx*: CUcontext
    stream*: CUstream
    internal*: ptr AVCUDADeviceContextInternal
  
  AVDRMObjectDescriptor* {.hwcontext_drm.} = object
    fg*: cint
    size*: csize_t
    format_modifier*: uint64

  AVDRMPlaneDescriptor* {.hwcontext_drm.} = object
    object_index*: cint
    offset*: ByteAddress
    pitch*: ByteAddress
  
  AVDRMLayerDescriptor* {.hwcontext_drm.} = object
    format*: cuint
    nb_planes*: cint
    planes*: array[AV_DRM_MAX_PLANES, AVDRMPlaneDescriptor]
  
  AVDRMFrameDescriptor* {.hwcontext_drm.} = object
    nb_objects*: cint
    objects*: array[AV_DRM_MAX_PLANES, AVDRMObjectDescriptor]
    nb_layers*: cint
    layers*: array[AV_DRM_MAX_PLANES, AVDRMLayerDescriptor]
  
  AVDRMDeviceContext* {.hwcontext_drm.} = object
    fd*: cint
  
  AVMediaCodecDeviceContext* {.hwcontext_mediacodec.} = object
    surface*: pointer
  
  cl_mem* {.hwcontext_opencl_include.} = object
  cl_device_id* {.hwcontext_opencl_include.} = object
  cl_context* {.hwcontext_opencl_include.} = object
  cl_command_queue* {.hwcontext_opencl_include.} = object

  AVOpenCLFrameDescriptor* {.hwcontext_opencl.} = object
    nb_planes*: cint
    planes*: array[AV_NUM_DATA_POINTERS, cl_mem]
  
  AVOpenCLDeviceContext* {.hwcontext_opencl.} = object
    device_id*: cl_device_id
    context*: cl_context
    command_queue*: cl_command_queue
  
  AVOpenCLFramesContext* {.hwcontext_opencl.} = object
    command_queue*: cl_command_queue
  
  VkAllocationCallbacks* {.vulkan.} = object
  VkInstance* {.vulkan.} = object
  VkPhysicalDevice* {.vulkan.} = object
  VkDevice* {.vulkan.} = object
  VkPhysicalDeviceFeatures2* {.vulkan.} = object
  VkImageTiling* {.vulkan.} = object
  VkImageUsageFlagBits* {.vulkan.} = object
  VkImage* {.vulkan.} = object
  VkDeviceMemory* {.vulkan.} = object
  VkMemoryPropertyFlagBits* {.vulkan.} = object
  VkAccessFlagBits* {.vulkan.} = object
  VkImageLayout* {.vulkan.} = object
  VkSemaphore* {.vulkan.} = object
  VkFormat* {.vulkan.} = object
  
  AVVkFrameInternal* {.hwcontext_vulkan.} = object

  AVVulkanDeviceContext* {.hwcontext_vulkan.} = object
    alloc*: ptr VkAllocationCallbacks
    inst*: VkInstance
    phys_dev*: VkPhysicalDevice
    act_dev*: VkDevice
    queue_family_index*: cuint
    nb_graphics_queues*: cuint
    queue_family_tx_index*: cuint
    nb_tx_queues*: cuint
    queue_family_comp_index*: cuint
    nb_comp_queues*: cuint
    enabled_inst_extensions*: cstring
    nb_enabled_inst_extensions*: cint
    enabled_dev_extensions*: cstring
    nb_enabled_dev_extensions*: cint
    device_features*: VkPhysicalDeviceFeatures2
  
  AVVulkanFramesContext* {.hwcontext_vulkan.} = object
    tiling*: VkImageTiling
    usage*: VkImageUsageFlagBits
    create_pnext*: pointer
    alloc_pnext*: array[AV_NUM_DATA_POINTERS, pointer]
  
  AVVkFrame* {.hwcontext_vulkan.} = object
    img*: array[AV_NUM_DATA_POINTERS, VkImage]
    tiling*: VkImageTiling
    mem*: array[AV_NUM_DATA_POINTERS, VkDeviceMemory]
    size*: array[AV_NUM_DATA_POINTERS, csize_t]
    flags*: VkMemoryPropertyFlagBits
    access*: array[AV_NUM_DATA_POINTERS, VkAccessFlagBits]
    layout*: array[AV_NUM_DATA_POINTERS, VkImageLayout]
    sem*: array[AV_NUM_DATA_POINTERS, VkSemaphore]
    internal*: ptr AVVkFrameInternal
  
  AVHWDeviceType* {.hwcontext, size: sizeof(cint).} = enum
    AV_HWDEVICE_TYPE_NONE
    AV_HWDEVICE_TYPE_VDPAU
    AV_HWDEVICE_TYPE_CUDA
    AV_HWDEVICE_TYPE_VAAPI
    AV_HWDEVICE_TYPE_DXVA2
    AV_HWDEVICE_TYPE_QSV
    AV_HWDEVICE_TYPE_VIDEOTOOLBOX
    AV_HWDEVICE_TYPE_D3D11VA
    AV_HWDEVICE_TYPE_DRM
    AV_HWDEVICE_TYPE_OPENCL
    AV_HWDEVICE_TYPE_MEDIACODEC
    AV_HWDEVICE_TYPE_VULKAN
  
  AVHWDeviceInternal* {.hwcontext.} = object

  AVHWDeviceContext* {.hwcontext, bycopy.} = object
    av_class*: ptr AVClass
    internal*: ptr AVHWDeviceInternal
    `type`*: AVHWDeviceType
    hwctx*: pointer
    free*: proc (ctx: ptr AVHWDeviceContext) {.cdecl.}
    user_opaque*: pointer
  
  AVHWFramesInternal* {.hwcontext.} = object

  AVHWFramesContext* {.hwcontext, bycopy.} = object
    av_class*: AVClass
    internal*: AVHWFramesInternal
    device_ref*: ptr AVBufferRef
    device_ctx*: ptr AVHWDeviceContext
    hwctx*: pointer
    free*: proc (ctx: ptr AVHWFramesContext) {.cdecl.}
    user_opaque*: pointer
    pool*: ptr AVBufferPool
    initial_pool_size*: cint
    format*: AVPixelFormat
    sw_format*: AVPixelFormat
    width*: cint
    height*: cint
  
  AVHWFrameTransferDirection* {.hwcontext, size: sizeof(cint).} = enum
    AV_HWFRAME_TRANSFER_DIRECTION_FROM
    AV_HWFRAME_TRANSFER_DIRECTION_TO
  
  AVHWFramesConstraints* {.hwcontext.} = object
    valid_hw_formats*: ptr AVPixelFormat
    valid_sw_formats*: ptr AVPixelFormat
    min_width*: cint
    min_height*: cint
    max_width*: cint
    max_height*: cint
  
  av_intfloat32* {.intfloat, bycopy, union.} = object
    i*: cuint
    f*: cfloat

  av_intfloat64* {.intfloat, bycopy, union.} = object
    i*: cuint
    f*: cdouble
  
  av_alias64* {.intreadwrite, union.} = object
    u64*: uint64
    u32*: array[2, uint32]
    u16*: array[4, uint16]
    u8*: array[8, uint8]
    f64*: cdouble
    f32*: array[2, cfloat]
  
  av_alias32* {.intreadwrite, union.} = object
    u32*: uint32
    u16*: array[2, uint16]
    u8*: array[4, uint8]
    f32*: cfloat
  
  av_alias16* {.intreadwrite, union.} = object
    u16*: uint16
    u8*: array[2, uint8]
  
  AVLFG* {.lfg, bycopy.} = object
    state*: array[64, cuint]
    index*: cint
  
  AVMasteringDisplayMetadata* {.mastering_display_metadata, bycopy.} = object
    display_primaries*: array[3, array[2, AVRational]]
    white_point*: array[2, AVRational]
    min_luminance*: AVRational
    max_luminance*: AVRational
    has_primaries*: cint
    has_luminance*: cint
  
  AVContentLightMetadata* {.mastering_display_metadata.} = object
    MaxCLL*: cuint
    MaxFALL*: cuint
  
  AVRounding* {.mathmatics.} = enum
    AV_ROUND_ZERO     = 0
    AV_ROUND_INF      = 1
    AV_ROUND_DOWN     = 2
    AV_ROUND_UP       = 3
    AV_ROUND_NEAR_INF = 5
    AV_ROUND_PASS_MINMAX = 8192
  
  AVMD5* {.md5, bycopy.} = object

  AVMotionVector* {.motion_vector, bycopy.} = object
    source*: int32
    w*, h*: uint8
    src_x*, src_y*: int16
    dst_x*, dst_y*: int16
    flags*: uint64
    motion_x*, motion_y*: int32
    motion_scale*: uint16
  
  AVMurMur3* {.murmur3.} = object

  AVClassCategory* {.log.} = enum
    AV_CLASS_CATEGORY_NA = 0
    AV_CLASS_CATEGORY_INPUT
    AV_CLASS_CATEGORY_OUTPUT
    AV_CLASS_CATEGORY_MUXER
    AV_CLASS_CATEGORY_DEMUXER
    AV_CLASS_CATEGORY_ENCODER
    AV_CLASS_CATEGORY_DECODER
    AV_CLASS_CATEGORY_FILTER
    AV_CLASS_CATEGORY_BITSTREAM_FILTER
    AV_CLASS_CATEGORY_SWSCALER
    AV_CLASS_CATEGORY_SWRESAMPLER
    AV_CLASS_CATEGORY_DEVICE_VIDEO_OUTPUT = 40
    AV_CLASS_CATEGORY_DEVICE_VIDEO_INPUT
    AV_CLASS_CATEGORY_DEVICE_AUDIO_OUTPUT
    AV_CLASS_CATEGORY_DEVICE_AUDIO_INPUT
    AV_CLASS_CATEGORY_DEVICE_OUTPUT
    AV_CLASS_CATEGORY_DEVICE_INPUT
    AV_CLASS_CATEGORY_NB

  AVClass* {.log, bycopy.} = object
    class_name*: cstring
    item_name*: proc (ctx: pointer): cstring {.cdecl.}
    option*: ptr AVOption
    version*: cint
    log_level_offset_offset*: cint
    parent_log_context_offset*: cint
    child_next*: proc (obj, prev: pointer): pointer {.cdecl.}
    child_class_next*: proc (prev: ptr AVClass): ptr AVClass {.cdecl.}
    category*: AVClassCategory
    get_category*: proc (ctx: pointer): AVClassCategory {.cdecl.}
    query_ranges*: proc (a1: ptr ptr AVOptionRanges, obj: pointer, key: cstring, flags: cint): cint {.cdecl.}

  AVOptionType* {.opt, size: sizeof(cint).} = enum
    AV_OPT_TYPE_FLAGS
    AV_OPT_TYPE_INT
    AV_OPT_TYPE_INT64
    AV_OPT_TYPE_DOUBLE
    AV_OPT_TYPE_FLOAT
    AV_OPT_TYPE_STRING
    AV_OPT_TYPE_RATIONAL
    AV_OPT_TYPE_BINARY
    AV_OPT_TYPE_DICT
    AV_OPT_TYPE_UINT64
    AV_OPT_TYPE_CONST
    AV_OPT_TYPE_IMAGE_SIZE
    AV_OPT_TYPE_PIXEL_FMT
    AV_OPT_TYPE_SAMPLE_FMT
    AV_OPT_TYPE_VIDEO_RATE
    AV_OPT_TYPE_DURATION
    AV_OPT_TYPE_COLOR
    AV_OPT_TYPE_CHANNEL_LAYOUT
    AV_OPT_TYPE_BOOL
  
  AVOption* {.opt, bycopy.} = object
    name*: cstring
    help*: cstring
    offset*: cint
    `type`*: AVOptionType
    default_val*: AVOptionUnion
    min*, max*: cdouble
    flags*: cint
    unit*: cstring
  
  AVOptionUnion* {.union, opt.} = object
    i64*: int64
    dbl*: cdouble
    str*: cstring
    q*: AVRational
  
  AVOptionRange* {.opt.} = object
    str*: cstring
    value_min*, value_max*: cdouble
    component_min*, component_max*: cdouble
    is_range*: cint
  
  AVOptionRanges* {.opt, bycopy.} = object
    `range`*: ptr ptr AVOptionRange
    nb_ranges*: cint
    nb_components*: cint
  
  AVComponentDescriptor* {.pixdesc, bycopy.} = object
    plane*: cint
    step*: cint
    offset*: cint
    shift*: cint
    depth*: cint

    when defined(FF_API_PLUS1_MINUS1):
      step_minus1* {.deprecated.}: cint
      depth_minus1* {.deprecated.}: cint
      offset_plus1* {.deprecated.}: cint
  
  AVPixFmtDescriptor* {.pixdesc, bycopy.} = object
    name*: cstring
    nb_components*: uint8
    log2_chroma_w*: uint8
    log2_chroma_h*: uint8
    flags*: uint64
    comp*: array[4, AVComponentDescriptor]
    alias*: cstring
  
  av_pixelutils_sad_fn* {.pixelutils.} = proc (src1: ptr uint8, stride1: ByteAddress, src2: ptr uint8, stride2: ByteAddress): cint {.cdecl.}

  AVPixelFormat* {.pixfmt, size: sizeof(cint).} = enum
    AV_PIX_FMT_NONE = -1
    AV_PIX_FMT_YUV420P
    AV_PIX_FMT_YUYV422
    AV_PIX_FMT_RGB24
    AV_PIX_FMT_BGR24
    AV_PIX_FMT_YUV422P
    AV_PIX_FMT_YUV444P
    AV_PIX_FMT_YUV410P
    AV_PIX_FMT_YUV411P
    AV_PIX_FMT_GRAY8
    AV_PIX_FMT_MONOWHITE
    AV_PIX_FMT_MONOBLACK
    AV_PIX_FMT_PAL8
    AV_PIX_FMT_YUVJ420P
    AV_PIX_FMT_YUVJ422P
    AV_PIX_FMT_YUVJ444P
    AV_PIX_FMT_UYVY422
    AV_PIX_FMT_UYYVYY411
    AV_PIX_FMT_BGR8
    AV_PIX_FMT_BGR4
    AV_PIX_FMT_BGR4_BYTE
    AV_PIX_FMT_RGB8
    AV_PIX_FMT_RGB4
    AV_PIX_FMT_RGB4_BYTE
    AV_PIX_FMT_NV12
    AV_PIX_FMT_NV21
    AV_PIX_FMT_ARGB
    AV_PIX_FMT_RGBA
    AV_PIX_FMT_ABGR
    AV_PIX_FMT_BGRA
    AV_PIX_FMT_GRAY16BE
    AV_PIX_FMT_GRAY16LE
    AV_PIX_FMT_YUV440P
    AV_PIX_FMT_YUVJ440P
    AV_PIX_FMT_YUVA420P
    AV_PIX_FMT_RGB48BE
    AV_PIX_FMT_RGB48LE
    AV_PIX_FMT_RGB565BE
    AV_PIX_FMT_RGB565LE
    AV_PIX_FMT_RGB555BE
    AV_PIX_FMT_RGB555LE
    AV_PIX_FMT_BGR565BE
    AV_PIX_FMT_BGR565LE
    AV_PIX_FMT_BGR555BE
    AV_PIX_FMT_BGR555LE
    AV_PIX_FMT_VAAPI_MOCO # if FF_API_VAAPI
    AV_PIX_FMT_VAAPI_IDCT # if FF_API_VAAPI
    AV_PIX_FMT_VAAPI_VLD # if FF_API_VAAPI
    AV_PIX_FMT_VAAPI # if FF_API_VAAPI
    AV_PIX_FMT_YUV420P16LE
    AV_PIX_FMT_YUV420P16BE
    AV_PIX_FMT_YUV422P16LE
    AV_PIX_FMT_YUV422P16BE
    AV_PIX_FMT_YUV444P16LE
    AV_PIX_FMT_YUV444P16BE
    AV_PIX_FMT_DXVA2_VLD
    AV_PIX_FMT_RGB444LE
    AV_PIX_FMT_RGB444BE
    AV_PIX_FMT_BGR444LE
    AV_PIX_FMT_BGR444BE
    AV_PIX_FMT_YA8
    AV_PIX_FMT_Y400A
    AV_PIX_FMT_GRAY8A
    AV_PIX_FMT_BGR48BE
    AV_PIX_FMT_YUV420P9BE
    AV_PIX_FMT_YUV420P9LE
    AV_PIX_FMT_YUV420P10BE
    AV_PIX_FMT_YUV420P10LE
    AV_PIX_FMT_YUV422P10BE
    AV_PIX_FMT_YUV422P10LE
    AV_PIX_FMT_YUV444P9BE
    AV_PIX_FMT_YUV444P9LE
    AV_PIX_FMT_YUV444P10BE
    AV_PIX_FMT_YUV444P10LE
    AV_PIX_FMT_YUV422P9BE
    AV_PIX_FMT_YUV422P9LE
    AV_PIX_FMT_GBRP
    AV_PIX_FMT_GBR24P
    AV_PIX_FMT_GBRP9BE
    AV_PIX_FMT_GBRP9LE
    AV_PIX_FMT_GBRP10BE
    AV_PIX_FMT_GBRP10LE
    AV_PIX_FMT_GBRP16BE
    AV_PIX_FMT_GBRP16LE
    AV_PIX_FMT_YUVA422P
    AV_PIX_FMT_YUVA444P
    AV_PIX_FMT_YUVA420P9BE
    AV_PIX_FMT_YUVA420P9LE
    AV_PIX_FMT_YUVA422P9BE
    AV_PIX_FMT_YUVA422P9LE
    AV_PIX_FMT_YUVA444P9BE
    AV_PIX_FMT_YUVA444P9LE
    AV_PIX_FMT_YUVA420P10BE
    AV_PIX_FMT_YUVA420P10LE
    AV_PIX_FMT_YUVA422P10BE
    AV_PIX_FMT_YUVA422P10LE
    AV_PIX_FMT_YUVA444P10BE
    AV_PIX_FMT_YUVA444P10LE
    AV_PIX_FMT_YUVA420P16BE
    AV_PIX_FMT_YUVA420P16LE
    AV_PIX_FMT_YUVA422P16BE
    AV_PIX_FMT_YUVA422P16LE
    AV_PIX_FMT_YUVA444P16BE
    AV_PIX_FMT_YUVA444P16LE
    AV_PIX_FMT_VDPAU
    AV_PIX_FMT_XYZ12LE
    AV_PIX_FMT_XYZ12BE
    AV_PIX_FMT_NV16
    AV_PIX_FMT_NV20LE
    AV_PIX_FMT_NV20BE
    AV_PIX_FMT_RGBA64BE
    AV_PIX_FMT_RGBA64LE
    AV_PIX_FMT_BGRA64BE
    AV_PIX_FMT_BGRA64LE
    AV_PIX_FMT_YVYU422
    AV_PIX_FMT_YA16BE
    AV_PIX_FMT_YA16LE
    AV_PIX_FMT_GBRAP
    AV_PIX_FMT_GBRAP16BE
    AV_PIX_FMT_GBRAP16LE
    AV_PIX_FMT_QSV
    AV_PIX_FMT_MMAL
    AV_PIX_FMT_D3D11VA_VLD
    AV_PIX_FMT_CUDA
    AV_PIX_FMT_0RGB
    AV_PIX_FMT_RGB0
    AV_PIX_FMT_0BGR
    AV_PIX_FMT_BGR0
    AV_PIX_FMT_YUV420P12BE
    AV_PIX_FMT_YUV420P12LE
    AV_PIX_FMT_YUV420P14BE
    AV_PIX_FMT_YUV420P14LE
    AV_PIX_FMT_YUV422P12BE
    AV_PIX_FMT_YUV422P12LE
    AV_PIX_FMT_YUV422P14BE
    AV_PIX_FMT_YUV422P14LE
    AV_PIX_FMT_YUV444P12BE
    AV_PIX_FMT_YUV444P12LE
    AV_PIX_FMT_YUV444P14BE
    AV_PIX_FMT_YUV444P14LE
    AV_PIX_FMT_GBRP12BE
    AV_PIX_FMT_GBRP12LE
    AV_PIX_FMT_GBRP14BE
    AV_PIX_FMT_GBRP14LE
    AV_PIX_FMT_YUVJ411P
    AV_PIX_FMT_BAYER_BGGR8
    AV_PIX_FMT_BAYER_RGGB8
    AV_PIX_FMT_BAYER_GBRG8
    AV_PIX_FMT_BAYER_GRBG8
    AV_PIX_FMT_BAYER_BGGR16LE
    AV_PIX_FMT_BAYER_BGGR16BE
    AV_PIX_FMT_BAYER_RGGB16LE
    AV_PIX_FMT_BAYER_RGGB16BE
    AV_PIX_FMT_BAYER_GBRG16LE
    AV_PIX_FMT_BAYER_GBRG16BE
    AV_PIX_FMT_BAYER_GRBG16LE
    AV_PIX_FMT_BAYER_GRBG16BE
    AV_PIX_FMT_XVMC
    AV_PIX_FMT_YUV440P10LE
    AV_PIX_FMT_YUV440P10BE
    AV_PIX_FMT_YUV440P12LE
    AV_PIX_FMT_YUV440P12BE
    AV_PIX_FMT_AYUV64LE
    AV_PIX_FMT_AYUV64BE
    AV_PIX_FMT_VIDEOTOOLBOX
    AV_PIX_FMT_P010LE
    AV_PIX_FMT_P010BE
    AV_PIX_FMT_GBRAP12BE
    AV_PIX_FMT_GBRAP12LE
    AV_PIX_FMT_GBRAP10BE
    AV_PIX_FMT_GBRAP10LE
    AV_PIX_FMT_MEDIACODEC
    AV_PIX_FMT_GRAY12BE
    AV_PIX_FMT_GRAY12LE
    AV_PIX_FMT_GRAY10BE
    AV_PIX_FMT_GRAY10LE
    AV_PIX_FMT_P016LE
    AV_PIX_FMT_P016BE
    AV_PIX_FMT_D3D11
    AV_PIX_FMT_GRAY9BE
    AV_PIX_FMT_GRAY9LE
    AV_PIX_FMT_GBRPF32BE
    AV_PIX_FMT_GBRPF32LE
    AV_PIX_FMT_GBRAPF32BE
    AV_PIX_FMT_GBRAPF32LE
    AV_PIX_FMT_DRM_PRIME
    AV_PIX_FMT_OPENCL
    AV_PIX_FMT_GRAY14BE
    AV_PIX_FMT_GRAY14LE
    AV_PIX_FMT_GRAYF32BE
    AV_PIX_FMT_GRAYF32LE
    AV_PIX_FMT_YUVA422P12BE
    AV_PIX_FMT_YUVA422P12LE
    AV_PIX_FMT_YUVA444P12BE
    AV_PIX_FMT_YUVA444P12LE
    AV_PIX_FMT_NV24
    AV_PIX_FMT_NV42
    AV_PIX_FMT_VULKAN
    AV_PIX_FMT_Y210BE
    AV_PIX_FMT_Y210LE
    AV_PIX_FMT_NB

  AVColorPrimaries* {.pixfmt, size: sizeof(cint).} = enum
    AVCOL_PRI_RESERVED0   = 0
    AVCOL_PRI_BT709       = 1
    AVCOL_PRI_UNSPECIFIED = 2
    AVCOL_PRI_RESERVED    = 3
    AVCOL_PRI_BT470M      = 4
    AVCOL_PRI_BT470BG     = 5
    AVCOL_PRI_SMPTE170M   = 6
    AVCOL_PRI_SMPTE240M   = 7
    AVCOL_PRI_FILM        = 8
    AVCOL_PRI_BT2020      = 9
    AVCOL_PRI_SMPTE428    = 10
    AVCOL_PRI_SMPTE431    = 11
    AVCOL_PRI_SMPTE432    = 12
    AVCOL_PRI_EBU3213     = 22
    AVCOL_PRI_SMPTEST428_1  # = AVCOL_PRI_SMPTE428
    AVCOL_PRI_JEDEC_P22   # = AVCOL_PRI_EBU3213
    AVCOL_PRI_NB
  
  AVColorTransferCharacteristic* {.pixfmt.} = enum
    AVCOL_TRC_RESERVED0    = 0
    AVCOL_TRC_BT709        = 1
    AVCOL_TRC_UNSPECIFIED  = 2
    AVCOL_TRC_RESERVED     = 3
    AVCOL_TRC_GAMMA22      = 4
    AVCOL_TRC_GAMMA28      = 5
    AVCOL_TRC_SMPTE170M    = 6
    AVCOL_TRC_SMPTE240M    = 7
    AVCOL_TRC_LINEAR       = 8
    AVCOL_TRC_LOG          = 9
    AVCOL_TRC_LOG_SQRT     = 10
    AVCOL_TRC_IEC61966_2_4 = 11
    AVCOL_TRC_BT1361_ECG   = 12
    AVCOL_TRC_IEC61966_2_1 = 13
    AVCOL_TRC_BT2020_10    = 14
    AVCOL_TRC_BT2020_12    = 15
    AVCOL_TRC_SMPTE2084    = 16
    AVCOL_TRC_SMPTE428     = 17
    AVCOL_TRC_ARIB_STD_B67 = 18
    AVCOL_TRC_SMPTEST2084  #= AVCOL_TRC_SMPTE2084,
    AVCOL_TRC_SMPTEST428_1 #= AVCOL_TRC_SMPTE428,
    AVCOL_TRC_NB

  AVColorSpace* {.pixfmt.} = enum
    AVCOL_SPC_RGB         = 0
    AVCOL_SPC_BT709       = 1
    AVCOL_SPC_UNSPECIFIED = 2
    AVCOL_SPC_RESERVED    = 3
    AVCOL_SPC_FCC         = 4
    AVCOL_SPC_BT470BG     = 5
    AVCOL_SPC_SMPTE170M   = 6
    AVCOL_SPC_SMPTE240M   = 7
    AVCOL_SPC_YCGCO       = 8
    AVCOL_SPC_BT2020_NCL  = 9
    AVCOL_SPC_BT2020_CL   = 10
    AVCOL_SPC_SMPTE2085   = 11
    AVCOL_SPC_CHROMA_DERIVED_NCL = 12
    AVCOL_SPC_CHROMA_DERIVED_CL = 13
    AVCOL_SPC_ICTCP       = 14
    AVCOL_SPC_YCOCG       #= AVCOL_SPC_YCGCO,
    AVCOL_SPC_NB
  
  AVColorRange* {.pixfmt.} = enum
    AVCOL_RANGE_UNSPECIFIED = 0
    AVCOL_RANGE_MPEG        = 1
    AVCOL_RANGE_JPEG        = 2
    AVCOL_RANGE_NB
  
  AVChromaLocation* {.pixfmt.} = enum
    AVCHROMA_LOC_UNSPECIFIED = 0
    AVCHROMA_LOC_LEFT        = 1
    AVCHROMA_LOC_CENTER      = 2
    AVCHROMA_LOC_TOPLEFT     = 3
    AVCHROMA_LOC_TOP         = 4
    AVCHROMA_LOC_BOTTOMLEFT  = 5
    AVCHROMA_LOC_BOTTOM      = 6
    AVCHROMA_LOC_NB
  
  AVRational* {.rational, bycopy.} = object
    num*: cint
    den*: cint
  
  AVRC4* {.rc4, bycopy.} = object
    state*: array[256, uint8]
    x*, y*: cint
  
  AVReplayGain* {.replaygain, bycopy.} = object
    track_gain*: int32
    track_peak*: uint32
    album_gain*: int32
    album_peak*: uint32
  
  AVRIPEMD* {.ripemd, bycopy.} = object

  AVSampleFormat* {.samplefmt, size: sizeof(cint).} = enum
    AV_SAMPLE_FMT_NONE = -1
    AV_SAMPLE_FMT_U8
    AV_SAMPLE_FMT_S16
    AV_SAMPLE_FMT_S32
    AV_SAMPLE_FMT_FLT
    AV_SAMPLE_FMT_DBL
    AV_SAMPLE_FMT_U8P
    AV_SAMPLE_FMT_S16P
    AV_SAMPLE_FMT_S32P
    AV_SAMPLE_FMT_FLTP
    AV_SAMPLE_FMT_DBLP
    AV_SAMPLE_FMT_S64
    AV_SAMPLE_FMT_S64P
    AV_SAMPLE_FMT_NB
  
  AVSHA* {.sha, bycopy.} = object

  AVSHA512* {.sha512, bycopy.} = object

  AVSphericalProjection* {.spherical, size: sizeof(cint).} = enum
    AV_SPHERICAL_EQUIRECTANGULAR
    AV_SPHERICAL_CUBEMAP
    AV_SPHERICAL_EQUIRECTANGULAR_TILE
  
  AVSphericalMapping* {.spherical, bycopy.} = object
    projection*: AVSphericalProjection
    yaw*: int32
    pitch*: int32
    roll*: int32
    bound_left*: uint32
    bound_top*: uint32
    bound_right*: uint32
    bound_bottom*: uint32
    padding*: uint32
  
  AVStereo3DType* {.stereo3d, size: sizeof(cint).} = enum
    AV_STEREO3D_2D
    AV_STEREO3D_SIDEBYSIDE
    AV_STEREO3D_TOPBOTTOM
    AV_STEREO3D_FRAMESEQUENCE
    AV_STEREO3D_CHECKERBOARD
    AV_STEREO3D_SIDEBYSIDE_QUINCUNX
    AV_STEREO3D_LINES
    AV_STEREO3D_COLUMNS
  
  AVStereo3DView* {.stereo3d.} = enum
    AV_STEREO3D_VIEW_PACKED
    AV_STEREO3D_VIEW_LEFT
    AV_STEREO3D_VIEW_RIGHT
  
  AVStereo3D* {.stereo3d, bycopy.} = object
    `type`*: AVStereo3DType
    flags*: cint
    view*: AVStereo3DView
  
  AVTEA* {.tea, bycopy.} = object

  AVThreadMessageQueue* {.threadmessage.} = object

  AVThreadMessageFlags* {.threadmessage, size: sizeof(cint).} = enum
    AV_THREAD_MESSAGE_NONBLOCK = 1
  
  AVTimecodeFlag* {.timecode, size: sizeof(cint).} = enum
    AV_TIMECODE_FLAG_DROPFRAME = 1 shl 0
    AV_TIMECODE_FLAG_24HOURSMAX = 1 shl 1
    AV_TIMECODE_FLAG_ALLOWNEGATIVE = 1 shl 2
  
  AVTimecode* {.timecode, bycopy.} = object
    start: cint
    flags: uint32
    rate: AVRational
    fps: cuint
  
  AVTreeNode* {.tree, bycopy.} = object

  AVTWOFISH* {.twofish, bycopy.} = object

  AVTXContext* {.tx.} = object

  AVComplexFloat* {.tx.} = object
    re*, im*: cfloat
  
  AVComplexDouble* {.tx.} = object
    re*, im*: cdouble
  
  AVComplexInt32* {.tx.} = object
    re*, im*: int32
  
  AVTXType* {.tx.} = enum
    AV_TX_FLOAT_FFT = 0
    AV_TX_FLOAT_MDCT = 1
    AV_TX_DOUBLE_FFT = 2
    AV_TX_DOUBLE_MDCT = 3
    AV_TX_INT32_FFT = 4
    AV_TX_INT32_MDCT = 5
  
  av_tx_fn* {.tx.} = proc (s: ptr AVTXContext, `out`, `in`: pointer, stride: ByteAddress) {.cdecl.}

  AVVideoEncParamsType* {.video_enc_params.} = enum
    AV_VIDEO_ENC_PARAMS_NONE = -1
    AV_VIDEO_ENC_PARAMS_VP9
    AV_VIDEO_ENC_PARAMS_H264
  
  AVVideoEncParams* {.video_enc_params.} = object
    nb_blocks*: cuint
    blocks_offset*: csize_t
    block_size*: csize_t
    `type`*: AVVideoEncParamsType
    qp*: int32
    delta_qp*: array[4, array[2, int32]]
  
  AVVideoBlockParams* {.video_enc_params.} = object
    src_x*, src_y*: cint
    w*, h*: cint
    delta_qp*: int32
  
  pp_context* {.postprocess.} = object
  pp_mode* {.postprocess.} = object

  SwrDitherType* {.swresample.} = enum
    SWR_DITHER_NONE = 0
    SWR_DITHER_RECTANGULAR
    SWR_DITHER_TRIANGULAR
    SWR_DITHER_TRIANGULAR_HIGHPASS
    SWR_DITHER_NS = 64
    SWR_DITHER_NS_LIPSHITZ
    SWR_DITHER_NS_F_WEIGHTED
    SWR_DITHER_NS_MODIFIED_E_WEIGHTED
    SWR_DITHER_NS_IMPROVED_E_WEIGHTED
    SWR_DITHER_NS_SHIBATA
    SWR_DITHER_NS_LOW_SHIBATA
    SWR_DITHER_NS_HIGH_SHIBATA
    SWR_DITHER_NB
  
  SwrEngine* {.swresample.} = enum
    SWR_ENGINE_SWR
    SWR_ENGINE_SOXR
    SWR_ENGINE_NB
  
  SwrFilterType* {.swresample.} = enum
    SWR_FILTER_TYPE_CUBIC
    SWR_FILTER_TYPE_BLACKMAN_NUTTALL
    SWR_FILTER_TYPE_KAISER

  SwrContext* {.swresample.} = object

  SwsVector* {.swscale, bycopy.} = object
    coeff*: ptr cdouble
    length*: cint
  
  SwsFilter* {.swscale, bycopy.} = object
    lumH*: ptr SwsVector
    lumV*: ptr SwsVector
    chrH*: ptr SwsVector
    chrV*: ptr SwsVector
  
  SwsContext* {.swscale.} = object