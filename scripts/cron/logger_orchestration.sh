#!/bin/bash
set -eu

sleep 5

/projects/musical-plants/scripts/cron/temperature_logger.sh
sleep 5

/projects/musical-plants/scripts/cron/humidity_logger.sh
sleep 5

/projects/musical-plants/scripts/cron/soilmoisture_logger.sh
sleep 5

/projects/musical-plants/scripts/cron/carbondioxide_logger.sh
