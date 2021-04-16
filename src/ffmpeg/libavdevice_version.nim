from libavutil_version import AV_VERSION_INT, AV_VERSION

when defined(windows):
  {.push importc, dynlib: "avdevice(|-55|-56|-57|-58).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "avdevice(|.55|.56|.57|.58).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavdevice.so(|.55|.56|.57|.58)", cdecl.}

const
  LIBAVDEVICE_VERSION_MAJOR* = 58
  LIBAVDEVICE_VERSION_MINOR* = 10
  LIBAVDEVICE_VERSION_MICRO* = 100
  LIBAVDEVICE_VERSION_INT* = AV_VERSION_INT(LIBAVDEVICE_VERSION_MAJOR, LIBAVDEVICE_VERSION_MINOR, LIBAVDEVICE_VERSION_MICRO)
  LIBAVDEVICE_VERSION* = AV_VERSION(LIBAVDEVICE_VERSION_MAJOR, LIBAVDEVICE_VERSION_MINOR, LIBAVDEVICE_VERSION_MICRO)
  LIBAVDEVICE_BUILD* = LIBAVDEVICE_VERSION_INT
  LIBAVDEVICE_IDENT* = "Lavd"
