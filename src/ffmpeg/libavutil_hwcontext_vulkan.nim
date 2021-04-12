when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

#include <vulkan/vulkan.h>

type
  AVVulkanDeviceContext* = object
    alloc: ptr VkAllocationCallbacks
    inst: VkInstance
    phys_dev: VkPhysicalDevice
    act_dev: VkDevice
    queue_family_index: cuint
    nb_graphics_queues: cuint
    queue_family_tx_index: cuint
    nb_tx_queues: cuint
    queue_family_comp_index: cuint
    nb_comp_queues: cuint
    enabled_inst_extensions: ptr cchar
    nb_enabled_inst_extensions: cint
    enabled_dev_extensions: ptr cchar
    nb_enabled_dev_extensions: cint
    device_features: VkPhysicalDeviceFeatures2
  
  AVVulkanFramesContext* = object
    tiling: VkImageTiling
    usage: VkImageUsageFlagBits
    create_pnext: pointer
    alloc_pnext: array[AV_NUM_DATA_POINTERS, pointer]
  
  AVVkFrame* = object
    img: array[AV_NUM_DATA_POINTERS, VkImage]
    tiling: VkImageTiling
    mem: array[AV_NUM_DATA_POINTERS, VkDeviceMemory]
    size: array[AV_NUM_DATA_POINTERS, csize_t]
    flags: VkMemoryPropertyFlagBits
    access: array[AV_NUM_DATA_POINTERS, VkAccessFlagBits]
    layout: array[AV_NUM_DATA_POINTERS, VkImageLayout]
    sem: array[AV_NUM_DATA_POINTERS, VkSemaphore]
    internal: ptr AVVkFrameInternal

proc av_vk_frame_alloc* (): AVVkFrame
proc av_vkfmt_from_pixfmt* (p: AVPixelFormat): ptr VkFormat
