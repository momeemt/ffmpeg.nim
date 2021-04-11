when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

type
  AVSubsampleEncryptionInfo* = object
    bytes_of_clear_data: cuint
    bytes_of_protected_data: cuint
  
  AVEncryptionInfo* = object
    scheme: cuint
    crypt_byte_block: cuint
    skip_byte_block: cuint
    key_id: ptr uint8
    key_id_size: cuint
    iv: ptr uint8
    iv_size: cuint
    subsamples: ptr AVSubsampleEncryptionInfo
    subsample_count: cuint

  AVEncryptionInitInfo* = object
    system_id: ptr uint8
    system_id_size: cuint
    key_ids: ptr ptr uint8
    num_key_ids: cuint
    key_id_size: cuint
    data: ptr uint8
    data_size: cuint
    next: ptr AVEncryptionInitInfo

proc av_encryption_info_alloc* (subsample_count, key_id_size, iv_size: cuint): AVEncryptionInfo
proc av_encryption_info_clone* (info: ptr AVEncryptionInfo): ptr AVEncryptionInfo
proc av_encryption_info_free* (info: ptr AVEncryptionInfo)
proc av_encryption_info_get_side_data* (side_data: ptr uint8, side_data_size: csize_t): ptr AVEncryptionInfo
proc av_encryption_info_add_side_data* (info: ptr AVEncryptionInfo, side_data_size: ptr csize_t): ptr uint8
proc av_encryption_init_info_alloc* (system_id_size, num_key_ids, key_id_size, data_size: uint32): AVEncryptionInitInfo
proc av_encryption_init_info_free* (info: ptr AVEncryptionInitInfo)
proc av_encryption_init_info_get_side_data* (side_data: ptr uint8, side_daata_size: csize_t): ptr AVEncryptionInitInfo
proc av_encryption_init_info_add_side_data* (info: ptr AVEncryptionInitInfo, side_data_size: ptr csize_t): ptr uint8
