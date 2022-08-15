# Package

version       = "0.5.5"
author        = "momeemt"
description   = "ffmpeg.nim is the Nim binding for FFmpeg 5.0."
license       = "LGPL-2.1-or-later"
srcDir        = "src"

# Dependencies

requires "nim >= 1.4.4"

# Tasks
task docs, "Generate documents":
  rmDir "docs"
  exec "nimble doc --project --index:on -o:docs src/ffmpeg.nim"

task ci, "Run CI":
  exec "nim -v"
  exec "nimble -v"
  exec "nimble check"
  exec "nimble install -Y"
  exec "nimble test -Y"
  exec "nimble docs -Y"
