import ffmpeg

# 测试 libavutil 版本
let version = avutil_version()
echo "libavutil version: ", version

# 测试 libavcodec 版本
let codecVersion = avcodec_version()
echo "libavcodec version: ", codecVersion

# 测试 libavformat 版本
let formatVersion = avformat_version()
echo "libavformat version: ", formatVersion

echo "FFmpeg libraries loaded successfully!"
