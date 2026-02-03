#!/bin/bash

set -eu

DATE=$(date +%Y-%m-%d)
MONTHDAY=$(date +%m-%d)


mkdir -p "/projects/musical-plants/images/$DATE"

mkdir -p "/projects/musical-plants/videos/$DATE"

for ((i=0; i<96; i++)); do

C02=$(/projects/musical-plants/venv/bin/python3 /projects/musical-plants/scripts/python/carbondioxide_ingest.py || echo "NA")

TEMPERATURE=$(cat /sys/bus/w1/devices/w1_bus_master1/28-0000005b67ce/temperature)
TEMP_C=$(awk "BEGIN { printf \"%.2f\", $TEMPERATURE / 1000 }")

HUMIDITY=$(/projects/musical-plants/venv/bin/python3 /projects/musical-plants/scripts/python/humidity_ingest.py || echo "NA")

MOISTURE=$(/projects/musical-plants/venv/bin/python3 /projects/musical-plants/scripts/python/soilmoisture_ingest.py || echo "NA")


    rpicam-still --nopreview --timeout 1000 \
    -o "/projects/musical-plants/images/$DATE/plant_"$MONTHDAY"_$(printf '%04d' "$i").jpg" \
    --awb indoor \
    --gain 1.0 \
    --shutter 16667 \
    --width 4606 \
    --height 2590 && \
    convert "/projects/musical-plants/images/$DATE/plant_"$MONTHDAY"_$(printf '%04d' "$i").jpg" \
    -gravity SouthEast \
    -pointsize 100 \
    -fill white \
    -stroke black -strokewidth 1 \
    -annotate +10+10 "$(date '+%Y-%m-%d %H:%M:%S'), Soil moisture:$MOISTURE, Humidity:$HUMIDITY%, Soil temperature:"${TEMP_C}°C", C02:$C02 ppm" \
    "/projects/musical-plants/images/$DATE/plant_"$MONTHDAY"_$(printf '%04d' "$i").jpg"


    sleep 300

done

