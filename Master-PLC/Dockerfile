FROM python:3.11.0-bullseye

COPY ./code/ /root/

RUN apt update && apt install -y iproute2 iptables 

WORKDIR /root
RUN pip install -r requirements.txt
CMD ./run_script.sh
