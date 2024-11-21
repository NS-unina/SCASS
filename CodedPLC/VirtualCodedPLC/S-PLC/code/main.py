import time
import os
from pymodbus.client import ModbusTcpClient  # pylint: disable-msg=E0611

time.sleep(5)

if __name__ == '__main__':
    print("Run")
    while True:

        client = ModbusTcpClient('127.0.0.1', 502)
        result = client.read_coils(0, 4)
        
        try:
            s_ied1 = ModbusTcpClient('10.0.1.34', 502)
            s_ied1.write_coil(0,result.bits[0])
            s_ied1.close()
        except:
            print("connessione con s_ied1 fallita, riprovare")

        try:
            s_ied2 = ModbusTcpClient('10.0.1.35', 502)
            s_ied2.write_coil(0,result.bits[1])
            s_ied2.close()
        except:
            print("connessione con s_ied2 fallita, riprovare")

        try:
            s_ied3 = ModbusTcpClient('10.0.1.36', 502)
            s_ied3.write_coil(0,result.bits[2])
            s_ied3.close()
        except:
            print("connessione con s_ied3 fallita, riprovare")

        try:
            s_ied4 = ModbusTcpClient('10.0.1.37', 502)
            s_ied4.write_coil(0,result.bits[3])
            s_ied4.close()
        except:
            print("connessione con s_ied4 fallita, riprovare")


        time.sleep(1)


        try:
            s_ied1 = ModbusTcpClient('10.0.1.34', 502)
            readSIED1 = s_ied1.read_coils(1,1)
            client.write_coil(8,readSIED1.bits[0])
            s_ied1.close()
        except:
            print("connessione con s_ied1 fallita, riprovare")

        try:
            s_ied2 = ModbusTcpClient('10.0.1.35', 502)
            readSIED2 = s_ied2.read_coils(1,1)
            client.write_coil(16,readSIED2.bits[0])
            s_ied2.close()
        except:
            print("connessione con s_ied2 fallita, riprovare")

        try:
            s_ied3 = ModbusTcpClient('10.0.1.36', 502)
            readSIED3 = s_ied3.read_coils(1,1)
            client.write_coil(24,readSIED3.bits[0])
            s_ied3.close()
        except:
            print("connessione con s_ied3 fallita, riprovare")

        try:
            s_ied4 = ModbusTcpClient('10.0.1.37', 502)
            readSIED4 = s_ied4.read_coils(1,1)
            client.write_coil(32,readSIED4.bits[0])
            s_ied4.close()
        except:
            print("connessione con s_ied3 fallita, riprovare")
            
        client.close()
        time.sleep(1)