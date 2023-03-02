/* Attack goal */
attackGoal(canTamper(controlAction12)).
attackGoal(canSpoof(controlAction12)).
attackGoal(canTamper(controlAction4)).
attackGoal(canSpoof(controlAction4)).
attackGoal(canTamper(controlAction2)).
attackGoal(canSpoof(controlAction2)).
attackGoal(canTamper(feedbackAction12)).
attackGoal(canSpoof(feedbackAction12)).
attackGoal(canTamper(feedbackAction4)).
attackGoal(canSpoof(feedbackAction4)).
attackGoal(canTamper(feedbackAction2)).
attackGoal(canSpoof(feedbackAction2)).

/* Attacker location */
attackerLocated(intranet).

hacl(_, _, _, _).
hacl(X,Y,_,_):-
	inSubnet(X,S),
	inSubnet(Y,S).

/* Control Logic */
/* Control flow S-PLC to S-IED4*/
controlFlow(sPLC, sIED4, controlAction12).
feedbackFlow(sIED4, sPLC, feedbackAction12).
transportsFlow(mainRouter, controlAction12).
transportsFlow(mainRouter, feedbackAction12).
/* Control flow Master-PLC to S-PLC*/
controlFlow(mainPLC, sPLC, controlAction4).
feedbackFlow(sPLC, mainPLC, feedbackAction4).
transportsFlow(mainRouter, controlAction4).
transportsFlow(mainRouter, feedbackAction4).
/* Control flow Scada-System to Master-PLC*/
controlFlow(scadaWorkStation, mainPLC, controlAction2).
feedbackFlow(mainPLC, scadaWorkStation, feedbackAction2).
transportsFlow(mainRouter, controlAction2).
transportsFlow(mainRouter, feedbackAction2).

/* Vulnerabilities */
vulProperty(cve2016_7406,remoteExploit, privEscalation).
cvss(cve2016_7406,h).
vulProperty(cve2016_7407,remoteExploit, privEscalation).
cvss(cve2016_7407,h).
vulProperty(cve2016_7408,remoteExploit, privEscalation).
cvss(cve2016_7408,h).
vulProperty(cve2016_7409,remoteExploit, informationDisclosure).
cvss(cve2016_7409,l).
vulProperty(cwe_306,remoteExploit, privEscalation).
cvss(cwe_306,h).
vulProperty(cwe_521,remoteExploit, privEscalation).
cvss(cwe_521,h).
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
vulProperty(cve2014_6271, remoteClient, privEscalation).
cvss(cve2014_6271,h).
vulProperty(cve2012_0668, remoteClient, privEscalation).
cvss(cve2014_6271,h).
/* End Vulns */

inSubnet(scadaWorkStation, scadaNet).
inSubnet(historian, scadaNet).
inSubnet(mainRouter, scadaNet).

networkServiceInfo(mainRouter,ssh,_,_,root).
vulExists(mainPLC,cwe_521,codesys).

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

networkServiceInfo(mainPLC,apache,_,_,root).
vulExists(mainPLC,cve2012_0668,codesys).

/*
networkServiceInfo(mainPLC,dropbearssh,_,_,user).
vulExists(mainPLC,cve2016_7406,dropbearssh).
vulExists(mainPLC,cve2016_7407,dropbearssh).
vulExists(mainPLC,cve2016_7408,dropbearssh).
vulExists(mainPLC,cve2016_7409,dropbearssh).
*/
/* SmartHome network */
inSubnet(sIED1, smartHomeNet).
inSubnet(sIED2, smartHomeNet).
inSubnet(sIED3, smartHomeNet).
inSubnet(sIED4, smartHomeNet).
inSubnet(shPLC, smartHomeNet).
inSubnet(mainRouter, smartHomeNet).

networkServiceInfo(sPLC,codesys,_,_,root).
vulExists(sPLC,cwe_306,codesys).
/*
networkServiceInfo(sPLC,dropbearssh,_,_,user).
vulExists(sPLC,cve2016_7406,dropbearssh).
vulExists(sPLC,cve2016_7407,dropbearssh).
vulExists(sPLC,cve2016_7408,dropbearssh).
vulExists(sPLC,cve2016_7409,dropbearssh).
*/
/* Trasmission network*/
inSubnet(mainRouter, transmissionNet).
inSubnet(tPLC, transmissionNet).
inSubnet(tIED1, transmissionNet).
inSubnet(tIED2, transmissionNet).
inSubnet(tIED3, transmissionNet).
networkServiceInfo(tPLC,codesys,_,_,root).
vulExists(tPLC,cwe_306,codesys).
/*
networkServiceInfo(tPLC,dropbearssh,_,_,user).
vulExists(tPLC,cve2016_7406,dropbearssh).
vulExists(tPLC,cve2016_7407,dropbearssh).
vulExists(tPLC,cve2016_7408,dropbearssh).
vulExists(tPLC,cve2016_7409,dropbearssh).
*/
/* MicroGrid network */
inSubnet(mainRouter, mgNet).
inSubnet(mgPLC, mgNet).
inSubnet(mIED1, mgNet).
inSubnet(mIED2, mgNet).

networkServiceInfo(mgPLC,codesys,_,_,root).
vulExists(mgPLC,cwe_306,codesys).
/*
networkServiceInfo(mgPLC,dropbearssh,_,_,user).
vulExists(mgPLC,cve2016_7406,dropbearssh).
vulExists(mgPLC,cve2016_7407,dropbearssh).
vulExists(mgPLC,cve2016_7408,dropbearssh).
vulExists(mgPLC,cwe_306,dropbearssh).
*/
/* Generation network */
inSubnet(mainRouter, generationNet).
inSubnet(gIED1, generationNet).
inSubnet(genPLC, generationNet).

networkServiceInfo(genPLC,codesys,_,_,root).
vulExists(genPLC,cwe_306,codesys).
/*
networkServiceInfo(genPLC,dropbearssh,_,_,user).
vulExists(genPLC,cve2016_7406,dropbearssh).
vulExists(genPLC,cve2016_7407,dropbearssh).
vulExists(genPLC,cve2016_7408,dropbearssh).
vulExists(genPLC,cve2016_7409,dropbearssh).
*/
