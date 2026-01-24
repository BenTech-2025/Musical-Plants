#!/bin/bash

set -eu

TIMESTAMP=$(date +%Y-%m-%d_%H:%M)

HUMIDITY=$(python3 /projects/musical-plants/scripts/python/humidity_ingest.py)

echo "$TIMESTAMP,$HUMIDITY" >> /projects/musical-plants/data/humidity.csv
