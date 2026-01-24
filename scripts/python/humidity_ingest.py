import board
import busio
import adafruit_scd4x
import time

i2c = busio.I2C(board.SCL, board.SDA)
scd4x = adafruit_scd4x.SCD4X(i2c)

scd4x.start_periodic_measurement()

# Wait a few seconds for first reading
time.sleep(5)

print(f"{scd4x.relative_humidity:.2f}")
