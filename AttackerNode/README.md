# Multi Stage Attack scenario

The first stage of the attack path exploits the Shellshock vulnerability in the General-PLC, specifically targeting the CGI-Bin module of the Apache web server. This vulnerability enables attackers to inject and execute malicious commands through specially crafted HTTP requests since the CGI (Common Gateway Interface) scripts on Apache invoke the Bash shell for processing the HTTP response.

To progress further along the attack path, the attacker must perform pivoting to reach the I-Gateway. Indeed, this device is typically unreachable from the SCADA Network. However, by compromising the General-PLC, the attacker can bypass these restrictions and establish a connection to the I-Gateway using port forwarding techniques.

Then, the attacker is able to brute force the SSH service exsposed by the gateway and take the complete control of the endpoint. In fact, this service was exploited by finding the default credential. Therefore, this credential enable us also to gain root priviledge.

Then, the attacker brute-forces the SSH service exposed by the I-Gateway. This attack exploit the discovery of default credentials configured for the SSH authentication mechanism. Moreover, the use of these credentials grants root privileges.

Finally, the attacker alter the communication passing through the I-Gateway tin oder to manipulate the visualization of the M-IED1 status.