from libavutil_frame import AV_NUM_DATA_POINTERS
from libavutil_pixfmt import AVPixelFormat

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

{.pragma: vulkan, importc, header: "<vulkan/vulkan.h>".}
{.pragma: hwcontext_vulkan, importc, header: "<libavutil/hwcontext_vulkan.h>".}

type
  VkAllocationCallbacks* {.vulkan.} = object
  VkInstance* {.vulkan.} = object
  VkPhysicalDevice* {.vulkan.} = object
  VkDevice* {.vulkan.} = object
  VkPhysicalDeviceFeatures2* {.vulkan.} = object
  VkImageTiling* {.vulkan.} = object
  VkImageUsageFlagBits* {.vulkan.} = object
  VkImage* {.vulkan.} = object
  VkDeviceMemory* {.vulkan.} = object
  VkMemoryPropertyFlagBits* {.vulkan.} = object
  VkAccessFlagBits* {.vulkan.} = object
  VkImageLayout* {.vulkan.} = object
  VkSemaphore* {.vulkan.} = object
  VkFormat* {.vulkan.} = object
  
  AVVkFrameInternal* {.hwcontext_vulkan.} = object

  AVVulkanDeviceContext* {.hwcontext_vulkan.} = object
    alloc*: ptr VkAllocationCallbacks
    inst*: VkInstance
    phys_dev*: VkPhysicalDevice
    act_dev*: VkDevice
    queue_family_index*: cuint
    nb_graphics_queues*: cuint
    queue_family_tx_index*: cuint
    nb_tx_queues*: cuint
    queue_family_comp_index*: cuint
    nb_comp_queues*: cuint
    enabled_inst_extensions*: cstring
    nb_enabled_inst_extensions*: cint
    enabled_dev_extensions*: cstring
    nb_enabled_dev_extensions*: cint
    device_features*: VkPhysicalDeviceFeatures2
  
  AVVulkanFramesContext* {.hwcontext_vulkan.} = object
    tiling*: VkImageTiling
    usage*: VkImageUsageFlagBits
    create_pnext*: pointer
    alloc_pnext*: array[AV_NUM_DATA_POINTERS, pointer]
  
  AVVkFrame* {.hwcontext_vulkan.} = object
    img*: array[AV_NUM_DATA_POINTERS, VkImage]
    tiling*: VkImageTiling
    mem*: array[AV_NUM_DATA_POINTERS, VkDeviceMemory]
    size*: array[AV_NUM_DATA_POINTERS, csize_t]
    flags*: VkMemoryPropertyFlagBits
    access*: array[AV_NUM_DATA_POINTERS, VkAccessFlagBits]
    layout*: array[AV_NUM_DATA_POINTERS, VkImageLayout]
    sem*: array[AV_NUM_DATA_POINTERS, VkSemaphore]
    internal*: ptr AVVkFrameInternal

proc av_vk_frame_alloc* (): AVVkFrame
proc av_vkfmt_from_pixfmt* (p: AVPixelFormat): ptr VkFormat
