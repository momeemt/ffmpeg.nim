import os

# qsv is depend on intel media sdk library hence not included.
# in case of someone want to use it, they can directly import it
# like:
# import ffmpeg/libavcodec_qsv
# import ffmpeg/libavutil_hwcontext_qsv

const source = currentSourcePath.parentDir()
const includepath = "-I" & (source / "cinclude")
{.passC: includepath.}

import ffmpeg/libavcodec/[
  ac3_parser, adts_parser, avcodec,
  avdct, avfft, bsf, codec_desc,
  codec_id, codec_par, codec, dirac,
  dv_profile, jni, mediacodec,
  packet, vorbis_parser, defs
]
import ffmpeg/libavdevice/avdevice
import ffmpeg/libavfilter/[avfilter, buffersink, buffersrc]
import ffmpeg/libavformat/[avformat, avio]
import ffmpeg/libavutil/[
  adler32, aes_ctr, aes, attributes, audio_fifo,
  avassert, avconfig, avstring, avutil, base64,
  blowfish, bprint, bswap, buffer, camellia,
  cast5, channel_layout, common, cpu, crc, des,
  dict, display, dovi_meta, downmin_info, encryption_info,
  error, eval, fifo, file, frame, hash,
  hdr_dynamic_metadata, hmac, hwcontext_cuda,
  hwcontext_drm, hwcontext_mediacodec, hwcontext_opencl,
  hwcontext_vulkan, hwcontext, imgutils, intfloat,
  intreadwrite, lfg, log, lzo, macros,
  mastering_display_metadata, mathmatics, md5, mem,
  motion_vector, murmur3, opt, parseutils, pixdesc,
  pixelutils, pixfmt, random_seed, rational, rc4,
  replaygain, ripemd, samplefmt, sha, sha512,
  spherical, stereo3d, tea, threadmessage, time,
  timecode, timestamp, tree, tx, video_enc_params,
  film_grain_params, detection_bbox
]
import ffmpeg/libpostproc/postprocess
import ffmpeg/libpostproc/version as postprocVersion
import ffmpeg/libswresample/swresample
import ffmpeg/libswresample/version as swresampleVersion
import ffmpeg/libswscale/swscale
import ffmpeg/libswscale/version as swscaleVersion
import ffmpeg/types

when defined(windows):
  import ffmpeg/libavcodec/[d3d11va, dxva2]
  import ffmpeg/libavutil/[hwcontext_d3d11va, hwcontext_dxva2]
else:
  import ffmpeg/libavcodec/[vdpau, xvmc]
  import ffmpeg/libavutil/[hwcontext_vaapi, hwcontext_vdpau]

when defined(macosx):
  import ffmpeg/libavcodec/videotoolbox
  import ffmpeg/libavutil/hwcontext_videotoolbox

export types
export ac3_parser, adts_parser, avcodec, avdct, avfft
export bsf, codec_desc, codec_id, codec_par, codec, dirac, defs
export dv_profile, jni, mediacodec, packet, vorbis_parser
export avdevice, avfilter, buffersink, buffersrc, avformat, avio
export adler32, aes_ctr, aes, attributes, audio_fifo
export avassert, avconfig, avstring, avutil, base64
export blowfish, bprint, bswap, buffer, camellia
export cast5, channel_layout, common, cpu, crc, des
export dict, display, dovi_meta, downmin_info, encryption_info
export error, eval, fifo, file, frame, hash
export hdr_dynamic_metadata, hmac, hwcontext_cuda
export hwcontext_drm, hwcontext_mediacodec, hwcontext_opencl
export hwcontext_vulkan, hwcontext, imgutils, intfloat
export intreadwrite, lfg, log, lzo, macros
export mastering_display_metadata, mathmatics, md5, mem
export motion_vector, murmur3, opt, parseutils, pixdesc
export pixelutils, pixfmt, random_seed, rational, rc4
export replaygain, ripemd, samplefmt, sha, sha512
export spherical, stereo3d, tea, threadmessage, time
export timecode, timestamp, tree, tx, video_enc_params
export postprocess, postprocVersion, swresample, swresampleVersion
export swscale, swscaleVersion, film_grain_params, detection_bbox

when defined(windows):
  export d3d11va, dxva2, hwcontext_d3d11va, hwcontext_dxva2
else:
  export vdpau, xvmc, hwcontext_vaapi, hwcontext_vdpau

when defined(macosx):
  export videotoolbox, hwcontext_videotoolbox
