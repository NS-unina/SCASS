/*scada network*/
inSubnet(scadaWorkStation, scadaNet).
inSubnet(historian, scadaNet).
inSubnet(engineeringWorkStation, scadaNet).
inSubnet(scadaRouter, scadaNet).

/*generation network*/
inSubnet(gIED1, generationNet).
inSubnet(genPLC, generationNet).
inSubnet(gRouter, generationNet).

/*smarthome network*/
inSubnet(sIED1, smartHomeNet).
inSubnet(sIED2, smartHomeNet).
inSubnet(sIED3, smartHomeNet).
inSubnet(sIED4, smartHomeNet).
inSubnet(sPLC, smartHomeNet).
inSubnet(shRouter, smartHomeNet).

hacl(sIED1, sIED3, _, _).
hacl(sIED3, sIED1, _, _).
hacl(sIED2, sIED4, _, _).
hacl(sIED4, sIED2, _, _).

/*microgrid network*/
inSubnet(mIED1, mgNet).
inSubnet(mIED2, mgNet).
inSubnet(mgPLC, mgNet).
inSubnet(mgRouter, mgNet).

/*trasmission network*/
inSubnet(tIED1, mgNet).
inSubnet(tIED2, mgNet).
inSubnet(tIED3, mgNet).
inSubnet(tPLC, mgNet).
inSubnet(tRouter, mgNet).

/*router link*/
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



