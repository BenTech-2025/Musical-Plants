#!/bin/bash

set -eu

TIMESTAMP=$(date +%Y-%m-%d_%H:%M)

SOILMOISTURE=$(python3 /projects/musical-plants/scripts/python/soilmoisture_ingest.py)

echo "$TIMESTAMP,$SOILMOISTURE" >> /projects/musical-plants/data/moisture.csv
