from ../types import AVAudioFifo, AVSampleFormat

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

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
