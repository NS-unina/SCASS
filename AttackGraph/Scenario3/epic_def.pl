/* Attack goal */
attackGoal(canTamper(controlAction12)).

/* Attacker location */
attackerLocated(attackerNode).

/* Access Control rules */
hacl(J,K,_,_):-
	inSubnet(J,scadaNet),
	inSubnet(K,smartHomeNet).

hacl(X,Y,_,_):-
	inSubnet(X,S),
	inSubnet(Y,S).

/* Control Logic */
/* Control flow S-PLC to S-IED4*/
controlFlow(sPLC, sIED4, controlAction12).
protocol(controlAction12, plaintext).
transportsFlow(mainRouter, controlAction12).

/* Scada network */
inSubnet(attackerNode, scadaNet).
inSubnet(scadaWorkStation, scadaNet).
inSubnet(historian, scadaNet).
inSubnet(mainRouter, scadaNet).
isGateway(mainRouter).

/* SmartHome network */
inSubnet(sIED1, smartHomeNet).
inSubnet(sIED2, smartHomeNet).
inSubnet(sIED3, smartHomeNet).
inSubnet(sIED4, smartHomeNet).
inSubnet(sPLC, smartHomeNet).
inSubnet(mainRouter, smartHomeNet).

networkServiceInfo(sPLC,codesys,_,_,root).
vulExists(sPLC,cwe_306,codesys).

/* Vulnerabilities */
vulProperty(cwe_306,remoteExploit, privEscalation).
cvss(cwe_306,h).
/* End Vulns */