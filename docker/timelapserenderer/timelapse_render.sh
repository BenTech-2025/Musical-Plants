#!/bin/bash

set -eu

DATE=$(date +%Y-%m-%d)
MONTHDAY=$(date +%m-%d)



ffmpeg -framerate 24 \
  -i "/app/images/$DATE/plant_"$MONTHDAY"_%04d.jpg" \
  -c:v libx264 \
  -pix_fmt yuv420p \
  /app/videos/$DATE/plant_timelapse_$MONTHDAY.mp4
