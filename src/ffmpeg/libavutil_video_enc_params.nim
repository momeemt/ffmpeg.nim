import ffmpeg_types
  
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
