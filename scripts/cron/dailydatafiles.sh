#!/bin/bash

set -eu

DATE=$(date +%Y-%m-%d)

mkdir -p "/projects/musical-plants/data/$DATE"

touch "/projects/musical-plants/data/$DATE/carbondioxide_$DATE.csv" \
"/projects/musical-plants/data/$DATE/humidity_$DATE.csv" \
"/projects/musical-plants/data/$DATE/moisture_$DATE.csv" \
"/projects/musical-plants/data/$DATE/temperature_$DATE.csv"
 
echo "timestamp","carbondioxide" >> "/projects/musical-plants/data/$DATE/carbondioxide_$DATE.csv"
echo "timestamp","humidity" >> "/projects/musical-plants/data/$DATE/humidity_$DATE.csv"
echo "timestamp","moisture" >> "/projects/musical-plants/data/$DATE/moisture_$DATE.csv"
echo "timestamp","temperature" >> "/projects/musical-plants/data/$DATE/temperature_$DATE.csv"
