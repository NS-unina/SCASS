import time
import os
from pymodbus.client import ModbusTcpClient  # pylint: disable-msg=E0611

time.sleep(5)

if __name__ == '__main__':
    print("Run")
    while True:

        client = ModbusTcpClient('127.0.0.1', 502)
        result = client.read_coils(0, 2)
        
        try:
            m_ied1 = ModbusTcpClient('10.0.0.21', 502)
            m_ied1.write_coil(0,result.bits[0])
            m_ied1.close()
        except:
            print("connessione con m_ied1 fallita, riprovare")

        try:
            m_ied2 = ModbusTcpClient('10.0.0.22', 502)
            m_ied2.write_coil(0,result.bits[1])
            m_ied2.close()
        except:
            print("connessione con m_ied2 fallita, riprovare")


        time.sleep(1)


        try:
            m_ied1 = ModbusTcpClient('10.0.0.21', 502)
            readMIED1 = m_ied1.read_coils(1,1)
            client.write_coil(8,readMIED1.bits[0])
            m_ied1.close()
        except:
            print("connessione con m_ied1 fallita, riprovare")

        try:
            m_ied2 = ModbusTcpClient('10.0.0.22', 502)
            readMIED2 = m_ied2.read_coils(1,1)
            client.write_coil(16,readMIED2.bits[0])
            m_ied2.close()
        except:
            print("connessione con m_ied2 fallita, riprovare")

        client.close()
        time.sleep(1)