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
        
        try:
            splc = ModbusTcpClient("10.0.1.45", 502)
            splc.write_coil(0, result.bits[0])
            splc.write_coil(1, result.bits[1])
            splc.write_coil(2, result.bits[2])
            splc.write_coil(3, result.bits[3])
            splc.close()
        except:
            print("Connessione con splc fallita, riprovare")
        
        try:
            tplc = ModbusTcpClient("10.0.1.61", 502)
            tplc.write_coil(0, result.bits[4])
            tplc.write_coil(1, result.bits[5])
            tplc.write_coil(2, result.bits[6])
            tplc.close()
        except:
            print("Connessione con tplc fallita, riprovare")

        try:
            mplc = ModbusTcpClient("10.0.0.192", 502)
            mplc.write_coil(0, result.bits[7])
            mplc.write_coil(1, result.bits[8])
            mplc.close()
        except:
            print("Connessione con mplc fallita, riprovare")

        try:
            gplc = ModbusTcpClient("10.0.1.93", 502)
            gplc.write_coil(0, result.bits[9])        
            gplc.close()
        except:
            print("Connessione con gplc fallita, riprovare")


        time.sleep(1)

        try:
            splc = ModbusTcpClient("10.0.1.45", 502)
            readSPLC = splc.read_coils(8, 25)
            client.write_coil(22, readSPLC.bits[0])
            status["S-IED1"] = readSPLC.bits[0]
            client.write_coil(23, readSPLC.bits[8])
            status["S-IED2"] = readSPLC.bits[8]
            client.write_coil(24, readSPLC.bits[16])
            status["S-IED3"] = readSPLC.bits[16]
            client.write_coil(25, readSPLC.bits[24])
            status["S-IED4"] = readSPLC.bits[24]
            splc.close()
        except:
            print("Connessione con splc fallita, riprovare")
            
        try:
            tplc = ModbusTcpClient("10.0.1.61", 502)
            readTPLC = tplc.read_coils(8, 17)
            client.write_coil(36, readTPLC.bits[0])
            status["T-IED1"] = readTPLC.bits[0]
            client.write_coil(37, readTPLC.bits[8])
            status["T-IED2"] = readTPLC.bits[8]
            client.write_coil(38, readTPLC.bits[16])
            status["T-IED3"] = readTPLC.bits[16]
            tplc.close()
        except:
            print("Connessione con tplc fallita, riprovare")
   
        try:
            mplc = ModbusTcpClient("10.0.0.192", 502)
            readMPLC = mplc.read_coils(8, 9)
            client.write_coil(50, readMPLC.bits[0])
            status["M-IED1"] = readMPLC.bits[0]
            client.write_coil(51, readMPLC.bits[8])
            status["M-IED2"] = readMPLC.bits[8]
            mplc.close()
        except:
            print("Connessione con mplc fallita, riprovare")
   
        try:
            gplc = ModbusTcpClient("10.0.1.93", 502)
            readGPLC = gplc.read_coils(8, 1)
            client.write_coil(56, readGPLC.bits[0])
            status["G-IED1"] = readGPLC.bits[0]
            gplc.close()
        except:
            print("Connessione con gplc fallita, riprovare")

        
        f = open("status.txt", "w", encoding="utf-8")
        for key, value in status.items():
            f.write('%s:%s\n' % (key, value))
        f.close()

        client.close()
        time.sleep(1)
