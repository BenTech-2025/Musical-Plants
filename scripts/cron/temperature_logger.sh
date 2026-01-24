#!/bin/bash

set -eu

TIMESTAMP=$(date +%Y-%m-%d_%H:%M)
TEMPERATURE=$(cat /sys/bus/w1/devices/w1_bus_master1/28-0000005b67ce/temperature)

TEMP_C=$(awk "BEGIN { printf \"%.2f\", $TEMPERATURE / 1000 }")

echo "$TIMESTAMP,$TEMP_C" >> /projects/musical-plants/data/temperature.csv
