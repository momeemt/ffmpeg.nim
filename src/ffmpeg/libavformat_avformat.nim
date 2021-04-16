import ffmpeg_types

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
