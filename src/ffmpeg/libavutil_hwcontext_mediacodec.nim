{.pragma: hwcontext_mediacodec, importc, header: "libavutil/hwcontext_mediacodec.h".}

type
  AVMediaCodecDeviceContext* {.hwcontext_mediacodec.} = object
    surface: pointer
