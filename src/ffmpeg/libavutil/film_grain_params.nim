from ../types import AVColorRange, AVColorPrimaries, AVColorTransferCharacteristic, AVColorSpace, AVFrame

when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|-58|-59|-60|-61|-62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|-58|-59|-60|-61|-62)", cdecl.}

type
  AVFilmGrainParamsType* = enum
    AV_FILM_GRAIN_PARAMS_NONE = 0
    AV_FILM_GRAIN_PARAMS_AV1
    AV_FILM_GRAIN_PARAMS_H274
  
  AVFilmGrainAOMParams* = object
    num_y_points*: cint
    y_points*: array[14, array[2, uint8]]
    chroma_scaling_from_luma*: cint
    num_uv_points*: array[2, cint]
    uv_points*: array[2, array[10, array[2, uint8]]]
    scaling_shift*: cint
    ar_coeff_lag*: cint
    ar_coeffs_y*: array[24, int8]
    ar_coeffs_uv*: array[2, array[25, int8]]
    ar_coeff_shift*: cint
    grain_scale_shift*: cint
    uv_mult*: array[2, cint]
    uv_mult_luma*: array[2, cint]
    uv_offset*: array[2, cint]
    overlap_flag*: cint
    limit_output_range*: cint
  
  AVFilmGrainH274Params* = object
    model_id*: cint
    bit_depth_luma*: cint
    bit_depth_chroma*: cint
    color_range*: AVColorRange
    color_primaries*: AVColorPrimaries
    color_trc*: AVColorTransferCharacteristic
    color_space*: AVColorSpace
    blending_mode_id*: cint
    log2_scale_factor*: cint
    component_model_present*: array[3, cint]
    num_intensity_intervals*: array[3, uint16]
    num_model_values*: array[3, uint8]
    intensity_interval_lower_bound*: array[3, array[256, uint8]]
    intensity_interval_upper_bound*: array[3, array[256, uint8]]
    comp_model_value*: array[3, array[256, array[6, int16]]]
  
  AVFilmGrainParamsCodec* {.union.} = object
    aom*: AVFilmGrainAOMParams
    h274*: AVFilmGrainH274Params
  
  AVFilmGrainParams* = object
    `type`*: AVFilmGrainParamsType
    seed*: uint64
    codec*: AVFilmGrainParamsCodec

proc av_film_grain_params_alloc* (size: ptr csize_t): ptr AVFilmGrainParams
proc av_film_grain_params_create_side_data* (frame: ptr AVFrame): ptr AVFilmGrainParams
