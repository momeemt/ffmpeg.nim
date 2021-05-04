import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.55|.56|.57).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)", cdecl.}

proc av_get_sample_fmt_name* (sample_fmt: AVSampleFormat): cstring
proc av_get_sample_fmt* (name: cstring): AVSampleFormat
proc av_get_alt_sample_fmt* (sample_fmt: AVSampleFormat, planar: cint): AVSampleFormat
proc av_get_packed_sample_fmt* (sample_fmt: AVSampleFormat): AVSampleFormat
proc av_get_planar_sample_fmt* (saample_fmt: AVSampleFormat): AVSampleFormat
proc av_get_sample_fmt_string* (buf: cstring, buf_size: cint, sample_fmt: AVSampleFormat): cstring
proc av_get_bytes_per_sample* (sample_fmt: AVSampleFormat): cint
proc av_sample_fmt_is_planar* (sample_fmt: AVSampleFormat): cint
proc av_samples_get_buffer_size* (linesize: ptr cint, nb_channels: cint, nb_samples: cint, sample_fmt: AVSampleFormat, align: cint): cint
proc av_samples_fill_arrays* (audio_data: ptr ptr uint8, linesize: ptr cint, buf: ptr uint8, nb_channels: cint, nb_samples: cint, sample_fmt: AVSampleFormat, align: cint): cint
proc av_samples_alloc* (audio_data: ptr ptr uint8, linesize: ptr cint, buf: ptr uint8, nb_channels: cint, nb_samples: cint, sample_fmt: AVSampleFormat, align: cint): cint
proc av_samples_alloc_array_and_samples* (audio_data: ptr ptr uint8, linesize: ptr cint, buf: ptr uint8, nb_channels: cint, nb_samples: cint, sample_fmt: AVSampleFormat, align: cint): cint
proc av_samples_copy* (dst: ptr ptr uint8, src: ptr ptr uint8, dst_offset: cint, src_offset: cint, nb_samples: cint, nb_channels: cint, sample_fmt: AVSampleFormat): cint
proc av_samples_set_silence* (audio_data: ptr ptr uint8, offset: cint, nb_samples: cint, nb_channels: cint, sample_fmt: AVSampleFormat): cint
