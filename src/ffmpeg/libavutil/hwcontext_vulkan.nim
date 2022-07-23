from ../types import AVVkFrame, VkFormat, AVPixelFormat

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

#if defined(_WIN32) && !defined(VK_USE_PLATFORM_WIN32_KHR)
#define VK_USE_PLATFORM_WIN32_KHR
#endif

proc av_vk_frame_alloc* (): AVVkFrame
proc av_vkfmt_from_pixfmt* (p: AVPixelFormat): ptr VkFormat
