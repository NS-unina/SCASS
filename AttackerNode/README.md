# Multi Stage Attack scenario

The first stage of the attack path exploits the Shellshock vulnerability in the General-PLC, specifically targeting the CGI-Bin module of the Apache web server. This vulnerability enables attackers to inject and execute malicious commands through specially crafted HTTP requests since the CGI (Common Gateway Interface) scripts on Apache invoke the Bash shell for processing the HTTP response.

![Shellshock Exploit](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/shellshock.png "Figure: Shellshock Exploit")

![Reverse Shell](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/reverse.png "Figure: Reverse Shell")

To progress further along the attack path, the attacker must perform pivoting to reach the I-Gateway. Indeed, this device is typically unreachable from the SCADA Network. However, by compromising the General-PLC, the attacker can bypass these restrictions and establish a connection to the I-Gateway using port forwarding techniques.

Then, the attacker is able to brute force the SSH service exposed by the gateway and take complete control of the endpoint. In fact, this service was exploited by finding the default credential. Therefore, this credential enables us also to gain root privilege.

![SSH Access](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/ssh.png "Figure: SSH Access")

Then, the attacker brute-forces the SSH service exposed by the I-Gateway. This attack exploits the discovery of default credentials configured for the SSH authentication mechanism. Moreover, the use of these credentials grants root privileges.

![SSH Access](https://github.com/NS-unina/SCASS/tree/master/AttackerNode/images/sshAccess.png "Figure: SSH Access")

Finally, the attacker alters the communication passing through the I-Gateway in order to manipulate the visualization of the M-IED1 status.

![Packet Modification](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/packetModification.png "Figure: Packet Modification")

Indeed, from the HMI interface, we can observe that MIED1 appears to be active. However, by using the TestNode, which is connected to the same network interface as the MPLC, it is possible to confirm that the displayed MIED1 is close.

![Shellshock Exploit](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/HMI.png "Figure: Shellshock Exploit")

![Shellshock Exploit](https://github.com/NS-unina/SCASS/blob/master/AttackerNode/images/coils.png "Figure: Shellshock Exploit")
