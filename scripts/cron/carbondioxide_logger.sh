#!/bin/bash

set -eu

TIMESTAMP=$(date +%Y-%m-%d_%H:%M)

CARBONDIOXIDE=$(python3 /projects/musical-plants/scripts/python/carbondioxide_ingest.py)

echo "$TIMESTAMP,$CARBONDIOXIDE" >> /projects/musical-plants/data/carbondioxide.csv
