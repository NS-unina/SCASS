/* Attack goal */
attackGoal(canSpoof(controlAction12)).
attackGoal(canSpoof(controlAction2)).

/* Attacker location */
attackerLocated(attackerNode).

/* Access Control rules */
hacl(scadaWorkStation,mainPLC,_,_).
hacl(attackerNode,mainPLC,_,_).

hacl(X,Y,_,_):-
	inSubnet(X,S),
	inSubnet(Y,S).

/* Control Logic */
/* Control flow S-PLC to S-IED4*/
controlFlow(sPLC, sIED4, controlAction12).
protocol(controlAction12, plaintext).
transportsFlow(mainRouter, controlAction12).
/* Control flow Master-PLC to S-PLC*/
controlFlow(mainPLC, sPLC, controlAction4).
protocol(controlAction4, plaintext).
transportsFlow(controlGateway, controlAction4).
/* Control flow Scada-System to Master-PLC*/
controlFlow(scadaWorkStation, mainPLC, controlAction2).
protocol(controlAction2, plaintext).
transportsFlow(mainRouter, controlAction2).

/* Scada network */
inSubnet(attackerNode, scadaNet).
inSubnet(scadaWorkStation, scadaNet).
inSubnet(historian, scadaNet).
inSubnet(controlGateway, scadaNet).
%isGateway(controlGateway).

/* Main PLC */
inSubnet(controlGateway, mainNet).
inSubnet(mainPLC, mainNet).
inSubnet(mainRouter, mainNet).

networkServiceInfo(mainPLC,apache,httpProtocol,httpPort,root).
vulExists(mainPLC,cve2012_0668,apache).

inCompetent(scadaOperator).
hasAccount(scadaOperator,mainRouter,root).
networkServiceInfo(mainRouter, sshd, ssh, sshPort, root).

/* SmartHome network */
inSubnet(sIED1, smartHomeNet).
inSubnet(sIED2, smartHomeNet).
inSubnet(sIED3, smartHomeNet).
inSubnet(sIED4, smartHomeNet).
inSubnet(shPLC, smartHomeNet).
inSubnet(mainRouter, smartHomeNet).

/* Trasmission network*/
inSubnet(mainRouter, transmissionNet).
inSubnet(tPLC, transmissionNet).
inSubnet(tIED1, transmissionNet).
inSubnet(tIED2, transmissionNet).
inSubnet(tIED3, transmissionNet).

/* MicroGrid network */
inSubnet(mainRouter, mgNet).
inSubnet(mgPLC, mgNet).
inSubnet(mIED1, mgNet).
inSubnet(mIED2, mgNet).

/* Generation network */
inSubnet(mainRouter, generationNet).
inSubnet(gIED1, generationNet).
inSubnet(genPLC, generationNet).

/* Vulnerabilities */
vulProperty(cve2012_0668,remoteExploit, privEscalation).
cvss(cve2012_0668).
vulProperty(cwe_521,remoteExploit, privEscalation).
cvss(cwe_521).
/* End Vulns */