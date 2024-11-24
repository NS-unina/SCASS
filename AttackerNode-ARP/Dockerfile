FROM kalilinux/kali-rolling

RUN apt update && apt -y install curl python3 python3-pip iproute2 iptables dsniff netcat-traditional tcpdump

WORKDIR /root/

COPY ./code/ /root/

RUN apt update && apt install -y libnfnetlink-dev libnetfilter-queue-dev 
RUN apt update && apt install -y python3-scapy python3-netfilter
RUN pip3 install --break-system-packages NetfilterQueue

# arpspoof -i eth0 10.0.0.192 -rt 10.0.0.21
# arpspoof -i eth0 10.0.0.21 -rt 10.0.0.192
# tcpdump -i eth0 host 10.0.0.192 and host 10.0.0.21