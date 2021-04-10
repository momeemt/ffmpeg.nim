when defined(windows):
  {.push importc, dynlib: "avdevice(|-55|-56|-57|-58).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avdevice(|.55|.56|.57|.58).dylib".}
else:
  {.push importc, dynlib: "libavdevice.so(|.55|.56|.57|.58)".}

# let av_device_capabilities*: seq[AVOption]

type
  AVDeviceRect* = object
    x: cint
    y: cint
    width: cint
    height: cint
  
  AVAppToDevMessageType* = enum
    AV_APP_TO_DEV_NONE = MKBETAG('N','O','N','E')
    AV_APP_TO_DEV_WINDOW_SIZE = MKBETAG('G','E','O','M')
    AV_APP_TO_DEV_WINDOW_REPAINT = MKBETAG('R','E','P','A')
    AV_APP_TO_DEV_PAUSE = MKBETAG('P', 'A', 'U', ' ')
    AV_APP_TO_DEV_PLAY = MKBETAG('P', 'L', 'A', 'Y')
    AV_APP_TO_DEV_TOGGLE_PAUSE = MKBETAG('P', 'A', 'U', 'T')
    AV_APP_TO_DEV_SET_VOLUME = MKBETAG('S', 'V', 'O', 'L')
    AV_APP_TO_DEV_MUTE = MKBETAG(' ', 'M', 'U', 'T')
    AV_APP_TO_DEV_UNMUTE = MKBETAG('U', 'M', 'U', 'T')
    AV_APP_TO_DEV_TOGGLE_MUTE = MKBETAG('T', 'M', 'U', 'T')
    AV_APP_TO_DEV_GET_VOLUME = MKBETAG('G', 'V', 'O', 'L')
    AV_APP_TO_DEV_GET_MUTE = MKBETAG('G', 'M', 'U', 'T')
  
  AVDevToAppMessageType* = enum
    AV_DEV_TO_APP_NONE = MKBETAG('N','O','N','E')
    AV_DEV_TO_APP_CREATE_WINDOW_BUFFER = MKBETAG('B','C','R','E')
    AV_DEV_TO_APP_PREPARE_WINDOW_BUFFER = MKBETAG('B','P','R','E')
    AV_DEV_TO_APP_DISPLAY_WINDOW_BUFFER = MKBETAG('B','D','I','S')
    AV_DEV_TO_APP_DESTROY_WINDOW_BUFFER = MKBETAG('B','D','E','S')
    AV_DEV_TO_APP_BUFFER_OVERFLOW = MKBETAG('B','O','F','L')
    AV_DEV_TO_APP_BUFFER_UNDERFLOW = MKBETAG('B','U','F','L')
    AV_DEV_TO_APP_BUFFER_READABLE = MKBETAG('B','R','D',' ')
    AV_DEV_TO_APP_BUFFER_WRITABLE = MKBETAG('B','W','R',' ')
    AV_DEV_TO_APP_MUTE_STATE_CHANGED = MKBETAG('C','M','U','T')
    AV_DEV_TO_APP_VOLUME_LEVEL_CHANGED = MKBETAG('C','V','O','L')
  
  AVDeviceCapabilitiesQuery* = object
    av_class: ptr AVClass
    device_context: ptr AVFormatContext
    codec: AVCodecID
    sample_format: AVSampleFormat
    pixel_format: AVPixelFormat
    sample_rate: cint
    channels: cint
    channel_layout: int64
    window_width: cint
    window_height: cint
    frame_width: cint
    frame_height: cint
    fps: AVRational
  
  AVDeviceInfo* = object
    device_name: ptr cchar
    device_description: ptr cchar
  
  AVDeviceInfoList* = object
    devices: ptr ptr AVDeviceInfo
    nb_devices: cint
    default_device: cint

proc avdevice_version* (): cuint
proc avdevice_configuration* (): ptr cchar
proc avdevice_license* (): ptr cchar
proc avdevice_register_all* ()
proc av_input_audio_device_next* (d: ptr AVInputFormat): ptr AVInputFormat
proc av_input_video_device_next* (d: ptr AVInputFormat): ptr AVInputFormat
proc av_output_audio_device_next* (d: ptr AVOutputFormat): ptr AVOutputFormat
proc av_output_video_device_next* (d: ptr AVOutputFormat): ptr AVOutputFormat
proc avdevice_app_to_dev_control_message* (s: ptr AVFormatContext, `type`: AVAppToDevMessageType, data: pointer, data_size: csize_t): cint
proc avdevice_dev_to_app_control_message* (s: ptr AVFormatContext, `type`: AVDevToAppMessageType, data: pointer, data_size: csize_t): cint
proc avdevice_capabilities_create* (caps: ptr ptr AVDeviceCapabilitiesQuery, s: ptr AVFormatContext, device_options: ptr ptr AVDictionary): cint
proc avdevice_capabilities_free* (caps: ptr ptr AVDeviceCapabilitiesQuery, s: ptr AVFormatContext)
proc avdevice_list_devices* (s: ptr AVFormatContext, device_list: ptr ptr AVDeviceInfoList): cint
proc avdevice_free_list_devices* (device_list: ptr ptr AVDeviceInfoList)
proc avdevice_list_input_sources* (device: ptr AVInputFormat, device_name: ptr cchar, device_options: ptr AVDictionary, device_list: ptr ptr AVDeviceInfoList): cint
proc avdevice_list_output_sinks* (device: ptr AVOutputFormat, device_name: ptr cchar, device_options: ptr AVDictionary, device_list: ptr ptr AVDeviceInfoList): cint
