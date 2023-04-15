alegeCameraDebara(S):-random(0,3,S).

distribuireCamere():-
            alegeCameraDebara(S),
            efectuareModificari(S),!.

efectuareModificari(S):-
        S = 0 ->
        numarPlanCasa(NRP),
        retract(legatura(_,s,cameraNW,_)),
        assert(legatura(NRP,s,cameraNW,debara)),
        retract(legatura(_,n,cameraNW,_)),
        assert(legatura(NRP,n,cameraNW,cameraCapcana1)),
        retract(legatura(_,w,cameraNW,_)),
        assert(legatura(NRP,w,cameraNW,cameraCapcana2)),

        retract(legatura(_,_,cameraCapcana1,cameraNW)),
        assert(legatura(NRP,s,cameraCapcana1,cameraNW)),

        retract(legatura(_,_,debara,cameraNW)),
        assert(legatura(NRP,n,debara,cameraNW)),

        retract(legatura(_,_,cameraCapcana2,cameraNW)),
        assert(legatura(NRP,e,cameraCapcana2,cameraNW)),
        retract(camerePericol(_)),
        assert(camerePericol([w,n])),

        retract(camere(_,3,2,_)),
        assert(camere(NRP,3,2,debara)),
        retract(camere(_,4,1,_)),
        assert(camere(NRP,4,1,cameraCapcana2)),
        retract(camere(_,5,2,_)),
        assert(camere(NRP,5,2,cameraCapcana1)),!;
        S = 1 ->
        numarPlanCasa(NRP),
        retract(legatura(_,w,cameraNW,_)),
        assert(legatura(NRP,w,cameraNW,debara)),
        retract(legatura(_,n,cameraNW,_)),
        assert(legatura(NRP,n,cameraNW,cameraCapcana2)),
        retract(legatura(_,s,cameraNW,_)),
        assert(legatura(NRP,s,cameraNW,cameraCapcana1)),

        retract(legatura(_,_,cameraCapcana2,cameraNW)),
        assert(legatura(NRP,s,cameraCapcana2,cameraNW)),

        retract(legatura(_,_,debara,cameraNW)),
        assert(legatura(NRP,e,debara,cameraNW)),

        retract(legatura(_,_,cameraCapcana1,cameraNW)),
        assert(legatura(NRP,n,cameraCapcana1,cameraNW)),

        retract(camerePericol(_)),
        assert(camerePericol([n,s ])),

        retract(camere(_,3,2,_)),
        assert(camere(NRP,3,2,cameraCapcana1)),
        retract(camere(_,4,1,_)),
        assert(camere(NRP,4,1,debara)),
        retract(camere(_,5,2,_)),
        assert(camere(NRP,5,2,cameraCapcana2)),!;
        S = 2 ->
        numarPlanCasa(NRP),
        retract(legatura(_,w,cameraNW,_)),
        assert(legatura(NRP,w,cameraNW,cameraCapcana2)),
        retract(legatura(_,n,cameraNW,_)),
        assert(legatura(NRP,n,cameraNW,debara)),
        retract(legatura(_,s,cameraNW,_)),
        assert(legatura(NRP,s,cameraNW,cameraCapcana1)),

        retract(legatura(_,_,cameraCapcana2,cameraNW)),
        assert(legatura(NRP,e,cameraCapcana2,cameraNW)),

        retract(legatura(_,_,debara,cameraNW)),
        assert(legatura(NRP,s,debara,cameraNW)),

        retract(legatura(_,_,cameraCapcana1,cameraNW)),
        assert(legatura(NRP,n,cameraCapcana1,cameraNW)),

        retract(camerePericol(_)),
        assert(camerePericol([s,w])),
        
        retract(camere(_,3,2,_)),
        assert(camere(NRP,3,2,cameraCapcana1)),
        retract(camere(_,4,1,_)),
        assert(camere(NRP,4,1,cameraCapcana2)),
        retract(camere(_,5,2,_)),
        assert(camere(NRP,5,2,debara)),!.
