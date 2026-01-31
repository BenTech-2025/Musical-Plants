#!/bin/bash

set -eu

TIMESTAMP=$(date +%Y-%m-%d_%H:%M)

HUMIDITY=$(python3 /projects/musical-plants/scripts/python/humidity_ingest.py)

DATE=$(date +%Y-%m-%d)

echo "$TIMESTAMP,$HUMIDITY" >> "/projects/musical-plants/data/$DATE/humidity_$DATE.csv"
