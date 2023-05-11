"""General IED module"""

import time
from pymodbus.client import ModbusTcpClient  # pylint: disable-msg=E0611

time.sleep(5)
status = {"S-IED1": False, "S-IED2": False, "S-IED3": False, "S-IED4": False,
          "T-IED1": False, "T-IED2": False, "T-IED3": False,
          "M-IED1": False, "M-IED2": False,
          "G-IED1": False}

if __name__ == '__main__':
    print("Run")
    while True:
        client = ModbusTcpClient('127.0.0.1', 502)
        result = client.read_coils(0, 10)

        status["S-IED1"] = result.bits[0]
        status["S-IED2"] = result.bits[1]
        status["S-IED3"] = result.bits[2]
        status["S-IED4"] = result.bits[3]

        status["T-IED1"] = result.bits[4]
        status["T-IED2"] = result.bits[5]
        status["T-IED3"] = result.bits[6]

        status["M-IED1"] = result.bits[7]
        status["M-IED2"] = result.bits[8]

        status["G-IED1"] = result.bits[9]

        f = open("status.txt", "w", encoding="utf-8")
        for key, value in status.items():
            f.write('%s:%s\n' % (key, value))
        f.close()

        client.close()
        time.sleep(0.5)
