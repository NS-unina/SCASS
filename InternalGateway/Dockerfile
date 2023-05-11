FROM ubuntu:22.04

RUN apt update && apt install openssh-server sudo iproute2 iptables -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 admin

RUN  echo 'admin:admin' | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
