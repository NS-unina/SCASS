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

![Electrical Layout](path/to/electrical_layout.png "Figure: Electrical Layout")

