/* Attack goal */
attackGoal(canSpoof(controlAction2)).

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
transportsFlow(controlGateway, controlAction2).

/* Scada network */
inSubnet(attackerNode, scadaNet).
inSubnet(scadaWorkStation, scadaNet).
inSubnet(controlGateway, scadaNet).
isGateway(controlGateway).

networkServiceInfo(scadaWorkStation,smbServer,smbProtocol,smbPort,root).
vulExists(scadaWorkStation,cve2017_0144,smbServer).

/* Vulnerabilities */
vulProperty(cve2017_0144,remoteExploit, privEscalation).
cvss(cve2017_0144).
/* End Vulns */