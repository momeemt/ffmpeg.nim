# ffmpeg.nim
**This is a work in progress project!**

ffmpeg.nim is the Nim binding for FFMpeg.  
The version is `4.3.2`.  

There are other Nim bindings for FFMpeg.  
- [nimffmpeg](https://github.com/mashingan/nimffmpeg)
  - This is currently the best wrapper available, but it does not work on MacOS.
- [nim-ffmpeg](https://github.com/ahirner/nim-ffmpeg)
  - This is an old wrapper for FFmpeg `3.3.3`. It did not work, at least not in my environment.

## install

```bash:install
nimble install ffmpeg
```

However, you will need to install ffmpeg.