/* Attack goal */
attackGoal(lossVisibility(feedbackAction3)).

/* Attacker location */
attackerLocated(microgrid).
hacl(_,_,_,_).
hacl(X,Y,_,_):-
	inSubnet(X,S),
	inSubnet(Y,S).

/* Control Logic */
/* Control flow Master-PLC to S-PLC*/
controlFlow(terminal, mplc, controlAction2).
feedbackFlow(mplc, terminal, feedbackAction2).
protocol(controlAction2, plaintext).
protocol(feedbackAction2, plaintext).
/* Control flow Scada-System to Master-PLC*/
controlFlow(mplc, mied1, controlAction3).
feedbackFlow(mied1, mplc, feedbackAction3).
protocol(feedbackAction3, plaintext).
protocol(feedbackAction3, unauthenticated).

inSubnet(terminal, microgrid).
l2Discovery(terminal, arp).
inSubnet(mplc, microgrid).
l2Discovery(mplc, arp).
inSubnet(mied2, microgrid).
l2Discovery(mied2, arp).
inSubnet(mied1, microgrid).
l2Discovery(mied1, arp).
inSubnet(vulnHost, microgrid).

/* Vulnerabilities */
vulProperty(cve_1999_0667, remoteExploit, privEscalation).
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
