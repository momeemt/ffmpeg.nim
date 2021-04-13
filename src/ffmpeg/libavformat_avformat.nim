from libavcodec_avcodec import AVDiscard, AVCodecParserContext
from libavcodec_codec import AVCodec
from libavcodec_codec_id import AVCodecID
from libavcodec_codec_par import AVCodecParameters
from libavcodec_packet import AVPacket, AVPacketSideData, AVPacketSideDataType
from libavformat_avio import AVIOContext, AVIOInterruptCB
from libavutil_avutil import AVMediaType
from libavutil_dict import AVDictionary
from libavutil_frame import AVFrame
from libavutil_log import AVClass
from libavutil_rational import AVRational

when defined(windows):
  {.push importc, dynlib: "avformat(|-55|-56|-57|-58).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avformat(|.55|.56|.57|.58).dylib".}
else:
  {.push importc, dynlib: "libavformat.so(|.55|.56|.57|.58)".}

const
  AVPROBE_SCORE_EXTENSION* = 50
  AVPROBE_SCORE_MIME* = 75
  AVPROBE_SCORE_MAX* = 100
  AVPROBE_SCORE_RETRY* = AVPROBE_SCORE_MAX / 4
  AVPROBE_SCORE_STREAM_RETRY* = AVPROBE_SCORE_MAX / 4 - 1
  AVPROBE_PADDING_SIZE* = 32
  AVFMT_NOFILE* = 0x0001
  AVFMT_NEEDNUMBER* = 0x0002
  AVFMT_SHOW_IDS* = 0x0008
  AVFMT_GLOBALHEADER* = 0x0040
  AVFMT_NOTIMESTAMPS* = 0x0080
  AVFMT_GENERIC_INDEX* = 0x0100
  AVFMT_TS_DISCONT* = 0x0200
  AVFMT_VARIABLE_FPS* = 0x0400
  AVFMT_NODIMENSIONS* = 0x0800
  AVFMT_NOSTREAMS* = 0x1000
  AVFMT_NOBINSEARCH* = 0x2000
  AVFMT_NOGENSEARCH* = 0x4000
  AVFMT_NO_BYTE_SEEK* = 0x8000
  AVFMT_ALLOW_FLUSH* = 0x10000
  AVFMT_TS_NONSTRICT* = 0x20000
  AVFMT_TS_NEGATIVE* = 0x40000
  AVFMT_SEEK_TO_PTS* = 0x4000000
  AVINDEX_KEYFRAME* = 0x0001
  AVINDEX_DISCARD_FRAME* = 0x0002
  AV_DISPOSITION_DEFAULT* = 0x0001
  AV_DISPOSITION_DUB* = 0x0002
  AV_DISPOSITION_ORIGINAL* = 0x0004
  AV_DISPOSITION_COMMENT* = 0x0008
  AV_DISPOSITION_LYRICS* = 0x0010
  AV_DISPOSITION_KARAOKE* = 0x0020
  AV_DISPOSITION_FORCED* = 0x0040
  AV_DISPOSITION_HEARING_IMPAIRED* = 0x0080
  AV_DISPOSITION_VISUAL_IMPAIRED* = 0x0100
  AV_DISPOSITION_CLEAN_EFFECTS* = 0x0200
  AV_DISPOSITION_ATTACHED_PIC* = 0x0400
  AV_DISPOSITION_TIMED_THUMBNAILS* = 0x0800
  AV_DISPOSITION_CAPTIONS* = 0x10000
  AV_DISPOSITION_DESCRIPTIONS* = 0x20000
  AV_DISPOSITION_METADATA* = 0x40000
  AV_DISPOSITION_DEPENDENT* = 0x80000
  AV_DISPOSITION_STILL_IMAGE* = 0x100000
  AV_PTS_WRAP_IGNORE* = 0
  AV_PTS_WRAP_ADD_OFFSET* = 1
  AV_PTS_WRAP_SUB_OFFSET* = -1
  AVSTREAM_EVENT_FLAG_METADATA_UPDATED* = 0x0001
  MAX_STD_TIMEBASES* = 30*12+30+3+6
  MAX_REORDER_DELAY* = 16
  AV_PROGRAM_RUNNING* = 1
  AVFMTCTX_NOHEADER* = 0x0001
  AVFMTCTX_UNSEEKABLE* = 0x0002
  AVFMT_FLAG_GENPTS* = 0x0001
  AVFMT_FLAG_IGNIDX* = 0x0002
  AVFMT_FLAG_NONBLOCK* = 0x0004
  AVFMT_FLAG_IGNDTS* = 0x0008
  AVFMT_FLAG_NOFILLIN* = 0x0010
  AVFMT_FLAG_NOPARSE* = 0x0020
  AVFMT_FLAG_NOBUFFER* = 0x0040
  AVFMT_FLAG_CUSTOM_IO* = 0x0080
  AVFMT_FLAG_DISCARD_CORRUPT* = 0x0100
  AVFMT_FLAG_FLUSH_PACKETS* = 0x0200
  AVFMT_FLAG_BITEXACT* = 0x0400
  AVFMT_FLAG_SORT_DTS* = 0x10000
  AVFMT_FLAG_PRIV_OPT* = 0x20000
  AVFMT_FLAG_FAST_SEEK* = 0x80000
  AVFMT_FLAG_SHORTEST* = 0x100000
  AVFMT_FLAG_AUTO_BSF* = 0x200000
  FF_FDEBUG_TS* = 0x0001
  AVFMT_EVENT_FLAG_METADATA_UPDATED* = 0x0001
  AVFMT_AVOID_NEG_TS_AUTO* = -1
  AVFMT_AVOID_NEG_TS_MAKE_NON_NEGATIVE* = 1
  AVFMT_AVOID_NEG_TS_MAKE_ZERO* = 2
  AVSEEK_FLAG_BACKWARD* = 1
  AVSEEK_FLAG_BYTE* = 2
  AVSEEK_FLAG_ANY* = 4
  AVSEEK_FLAG_FRAME* = 8
  AVSTREAM_INIT_IN_WRITE_HEADER* = 0
  AVSTREAM_INIT_IN_INIT_OUTPUT* = 1
  AV_FRAME_FILENAME_FLAGS_MULTIPLE* = 1

{.pragma: avformat, importc, header: "<libavformat_avformat.h>".}

type
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
  
  AVProgram* = object
    id: cint
    flags: cint
    `discard`: AVDiscard
    stream_index: ptr cuint
    nb_stream_indexes: cuint
    metadata: ptr AVDictionary
    program_num: cint
    pmt_pid: cint
    pcr_pid: cint
    pmt_version: cint
    start_time: int64
    end_time: int64
    pts_wrap_reference: int64
    pts_wrap_behavior: cint
  
  AVChapter* = object
    id: cint
    time_base: AVRational
    start: int64
    `end`: int64
    metadata: ptr AVDictionary
  
  av_format_control_message* = proc (s: ptr AVFormatContext, `type`: cint, data: pointer, data_size: csize_t): cint

  AVOpenCallback* = proc (s: ptr AVFormatContext, pb: ptr ptr AVIOContext, url: cstring, flags: cint, int_cb: ptr AVIOInterruptCB, options: ptr ptr AVDictionary): cint

  AVDurationEstimationMethod* = enum
    AVFMT_DURATION_FROM_PTS
    AVFMT_DURATION_FROM_STREAM
    AVFMT_DURATION_FROM_BITRATE
  
  AVFormatInternal* = object

  AVPacketList* = object
    pkt: AVPacket
    next: ptr AVPacketList
  
  AVTimebaseSource* = enum
    AVFMT_TBCF_AUTO = -1
    AVFMT_TBCF_DECODER
    AVFMT_TBCF_DEMUXER
    AVFMT_TBCF_R_FRAMERATE # when defined(FF_API_R_FRAME_RATE)

proc av_get_packet* (s: ptr AVIOContext, pkt: ptr AVPacket, size: cint): cint
proc av_append_packet* (s: ptr AVIOContext, pkt: ptr AVPacket, size: cint): cint
proc av_stream_get_parser* (s: ptr AVStream): ptr AVCodecParserContext
proc av_stream_get_end_pts* (st: ptr AVStream): int64
proc av_format_inject_global_side_data* (s: ptr AVFormatContext)
proc av_fmt_ctx_get_duration_estimation_method* (ctx: ptr AVFormatContext): AVDurationEstimationMethod
proc avformat_version* (): cuint
proc avformat_configuration* (): cstring
proc avformat_license* (): cstring
proc avformat_network_init* (): cint
proc avformat_network_deinit* (): cint
proc av_muxer_iterate* (opaque: ptr pointer): ptr AVOutputFormat
proc av_demuxer_iterate* (opaque: ptr pointer): ptr AVInputFormat
proc avformat_alloc_context* (): ptr AVFormatContext
proc avformat_free_context* (s: ptr AVFormatContext)
proc avformat_get_class* (): ptr AVClass
proc avformat_new_stream* (s: ptr AVFormatContext, c: ptr AVCodec): ptr AVStream
proc av_stream_add_side_data* (st: ptr AVStream, `type`: AVPacketSideDataType, data: ptr uint8, size: csize_t): cint
proc av_stream_new_side_data* (stream: ptr AVStream, `type`: AVPacketSideDataType, size: cint): uint8
proc av_stream_get_side_data* (stream: ptr AVStream, `type`: AVPacketSideDataType, size: ptr cint): uint8
proc av_new_program* (s: ptr AVFormatContext, id: cint): AVProgram
proc avformat_alloc_output_context2* (ctx: ptr ptr AVFormatContext, oformat: ptr AVOutputFormat, format_name: cstring, filename: cstring): cint
proc av_find_input_format* (short_name: cstring): ptr AVInputFormat
proc av_probe_input_format* (pd: ptr AVProbeData, is_opened: cint): ptr AVInputFormat
proc av_probe_input_format2* (pd: ptr AVProbeData, is_opened, score_max: cint): ptr AVInputFormat
proc av_probe_input_format3* (pd: ptr AVProbeData, is_opened: cint, score_ret: cint): ptr AVInputFormat
proc av_probe_input_buffer2* (pb: ptr AVIOContext, fmt: ptr ptr AVInputFormat, url: cstring, logctx: pointer, offset, max_probe_size: cuint): cint
proc av_probe_input_buffer* (pb: ptr AVIOContext, fmt: ptr ptr AVInputFormat, url: cstring, logctx: pointer, offset, max_probe_size: cuint): cint
proc avformat_open_input* (ps: ptr ptr AVFormatContext, url: cstring, fmt: ptr AVInputFormat, options: ptr ptr AVDictionary): cint
proc av_demuxer_open* (ic: ptr AVFormatContext): cint {.deprecated.}
proc avformat_find_stream_info* (ic: ptr AVFormatContext, options: ptr ptr AVDictionary): cint
proc av_find_program_from_stream* (ic: ptr AVFormatContext, last: ptr AVProgram, s: cint): ptr AVProgram
proc av_program_add_stream_index* (ac: ptr AVFormatContext, progid: cint, idx: cuint)
proc av_find_best_stream* (ic: ptr AVFormatContext, `type`: AVMediaType, wanted_stream_nb, related_stream: cint, decoder_ret: ptr ptr AVCodec, flags: cint): cint
proc av_read_frame* (s: ptr AVFormatContext, pkt: ptr AVPacket): cint
proc av_seek_frame* (s: ptr AVFormatContext, stream_index: cint, timestamp: int64, flags: cint): cint
proc avformat_seek_file* (s: ptr AVFormatContext, stream_index: cint, min_ts, ts, max_ts: int64, flags: cint): cint
proc avformat_flush* (s: ptr AVFormatContext): cint
proc av_read_play* (s: ptr AVFormatContext): cint
proc av_read_pause* (s: ptr AVFormatContext): cint
proc avformat_close_input* (s: ptr ptr AVFormatContext)
proc avformat_write_header* (s: ptr AVFormatContext, options: ptr ptr AVDictionary): cint # warning
proc avformat_init_output* (s: ptr AVFormatContext, options: ptr ptr AVDictionary): cint # warning
proc av_write_frame* (s: ptr AVFormatContext, pkt: ptr AVPacket): cint
proc av_interleaved_write_frame* (s: ptr AVFormatContext, pkt: ptr AVPacket): cint
proc av_write_uncoded_frame* (s: ptr AVFormatContext, stream_index: cint, frame: ptr AVFrame): cint
proc av_interleaved_write_uncoded_frame* (s: ptr AVFormatContext, stream_index: cint, frame: ptr AVFrame): cint
proc av_write_uncoded_frame_query* (s: ptr AVFormatContext, stream_index: cint): cint
proc av_write_trailer* (s: ptr AVFormatContext): cint
proc av_guess_format* (short_name: cstring, filename: cstring, mime_type: cstring): ptr AVOutputFormat
proc av_guess_codec* (fmt: ptr AVOutputFormat, short_name, filenamme, mime_type: cstring, `type`: AVMediaType): AVCodecID
proc av_get_output_timestamp* (s: ptr AVFormatContext, stream: cint, dts, wall: ptr int64): cint
proc av_hex_dump* (f: ptr File, buf: ptr uint8, size: cint)
proc av_hex_dump_log* (avcl: pointer, level: cint, buf: ptr uint8, size: cint)
proc av_pkt_dump2* (f: ptr File, pkt: ptr AVPacket, dump_payload: cint, st: ptr AVStream)
proc av_pkt_dump_log2* (avcl: pointer, level: cint, pkt: ptr AVPacket, dump_payload: cint, st: ptr AVStream)
proc av_codec_get_id* (tags: ptr ptr AVCodecTag, tag: cuint): AVCodecID
proc av_codec_get_tag* (tags: ptr ptr AVCodecTag, id: AVCodecID): cuint
proc av_codec_get_tag2* (tags: ptr ptr AVCodecTag, id: AVCodecID, tag: ptr cuint): cint
proc av_find_default_stream_index* (s: ptr AVFormatContext): cint
proc av_index_search_timestamp* (st: ptr AVStream, timestamp: int64, flags: cint): cint
proc av_add_index_entry* (st: ptr AVStream, pos, time_stamp: int64, size, distance, flags: cint): cint
proc av_url_split* (proto: cstring, proto_size: cint, authorization: cstring, authorization_size: cint, hostname: cstring, hostname_size: cint, port_ptr: ptr cint, path: cstring, path_size: cint, url: cstring)
proc av_dump_format* (ic: ptr AVFormatContext, index: cint, url: cstring, is_output: cint)
proc av_get_frame_filename2* (buf: cstring, buf_size: cint, path: cstring, number: cint, flags: cint): cint
proc av_get_frame_filename* (buf: cstring, buf_size: cint, path: cstring, number: cint): cint
proc av_filename_number_test* (filename: cstring): cint
proc av_sdp_create* (ac: ptr openArray[AVFormatContext], n_files: cint, buf: cstring, size: cint): cint
proc av_match_ext* (filename, extensions: cstring): cint
proc avformat_query_codec* (ofmt: ptr AVOutputFormat, codec_id: AVCodecID, std_compliance: cint): cint
proc avformat_get_riff_video_tags* (): ptr AVCodecTag
proc avformat_get_riff_audio_tags* (): ptr AVCodecTag
proc avformat_get_mov_video_tags* (): AVCodecTag
proc avformat_get_mov_audio_tags* (): AVCodecTag
proc av_guess_sample_aspect_ratio* (format: ptr AVFormatContext, stream: ptr AVStream, frame: ptr AVFrame): AVRational
proc av_guess_frame_rate* (ctx: ptr AVFormatContext, stream: ptr AVStream, frame: ptr AVFrame): AVRational
proc avformat_match_stream_specifier* (s: ptr AVFormatContext, st: ptr AVStream, spec: cstring): cint
proc avformat_queue_attached_pictures* (s: ptr AVFormatContext): cint
proc avformat_transfer_internal_stream_timing_info* (ofmt: ptr AVOutputFormat, ost, ist: ptr AVStream, copy_tb: AVTimebaseSource): cint
proc av_stream_get_codec_timebase* (st: ptr AVStream): AVRational

#when defined(FF_API_AVIOFORMAT):

when defined(FF_API_FORMAT_GET_SET):
  proc av_stream_get_r_frame_rate* (s: ptr AVStream): AVRational {.deprecated.}
  proc av_stream_set_r_frame_rate* (s: ptr AVStream, r: AVRational) {.deprecated.}
  proc av_format_get_probe_score* (s: ptr AVFormatContext): cint {.deprecated.}
  proc av_format_get_video_codec* (s: ptr AVFormatContext): ptr AVCodec {.deprecated.}
  proc av_format_set_video_codec* (s: ptr AVFormatContext, c: ptr AVCodec) {.deprecated.}
  proc av_format_get_audio_codec* (s: ptr AVFormatContext): ptr AVCodec {.deprecated.}
  proc av_format_set_audio_codec* (s: ptr AVFormatContext, c: ptr AVCodec) {.deprecated.}
  proc av_format_get_subtitle_codec* (s: ptr AVFormatContext): ptr AVCodec {.deprecated.}
  proc av_format_set_subtitle_codec* (s: ptr AVFormatContext, c: ptr AVCodec) {.deprecated.}
  proc av_format_get_data_codec* (s: ptr AVFormatContext): ptr AVCodec {.deprecated.}
  proc av_format_set_data_codec* (s: ptr AVFormatContext, c: ptr AVCodec) {.deprecated.}
  proc av_format_get_metadata_header_padding* (s: ptr AVFormatContext): cint {.deprecated.}
  proc av_format_set_metadata_header_padding* (s: ptr AVFormatContext, c: cint) {.deprecated.}
  proc av_format_get_opaque* (s: ptr AVFormatContext): pointer {.deprecated.}
  proc av_format_set_opaque* (s: ptr AVFormatContext, opaque: pointer) {.deprecated.}
  proc av_format_get_control_message_cb* (s: ptr AVFormatContext): av_format_control_message {.deprecated.}
  proc av_format_set_control_message_cb* (s: ptr AVFormatContext, callback: av_format_control_message) {.deprecated.}
  
  when defined(FF_API_OLD_OPEN_CALLBACKS):
    proc av_format_get_open_cb (s: ptr AVFormatContext): AVOpenCallback {.deprecated.}
    proc av_format_set_open_cb (s: ptr AVFormatContext, callback: AVOpenCallback) {.deprecated.}

  when defined(FF_API_LAVF_FFSERVER):
    proc av_stream_get_recommended_encoder_configuration* (s: ptr AVStream): cstring {.deprecated.}
    proc av_stream_set_recommended_encoder_configuration* (s: ptr AVStream, configuration: cstring) {.deprecated.}

when defined(FF_API_LAVF_MP4A_LATM):
  const AVFMT_FLAG_MP4A_LATM* {.deprecated.} = 0x8000

when defined(FF_API_LAVF_KEEPSIDE_FLAG):
  const AVFMT_FLAG_KEEP_SIDE_DATA* {.deprecated.} = 0x40000

when defined(FF_API_NEXT):
  proc av_register_all* () {.deprecated.}
  proc av_register_input_format* (format: ptr AVInputFormat) {.deprecated.}
  proc av_register_output_format* (format: ptr AVOutputFormat) {.deprecated.}
  proc av_iformat_next* (f: ptr AVInputFormat): ptr AVInputFormat {.deprecated.}
  proc av_oformat_next* (f: ptr AVOutputFormat): ptr AVOutputFormat {.deprecated.}

when defined(FF_API_OLD_BSF):
  proc av_apply_bitstream_filters* (codec: ptr AVCodecContext, pkt: ptr AVPacket, bsfc: ptr AVBitStreamFilterContext): cint {.deprecated.}
