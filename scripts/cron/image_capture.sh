#!/bin/bash

set -eu

DATE=$(date +%Y-%m-%d)
MONTHDAY=$(date +%m-%d)

mkdir -p "/projects/musical-plants/images/$DATE"

for ((i=0; i<96; i++)); do
    rpicam-still --nopreview --timeout 1000 \
    -o "/projects/musical-plants/images/$DATE/plant_"$MONTHDAY"_$(printf '%04d' "$i").jpg" \
    --awb indoor \
    --gain 1.0 \
    --shutter 16667 \
    --width 4606 \
    --height 2590

    sleep 300

done
