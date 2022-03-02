from ../types import AVVideoEncParams, AVVideoBlockParams, AVFrame, AVVideoEncParamsType

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_video_enc_params_alloc* (`type`: AVVideoEncParams, nb_blocka: cuint, out_size: ptr csize_t): ptr AVVideoEncParams
proc av_video_enc_params_create_side_data* (frame: ptr AVFrame, `type`: AVVideoEncParamsType, nb_blocks: cuint): ptr AVVideoEncParams

# TODO
proc av_video_enc_params_block* (par: ptr AVVideoEncParams, idx: cuint): ptr AVVideoBlockParams =
  discard
