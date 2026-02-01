#!/bin/bash

set -eu

DATE=$(date +%Y-%m-%d-%A)

/usr/bin/cvlc --loop --gain 0.9 /projects/musical-plants/music/classicalmusic_compilation.mp3 &

VLC_PID=$!

sleep 8h

echo "$DATE" >> /projects/musical-plants/data/musicdays_log.txt

kill $VLC_PID
