from ../types import AVDCT, AVClass

when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|-58|-59|-60|-61|-62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|-58|-59|-60|-61|-62)", cdecl.}

proc avcodec_dct_alloc* (): ptr AVDCT
proc avcodec_dct_init* (a1: ptr AVDCT): cint
proc avcodec_dct_get_class* (): ptr AVClass
