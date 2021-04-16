import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_audio_fifo_free* (af: ptr AVAudioFifo)
proc av_audio_fifo_alloc* (sample_fmt: AVSampleFormat, channels, nb_samples: cint): ptr AVAudioFifo
proc av_audio_fifo_realloc* (af: ptr AVAudioFifo, nb_samples: cint): cint # warning
proc av_audio_fifo_write* (af: ptr AVAudioFifo, data: ptr pointer, nb_samples: cint): cint
proc av_audio_fifo_peek* (af: ptr AVAudioFifo, data: ptr pointer, nb_samples: cint): cint
proc av_audio_fifo_peek_at* (af: ptr AVAudioFifo, data: ptr pointer, nb_samples, offset: cint): cint
proc av_audio_fifo_read* (af: ptr AVAudioFifo, data: ptr pointer, nb_samples: cint): cint
proc av_audio_fifo_drain* (af: ptr AVAudioFifo, nb_samples: cint): cint
proc av_audio_fifo_reset* (af: ptr AVAudioFifo)
proc av_audio_fifo_size* (af: ptr AVAudioFifo): cint
proc av_audio_fifo_space* (af: ptr AVAudioFifo): cint
