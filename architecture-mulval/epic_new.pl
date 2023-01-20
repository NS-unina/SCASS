/* Enable comunication between host in the same subnet*/
hacl(X,Y,_,_):-
	inSubnet(X,S),
	inSubnet(Y,S).

/*scada network*/
inSubnet(scadaWorkStation, scadaNet).
inSubnet(historian, scadaNet).
inSubnet(engineeringWorkStation, scadaNet).
inSubnet(scadaRouter, scadaNet).
hacl(scadaWorkStation, intranet, _, _).
/*scada hacl rules*/
hacl(scadaWorkStation, genPLC, _, _).
hacl(scadaWorkStation, shPLC, _, _).
hacl(scadaWorkStation, mgPLC, _, _).
hacl(scadaWorkStation, trPLC, _, _).

/*generation network*/
inSubnet(gIED1, generationNet).
inSubnet(genPLC, generationNet).
inSubnet(gRouter, generationNet).

/*smarthome network*/
inSubnet(sIED1, smartHomeNet).
inSubnet(sIED2, smartHomeNet).
inSubnet(sIED3, smartHomeNet).
inSubnet(sIED4, smartHomeNet).
inSubnet(shPLC, smartHomeNet).
inSubnet(shRouter, smartHomeNet).

/*microgrid network*/
inSubnet(mIED1, mgNet).
inSubnet(mIED2, mgNet).
inSubnet(mgPLC, mgNet).
inSubnet(mgRouter, mgNet).

/*trasmission network*/
inSubnet(tIED1, mgNet).
inSubnet(tIED2, mgNet).
inSubnet(tIED3, mgNet).
inSubnet(trPLC, mgNet).
inSubnet(tRouter, mgNet).

/*TO CHECK - router link*/
/*generation microgrid lan*/
inSubnet(gRouter, gmNet).
inSubnet(mgRouter, gmNet).
/*generation trasmission lan*/
inSubnet(gRouter, gtNet).
inSubnet(tRouter, gtNet).
/*trasmission scada lan*/
inSubnet(tRouter, tsNet).
inSubnet(scadaRouter, tsNet).
/*smarthome scada lan*/
inSubnet(shRouter, ssNet).
inSubnet(scadaRouter, ssNet).
/*smarthome microgrid lan*/
inSubnet(shRouter, smNet).
inSubnet(mgRouter, smNet).
