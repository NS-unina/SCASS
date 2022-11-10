FROM nodered/node-red:3.0.2

COPY ./data/ /usr/src/node-red/

WORKDIR /usr/src/node-red/

RUN npm install node-red-contrib-modbus
RUN npm install node-red-contrib-ui-led
RUN npm install node-red-dashboard
