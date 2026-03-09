# FFmpeg.nim

**🎉 FFmpeg.nim supports FFmpeg 5.0!**

**This is a work in progress project!**

FFmpeg.nim is the Nim binding for FFmpeg.  
The version is `5.0`.  

There are other Nim bindings for FFMpeg.  
- [nimffmpeg](https://github.com/mashingan/nimffmpeg)
  - This is currently the best wrapper available, but it does not work on macOS.
- [nim-ffmpeg](https://github.com/ahirner/nim-ffmpeg)
  - This is an old wrapper for FFmpeg `3.3.3`. It did not work, at least not in my environment.

## install

```bash:install
nimble install FFmpeg
```

You will need to install FFmpeg.

## Compile Options

### `-d:FFmpegPostProc`

Enable libpostproc support. libpostproc is an optional FFmpeg library for video post-processing (e.g., denoising, sharpening). Some package managers (like Homebrew) do not include it by default.

If you encounter `could not load: libpostproc` error at runtime, it means your FFmpeg installation does not include libpostproc. You can either:
- Compile without the flag (default)
- Rebuild FFmpeg from source with libpostproc enabled

## Why don't we use 'c2nim'?
'c2nim' is a useful tool for developing a Nim wrapper. However, FFmpeg uses many attributes and syntaxes that cannot be analyzed by 'c2nim'.
As a result, wrapper development using 'c2nim' lacks accuracy and speed.
Therefore, we create the wrappers manually. If you find an incorrect type or name, please let us know in an issue and please create a pull request.

## Environment
Please help us test the execution in various environments.

- ⭕️ (Available)
- ❌ (Not Available)
- ❓ (Untested)

| | Result |
| --- | ---- |
| Windows | ❓ |
| macOS | ❓ |
| Linux | ❓ |