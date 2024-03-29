# ARCHIEVE REASON
It seems that `ffmpeg` goes wrong with frame-rate when converting mkv to mov (23.98 to 23.81).

Check [GitHub | mkv2mp4_fcp](https://github.com/Yang-Xijie/mkv2mp4_fcp) instead.

# mkv2mov
Convert anime to import in FCP.

# README
This repo provides kinds of shell scrips to help you convert media that may be not well supported on `macOS`.

Author: Yang-Xijie <https://github.com/Yang-Xijie>

# Convert BDrip(.mkv) to mov
## Function
Convert anime `BDrip` (with `mkv` format, track 0 `HEVC`, track 1 `FLAC`) to `mov` in order to make it importable to `FCP` without recoding (just extract and re-package).

## Background
Sometimes we want to make MAD with animation. We download the resources (often `BDrip` because it's rather small with great quality) from PT sites or somewhere. But these files have a file format `.mkv` with `HEVC` (video) and `FLAC` (audio) codec.

To convert BDrip, one way is to transcode it. However, to *extrat and re-package* them into a compatitable continer is **much more efficient** and **keep the original quality**. This script is to realize it.

## Operation
Clone this repo or copy the content in `mkv2mov.sh`. Put the `mkv2mov.sh` in an appropriate place (notice that the script converts all `.mkv` files inside the path it exists). Then use `./mkv2mov.sh` to run the script.

## Note 
Use command `chmod a+x mkv2mov.sh` to make script executable.

You should make a slight adjustment to the script if your media has a codec *different* from `mkv format, track 0 HEVC, track 1 FLAC`.

For editing in `FCP`, it's better to use `Apple Prores` to make rendering faster. Choose `proxy` in `FCP` if your Mac doesn't have that great performance. 

**Notice** Import output files directly into `FCP` because they have the original quality. **Don't** transcode them using Compressor or something which decreases the quality (unless you convert them to Apple Prores 422 HQ).

# Other Scrips
Here are some other scripts that convert specific kinds of media.

## Convert BDMV(.m2ts) to mov
`BDMV` has the best quality of anime. Convert them to mov in order to import them into `FCP` with the best quality.

### Function
Convert `BDMV` anime (with `.m2ts` format, track 0` H264/AVC`, track 1 `PCM`) to `mov` in order to make it importable to `FCP` without recoding.

## Convert FLAC(.flac) to ALAC(.m4a)
`FLAC` is a codec for lossless audio. However, `FCP` or `Compressor` (and also `Music.app`) doesn't support that not-for-industry audio codec.

`ALAC` is also a codec for lossless audio designed by `Apple`. So it has great support in `macOS`.
### Function
The function of this script is to convert `FLAC` file (with a suffix `.flac`) to `ALAC` (with a suffix `.m4a`).

### Note
You may think command `ffmpeg -i song.flac -acodec alac song.m4a` or `ffmpeg -i song.flac song.m4a` is enough. But unfortunately sometimes it fails. Check here at [Stack Overflow](https://stackoverflow.com/questions/55429909/could-not-find-tag-for-codec-h264-in-stream-0-codec-ffmpeg-flac-to-alac-conver).