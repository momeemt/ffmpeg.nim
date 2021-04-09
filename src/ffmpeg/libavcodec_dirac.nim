when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

const
  MAX_DWT_LEVELS* = 5

type
  DiracParseCodes* = enum
    DIRAC_PCODE_SEQ_HEADER      #= 0x00
    DIRAC_PCODE_END_SEQ         #= 0x10
    DIRAC_PCODE_AUX             #= 0x20
    DIRAC_PCODE_PAD             #= 0x30
    DIRAC_PCODE_PICTURE_CODED   #= 0x08
    DIRAC_PCODE_PICTURE_RAW     #= 0x48
    DIRAC_PCODE_PICTURE_LOW_DEL #= 0xC8
    DIRAC_PCODE_PICTURE_HQ      #= 0xE8
    DIRAC_PCODE_INTER_NOREF_CO1 #= 0x0A
    DIRAC_PCODE_INTER_NOREF_CO2 #= 0x09
    DIRAC_PCODE_INTER_REF_CO1   #= 0x0D
    DIRAC_PCODE_INTER_REF_CO2   #= 0x0E
    DIRAC_PCODE_INTRA_REF_CO    #= 0x0C
    DIRAC_PCODE_INTRA_REF_RAW   #= 0x4C
    DIRAC_PCODE_INTRA_REF_PICT  #= 0xCC
    DIRAC_PCODE_MAGIC           #= 0x42424344
  
  DiracVersionInfo* = object
    major, minor: cint

  AVDiracSeqHeader* = object
    width: cuint
    height: cuint
    chroma_format: uint8
    interlaced: uint8
    top_field_first: uint8
    frame_rate_index: uint8
    aspect_ratio_index: uint8
    clean_width: uint16
    clean_height: uint16
    clean_left_offset: uint16
    clean_right_offset: uint16
    pixel_range_index: uint8
    color_spec_index: uint8
    profile: cuint
    level: cuint
    framerate: AVRational
    sample_aspect_ratio: AVRational
    pix_fmt: AVPixelFormat
    color_range: AVColorRange
    color_primaries: AVColorPrimaries
    color_trc: AVColorTransferCharacteristic
    colorspace: AVColorSpace
    version: DiracVersionInfo
    bit_depth: cint

proc av_dirac_parse_sequence_header* (dsh: ptr ptr AVDiracSeqHeader, buf: ptr uint8, buf_size: csize_t, log_ctx: pointer): cint
