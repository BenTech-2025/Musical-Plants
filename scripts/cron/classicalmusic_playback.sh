#!/bin/bash

/usr/bin/cvlc --loop --gain 0.9 /projects/musical-plants/music/classicalmusic_compilation.mp3 &

VLC_PID=$!

sleep 8h

kill $VLC_PID
