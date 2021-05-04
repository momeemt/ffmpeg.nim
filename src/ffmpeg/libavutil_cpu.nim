when defined(windows):
  {.push importc, dynlib: "avcodec(|-55|-56|-57|-58|-59).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|.55|.56|.57|.58|.59).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.55|.56|.57|.58|.59)", cdecl.}

const
  AV_CPU_FLAG_FORCE* = 0x80000000
  AV_CPU_FLAG_MMX* = 0x0001
  AV_CPU_FLAG_MMXEXT* = 0x0002
  AV_CPU_FLAG_3DNOW* = 0x0004
  AV_CPU_FLAG_SSE* = 0x0008
  AV_CPU_FLAG_SSE2* = 0x0010
  AV_CPU_FLAG_SSE2SLOW* = 0x40000000
  AV_CPU_FLAG_3DNOWEXT* = 0x0020
  AV_CPU_FLAG_SSE3* = 0x0040
  AV_CPU_FLAG_SSE3SLOW* = 0x20000000
  AV_CPU_FLAG_SSSE3* = 0x0080
  AV_CPU_FLAG_SSSE3SLOW* = 0x4000000
  AV_CPU_FLAG_ATOM* = 0x10000000
  AV_CPU_FLAG_SSE4* = 0x0100
  AV_CPU_FLAG_SSE42* = 0x0200
  AV_CPU_FLAG_AESNI* = 0x80000
  AV_CPU_FLAG_AVX* = 0x4000
  AV_CPU_FLAG_AVXSLOW* = 0x8000000
  AV_CPU_FLAG_XOP* = 0x0400
  AV_CPU_FLAG_FMA4* = 0x0800
  AV_CPU_FLAG_CMOV* = 0x1000
  AV_CPU_FLAG_AVX2* = 0x8000
  AV_CPU_FLAG_FMA3* = 0x10000
  AV_CPU_FLAG_BMI1* = 0x20000
  AV_CPU_FLAG_BMI2* = 0x40000
  AV_CPU_FLAG_AVX512* = 0x100000
  AV_CPU_FLAG_ALTIVEC* = 0x0001
  AV_CPU_FLAG_VSX* = 0x0002
  AV_CPU_FLAG_POWER8* = 0x0004
  AV_CPU_FLAG_ARMV5TE* = 1 shl 0
  AV_CPU_FLAG_ARMV6* = 1 shl 1
  AV_CPU_FLAG_ARMV6T2* = 1 shl 2
  AV_CPU_FLAG_VFP* = 1 shl 3
  AV_CPU_FLAG_VFPV3* = 1 shl 4
  AV_CPU_FLAG_NEON* = 1 shl 5
  AV_CPU_FLAG_ARMV8* = 1 shl 6
  AV_CPU_FLAG_VFP_VM* = 1 shl 7
  AV_CPU_FLAG_SETEND* = 1 shl 16

proc av_get_cpu_flags* (): cint
proc av_force_cpu_flags* (flags: cint)
proc av_set_cpu_flags_mask* (mask: cint) {.deprecated.}
proc av_parse_cpu_flags* (s: cstring): cint {.deprecated.}
proc av_parse_cpu_caps* (flags: ptr cuint, s: cstring): cint
proc av_cpu_count* (): cint
proc av_cpu_max_align* (): csize_t
