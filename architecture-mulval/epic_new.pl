/* Attack goal */
attackGoal(canTamper(controlAction12)).
attackGoal(canSpoof(controlAction12)).
attackGoal(canTamper(controlAction4)).
attackGoal(canSpoof(controlAction4)).
attackGoal(canTamper(controlAction2)).
attackGoal(canSpoof(controlAction2)).

/* Attacker Location */
attackerLocated(intranet).

/* Enable communication between host in the same subnet */
hacl(X,Y,_,_):-
	inSubnet(X,S),
	inSubnet(Y,S).

/* Control Logic */
/* Unsafe configuration of breakers */
controlsFlow(shPLC, controlAction12).
transportsFlow(shRouter, controlAction12).
/* CB-7 is open while the power is supplied through P3 */
controlsFlow(scadaWorkStation, controlAction4).
transportsFlow(scadaRouter, controlAction4).
/* The circuit breaker CB-12 is open*/
controlsFlow(scadaWorkStation, controlAction2).
transportsFlow(scadaRouter, controlAction2).

/* Scada network*/
inSubnet(scadaWorkStation, scadaNet).
inSubnet(historian, scadaNet).
inSubnet(engineeringWorkStation, scadaNet).
inSubnet(scadaRouter, scadaNet).

/* Enable communication between scadaWorkStation and all PLC */
hacl(scadaWorkStation, intranet, _, _).
hacl(intranet, scadaWorkStation, _, _).
hacl(scadaWorkStation, genPLC, _, _).
hacl(genPLC, scadaWorkStation, _, _).
hacl(scadaWorkStation, trPLC, _, _).
hacl(trPLC, scadaWorkStation, _, _).
hacl(scadaWorkStation, mgPLC, _, _).
hacl(mgPLC, scadaWorkStation, _, _).
hacl(scadaWorkStation, shPLC, _, _).
hacl(shPLC, scadaWorkStation, _, _).

/* Scada Workstation vulnerabilities */
/* SMB - Eternalblue */
networkServiceInfo(scadaWorkStation,smbServer,smbProtocol,smbPort,user).
vulExists(scadaWorkStation,cve2017_0144,smbServer).
vulExists(scadaWorkStation,cve2017_0267,smbServer).
vulExists(scadaWorkStation,cve2017_0268,smbServer).
vulExists(scadaWorkStation,cve2017_0269,smbServer).
/* RDP - CWE-1391: Use of Weak Credential */
inCompetent(scadaOperator).
hasAccount(scadaOperator,scadaWorkStation,user).
networkServiceInfo(scadaWorkStation,rdpd,rdpProtocol,rdpPort,user).

/* Generation network */
inSubnet(gIED1, generationNet).
inSubnet(genPLC, generationNet).
inSubnet(gRouter, generationNet).
/* Generation PLC vulnerabilities */
/* CodeSYS RCE */
networkServiceInfo(genPLC,codesys,_,_,root).
vulExists(genPLC,cve2012_6068,codesys).
/* SSH RCE */
networkServiceInfo(genPLC,dropbearssh,_,_,user).
vulExists(genPLC,cve2016_7406,dropbearssh).
vulExists(genPLC,cve2016_7407,dropbearssh).
vulExists(genPLC,cve2016_7408,dropbearssh).
vulExists(genPLC,cve2016_7409,dropbearssh).

/* SmartHome network */
inSubnet(sIED1, smartHomeNet).
inSubnet(sIED2, smartHomeNet).
inSubnet(sIED3, smartHomeNet).
inSubnet(sIED4, smartHomeNet).
inSubnet(shPLC, smartHomeNet).
inSubnet(shRouter, smartHomeNet).
/* Smarthome PLC vulnerabilities */
/* CodeSYS RCE */
networkServiceInfo(shPLC,codesys,_,_,root).
vulExists(shPLC,cve2012_6068,codesys).
/* SSH RCE */
networkServiceInfo(shPLC,dropbearssh,_,_,user).
vulExists(shPLC,cve2016_7406,dropbearssh).
vulExists(shPLC,cve2016_7407,dropbearssh).
vulExists(shPLC,cve2016_7408,dropbearssh).
vulExists(shPLC,cve2016_7409,dropbearssh).

/* MicroGrid network */
inSubnet(mIED1, mgNet).
inSubnet(mIED2, mgNet).
inSubnet(mgPLC, mgNet).
inSubnet(mgRouter, mgNet).
/* MicroGrid PLC vulnerabilities */
/* CodeSYS RCE */
networkServiceInfo(mgPLC,codesys,_,_,root).
vulExists(mgPLC,cve2012_6068,codesys).
/* SSH RCE */
networkServiceInfo(mgPLC,dropbearssh,_,_,user).
vulExists(mgPLC,cve2016_7406,dropbearssh).
vulExists(mgPLC,cve2016_7407,dropbearssh).
vulExists(mgPLC,cve2016_7408,dropbearssh).
vulExists(mgPLC,cve2016_7409,dropbearssh).

/* Trasmission network*/
inSubnet(tIED1, mgNet).
inSubnet(tIED2, mgNet).
inSubnet(tIED3, mgNet).
inSubnet(trPLC, mgNet).
inSubnet(tRouter, mgNet).
/* Trasmission PLC vulnerabilities */
/* CodeSYS RCE */
networkServiceInfo(trPLC,codesys,_,_,root).
vulExists(trPLC,cve2012_6068,codesys).
/* SSH RCE */
networkServiceInfo(trPLC,dropbearssh,_,_,user).
vulExists(trPLC,cve2016_7406,dropbearssh).
vulExists(trPLC,cve2016_7407,dropbearssh).
vulExists(trPLC,cve2016_7408,dropbearssh).
vulExists(trPLC,cve2016_7409,dropbearssh).

/* TO CHECK - router link - at the moment are useless */
/* Generation MicroGrid lan */
inSubnet(gRouter, gmNet).
inSubnet(mgRouter, gmNet).
/* Generation Trasmission lan */
inSubnet(gRouter, gtNet).
inSubnet(tRouter, gtNet).
/* Trasmission Scada lan */
inSubnet(tRouter, tsNet).
inSubnet(scadaRouter, tsNet).
/* SmartHome Scada lan */
inSubnet(shRouter, ssNet).
inSubnet(scadaRouter, ssNet).
/* SmartHome Microgrid lan */
inSubnet(shRouter, smNet).
inSubnet(mgRouter, smNet).

/* Vulnerabilities */
vulProperty(cve2016_7406,remoteExploit, privEscalation).
cvss(cve2016_7406,h).
vulProperty(cve2016_7407,remoteExploit, privEscalation).
cvss(cve2016_7407,h).
vulProperty(cve2016_7408,remoteExploit, privEscalation).
cvss(cve2016_7408,h).
vulProperty(cve2016_7409,remoteExploit, informationDisclosure).
cvss(cve2016_7409,l).
vulProperty(cve2012_6068,remoteExploit, privEscalation).
cvss(cve2012_6068,h).
vulProperty(cve2017_0267,remoteExploit, informationDisclosure).
cvss(cve2017_0267,m).
vulProperty(cve2017_0268,remoteExploit, informationDisclosure).
cvss(cve2017_0268,m).
vulProperty(cve2017_0269,remoteExploit, denialOfService).
cvss(cve2017_0269,m).
vulProperty(cve2017_0144,remoteExploit, privEscalation).
cvss(cve2017_0144,h).
vulProperty(cve2022_30697, localExploit, privEscalation).
cvss(cve2022_30697,m).
vulProperty(cve2022_26485, remoteClient, privEscalation).
cvss(cve2022_26485,h).
/* End Vulns */