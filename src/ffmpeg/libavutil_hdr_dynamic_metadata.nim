when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

type
  AVHDRPlusOverlapProcessOption* = enum
    AV_HDR_PLUS_OVERLAP_PROCESS_WEIGHTED_AVERAGING = 0
    AV_HDR_PLUS_OVERLAP_PROCESS_LAYERING = 1
  
  AVHDRPlusPercentile* = object
    percentage: uint8
    percentile: AVRational
  
  AVHDRPlusColorTransformParams* = object
    window_upper_left_corner_x: AVRational
    window_upper_left_corner_y: AVRational
    window_lower_right_corner_x: AVRational
    window_lower_right_corner_y: AVRational
    center_of_ellipse_x: uint16
    center_of_ellipse_y: uint16
    rotation_angle: uint8
    semimajor_axis_internal_ellipse: uint16
    semimajor_axis_external_ellipse: uint16
    semiminor_axis_external_ellipse: uint16
    overlap_process_option: AVHDRPlusOverlapProcessOption
    maxscl: array[3, AVRational]
    average_maxrgb: AVRational
    num_distribution_maxrgb_percentiles: uint8
    distribution_maxrgb: array[15, AVHDRPlusPercentile]
    fraction_bright_pixels: AVRational
    tone_mapping_flag: uint8
    knee_point_x: AVRational
    knee_point_y: AVRational
    num_bezier_curve_anchors: uint8
    bezier_curve_anchors: array[15, AVRational]
    color_saturation_mapping_flag: uint8
    color_saturation_weight: AVRational
  
  AVDynamicHDRPlus* = object
    itu_t_t35_country_code: uint8
    application_version: uint8
    num_windows: uint8
    params: array[3, AVHDRPlusColorTransformParams]
    targeted_system_display_maximum_luminance: AVRational
    targeted_system_display_actual_peak_luminance_flag: uint8
    num_rows_targeted_system_display_actual_peak_luminance: uint8
    num_cols_targeted_system_display_actual_peak_luminance: uint8
    targeted_system_display_actual_peak_luminance: array[25, array[25, AVRational]]
    mastering_display_actual_peak_luminance_flag: uint8
    num_rows_mastering_display_actual_peak_luminance: uint8
    num_cols_mastering_display_actual_peak_luminance: uint8
    mastering_display_actual_peak_luminance: array[25, array[25, AVRational]]

proc av_dynamic_hdr_plus_alloc* (size: ptr csize_t): ptr AVDynamicHDRPlus
proc av_dynamic_hdr_plus_create_side_data* (frame: ptr AVFrame): ptr AVDynamicHDRPlus
