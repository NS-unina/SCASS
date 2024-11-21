FROM ubuntu:22.04

RUN apt update && apt install openssh-server sudo iproute2 iptables -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 admin

RUN apt update && apt install -y libnfnetlink-dev libnetfilter-queue-dev python3 python3-pip
RUN pip3 install scapy && pip3 install netfilterqueue

RUN  echo 'admin:admin' | chpasswd

RUN service ssh start

CMD ["/usr/sbin/sshd","-D"]
