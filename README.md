# SCASS Architecture
We introduce SCASS, an open-source, modular, and hybrid platform specifically designed for the development of extensible cybersecurity testbeds within the Industrial Control Systems (ICS) domain.

## Physical components 
The physical components are located in `SafetyGrid.project` that writes all the firmwares that are flashed with PLCs. ABB Automation Builder allows writing PLCs written in CodeSys. In case physical devices are unavailable, the architecture provides virtualized components as an alternative. See [this page](https://github.com/NS-unina/SCASS/blob/master/docs/README.md) for reference.

## Attack graphs
You can find comprehensive documentation about attack graphs and their generation at [this link](https://github.com/NS-unina/SCASS/blob/master/AttackGraph/README.md).

## Attack Scenario execution
Comprehensive documentation on attack execution is available at [this link](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/README.md) for the ARP Poisoning Attack and at [this link](https://github.com/NS-unina/SCASS/blob/master/AttackGraph/README.md) for the multistage attack.
 

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