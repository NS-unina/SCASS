# SCASS Architecture
 The following project aims to reproduce EpicTWIN through SCASS. 

 ## Physical components 
 The physical components are located in `SafetyGrid.project` that writes all the firmwares that are flashed with PLCs.
 ABB Automation Builder allows writing PLCs written in CodeSys. 



 ## Virtual components
 All the virtual components runs on the RaspberryPy located in the cabinet.
 A `docker-compose.-yml` holds all the virtual components, i.e.: 
 

 ### Implementation 
 * `IED`: a Docker container that is implemented in Python. It is a `modbus server` that listens for commands on 501 TCP port. The `main.py` refreshes the state of the `modbus_server`, while the `modbus_server` stores a register that can be 0 or 1 depending on the circuit breaker state.  
 * `General Manager`: it is a Firefox container. Node-RED cannot be reached by Raspberry-Py for MacVLAN the host machine cannot be reached with internal containers. 
* `Internal Gateway`: the router container, it is used in two parts. In EPIC there is a component called `General-PLC`, that is used to controll the Slave PLCs. The `Main Gateway` connects the GeneralPLC with the SCADA system, while the `Internal Gateway` connects the remaining zones with the General PLC. 
* `SCADA-System`: It is the SCADA system
* `Test-Node`: for testing purposes. 


### Networking 
In order to optimize the number of components, we use 28 bits (16 bits for network). 
* `scass-migrogrid`: 192.168.72.16-192.168.72.31
* `scass-smarthome`: 192.168.72.32-192.168.72.47
* `scass-trasmission`: 192.168.72.48-192.168.72.63
* `scass-plc`: 192.168.72.64-192.168.72.79
* `scass-generation`: 192.168.72.80-192.168.72.95
* `scass-scada`: 192.168.72.96-192.168.72.127