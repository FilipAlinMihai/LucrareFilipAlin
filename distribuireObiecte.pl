:- dynamic camereLibere/1.

listaLanterna(
    [hol,biblioteca,cameraE,cameraES,
    cameraEE,debara,bucatarie,cameraNW]).
listaComestibile(
    [hol,biblioteca,cameraE,cameraES,
    cameraEE,debara,bucatarie,cameraNW,cameraW,
    cameraWW,cameraWS,cameraNE,cameraCapcana2,cameraCapcana1]).

camereLibere([hol,biblioteca,cameraE,
    cameraES,cameraEE,debara,bucatarie,
    cameraNW,cameraW,cameraWW,cameraWS,cameraNE]).

alegeCamera(L,Locatie):-
    length(L,X),
    random(0,X,Pozitie),
    nth0(Pozitie,L,Locatie),!.

alegeCameraLitera(Locatie):-
    camereLibere(L),
    length(L,X),
    random(0,X,Pozitie),
    nth0(Pozitie,L,Locatie),
    elimina(Locatie,L,RezultatEliminare),
    retract(camereLibere(_)),
    assert(camereLibere(RezultatEliminare)),!.

distribuieObiecte():-
        listaLanterna(L2),
        listaComestibile(L3),
        alegeCameraLitera(R0),
        retract(locatieObiect(carteLitera3,_)),
        assert(locatieObiect(carteLitera3,R0)),
        alegeCameraLitera(R1),
        retract(locatieObiect(scrisoareLitera1,_)),
        assert(locatieObiect(scrisoareLitera1,R1)),
        alegeCameraLitera(R2),
        retract(locatieObiect(ghicitoare,_)),
        assert(locatieObiect(ghicitoare,R2)),
        alegeCameraLitera(R3),
        retract(locatieObiect(carteLitera2,_)),
        assert(locatieObiect(carteLitera2,R3)),
        retract(locatieObiect(bilet,_)),
        assert(locatieObiect(bilet,hol)),
        alegeCamera(L2,R5),
        retract(locatieObiect(lanterna,_)),
        assert(locatieObiect(lanterna,R5)),
        alegeCamera(L3,R6),
        retract(locatieObiect(mar,_)),
        assert(locatieObiect(mar,R6)),
        alegeCamera(L3,R7),
        retract(locatieObiect(biscuit,_)),
        assert(locatieObiect(biscuit,R7)),
        alegeCameraLitera(R8),
        retract(locatieObiect(scrisoareLitera5,_)),
        assert(locatieObiect(scrisoareLitera5,R8)),
        alegeCameraLitera(R9),
        retract(locatieObiect(carteLitera4,_)),
        assert(locatieObiect(carteLitera4,R9)),!.

elimina(_,[],[]):-!.
elimina(Locatie,[Locatie|T],T):-!.
elimina(Locatie,[X|T],[X|RezEliminare]):-elimina(Locatie,T,RezEliminare),!.