import os

# qsv is depend on intel media sdk library hence not included.
# in case of someone want to use it, they can directly import it
# like:
# import ffmpeg/libavcodec_qsv
# import ffmpeg/libavutil_hwcontext_qsv

const source = currentSourcePath.parentDir()
const includepath = "-I" & (source / "cinclude")
{.passC: includepath.}

import ffmpeg/[
  libavcodec_ac3_parser,
  libavcodec_adts_parser,
  libavcodec_avcodec,
  libavcodec_avdct,
  libavcodec_avfft,
  libavcodec_bsf,
  libavcodec_codec_desc,
  libavcodec_codec_id,
  libavcodec_codec_par,
  libavcodec_codec,
  libavcodec_dirac,
  libavcodec_dv_profile,
  libavcodec_jni,
  libavcodec_mediacodec,
  libavcodec_packet,
  libavcodec_vorbis_parser,
  libavdevice_avdevice,
  libavfilter_avfilter,
  libavfilter_buffersink,
  libavfilter_buffersrc,
  libavformat_avformat,
  libavformat_avio,
  libavresample_avresample,
  libavutil_adler32,
  libavutil_aes_ctr,
  libavutil_aes,
  libavutil_attributes,
  libavutil_audio_fifo,
  libavutil_avassert,
  libavutil_avconfig,
  libavutil_avstring,
  libavutil_avutil,
  libavutil_base64,
  libavutil_blowfish,
  libavutil_bprint,
  libavutil_bswap,
  libavutil_buffer,
  libavutil_camellia,
  libavutil_cast5,
  libavutil_channel_layout,
  libavutil_common,
  libavutil_cpu,
  libavutil_crc,
  libavutil_des,
  libavutil_dict,
  libavutil_display,
  libavutil_dovi_meta,
  libavutil_downmin_info,
  libavutil_encryption_info,
  libavutil_error,
  libavutil_eval,
  libavutil_fifo,
  libavutil_file,
  libavutil_frame,
  libavutil_hash,
  libavutil_hdr_dynamic_metadata,
  libavutil_hmac,
  libavutil_hwcontext_cuda,
  libavutil_hwcontext_drm,
  libavutil_hwcontext_mediacodec,
  libavutil_hwcontext_opencl,
  libavutil_hwcontext_vulkan,
  libavutil_hwcontext,
  libavutil_imgutils,
  libavutil_intfloat,
  libavutil_intreadwrite,
  libavutil_lfg,
  libavutil_log,
  libavutil_lzo,
  libavutil_macros,
  libavutil_mastering_display_metadata,
  libavutil_mathmatics,
  libavutil_md5,
  libavutil_mem,
  libavutil_motion_vector,
  libavutil_murmur3,
  libavutil_opt,
  libavutil_parseutils,
  libavutil_pixdesc,
  libavutil_pixelutils,
  libavutil_pixfmt,
  libavutil_random_seed,
  libavutil_rational,
  libavutil_rc4,
  libavutil_replaygain,
  libavutil_ripemd,
  libavutil_samplefmt,
  libavutil_sha,
  libavutil_sha512,
  libavutil_spherical,
  libavutil_stereo3d,
  libavutil_tea,
  libavutil_threadmessage,
  libavutil_time,
  libavutil_timecode,
  libavutil_timestamp,
  libavutil_tree,
  libavutil_tx,
  libavutil_video_enc_params,
  libpostproc_postprocess,
  libpostproc_version,
  libswresample_swresample,
  libswresample_version,
  libswscale_swscale,
  libswscale_version
]

when defined(windows):
  import ffmpeg/[
    libavcodec_d3d11va,
    libavcodec_dxva2,
    libavutil_hwcontext_d3d11va,
    libavutil_hwcontext_dxva2
  ]
else:
  import ffmpeg/[
    libavcodec_vaapi,
    libavcodec_vdpau,
    libavcodec_xvmc,
    libavutil_hwcontext_vaapi,
    libavutil_hwcontext_vdpau
  ]

when defined(macosx):
  import ffmpeg/[
    libavcodec_videotoolbox,
    libavutil_hwcontext_videotoolbox
  ]

export libavcodec_ac3_parser
export libavcodec_adts_parser
export libavcodec_avcodec
export libavcodec_avdct
export libavcodec_avfft
export libavcodec_bsf
export libavcodec_codec_desc
export libavcodec_codec_id
export libavcodec_codec_par
export libavcodec_codec
export libavcodec_dirac
export libavcodec_dv_profile
export libavcodec_jni
export libavcodec_mediacodec
export libavcodec_packet
export libavcodec_vorbis_parser
export libavdevice_avdevice
export libavfilter_avfilter
export libavfilter_buffersink
export libavfilter_buffersrc
export libavformat_avformat
export libavformat_avio
export libavresample_avresample
export libavutil_adler32
export libavutil_aes_ctr
export libavutil_aes
export libavutil_attributes
export libavutil_audio_fifo
export libavutil_avassert
export libavutil_avconfig
export libavutil_avstring
export libavutil_avutil
export libavutil_base64
export libavutil_blowfish
export libavutil_bprint
export libavutil_bswap
export libavutil_buffer
export libavutil_camellia
export libavutil_cast5
export libavutil_channel_layout
export libavutil_common
export libavutil_cpu
export libavutil_crc
export libavutil_des
export libavutil_dict
export libavutil_display
export libavutil_dovi_meta
export libavutil_downmin_info
export libavutil_encryption_info
export libavutil_error
export libavutil_eval
export libavutil_fifo
export libavutil_file
export libavutil_frame
export libavutil_hash
export libavutil_hdr_dynamic_metadata
export libavutil_hmac
export libavutil_hwcontext_cuda
export libavutil_hwcontext_drm
export libavutil_hwcontext_mediacodec
export libavutil_hwcontext_opencl
export libavutil_hwcontext_vulkan
export libavutil_hwcontext
export libavutil_imgutils
export libavutil_intfloat
export libavutil_intreadwrite
export libavutil_lfg
export libavutil_log
export libavutil_lzo
export libavutil_macros
export libavutil_mastering_display_metadata
export libavutil_mathmatics
export libavutil_md5
export libavutil_mem
export libavutil_motion_vector
export libavutil_murmur3
export libavutil_opt
export libavutil_parseutils
export libavutil_pixdesc
export libavutil_pixelutils
export libavutil_pixfmt
export libavutil_random_seed
export libavutil_rational
export libavutil_rc4
export libavutil_replaygain
export libavutil_ripemd
export libavutil_samplefmt
export libavutil_sha
export libavutil_sha512
export libavutil_spherical
export libavutil_stereo3d
export libavutil_tea
export libavutil_threadmessage
export libavutil_time
export libavutil_timecode
export libavutil_timestamp
export libavutil_tree
export libavutil_tx
export libavutil_video_enc_params
export libpostproc_postprocess
export libpostproc_version
export libswresample_swresample
export libswresample_version
export libswscale_swscale
export libswscale_version

when defined(windows):
  export libavcodec_d3d11va
  export libavcodec_dxva2
  export libavutil_hwcontext_d3d11va
  export libavutil_hwcontext_dxva2
else:
  export libavcodec_vaapi
  export libavcodec_vdpau
  export libavcodec_xvmc
  export libavutil_hwcontext_vaapi
  export libavutil_hwcontext_vdpau

when defined(macosx):
  export libavcodec_videotoolbox
  export libavutil_hwcontext_videotoolbox