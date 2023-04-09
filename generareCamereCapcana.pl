alegeCameraDebara(S):-random(0,3,S).

distribuireCamere():-
            alegeCameraDebara(S),
            efectuareModificari(S),!.

efectuareModificari(S):-
        S = 0 ->
        retract(legatura(s,cameraNW,_)),
        assert(legatura(s,cameraNW,debara)),
        retract(legatura(n,cameraNW,_)),
        assert(legatura(n,cameraNW,cameraCapcana1)),
        retract(legatura(w,cameraNW,_)),
        assert(legatura(w,cameraNW,cameraCapcana2)),

        retract(legatura(_,cameraCapcana1,cameraNW)),
        assert(legatura(s,cameraCapcana1,cameraNW)),

        retract(legatura(_,debara,cameraNW)),
        assert(legatura(n,debara,cameraNW)),

        retract(legatura(_,cameraCapcana2,cameraNW)),
        assert(legatura(e,cameraCapcana2,cameraNW)),
        retract(camerePericol(_)),
        assert(camerePericol([w,n])),

        retract(camere(3,2,_)),
        assert(camere(3,2,debara)),
        retract(camere(4,1,_)),
        assert(camere(4,1,cameraCapcana2)),
        retract(camere(5,2,_)),
        assert(camere(5,2,cameraCapcana1)),!;
        S = 1 ->
        retract(legatura(w,cameraNW,_)),
        assert(legatura(w,cameraNW,debara)),
        retract(legatura(n,cameraNW,_)),
        assert(legatura(n,cameraNW,cameraCapcana2)),
        retract(legatura(s,cameraNW,_)),
        assert(legatura(s,cameraNW,cameraCapcana1)),

        retract(legatura(_,cameraCapcana2,cameraNW)),
        assert(legatura(s,cameraCapcana2,cameraNW)),

        retract(legatura(_,debara,cameraNW)),
        assert(legatura(e,debara,cameraNW)),

        retract(legatura(_,cameraCapcana1,cameraNW)),
        assert(legatura(n,cameraCapcana1,cameraNW)),

        retract(camerePericol(_)),
        assert(camerePericol([n,s ])),

        retract(camere(3,2,_)),
        assert(camere(3,2,cameraCapcana1)),
        retract(camere(4,1,_)),
        assert(camere(4,1,debara)),
        retract(camere(5,2,_)),
        assert(camere(5,2,cameraCapcana2)),!;
        S = 2 ->
        retract(legatura(w,cameraNW,_)),
        assert(legatura(w,cameraNW,cameraCapcana2)),
        retract(legatura(n,cameraNW,_)),
        assert(legatura(n,cameraNW,debara)),
        retract(legatura(s,cameraNW,_)),
        assert(legatura(s,cameraNW,cameraCapcana1)),

        retract(legatura(_,cameraCapcana2,cameraNW)),
        assert(legatura(e,cameraCapcana2,cameraNW)),

        retract(legatura(_,debara,cameraNW)),
        assert(legatura(s,debara,cameraNW)),

        retract(legatura(_,cameraCapcana1,cameraNW)),
        assert(legatura(n,cameraCapcana1,cameraNW)),

        retract(camerePericol(_)),
        assert(camerePericol([s,w])),
        
        retract(camere(3,2,_)),
        assert(camere(3,2,cameraCapcana1)),
        retract(camere(4,1,_)),
        assert(camere(4,1,cameraCapcana2)),
        retract(camere(5,2,_)),
        assert(camere(5,2,debara)),!.
