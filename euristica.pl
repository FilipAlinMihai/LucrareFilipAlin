distanta(0,1,1).
distanta(0,2,2).
distanta(0,3,1).
distanta(0,4,2).
distanta(0,5,3).
distanta(0,6,2).
distanta(0,7,3).
distanta(0,8,4).
distanta(1,2,2).
distanta(1,3,4).
distanta(1,4,2).
distanta(1,5,4).
distanta(1,6,6).
distanta(1,7,4).
distanta(1,8,6).
distanta(2,3,6).
distanta(2,4,4).
distanta(2,5,2).
distanta(2,6,8).
distanta(2,7,6).
distanta(2,8,4).
distanta(3,4,2).
distanta(3,5,4).
distanta(3,6,2).
distanta(3,7,4).
distanta(3,8,6).
distanta(4,5,2).
distanta(4,6,4).
distanta(4,7,2).
distanta(4,8,4).
distanta(5,6,6).
distanta(5,7,4).
distanta(5,8,2).
distanta(6,7,2).
distanta(6,8,4).
distanta(7,8,2).
distanta(0,0,0).
distanta(2,2,0).
distanta(1,1,0).
distanta(3,3,0).
distanta(4,4,0).
distanta(5,5,0).
distanta(6,6,0).
distanta(7,7,0).
distanta(8,8,0).


coloana(1,2).
coloana(2,3).
coloana(3,1).
coloana(4,2).
coloana(5,3).
coloana(6,1).
coloana(7,2).
coloana(8,3).

completare2([A,B,C,D,E,F,G,H,I],R):-
        verificare2(A,D,1,X1),
        verificare2(D,G,1,X2),
        verificare2(A,G,1,X7),
        verificare2(B,E,2,X3),
        verificare2(E,H,2,X4),
        verificare2(B,H,2,X8),
        verificare2(C,F,3,X5),
        verificare2(F,I,3,X6),
        verificare2(C,I,3,X9),
        R is X1+X2+X3+X4+X5+X6+X7+X8+X9.

verificare2(_,0,_,0).
verificare2(0,_,_,0).
verificare2(A,B,L,4):-
                A > B,
                coloana(A,L),
                coloana(B,L),!.
verificare2(_,_,_,0).


linie(1,1).
linie(2,1).
linie(3,2).
linie(4,2).
linie(5,2).
linie(6,3).
linie(7,3).
linie(8,3).

completare([A,B,C,D,E,F,G,H,I],R):-
        verificare(A,B,1,X1),
        verificare(B,C,1,X2),
        verificare(A,C,1,X7),
        verificare(D,E,2,X3),
        verificare(D,F,2,X8),
        verificare(E,F,2,X4),
        verificare(G,H,3,X5),
        verificare(H,I,3,X6),
        verificare(G,I,3,X9),
        R is X1+X2+X3+X4+X5+X6+X7+X8+X9.

verificare(_,0,_,0):-!.
verificare(0,_,_,0):-!.
verificare(A,B,L,4):-
                A > B,
                linie(A,L),
                linie(B,L),!.
verificare(_,_,_,0).

pozitieInStare(X,[X|_],0).
pozitieInStare(X,[_|T],R):- pozitieInStare(X,T,R1), R is R1 + 1,!.

euristica(S,R):-
        euristica1(S,S,R1),
        completare(S,X1),
        completare2(S,X2),
        R is R1 + X1+X2,!.

euristica1(_,[],0).
euristica1(S,[0|T],R1):-
        euristica1(S,T,R1),!.
euristica1(S,[L|T],R):-
        euristica1(S,T,R1),
        pozitieInStare(L,S,H),
        ordonare(L,H,J,K),
        distanta(J,K,X),
        R is R1 + X,!.

ordonare(X,Y,X,Y):- X < Y,!.
ordonare(X,Y,Y,X).