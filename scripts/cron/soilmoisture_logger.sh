#!/bin/bash

set -eu

TIMESTAMP=$(date +%Y-%m-%d_%H:%M)

SOILMOISTURE=$(/projects/musical-plants/venv/bin/python3 /projects/musical-plants/scripts/python/soilmoisture_ingest.py)

DATE=$(date +%Y-%m-%d)

echo "$TIMESTAMP,$SOILMOISTURE" >> "/projects/musical-plants/data/$DATE/moisture_$DATE.csv"
