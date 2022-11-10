FROM python:3.11.0-bullseye

COPY ./code/ /root/

WORKDIR /root
RUN pip install -r requirements.txt

CMD python3 modbus_server.py