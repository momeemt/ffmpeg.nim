#include "libavformat/avformat.h"

AVStream* getAVStream(AVFormatContext *ctx, int index) {
    return ctx->streams[index];
}