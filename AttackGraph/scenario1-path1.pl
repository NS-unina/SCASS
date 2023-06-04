/* Attack goal */
attackGoal(canTamper(controlAction2)).

/* Attacker location */
attackerLocated(attackerNode).

/* Access Control rules */
hacl(_, _, _, _).
hacl(X,Y,_,_):-
	inSubnet(X,S),
	inSubnet(Y,S).

/* Control flow Scada-System to Master-PLC*/
controlFlow(scadaWorkStation, mainPLC, controlAction2).
protocol(controlAction2, plaintext).
transportsFlow(mainRouter, controlAction2).

/* Scada network */
inSubnet(scadaWorkStation, scadaNet).
inSubnet(mainRouter, scadaNet).
isGateway(mainRouter).

networkServiceInfo(scadaWorkStation,smbServer,smbProtocol,smbPort,root).
vulExists(scadaWorkStation,cve2017_0144,smbServer).

/* Vulnerabilities */
vulProperty(cve2017_0144,remoteExploit, privEscalation).
cvss(cve2017_0144).
/* End Vulns */