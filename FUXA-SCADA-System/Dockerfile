FROM frangoteam/fuxa:1.2.1

RUN apt update && apt install -y iproute2 iptables 

COPY fuxa_appdata /usr/src/app/FUXA/server/_appdata
COPY fuxa_db /usr/src/app/FUXA/server/_db

CMD ["npm", "start"]