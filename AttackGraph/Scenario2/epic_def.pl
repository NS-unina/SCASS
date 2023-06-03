/* Attack goal */
attackGoal(canTamper(controlAction4)).

/* Attacker location */
attackerLocated(attackerNode).

/* Access Control rules */
hacl(J,K,_,_):-
	inSubnet(J,scadaNet),
	inSubnet(K,mainNet).

hacl(X,Y,_,_):-
	inSubnet(X,S),
	inSubnet(Y,S).

/* Control Logic */
/* Control flow Master-PLC to S-PLC*/
controlFlow(mainPLC, sPLC, controlAction4).
protocol(controlAction4, plaintext).
transportsFlow(mainRouter, controlAction4).

/* Scada network */
inSubnet(attackerNode, scadaNet).
inSubnet(scadaWorkStation, scadaNet).
inSubnet(historian, scadaNet).
inSubnet(mainRouter, scadaNet).
isGateway(mainRouter).

/* Main PLC */
inSubnet(mainRouter, mainNet).
inSubnet(mainPLC, mainNet).

networkServiceInfo(mainPLC,apache,httpProtocol,httpPort,root).
vulExists(mainPLC,cve2012_0668,apache).

/* Vulnerabilities */
vulProperty(cve2012_0668,remoteExploit, privEscalation).
cvss(cve2012_0668,h).
/* End Vulns */