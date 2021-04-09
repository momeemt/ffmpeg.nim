when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avcodec(|.55|.56|.57|.58|.59).dylib".}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)".}

when defined(FF_API_STRUCT_VAAPI_CONTEXT):
  type
    vaapi_context* {.deprecated.} = object
      display: pointer
      config_id: cuint
      context_id: cuint
