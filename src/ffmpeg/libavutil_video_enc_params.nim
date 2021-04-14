from libavutil_frame import AVFrame

{.pragma: video_enc_params, importc, header: "<libavutil/video_enc_params.h>".}

type
  AVVideoEncParamsType* {.video_enc_params.} = enum
    AV_VIDEO_ENC_PARAMS_NONE = -1
    AV_VIDEO_ENC_PARAMS_VP9
    AV_VIDEO_ENC_PARAMS_H264
  
  AVVideoEncParams* {.video_enc_params.} = object
    nb_blocks*: cuint
    blocks_offset*: csize_t
    block_size*: csize_t
    `type`*: AVVideoEncParamsType
    qp*: int32
    delta_qp*: array[4, array[2, int32]]
  
  AVVideoBlockParams* {.video_enc_params.} = object
    src_x*, src_y*: cint
    w*, h*: cint
    delta_qp*: int32
  
when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_video_enc_params_alloc* (`type`: AVVideoEncParams, nb_blocka: cuint, out_size: ptr csize_t): ptr AVVideoEncParams
proc av_video_enc_params_create_side_data* (frame: ptr AVFrame, `type`: AVVideoEncParamsType, nb_blocks: cuint): ptr AVVideoEncParams

# TODO
proc av_video_enc_params_block* (par: ptr AVVideoEncParams, idx: cuint): ptr AVVideoBlockParams =
  discard
