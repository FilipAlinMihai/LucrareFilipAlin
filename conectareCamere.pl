:- dynamic numarPlanCasa/1.

numarPlanCasa(1).

%Sunt stabilite rutele de legatura intre camere.
legatura(1,n,hol,biblioteca).
legatura(1,w,hol,cameraW).
legatura(1,e,hol,cameraE).
legatura(1,s,hol,iesire).

legatura(1,e,cameraE,cameraEE).
legatura(1,w,cameraE,hol).
legatura(1,s,cameraE,cameraES).
legatura(1,n,cameraE,cameraEN).

legatura(1,n,cameraES,cameraE).

legatura(1,w,cameraEE,cameraE).
legatura(1,n,cameraEE,cameraNE).

%In birou se poate intra cu un cod gasit prin explorarea camerelor
legatura(1,n,biblioteca,birou):-cod_birou(X),codReal(Y),egale(X,Y).
legatura(1,n,biblioteca,birou):-
    write(''),nl,fail.
legatura(1,s,biblioteca,hol).
legatura(1,e,biblioteca,bucatarie).
legatura(1,w,biblioteca,cameraNW).

legatura(1,e,bucatarie,cameraNE).
legatura(1,w,bucatarie,biblioteca).
legatura(1,n,bucatarie,cameraNN).

legatura(1,s,cameraNN,bucatarie).

legatura(1,s,cameraEN,cameraE).

legatura(1,e,cameraNW,biblioteca).
legatura(1,s,cameraNW,cameraCapcana1).
legatura(1,n,cameraNW,debara).
legatura(1,w,cameraNW,cameraCapcana2).

legatura(1,s,debara,cameraNW).

legatura(1,n,cameraCapcana1,cameraNW).

legatura(1,s,cameraNE,cameraEE).
legatura(1,w,cameraNE,bucatarie).

legatura(1,e,cameraCapcana2,cameraNW).

legatura(1,w,cameraW,cameraWW).
legatura(1,e,cameraW,hol).
legatura(1,s,cameraW,cameraWS).

legatura(1,n,cameraWS,cameraW).

legatura(1,e,cameraWW,cameraW).

legatura(1,s,birou,biblioteca).

%HARTA NUMARUL 2

legatura(2,n,hol,cameraE).
legatura(2,s,hol,iesire).

legatura(2,s,cameraE,hol).
legatura(2,n,cameraE,cameraNN).
legatura(2,e,cameraE,cameraEE).
legatura(2,w,cameraE,cameraES).

legatura(2,w,cameraEE,cameraE).
legatura(2,n,cameraEE,cameraNE).

legatura(2,s,cameraNN,cameraE).
legatura(2,n,cameraNN,bucatarie).

legatura(2,s,bucatarie,cameraNN).
legatura(2,e,bucatarie,cameraNE).
legatura(2,w,bucatarie,biblioteca).

legatura(2,s,cameraNE,cameraEE).
legatura(2,w,cameraNE,bucatarie).

legatura(2,e,biblioteca,bucatarie).
legatura(2,n,biblioteca,birou):-cod_birou(X),codReal(Y),egale(X,Y).
legatura(2,n,biblioteca,birou):-fail.
legatura(2,w,biblioteca,cameraNW).
legatura(2,s,biblioteca,cameraEN).

legatura(2,s,birou,biblioteca).

legatura(2,e,cameraNW,biblioteca).
legatura(2,s,cameraNW,cameraCapcana1).
legatura(2,n,cameraNW,debara).
legatura(2,w,cameraNW,cameraCapcana2).

legatura(2,s,debara,cameraNW).

legatura(2,n,cameraCapcana1,cameraNW).
legatura(2,e,cameraCapcana2,cameraNW).

legatura(2,n,cameraEN,biblioteca).
legatura(2,s,cameraEN,cameraWS).

legatura(2,e,cameraES,cameraE).
legatura(2,w,cameraES,cameraWS).

legatura(2,e,cameraWS,cameraES).
legatura(2,w,cameraWS,cameraW).
legatura(2,n,cameraWS,cameraEN).

legatura(2,e,cameraW,cameraWS).
legatura(2,n,cameraW,cameraWW).
legatura(2,s,cameraWW,cameraW).

%HARTA NUMARUL 2

legatura(3,n,hol,cameraEE).
legatura(3,s,hol,iesire).

legatura(3,s,cameraEE,hol).
legatura(3,n,cameraEE,cameraNN).
legatura(3,w,cameraEE,cameraE).

legatura(3,e,cameraE,cameraEE).
legatura(3,n,cameraE,cameraES).

legatura(3,n,cameraES,biblioteca).
legatura(3,w,cameraES,cameraEN).
legatura(3,s,cameraES,cameraE).

legatura(3,s,cameraNN,cameraEE).
legatura(3,n,cameraNN,cameraNE).

legatura(3,s,cameraNE,cameraNN).
legatura(3,w,cameraNE,biblioteca).

legatura(3,w,biblioteca,bucatarie).
legatura(3,n,biblioteca,birou):-cod_birou(X),codReal(Y),egale(X,Y).
legatura(3,n,biblioteca,birou):-fail.
legatura(3,e,biblioteca,cameraNE).
legatura(3,s,biblioteca,cameraES).

legatura(3,s,birou,biblioteca).

legatura(3,e,cameraNW,bucatarie).
legatura(3,s,cameraNW,cameraCapcana1).
legatura(3,n,cameraNW,debara).
legatura(3,w,cameraNW,cameraCapcana2).

legatura(3,s,debara,cameraNW).

legatura(3,n,cameraCapcana1,cameraNW).
legatura(3,e,cameraCapcana2,cameraNW).

legatura(3,s,bucatarie,cameraEN).
legatura(3,e,bucatarie,biblioteca).
legatura(3,w,bucatarie,cameraNW).

legatura(3,s,cameraEN,cameraWW).
legatura(3,e,cameraEN,cameraES).
legatura(3,n,cameraEN,bucatarie).

legatura(3,s,cameraWW,cameraW).
legatura(3,w,cameraWW,cameraWS).
legatura(3,n,cameraWW,cameraEN).

legatura(3,n,cameraW,cameraWW).
legatura(3,e,cameraWS,cameraWW).

selectareHarta():-
        random(3,4,X),
        retract(numarPlanCasa(_)),
        assert(numarPlanCasa(X)),!.