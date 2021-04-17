import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avresample(|-0|-1|-2|-3|-4|).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavresample(|.0|.1|.2|.3|.4|).dylib", cdecl.}
else:
  {.push importc, dynlib: "libresample.so(|.0|.1|.2|.3|.4|)", cdecl.}

const
  AVRESAMPLE_MAX_CHANNELS* = 32
  
proc avresample_version* (): cuint {.deprecated.}
proc avresample_configuration* (): cchar {.deprecated.}
proc avresample_license* (): cchar {.deprecated.}
proc avresample_get_class* (): AVClass {.deprecated.}
proc avresample_alloc_context* (): AVAudioResampleContext {.deprecated.}
proc avresample_open* (avr: ptr AVAudioResampleContext): cint {.deprecated.}
proc avresample_is_open* (avr: ptr AVAudioResampleContext): cint {.deprecated.}
proc avresample_close* (avr: ptr AVAudioResampleContext) {.deprecated.}
proc avresample_free* (avr: ptr ptr AVAudioResampleContext) {.deprecated.}
proc avresample_build_matrix* (in_layout, out_layout: uint64, center_mix_level, surround_mix_level, lfe_mix_level: cdouble, normalize: cint, matrix: ptr cdouble, stride: cint, martix_encoding: AVMatrixEncoding): cint {.deprecated.}
proc avresample_get_matrix* (avr: ptr AVAudioResampleContext, matrix: ptr cdouble, stride: cint): cint {.deprecated.}
proc avresample_set_matrix* (avr: ptr AVAudioResampleContext, matrix: ptr cdouble, stride: cint): cint {.deprecated.}
proc avresample_set_channel_mapping* (avr: ptr AVAudioResampleContext, channel_map: ptr cint): cint {.deprecated.}
proc avresample_set_compensation* (avr: ptr AVAudioResampleContext, sample_delta: cint, compensation_distance: cint): cint {.deprecated.}
proc avresample_get_out_samples* (avr: ptr AVAudioResampleContext, in_nb_samples: cint): cint {.deprecated.}
proc avresample_convert* (avr: ptr AVAudioResampleContext, output: ptr ptr uint8, out_plane_size: cint, out_samples: cint, input: ptr ptr uint8, in_plane_size: cint, in_samples: cint): cint {.deprecated.}
proc avresample_get_delay* (avr: ptr AVAudioResampleContext): cint {.deprecated.}
proc avresample_available* (avr: ptr AVAudioResampleContext): cint {.deprecated.}
proc avresample_read* (avr: ptr AVAudioResampleContext, output: ptr ptr uint8, nb_samples: cint): cint {.deprecated.}
proc avresample_convert_frame* (avr: ptr AVAudioResampleContext, output, input: ptr AVFrame): cint {.deprecated.}
proc avresample_config* (avr: ptr AVAudioResampleContext, `out`, `in`: ptr AVFrame): cint {.deprecated.}
