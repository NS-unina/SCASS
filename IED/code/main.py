"""General IED module"""
import time
import os
from pymodbus.client import ModbusTcpClient  # pylint: disable-msg=E0611

time.sleep(5)

if __name__ == '__main__':
    print("Run")
    while True:
        client = ModbusTcpClient('127.0.0.1', 502)
        result = client.read_coils(0, 1)
        print("Read: " + str(result.bits[0]))
        f = open("status.txt", "w")
        f.write("Read: " + str(result.bits[0]))
        f.close()
        client.close()
        time.sleep(0.5)
        client = ModbusTcpClient('127.0.0.1', 502)
        client.write_coil(1, result.bits[0])
        client.close()
