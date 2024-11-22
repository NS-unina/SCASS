# SCASS Architecture
We introduce SCASS, an open-source, modular, and hybrid platform specifically designed for the development of extensible cybersecurity testbeds within the Industrial Control Systems (ICS) domain.

## Physical components 
The physical components are located in `SafetyGrid.project` that writes all the firmwares that are flashed with PLCs. ABB Automation Builder allows writing PLCs written in CodeSys. In case physical devices are unavailable, the architecture provides virtualized components as an alternative. See [this page](https://github.com/NS-unina/SCASS/blob/master/docs/README.md) for reference.

## Attack graphs
You can find comprehensive documentation about attack graphs and their generation at [this link](https://github.com/NS-unina/SCASS/blob/master/AttackGraph/README.md).

## Attack Scenario execution
Comprehensive documentation on attack execution is available at [this link](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/README.md) for the ARP Poisoning Attack and at [this link](https://github.com/NS-unina/SCASS/blob/master/AttackGraph/README.md) for the multistage attack.