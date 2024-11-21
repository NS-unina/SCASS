import time
import os
from pymodbus.client import ModbusTcpClient  # pylint: disable-msg=E0611

time.sleep(5)

if __name__ == '__main__':
    print("Run")
    while True:

        client = ModbusTcpClient('127.0.0.1', 502)
        result = client.read_coils(0, 3)
        
        try:
            t_ied1 = ModbusTcpClient('10.0.1.50', 502)
            t_ied1.write_coil(0,result.bits[0])
            t_ied1.close()
        except:
            print("connessione con t_ied1 fallita, riprovare")

        try:
            t_ied2 = ModbusTcpClient('10.0.1.51', 502)
            t_ied2.write_coil(0,result.bits[1])
            t_ied2.close()
        except:
            print("connessione con t_ied2 fallita, riprovare")

        try:
            t_ied3 = ModbusTcpClient('10.0.1.52', 502)
            t_ied3.write_coil(0,result.bits[2])
            t_ied3.close()
        except:
            print("connessione con t_ied3 fallita, riprovare")


        time.sleep(1)


        try:
            t_ied1 = ModbusTcpClient('10.0.1.50', 502)
            readTIED1 = t_ied1.read_coils(1,1)
            client.write_coil(8,readTIED1.bits[0])
            t_ied1.close()
        except:
            print("connessione con t_ied1 fallita, riprovare")

        try:
            t_ied2 = ModbusTcpClient('10.0.1.51', 502)
            readTIED2 = t_ied2.read_coils(1,1)
            client.write_coil(16,readTIED2.bits[0])
            t_ied2.close()
        except:
            print("connessione con t_ied2 fallita, riprovare")

        try:
            t_ied3 = ModbusTcpClient('10.0.1.52', 502)
            readTIED3 = t_ied3.read_coils(1,1)
            client.write_coil(24,readTIED3.bits[0])
            t_ied3.close()
        except:
            print("connessione con t_ied3 fallita, riprovare")

        client.close()
        time.sleep(1)