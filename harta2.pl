:- dynamic camereParcurse/1.

camereParcurse([hol]).

locLiber(1,1).
locLiber(1,3).
locLiber(1,5).
locLiber(3,1).
locLiber(3,3).
locLiber(3,4).
locLiber(3,5).
locLiber(5,1).
locLiber(5,4).
locLiber(5,5).

camere(1,2,cameraWS).
camere(1,4,cameraES).
camere(2,1,cameraWW).
camere(2,2,cameraW).
camere(2,3,hol).
camere(2,4,cameraE).
camere(2,5,cameraEE).
camere(3,2,cameraCapcana1).
camere(4,1,cameraCapcana2).
camere(4,2,cameraNW).
camere(4,3,biblioteca).
camere(4,4,bucatarie).
camere(4,5,cameraNE).
camere(5,2,debara).
camere(5,3,birou).

scrieLiber(R):-        R = '=============',!.
scrie(cameraWS,R):-    R = '===CAMERAY==',!.
scrie(cameraES,R):-    R = '===CAMERAX==',!.
scrie(cameraWW,R):-    R = '====MARIA===',!.
scrie(cameraW,R):-     R = '====DIANA===',!.
scrie(hol,R):-         R = '====HOLL====',!.
scrie(cameraE,R):-     R = '====MIHAI===',!.
scrie(cameraEE,R):-    R = '===ANDREI===',!.
scrie(cameraCapcana1,R):-R = '===CAPCANE==',!.
scrie(cameraCapcana2,R):-R = '===CAPCANE==',!.
scrie(cameraNW,R):-      R = '==CAMERA-ZI=',!.
scrie(biblioteca,R):-    R = '=BIBLIOTECA=',!.
scrie(bucatarie,R):-     R = '==BUCATARIE=',!.
scrie(cameraNE,R):-      R = '====BOGDAN==',!.
scrie(debara,R):-        R = '===DEBARA===',!.
scrie(birou,R):-         R = '====BIROU===',!.

desenare(X):-parcurgere1([1,2,3,4,5],X),nl,!.

parcurgere1([],'').
parcurgere1([X|T],Rez):-
        parcurgere1(T,R1),
        prelucrare2(X,[1,2,3,4,5],R2),
        atom_concat(R1,R2,Rez),!.

prelucrare2(_,[],'\n').
prelucrare2(X,[Y|T],Rez):-
        afisare(X,Y,R1),
        prelucrare2(X,T,R2),
        atom_concat(R1,R2,Rez),!.


afisare(X,Y,R):-locLiber(X,Y),scrieLiber(R),!.

afisare(X,Y,R):-
        camere(X,Y,Camera),
        camereParcurse(CP),
        apartine(Camera,CP),
        scrie(Camera,R),!.
afisare(_,_,R):-
        scrieLiber(R),!.

apartine(G,[G|_]).
apartine(G,[_|T]):-apartine(G,T).

amParcurs(X):-
        camereParcurse(L),
        retract(camereParcurse(_)),
        assert(camereParcurse([X|L])),!.

golire():-
        retract(camereParcurse(_)),
        assert(camereParcurse([hol])),!.
