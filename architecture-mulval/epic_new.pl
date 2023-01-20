/* Attack goal */
attackGoal(canTamper(controlAction12)).
attackGoal(canSpoof(controlAction12)).
attackGoal(canTamper(controlAction4)).
attackGoal(canSpoof(controlAction4)).
attackGoal(canTamper(controlAction2)).
attackGoal(canSpoof(controlAction2)).

/* Attacker Location */
attackerLocated(intranet).

/* Enable comunication between host in the same subnet*/
hacl(X,Y,_,_):-
	inSubnet(X,S),
	inSubnet(Y,S).

/* Control Logic */
/* Unsafe configuration of breakers */
controlsFlow(sPLC, controlAction12).
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
/* Enable comunication between scadaWorkStation and the attacker */
hacl(scadaWorkStation, intranet, _, _).
/* Scada hacl rules*/
hacl(scadaWorkStation, genPLC, _, _).
hacl(scadaWorkStation, shPLC, _, _).
hacl(scadaWorkStation, mgPLC, _, _).
hacl(scadaWorkStation, trPLC, _, _).

/* Generation network*/
inSubnet(gIED1, generationNet).
inSubnet(genPLC, generationNet).
inSubnet(gRouter, generationNet).

/* SmartHome network*/
inSubnet(sIED1, smartHomeNet).
inSubnet(sIED2, smartHomeNet).
inSubnet(sIED3, smartHomeNet).
inSubnet(sIED4, smartHomeNet).
inSubnet(shPLC, smartHomeNet).
inSubnet(shRouter, smartHomeNet).

/* MicroGrid network*/
inSubnet(mIED1, mgNet).
inSubnet(mIED2, mgNet).
inSubnet(mgPLC, mgNet).
inSubnet(mgRouter, mgNet).

/* Trasmission network*/
inSubnet(tIED1, mgNet).
inSubnet(tIED2, mgNet).
inSubnet(tIED3, mgNet).
inSubnet(trPLC, mgNet).
inSubnet(tRouter, mgNet).

/* TO CHECK - router link*/
/* Generation MicroGrid lan*/
inSubnet(gRouter, gmNet).
inSubnet(mgRouter, gmNet).
/* Generation Trasmission lan*/
inSubnet(gRouter, gtNet).
inSubnet(tRouter, gtNet).
/* Trasmission Scada lan*/
inSubnet(tRouter, tsNet).
inSubnet(scadaRouter, tsNet).
/* SmartHome Scada lan*/
inSubnet(shRouter, ssNet).
inSubnet(scadaRouter, ssNet).
/* SmartHome Microgrid lan*/
inSubnet(shRouter, smNet).
inSubnet(mgRouter, smNet).
