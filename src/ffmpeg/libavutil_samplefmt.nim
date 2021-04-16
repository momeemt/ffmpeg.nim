import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_get_sample_fmt_name* (sample_fmt: AVSampleFormat): ptr char
proc av_get_sample_fmt* (name: ptr char): AVSampleFormat
proc av_get_alt_sample_fmt* (sample_fmt: AVSampleFormat, planar: int): AVSampleFormat
proc av_get_packed_sample_fmt* (sample_fmt: AVSampleFormat): AVSampleFormat
proc av_get_planar_sample_fmt* (saample_fmt: AVSampleFormat): AVSampleFormat
proc av_get_sample_fmt_string* (buf: ptr char, buf_size: int, sample_fmt: AVSampleFormat): ptr char
proc av_get_bytes_per_sample* (sample_fmt: AVSampleFormat): int
proc av_sample_fmt_is_planar* (sample_fmt: AVSampleFormat): int
proc av_samples_get_buffer_size* (linesize: ptr int, nb_channels: int, nb_samples: int, sample_fmt: AVSampleFormat, align: int): int
proc av_samples_fill_arrays* (audio_data: ptr ptr uint8, linesize: ptr int, buf: ptr uint8, nb_channels: int, nb_samples: int, sample_fmt: AVSampleFormat, align: int): int
proc av_samples_alloc* (audio_data: ptr ptr uint8, linesize: ptr int, buf: ptr uint8, nb_channels: int, nb_samples: int, sample_fmt: AVSampleFormat, align: int): int
proc av_samples_alloc_array_and_samples* (audio_data: ptr ptr uint8, linesize: ptr int, buf: ptr uint8, nb_channels: int, nb_samples: int, sample_fmt: AVSampleFormat, align: int): int
proc av_samples_copy* (dst: ptr ptr uint8, src: ptr ptr uint8, dst_offset: int, src_offset: int, nb_samples: int, nb_channels: int, sample_fmt: AVSampleFormat): int
proc av_samples_set_silence* (audio_data: ptr ptr uint8, offset: int, nb_samples: int, nb_channels: int, sample_fmt: AVSampleFormat): int
