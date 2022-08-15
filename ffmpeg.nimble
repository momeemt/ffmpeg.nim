# Package

version       = "0.5.3"
author        = "momeemt"
description   = "ffmpeg.nim is the Nim binding for FFmpeg 5.0."
license       = "LGPL-2.1-or-later"
srcDir        = "src"
installDirs   = @["cinclude", "ffmpeg"]
installFiles  = @["ffmpeg.nim"]

# Dependencies

requires "nim >= 1.4.4"
