FROM kalilinux/kali-rolling

RUN apt update && apt -y install curl python3 python3-pip iproute2 iptables ssh netcat-traditional hydra
RUN apt update && apt install -y metasploit-framework

WORKDIR /root/

COPY ./code/ /root/

RUN git clone https://github.com/b4keSn4ke/CVE-2014-6271
