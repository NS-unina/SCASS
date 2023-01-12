%attackGoal(canAccessHost(mainPLC)).
%attackGoal(execCode(scadaWorkStation, root)).

attackGoal(canTamper(controlAction12)).
attackGoal(canSpoof(controlAction12)).
attackGoal(canTamper(controlAction4)).
attackGoal(canSpoof(controlAction4)).
attackGoal(canTamper(controlAction2)).
attackGoal(canSpoof(controlAction2)).

%attackGoal(accessMaliciousInput(scadaWorkStation,scadaOperator,firefoxBrowser)).
%attackGoal(netAccess(scadaWorkStation, _, _)).

%attackGoal(netAccess(workStation_host_6, _, _)).
%attackGoal(logInService(workStation_host_4, _, _)).

/*generated through input generator*/
attackerLocated(intranet).

hacl(X,Y,_,_):-
	inSubnet(X,S),
	inSubnet(Y,S).


/* Control Logic */
controlsFlow(sPLC, controlAction12).
transportsFlow(shRouter, controlAction12).

controlsFlow(mainPLC, controlAction4).
transportsFlow(mainRouter, controlAction4).

controlsFlow(scadaWorkStation, controlAction2).
transportsFlow(routerCsw2, controlAction2).

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


% inSubnet(enterpriseWorkStation, enterpriseNet).
%
% inCompetent(scadaOperator).
% hasAccount(scadaOperator,enterpriseWorkStation,user).
% networkServiceInfo(enterpriseWorkStation,rdpd,rdpProtocol,rdpPort,user).

%setuidProgramInfo(enterpriseWorkStation, firefoxBrowser).
%vulExists(enterpriseWorkStation, cve2022_26485,firefoxBrowser).
inSubnet(scadaWorkStation, scadaNet).
inSubnet(historian, scadaNet).
inSubnet(routerCsw2, scadaNet).

inCompetent(scadaOperator).
hasAccount(scadaOperator,scadaWorkStation,user).

networkServiceInfo(scadaWorkStation,rdpd,rdpProtocol,rdpPort,user).

networkServiceInfo(scadaWorkStation,smbServer,smbProtocol,smbPort,user).
vulExists(scadaWorkStation,cve2017_0144,smbServer).
vulExists(scadaWorkStation,cve2017_0267,smbServer).
vulExists(scadaWorkStation,cve2017_0268,smbServer).
vulExists(scadaWorkStation,cve2017_0269,smbServer).

%setuidProgramInfo(scadaWorkStation, winKernel, root).
%vulExists(scadaWorkStation, cve2022_30697,winKernel).

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
inSubnet(shRouter, smartHomeNet).
inSubnet(sPLC, smartHomeNet).
inSubnet(sIED3, smartHomeNet).
inSubnet(sIED4, smartHomeNet).
inSubnet(shRouter, scadaNet).
inSubnet(sPLC, scadaNet).
inSubnet(sIED3, scadaNet).
inSubnet(sIED4, scadaNet).

hacl(sIED1, sIED3, _, _).
hacl(sIED3, sIED1, _, _).
hacl(sIED2, sIED4, _, _).
hacl(sIED4, sIED2, _, _).

networkServiceInfo(sPLC,codesys,_,_,root).
vulExists(sPLC,cve2012_6068,codesys).

networkServiceInfo(sPLC,dropbearssh,_,_,user).
vulExists(sPLC,cve2016_7406,dropbearssh).
vulExists(sPLC,cve2016_7407,dropbearssh).
vulExists(sPLC,cve2016_7408,dropbearssh).
vulExists(sPLC,cve2016_7409,dropbearssh).

/* transmissionNet */
inSubnet(tRouter, transmissionNet).
inSubnet(tPLC, transmissionNet).
inSubnet(tIED1, transmissionNet).
inSubnet(tIED2, transmissionNet).
inSubnet(tRouter, scadaNet).
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
inSubnet(mgRouter, mgNet).
inSubnet(mgPLC, mgNet).
inSubnet(mIED1, mgNet).
inSubnet(mIED2, mgNet).

inSubnet(mgRouter, scadaNet).
inSubnet(mgPLC, scadaNet).
inSubnet(mIED1, scadaNet).
inSubnet(mIED2, scadaNet).

networkServiceInfo(mgPLC,codesys,_,_,root).
vulExists(mgPLC,cve2012_6068,codesys).

networkServiceInfo(mgPLC,dropbearssh,_,_,user).
vulExists(mgPLC,cve2016_7406,dropbearssh).
vulExists(mgPLC,cve2016_7407,dropbearssh).
vulExists(mgPLC,cve2016_7408,dropbearssh).
vulExists(mgPLC,cve2012_6068,dropbearssh).

/* generationNet */
inSubnet(gRouter, generationNet).
inSubnet(genPLC, generationNet).
inSubnet(gIED1, mgNet).
inSubnet(gIED2, mgNet).

inSubnet(gRouter, scadaNet).
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


% inSubnet(workStation_host_1, workStation).
% inSubnet(workStation_host_2, workStation).
% inSubnet(workStation_host_3, workStation).
% inSubnet(workStation_host_4, workStation).
% inSubnet(workStation_host_5, workStation).
% inSubnet(workStation_host_6, workStation).
% inSubnet(workStation_host_7, workStation).
% inSubnet(workStation_host_8, workStation).
% inSubnet(workStation_host_9, workStation).
% inSubnet(workStation_host_10, workStation).
% setuidProgramInfo(workStation_host_10, localApplication, root).
% vulExists(workStation_host_10, workStation_host_10_localVul_0,localApplication).
% vulProperty(workStation_host_10_localVul_0,localExploit, privEscalation).
% cvss(workStation_host_10_localVul_0,h).
%
% vulExists(workStation_host_10, workStation_host_10_localVul_1,localApplication).
% vulProperty(workStation_host_10_localVul_1,localExploit, privEscalation).
% cvss(workStation_host_10_localVul_1,l).
%
% inCompetent(workStation_host_10_victim).
% hasAccount(workStation_host_10_victim, workStation_host_10, user).
% isClient(clientApplication).
% vulExists(workStation_host_10, workStation_host_10_clientVul_0,clientApplication).
% vulProperty(workStation_host_10_clientVul_0, remoteExploit, privEscalation).
% cvss(workStation_host_10_clientVul_0,m).
%
% networkServiceInfo(workStation_host_10,serverApplication,httpProtocol, httpPort,user).
% vulExists(workStation_host_10, workStation_host_10_remoteVul_0,serverApplication).
% vulProperty(workStation_host_10_remoteVul_0, remoteExploit, privEscalation).
% cvss(workStation_host_10_remoteVul_0,h).
%
% vulExists(workStation_host_10, workStation_host_10_remoteVul_1,serverApplication).
% vulProperty(workStation_host_10_remoteVul_1, remoteExploit, privEscalation).
% cvss(workStation_host_10_remoteVul_1,h).
%
% setuidProgramInfo(workStation_host_9, localApplication, root).
% vulExists(workStation_host_9, workStation_host_9_localVul_0,localApplication).
% vulProperty(workStation_host_9_localVul_0,localExploit, privEscalation).
% cvss(workStation_host_9_localVul_0,l).
%
% vulExists(workStation_host_9, workStation_host_9_localVul_1,localApplication).
% vulProperty(workStation_host_9_localVul_1,localExploit, privEscalation).
% cvss(workStation_host_9_localVul_1,l).
%
% vulExists(workStation_host_9, workStation_host_9_localVul_2,localApplication).
% vulProperty(workStation_host_9_localVul_2,localExploit, privEscalation).
% cvss(workStation_host_9_localVul_2,h).
%
% inCompetent(workStation_host_9_victim).
% hasAccount(workStation_host_9_victim, workStation_host_9, user).
%
% isClient(clientApplication).
% vulExists(workStation_host_9, workStation_host_9_clientVul_0,clientApplication).
% vulProperty(workStation_host_9_clientVul_0, remoteExploit, privEscalation).
% cvss(workStation_host_9_clientVul_0,h).
%
% vulExists(workStation_host_9, workStation_host_9_clientVul_1,clientApplication).
% vulProperty(workStation_host_9_clientVul_1, remoteExploit, privEscalation).
% cvss(workStation_host_9_clientVul_1,h).
%
% inSubnet(fileServers_host_1, fileServers).
% inSubnet(fileServers_host_2, fileServers).
% inSubnet(fileServers_host_3, fileServers).
% inSubnet(fileServers_host_4, fileServers).
% inSubnet(fileServers_host_5, fileServers).
% inSubnet(fileServers_host_6, fileServers).
% inSubnet(fileServers_host_7, fileServers).
% inSubnet(fileServers_host_8, fileServers).
% inSubnet(fileServers_host_9, fileServers).
% inSubnet(fileServers_host_10, fileServers).
% inCompetent(fileServers_host_10_victim).
% hasAccount(fileServers_host_10_victim, fileServers_host_10, user).
% isClient(clientApplication).
% vulExists(fileServers_host_10, fileServers_host_10_clientVul_0,clientApplication).
% vulProperty(fileServers_host_10_clientVul_0, remoteExploit, privEscalation).
% cvss(fileServers_host_10_clientVul_0,h).
%
% networkServiceInfo(fileServers_host_10,serverApplication,httpProtocol, httpPort,user).
% vulExists(fileServers_host_10, fileServers_host_10_remoteVul_0,serverApplication).
% vulProperty(fileServers_host_10_remoteVul_0, remoteExploit, privEscalation).
% cvss(fileServers_host_10_remoteVul_0,m).
%
% vulExists(fileServers_host_10, fileServers_host_10_remoteVul_1,serverApplication).
% vulProperty(fileServers_host_10_remoteVul_1, remoteExploit, privEscalation).
% cvss(fileServers_host_10_remoteVul_1,h).
%
% vulExists(fileServers_host_10, fileServers_host_10_remoteVul_2,serverApplication).
% vulProperty(fileServers_host_10_remoteVul_2, remoteExploit, privEscalation).
% cvss(fileServers_host_10_remoteVul_2,h).
%
% inCompetent(fileServers_host_9_victim).
% hasAccount(fileServers_host_9_victim, fileServers_host_9, user).
% isClient(clientApplication).
% vulExists(fileServers_host_9, fileServers_host_9_clientVul_0,clientApplication).
% vulProperty(fileServers_host_9_clientVul_0, remoteExploit, privEscalation).
% cvss(fileServers_host_9_clientVul_0,l).
%
% vulExists(fileServers_host_9, fileServers_host_9_clientVul_1,clientApplication).
% vulProperty(fileServers_host_9_clientVul_1, remoteExploit, privEscalation).
% cvss(fileServers_host_9_clientVul_1,m).
%
% networkServiceInfo(fileServers_host_9,serverApplication,httpProtocol, httpPort,user).
% vulExists(fileServers_host_9, fileServers_host_9_remoteVul_0,serverApplication).
% vulProperty(fileServers_host_9_remoteVul_0, remoteExploit, privEscalation).
% cvss(fileServers_host_9_remoteVul_0,m).
%
% vulExists(fileServers_host_9, fileServers_host_9_remoteVul_1,serverApplication).
% vulProperty(fileServers_host_9_remoteVul_1, remoteExploit, privEscalation).
% cvss(fileServers_host_9_remoteVul_1,h).
%
% inSubnet(workStation_host_1, workStation).
% inSubnet(workStation_host_2, workStation).
% inSubnet(workStation_host_3, workStation).
% inSubnet(workStation_host_4, workStation).
% inSubnet(workStation_host_5, workStation).
% inSubnet(workStation_host_6, workStation).
% inSubnet(workStation_host_7, workStation).
% inSubnet(workStation_host_8, workStation).
% inSubnet(workStation_host_9, workStation).
% inSubnet(workStation_host_10, workStation).
% setuidProgramInfo(workStation_host_10, localApplication, root).
% vulExists(workStation_host_10, workStation_host_10_localVul_0,localApplication).
% vulProperty(workStation_host_10_localVul_0,localExploit, privEscalation).
% cvss(workStation_host_10_localVul_0,m).
%
% vulExists(workStation_host_10, workStation_host_10_localVul_1,localApplication).
% vulProperty(workStation_host_10_localVul_1,localExploit, privEscalation).
% cvss(workStation_host_10_localVul_1,h).
%
% inCompetent(workStation_host_10_victim).
% hasAccount(workStation_host_10_victim, workStation_host_10, user).
% isClient(clientApplication).
% vulExists(workStation_host_10, workStation_host_10_clientVul_0,clientApplication).
% vulProperty(workStation_host_10_clientVul_0, remoteExploit, privEscalation).
% cvss(workStation_host_10_clientVul_0,l).
%
% networkServiceInfo(workStation_host_10,serverApplication,httpProtocol, httpPort,user).
% vulExists(workStation_host_10, workStation_host_10_remoteVul_0,serverApplication).
% vulProperty(workStation_host_10_remoteVul_0, remoteExploit, privEscalation).
% cvss(workStation_host_10_remoteVul_0,l).
%
% vulExists(workStation_host_10, workStation_host_10_remoteVul_1,serverApplication).
% vulProperty(workStation_host_10_remoteVul_1, remoteExploit, privEscalation).
% cvss(workStation_host_10_remoteVul_1,m).
%
% setuidProgramInfo(workStation_host_9, localApplication, root).
% vulExists(workStation_host_9, workStation_host_9_localVul_0,localApplication).
% vulProperty(workStation_host_9_localVul_0,localExploit, privEscalation).
% cvss(workStation_host_9_localVul_0,m).
%
% vulExists(workStation_host_9, workStation_host_9_localVul_1,localApplication).
% vulProperty(workStation_host_9_localVul_1,localExploit, privEscalation).
% cvss(workStation_host_9_localVul_1,h).
%
% vulExists(workStation_host_9, workStation_host_9_localVul_2,localApplication).
% vulProperty(workStation_host_9_localVul_2,localExploit, privEscalation).
% cvss(workStation_host_9_localVul_2,h).
%
% inCompetent(workStation_host_9_victim).
% hasAccount(workStation_host_9_victim, workStation_host_9, user).
% isClient(clientApplication).
% vulExists(workStation_host_9, workStation_host_9_clientVul_0,clientApplication).
% vulProperty(workStation_host_9_clientVul_0, remoteExploit, privEscalation).
% cvss(workStation_host_9_clientVul_0,l).
%
% vulExists(workStation_host_9, workStation_host_9_clientVul_1,clientApplication).
% vulProperty(workStation_host_9_clientVul_1, remoteExploit, privEscalation).
% cvss(workStation_host_9_clientVul_1,l).
%
% inSubnet(dmz_host_1, dmz).
% inSubnet(dmz_host_2, dmz).
% inSubnet(dmz_host_3, dmz).
% inSubnet(dmz_host_4, dmz).
% inSubnet(dmz_host_5, dmz).
% inSubnet(dmz_host_6, dmz).
% inSubnet(dmz_host_7, dmz).
% inSubnet(dmz_host_8, dmz).
% inSubnet(dmz_host_9, dmz).
% inSubnet(dmz_host_10, dmz).
% setuidProgramInfo(dmz_host_10, localApplication, root).
% vulExists(dmz_host_10, dmz_host_10_localVul_0,localApplication).
% vulProperty(dmz_host_10_localVul_0,localExploit, privEscalation).
% cvss(dmz_host_10_localVul_0,m).
%
% inCompetent(dmz_host_10_victim).
% hasAccount(dmz_host_10_victim, dmz_host_10, user).
% isClient(clientApplication).
% vulExists(dmz_host_10, dmz_host_10_clientVul_0,clientApplication).
% vulProperty(dmz_host_10_clientVul_0, remoteExploit, privEscalation).
% cvss(dmz_host_10_clientVul_0,h).
%
% networkServiceInfo(dmz_host_10,serverApplication,httpProtocol, httpPort,user).
% vulExists(dmz_host_10, dmz_host_10_remoteVul_0,serverApplication).
% vulProperty(dmz_host_10_remoteVul_0, remoteExploit, privEscalation).
% cvss(dmz_host_10_remoteVul_0,l).
%
% vulExists(dmz_host_10, dmz_host_10_remoteVul_1,serverApplication).
% vulProperty(dmz_host_10_remoteVul_1, remoteExploit, privEscalation).
% cvss(dmz_host_10_remoteVul_1,l).
%
% vulExists(dmz_host_10, dmz_host_10_remoteVul_2,serverApplication).
% vulProperty(dmz_host_10_remoteVul_2, remoteExploit, privEscalation).
% cvss(dmz_host_10_remoteVul_2,l).
%
% vulExists(dmz_host_10, dmz_host_10_remoteVul_3,serverApplication).
% vulProperty(dmz_host_10_remoteVul_3, remoteExploit, privEscalation).
% cvss(dmz_host_10_remoteVul_3,l).
%
% setuidProgramInfo(dmz_host_9, localApplication, root).
% vulExists(dmz_host_9, dmz_host_9_localVul_0,localApplication).
% vulProperty(dmz_host_9_localVul_0,localExploit, privEscalation).
% cvss(dmz_host_9_localVul_0,l).
%
% inCompetent(dmz_host_9_victim).
% hasAccount(dmz_host_9_victim, dmz_host_9, user).
% isClient(clientApplication).
% vulExists(dmz_host_9, dmz_host_9_clientVul_0,clientApplication).
% vulProperty(dmz_host_9_clientVul_0, remoteExploit, privEscalation).
% cvss(dmz_host_9_clientVul_0,m).
%
% vulExists(dmz_host_9, dmz_host_9_clientVul_1,clientApplication).
% vulProperty(dmz_host_9_clientVul_1, remoteExploit, privEscalation).
% cvss(dmz_host_9_clientVul_1,h).
%
% vulExists(dmz_host_9, dmz_host_9_clientVul_2,clientApplication).
% vulProperty(dmz_host_9_clientVul_2, remoteExploit, privEscalation).
% cvss(dmz_host_9_clientVul_2,h).
%
% vulExists(dmz_host_9, dmz_host_9_clientVul_3,clientApplication).
% vulProperty(dmz_host_9_clientVul_3, remoteExploit, privEscalation).
% cvss(dmz_host_9_clientVul_3,h).
%

%hacl(fileServers_host_10, internet, httpProtocol, httpPort).
% hacl(internet, fileServers_host_10, httpProtocol, httpPort).
% hacl(fileServers_host_10, workStation_host_10, httpProtocol, httpPort).
% hacl(workStation_host_10, fileServers_host_10, httpProtocol, httpPort).

% hacl(enterpriseWorkStation, internet, _, _).
% hacl(internet, enterpriseWorkStation, _, _).

%hacl(scadaWorkStation, enterpriseWorkStation, _, _).
%hacl(enterpriseWorkStation, scadaWorkStation, _, _).

hacl(scadaWorkStation, intranet, _, _).
hacl(intranet, scadaWorkStation, _, _).

hacl(mainRouter, scadaWorkStation, _, _).
hacl(scadaWorkStation, mainRouter, _, _).

% hacl(subnet2_host_10, internet, httpProtocol, httpPort).
% hacl(internet, subnet2_host_10, httpProtocol, httpPort).
% hacl(dmz_host_10, internet, httpProtocol, httpPort).
% hacl(internet, dmz_host_10, httpProtocol, httpPort).
% hacl(historian_host_10, dmz_host_10, httpProtocol, httpPort).
% hacl(dmz_host_10, historian_host_10, httpProtocol, httpPort).
% hacl(historian_host_10, dmz_host_10, nfsProtocol, nfsPort).
% hacl(dmz_host_10, historian_host_10, nfsProtocol, nfsPort).
