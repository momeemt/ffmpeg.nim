import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "postproc(|-53|-54|-55|-56|-57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "postproc(|.53|.54|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libpostproc.so(|.53|.54|.55|.56|.57)", cdecl.}

const
  PP_QUALITY_MAX* = 6
  PP_CPU_CAPS_MMX* = 0x80000000
  PP_CPU_CAPS_MMX2* = 0x20000000
  PP_CPU_CAPS_3DNOW* = 0x40000000
  PP_CPU_CAPS_ALTIVEC* = 0x10000000
  PP_CPU_CAPS_AUTO* = 0x00080000
  PP_FORMAT* = 0x00000008
  PP_FORMAT_420* = 0x00000011 or PP_FORMAT
  PP_FORMAT_422* = 0x00000001 or PP_FORMAT
  PP_FORMAT_411* = 0x00000002 or PP_FORMAT
  PP_FORMAT_444* = 0x00000000 or PP_FORMAT
  PP_FORMAT_440* = 0x00000010 or PP_FORMAT
  PP_PICT_TYPE_QP2* = 0x00000010 

when defined(LIBPOSTPROC_VERSION_INT):
  when LIBPOSTPROC_VERSION_INT < (52 shl 16):
    type
      pp_context* = pp_context_t
      pp_mode* =  pp_mode_t
    var pp_help*: cstring
  else:
    var pp_help*: cstring
else:
  var pp_help*: cstring

proc postproc_version* (): cuint
proc postproc_configuration* (): cstring
proc postproc_license* (): cstring
proc pp_postprocess* (src: array[3, ptr uint8], srcStride: array[3, cint], dst: array[3, ptr uint8], dstStride: array[3, cint], horizontalSize, verticalSize: cint, QP_store: ptr int8, QP_stride: cint, mode: ptr pp_mode, ppContext: ptr pp_context, pict_type: cint)
proc pp_get_mode_by_name_and_quality* (width, height, flags: cint): ptr pp_context
proc pp_free_context* (ppContext: ptr pp_context)
