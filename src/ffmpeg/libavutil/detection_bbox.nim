from ../types import AVRational, AVFrame
from avassert import av_assert0

when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|.58|.59|.60|.61|.62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.58|.59|.60|.61|.62)", cdecl.}

const
  AV_DETECTION_BBOX_LABEL_NAME_MAX_SIZE* = 64
  AV_NUM_DETECTION_BBOX_CLASSIFY* = 4

type
  AVDetectionBBox* = object
    x*, y*, w*, h*: cint
    classify_count*: uint32
    classify_labels*: array[
      AV_NUM_DETECTION_BBOX_CLASSIFY, array[
        AV_DETECTION_BBOX_LABEL_NAME_MAX_SIZE, cchar
      ]
    ]
    classify_confidences*: array[AV_NUM_DETECTION_BBOX_CLASSIFY, AVRational]
  
  AVDetectionBBoxHeader* = object
    source*: array[256, cchar]
    nb_bboxes*: uint32
    bboxes_offset*: csize_t
    bbox_size*: csize_t

proc av_get_detection_bbox* (header: ptr AVDetectionBBoxHeader, idx: cuint): ptr AVDetectionBBox {.inline.} =
  # av_assert0(idx < header[].nb_bboxes)
  # result = cast[ptr AVDetectionBBox](
  #   cast[ptr uint8](header) + header[].bboxes_offset + idx * header[].bbox_size
  # )
  discard

proc av_detection_bbox_alloc* (nb_bboxes: uint32, out_size: ptr csize_t): ptr AVDetectionBBoxHeader
proc av_detection_bbox_create_side_data* (frame: ptr AVFrame, nb_bboxes: uint32): ptr AVDetectionBBoxHeader
