:- dynamic camereLibere/1,
            listaLanterna/1.

listaLanterna(
    [hol,biblioteca,cameraE,cameraES,
    cameraEE,debara,bucatarie,
    cameraNW, cameraNN]).
listaComestibile(
    [hol,biblioteca,cameraE,cameraES,
    cameraEE,debara,bucatarie,cameraNW,cameraW,
    cameraWW,cameraWS,cameraNE,cameraCapcana2,
    cameraCapcana1,cameraNN, cameraEN]).

camereLibere([hol,biblioteca,cameraE,
    cameraES,cameraEE,debara,bucatarie,
    cameraNW,cameraW,cameraWW,cameraWS,
    cameraNE,cameraEN,cameraNN]).

alegeCamera(L,Locatie):-
    length(L,X),
    random(0,X,Pozitie),
    nth0(Pozitie,L,Locatie),
    listaLanterna(L2),
    elimina(Locatie,L2,RezultatEliminare),
    retract(listaLanterna(_)),
    assert(listaLanterna(RezultatEliminare)),!.

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
        listaLanterna(L4),
        alegeCamera(L4,LocatieBaterie),
        retract(locatieObiect(baterie,_)),
        assert(locatieObiect(baterie,LocatieBaterie)),
        listaComestibile(L3),
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

probabilitateBandaj(NivelSelectat,X):-
       NivelSelectat=usor->
       X = 3,!;
       NivelSelectat=mediu->
       X = 4,!;
       NivelSelectat=dificil->
       X = 6,!;
       NivelSelectat=imposibil->
       X = 8,!.

distribuieBandaj():-
        nivelSelectat(NivelSelectat),
        probabilitateBandaj(NivelSelectat,X),
        random(1,X,R),
        R = 1 ->
        alegeCameraLitera(Locatie),
        retract(locatieObiect(bandaj,_)),
        assert(locatieObiect(bandaj,Locatie)),!;
        true,!.