#!/bin/bash
mkdir fade
for f in *.mp4; do
  dur=$(ffprobe -loglevel error -show_entries format=duration -of default=nk=1:nw=1 "$f")
  offset=$(bc -l <<< "$dur"-1)
  ffmpeg -i "$f" -filter_complex "[0:a]afade=type=in:duration=1,afade=type=out:duration=1:start_time='$offset'[a]" -map "[v]" -map "[a]" fade/"$f"
done
