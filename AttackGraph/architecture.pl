/* Attack goal */
attackGoal(canTamper(controlAction12)).
attackGoal(canSpoof(controlAction12)).
attackGoal(canTamper(controlAction4)).
attackGoal(canSpoof(controlAction4)).
attackGoal(canTamper(controlAction2)).
attackGoal(canSpoof(controlAction2)).
attackGoal(arpPoisoning(scadaWorkStation, controlGateway)).

/* Attacker location */
attackerLocated(attackerNode).

/* Access Control rules */
hacl(scadaWorkStation,mainPLC,_,_).
hacl(attackerNode,mainPLC,_,_).

hacl(X,Y,_,_):-
	inSubnet(X,S),
	inSubnet(Y,S).

hacl(X,Y,_,_):-
	inSubnet(X,mainNet),
	inSubnet(Y,smartHomeNet).
hacl(X,Y,_,_):-
	inSubnet(X,mainNet),
	inSubnet(Y,transmissionNet).
hacl(X,Y,_,_):-
	inSubnet(X,mainNet),
	inSubnet(Y,mgNet).
hacl(X,Y,_,_):-
	inSubnet(X,mainNet),
	inSubnet(Y,generationNet).

hacl(X,Y,_,_):-
	inSubnet(X,smartHomeNet),
	inSubnet(Y,transmissionNet).
hacl(X,Y,_,_):-
	inSubnet(X,smartHomeNet),
	inSubnet(Y,mgNet).
hacl(X,Y,_,_):-
	inSubnet(X,smartHomeNet),
	inSubnet(Y,generationNet).

hacl(X,Y,_,_):-
	inSubnet(X,transmissionNet),
	inSubnet(Y,mgNet).
hacl(X,Y,_,_):-
	inSubnet(X,transmissionNet),
	inSubnet(Y,generationNet).

hacl(X,Y,_,_):-
	inSubnet(X,generationNet),
	inSubnet(Y,mgNet).


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
inSubnet(controlGateway, scadaNet).
isGateway(controlGateway).

networkServiceInfo(scadaWorkStation,smbServer,smbProtocol,smbPort,root).
vulExists(scadaWorkStation,cve2017_0144,smbServer).

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
inSubnet(sPLC, smartHomeNet).
inSubnet(mainRouter, smartHomeNet).

networkServiceInfo(sPLC,codesys,_,_,root).
vulExists(sPLC,cwe_306,codesys).

/* Trasmission network*/
inSubnet(mainRouter, transmissionNet).
inSubnet(tPLC, transmissionNet).
inSubnet(tIED1, transmissionNet).
inSubnet(tIED2, transmissionNet).
inSubnet(tIED3, transmissionNet).

networkServiceInfo(tPLC,codesys,_,_,root).
vulExists(tPLC,cwe_306,codesys).

/* MicroGrid network */
inSubnet(mainRouter, mgNet).
inSubnet(mgPLC, mgNet).
inSubnet(mIED1, mgNet).
inSubnet(mIED2, mgNet).

networkServiceInfo(mgPLC,codesys,_,_,root).
vulExists(mgPLC,cwe_306,codesys).

/* Generation network */
inSubnet(mainRouter, generationNet).
inSubnet(gIED1, generationNet).
inSubnet(genPLC, generationNet).

networkServiceInfo(genPLC,codesys,_,_,root).
vulExists(genPLC,cwe_306,codesys).

/* Vulnerabilities */
vulProperty(cve2012_0668,remoteExploit, privEscalation).
cvss(cve2012_0668).
vulProperty(cve2017_0144,remoteExploit, privEscalation).
cvss(cve2017_0144).
vulProperty(cwe_306,remoteExploit, privEscalation).
cvss(cwe_306).
/* End Vulns */