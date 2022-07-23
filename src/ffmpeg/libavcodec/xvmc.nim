{.pragma: xvmcInclude, importc, header: "<X11/extensions/XvMC.h>".}
{.pragma: xvmc, importc, header: "<libavcodec/xvmc.h>".}

type
  XvMCMacroBlock* {.xvmcInclude.} = object
  XvMCSurface* {.xvmcInclude.} = object

  xvmc_pix_fmt* {.xvmc, deprecated, bycopy.} = object
    xvmc_id*: cint
    data_blocks*: ptr cshort
    mv_blocks*: ptr XvMCMacroBlock
    allocated_mv_blocks*: cint
    allocated_data_blocks*: cint
    idct*: cint
    unsigned_intra*: cint
    p_surface*: ptr XvMCSurface
    p_past_surface*: ptr XvMCSurface
    p_future_surface*: ptr XvMCSurface
    picture_structure*: cuint
    flags*: cuint
    start_mv_blocks_num*: cint
    filled_mv_blocks_num*: cint
    next_free_data_block_num*: cint

when defined(windows):
  {.push importc, dynlib: "avcodec(|-58|-59|-60|-61|-62).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavcodec(|.58|.59|.60|.61|.62).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavcodec.so(|.58|.59|.60|.61|.62)", cdecl.}

const
  AV_XVMC_ID* = 0x1DC711C0
