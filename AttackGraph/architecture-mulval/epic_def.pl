/* Attack goal */
attackGoal(canTamper(controlAction12)).
attackGoal(canSpoof(controlAction12)).
attackGoal(canTamper(controlAction4)).
attackGoal(canSpoof(controlAction4)).
attackGoal(canTamper(controlAction2)).
attackGoal(canSpoof(controlAction2)).

/* Attacker location */
attackerLocated(intranet).

hacl(X,Y,_,_):-
	inSubnet(X,S),
	inSubnet(Y,S).

/* Control Logic */
/* Control flow S-PLC to S-IED4*/
controlsFlow(sPLC, controlAction12).
transportsFlow(mainRouter, controlAction12).
/* Control flow Master-PLC to S-PLC*/
controlsFlow(mainPLC, controlAction4).
transportsFlow(mainRouter, controlAction4).
/* Control flow Scada-System to Master-PLC*/
controlsFlow(scadaWorkStation, controlAction2).
transportsFlow(mainRouter, controlAction2).

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

inSubnet(scadaWorkStation, scadaNet).
inSubnet(historian, scadaNet).
inSubnet(mainRouter, scadaNet).

inCompetent(scadaOperator).
hasAccount(scadaOperator,scadaWorkStation,user).

networkServiceInfo(scadaWorkStation,rdpd,rdpProtocol,rdpPort,user).

networkServiceInfo(scadaWorkStation,smbServer,smbProtocol,smbPort,user).
vulExists(scadaWorkStation,cve2017_0144,smbServer).
vulExists(scadaWorkStation,cve2017_0267,smbServer).
vulExists(scadaWorkStation,cve2017_0268,smbServer).
vulExists(scadaWorkStation,cve2017_0269,smbServer).

/* Main PLC */
inSubnet(mainRouter, mainNet).
inSubnet(mainPLC, mainNet).
inSubnet(mainRouter, scadaNet).
inSubnet(mainPLC, scadaNet).

networkServiceInfo(mainPLC,codesys,_,_,root).
vulExists(mainPLC,cve2012_0668,codesys).

networkServiceInfo(mainPLC,dropbearssh,_,_,user).
vulExists(mainPLC,cve2016_7406,dropbearssh).
vulExists(mainPLC,cve2016_7407,dropbearssh).
vulExists(mainPLC,cve2016_7408,dropbearssh).
vulExists(mainPLC,cve2016_7409,dropbearssh).

/* Smart Home */
inSubnet(mainRouter, smartHomeNet).
inSubnet(sPLC, smartHomeNet).
inSubnet(sIED3, smartHomeNet).
inSubnet(sIED4, smartHomeNet).
inSubnet(mainRouter, scadaNet).
inSubnet(sPLC, scadaNet).
inSubnet(sIED3, scadaNet).
inSubnet(sIED4, scadaNet).

networkServiceInfo(sPLC,codesys,_,_,root).
vulExists(sPLC,cve2012_6068,codesys).

networkServiceInfo(sPLC,dropbearssh,_,_,user).
vulExists(sPLC,cve2016_7406,dropbearssh).
vulExists(sPLC,cve2016_7407,dropbearssh).
vulExists(sPLC,cve2016_7408,dropbearssh).
vulExists(sPLC,cve2016_7409,dropbearssh).

/* transmissionNet */
inSubnet(mainRouter, transmissionNet).
inSubnet(tPLC, transmissionNet).
inSubnet(tIED1, transmissionNet).
inSubnet(tIED2, transmissionNet).
inSubnet(mainRouter, scadaNet).
inSubnet(tPLC, scadaNet).
inSubnet(tIED1, scadaNet).
inSubnet(tIED2, scadaNet).

networkServiceInfo(tPLC,codesys,_,_,root).
vulExists(tPLC,cve2012_6068,codesys).

networkServiceInfo(tPLC,dropbearssh,_,_,user).
vulExists(tPLC,cve2016_7406,dropbearssh).
vulExists(tPLC,cve2016_7407,dropbearssh).
vulExists(tPLC,cve2016_7408,dropbearssh).
vulExists(tPLC,cve2016_7409,dropbearssh).

/* micogridNet */
inSubnet(mainRouter, mgNet).
inSubnet(mgPLC, mgNet).
inSubnet(mIED1, mgNet).
inSubnet(mIED2, mgNet).

inSubnet(mainRouter, scadaNet).
inSubnet(mgPLC, scadaNet).

networkServiceInfo(mgPLC,codesys,_,_,root).
vulExists(mgPLC,cve2012_6068,codesys).

networkServiceInfo(mgPLC,dropbearssh,_,_,user).
vulExists(mgPLC,cve2016_7406,dropbearssh).
vulExists(mgPLC,cve2016_7407,dropbearssh).
vulExists(mgPLC,cve2016_7408,dropbearssh).
vulExists(mgPLC,cve2012_6068,dropbearssh).

/* generationNet */
inSubnet(mainRouter, generationNet).
inSubnet(genPLC, generationNet).
inSubnet(gIED1, mgNet).
inSubnet(gIED2, mgNet).

inSubnet(mainRouter, scadaNet).
inSubnet(genPLC, scadaNet).
inSubnet(gIED1, scadaNet).
inSubnet(gIED2, scadaNet).

networkServiceInfo(genPLC,codesys,_,_,root).
vulExists(genPLC,cve2012_6068,codesys).

networkServiceInfo(genPLC,dropbearssh,_,_,user).
vulExists(genPLC,cve2016_7406,dropbearssh).
vulExists(genPLC,cve2016_7407,dropbearssh).
vulExists(genPLC,cve2016_7408,dropbearssh).
vulExists(genPLC,cve2016_7409,dropbearssh).

hacl(scadaWorkStation, intranet, _, _).
hacl(intranet, scadaWorkStation, _, _).
