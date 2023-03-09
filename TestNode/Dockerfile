FROM python:3.11.0-bullseye

COPY ./code/ /root/

WORKDIR /root
RUN apt update && apt install docker.io -y
RUN pip install -r requirements.txt

CMD tail -f /dev/null
