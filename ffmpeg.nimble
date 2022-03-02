# Package

version       = "0.5.0"
author        = "momeemt"
description   = "ffmpeg.nim is the Nim binding for FFMpeg(5.0)."
license       = "GPL-3.0-or-later"
srcDir        = "src"
installDirs   = @["cinclude", "ffmpeg"]
installFiles  = @["ffmpeg.nim"]

# Dependencies

requires "nim >= 1.4.4"
