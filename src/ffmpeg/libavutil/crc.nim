from ../types import AVCRC, AVCRCId

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_crc_init* (ctx: ptr AVCRC, le, bits: cint, poly: uint32, ctx_size: cint): cint
proc av_crc_get_table* (crc_id: AVCRCId): ptr AVCRC
proc av_crc* (ctx: ptr AVCRC, crc: uint32, buffer: ptr uint8, length: csize_t): uint32
