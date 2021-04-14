{.pragma: replaygain, importc, header: "<libavutil/replaygain.h>".}

type
  AVReplayGain* = object
    track_gain*: int32
    track_peak*: uint32
    album_gain*: int32
    album_peak*: uint32
