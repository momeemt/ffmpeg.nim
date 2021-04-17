import ffmpeg_types

when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|.55|.56|.57|.58|.59).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)", cdecl.}

proc av_encryption_info_alloc* (subsample_count, key_id_size, iv_size: cuint): AVEncryptionInfo
proc av_encryption_info_clone* (info: ptr AVEncryptionInfo): ptr AVEncryptionInfo
proc av_encryption_info_free* (info: ptr AVEncryptionInfo)
proc av_encryption_info_get_side_data* (side_data: ptr uint8, side_data_size: csize_t): ptr AVEncryptionInfo
proc av_encryption_info_add_side_data* (info: ptr AVEncryptionInfo, side_data_size: ptr csize_t): ptr uint8
proc av_encryption_init_info_alloc* (system_id_size, num_key_ids, key_id_size, data_size: uint32): AVEncryptionInitInfo
proc av_encryption_init_info_free* (info: ptr AVEncryptionInitInfo)
proc av_encryption_init_info_get_side_data* (side_data: ptr uint8, side_daata_size: csize_t): ptr AVEncryptionInitInfo
proc av_encryption_init_info_add_side_data* (info: ptr AVEncryptionInitInfo, side_data_size: ptr csize_t): ptr uint8
