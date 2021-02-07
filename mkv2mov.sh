#!/bin/zsh

# - Summary
#   Convert anime BDrip (with mkv format, track 0 HEVC, track 1 FLAC)
#   to mov in order to make it importable to FCP without transcoding.
# - Discussion
#   On macOS 11.1 Big Sur, with FCP 10.5
#   Use `brew install mkvtoolnix ffmpeg` to install all tools needed.
#   Use `mkvinfo <mkv_file>` (`brew install mkvtoolnix`) to get details of mkv files.
#   Or download `MediaInfo.app` in `App Store` to check file (.mkv) info.
# - SeeAlso
#   GitHub Repository https://github.com/Yang-Xijie/mkv2mov
# - Author
#   Yang-Xijie
#   GitHub https://github.com/Yang-Xijie

turn=1 # counter, make name of intermediate files short.

for anime in **/*.mkv; do
    echo "=====" "[""$turn""]""START" "$anime" "====="

    ffmpeg -i "$anime" -map 0:0 -map 0:1 -vcodec copy -acodec alac -vtag hvc1 "${anime%.*}"".mov"

    # `-map 0:0` refers to the video track while `-map 0:1` refers to the audio track

    # For the audio, change FLAC(Free Lossless Audio Code) to ALAC(Apple Lossless Audio Code).
    # (FLAC is not well compatible with FCP)

    # The reason of using `-vtag hvc1`: https://video.stackexchange.com/questions/26418/whats-special-about-apple-device-generated-hevc-files-that-apparently-x265-ca
    # or `1.10` of https://developer.apple.com/documentation/http_live_streaming/hls_authoring_specification_for_apple_devices?language=objc

    echo "=====" "[""$turn""]""DONE!" "=====\n\n"
    let turn=$turn+1
done

echo "ALL DONE!\n"
