# Testbed Deployment Documentation
This documentation outlines the steps to deploy a flexible and extensible testbed for cybersecurity analysis in the Industrial Control Systems (ICS) domain. The testbed supports multiple deployment scenarios:
- **Hybrid Deployment with Node-Red**: Combines physical and virtual components.
- **Hybrid Deployment with FUXA**: Combines physical and virtual components.
- **Fully Virtual Deployment with Node-Red**: Utilizes the FUXA framework for SCADA/HMI visualization.
- **Fully Virtual Deployment with FUXA**: Relies entirely on software-based components.

---

## Hybrid Deployment with Node-Red

### Hardware Requirements
The following hardware components are necessary to set up the testbed:
- **Industrial Managed Switch**: One IDS-409-1SFP by Perle Systems Inc.
- **Power Supply Units**: Two UNO-PS/1AC/24DC/60W by Phoenix Contact.
- **Programmable Logic Controllers (PLCs)**: Four PM554-TP-ETH by ABB Ltd (Figure \ref{fig:plc_array}).
- **Single-Board Computer**: One Raspberry Pi 4, equipped with a 64GB SD card by Samsung.
- **Magneto-Thermic Switch**: One C60N by Merlin Gerin (Schneider Electric SA).
- **Monitor**: One 12HD7 by Beetronic.
- **Stabilized Power Supply**: One unit by Mean Well.

The overall configuration and connections are depicted in the electrical layout presented in the following Figure.

![Electrical Layout](https://github.com/NS-unina/SCASS/blob/master/docs/images/scass-circuit%20diagram.jpg "Figure: Electrical Layout")

The switch must be configured with the following VLAN table to ensure the architecture functions correctly.

| **VLAN Name**          | **Parent Interface** |
|:----------------------:|:--------------------:|
| scass-microgrid        | 2                    |
| scass-smarthome        | 3                    |
| scass-trasmission      | 4                    |
| scass-scada            | 5                    |
| scass-generation       | 6                    |
| scass-plc              | 7                    |


## Fully Virtual Deployment with Node-Red or FUXA
This deployment scenario leverages the testbed in a fully virtualized environment

### Software requirement 
To run the virtual testbed, we rely exclusively on Docker Compose, making it essential to have Docker installed. Furthermore, the testbed utilizes the macvlan driver, which is only supported in the Docker engine. If necessary, the interface name specified in the Docker Compose configuration must be updated to match the system's network interface.

To run the virtual testbed, you only need Docker Compose, so Docker must be installed. You can find the installation guide in the [Docker documentation](https://docs.docker.com/get-docker/). Moreover, the testbed uses the `macvlan` driver, which works only with Docker engine. If needed, update the interface name in the Docker Compose file to match your system.

### **Running the Docker Compose**
You can deploy the virtual testbed with Node-Red by running the following command:
```bash
docker-compose -f docker-compose-full-virtual up
```

You can deploy the virtual testbed with FUXA by running the following command:
```bash
docker-compose -f docker-compose-full-virtual-fuxa up
```

A deployment video for each configuration is available in the video folder to provide additional guidance and support.