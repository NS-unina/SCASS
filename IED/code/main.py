"""General IED module"""
import time
from pymodbus.client import ModbusTcpClient  # pylint: disable-msg=E0611


CB_STATUS = 0
CB_INDEX = "0"


if __name__ == '__main__':
    while True:
        client = ModbusTcpClient('127.0.0.1', 502)
        result = client.read_coils(0, 1)
        print("Read: " + str(result.bits[0]))
        client.close()
        time.sleep(0.5)
        client = ModbusTcpClient('127.0.0.1', 502)
        client.write_coil(1, result.bits[0])
        client.close()
