import time
import os
from pymodbus.client import ModbusTcpClient  # pylint: disable-msg=E0611

time.sleep(5)

if __name__ == '__main__':
    print("Run")
    while True:

        client = ModbusTcpClient('127.0.0.1', 502)
        result = client.read_coils(0, 1)
        
        try:
            g_ied = ModbusTcpClient('10.0.1.82', 502)
            g_ied.write_coil(0,result.bits[0])
            g_ied.close()
        except:
            print("connessione con g_ied fallita, riprovare")

        time.sleep(1)

        try:
            g_ied = ModbusTcpClient('10.0.1.82', 502)
            readGIED = g_ied.read_coils(1,1)
            client.write_coil(8,readGIED.bits[0])
            g_ied.close()
        except:
            print("connessione con g_ied fallita, riprovare")

        client.close()
        time.sleep(1)