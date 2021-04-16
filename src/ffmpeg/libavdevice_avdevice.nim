import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avdevice(|-55|-56|-57|-58).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "avdevice(|.55|.56|.57|.58).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavdevice.so(|.55|.56|.57|.58)", cdecl.}

var av_device_capabilities*: seq[AVOption]

proc avdevice_version* (): cuint
proc avdevice_configuration* (): cstring
proc avdevice_license* (): cstring
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
proc avdevice_list_input_sources* (device: ptr AVInputFormat, device_name: cstring, device_options: ptr AVDictionary, device_list: ptr ptr AVDeviceInfoList): cint
proc avdevice_list_output_sinks* (device: ptr AVOutputFormat, device_name: cstring, device_options: ptr AVDictionary, device_list: ptr ptr AVDeviceInfoList): cint
