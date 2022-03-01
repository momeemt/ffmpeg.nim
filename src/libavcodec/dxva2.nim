from ../undefined_symbol import IDirectXVideoDecoder, DXVA2_ConfigPictureDecode, LPDIRECT3DSURFACE9

#if !defined(_WIN32_WINNT) || _WIN32_WINNT < 0x0602
#undef _WIN32_WINNT
#define _WIN32_WINNT 0x0602
#endif

const
  FF_DXVA2_WORKAROUND_SCALING_LIST_ZIGZAG* = 1
  FF_DXVA2_WORKAROUND_INTEL_CLEARVIDEO* = 2

type
  dxva_context* {.bycopy.} = object
    decoder*: ptr IDirectXVideoDecoder
    cfg*: ptr DXVA2_ConfigPictureDecode
    surface_count*: cuint
    surface*: ptr LPDIRECT3DSURFACE9
    workaround*: uint64
    report_id*: cuint
