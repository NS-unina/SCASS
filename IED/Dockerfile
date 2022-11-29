FROM python:3.11.0-bullseye

COPY ./code/ /root/

WORKDIR /root
RUN pip install -r requirements.txt

CMD ./run_script.sh
