import time
import board
from adafruit_seesaw.seesaw import Seesaw

i2c = board.I2C()
ss = Seesaw(i2c, addr=0x36)

moisture = ss.moisture_read()
#temperature = ss.get_temp()

print(f"{moisture}")
#print(f"Temperature: {temperature:.2f} °C")


