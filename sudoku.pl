:- module(sudoku,[startS/1,
                stopS/0,
                sudoku/3
                  ]).

:- use_module(castigare).
:- dynamic stareCurenta/1,status/1.

stareCurenta([]).

status(oprit).

tabele([
    [[9,4,2,1,6,3,8,5,4],
    [5,3,6,2,8,7,9,4,1],
    [8,7,1,9,5,4,2,3,6],
    [3,2,7,8,1,9,4,6,5],
    [1,5,4,3,2,6,7,9,8],
    [6,9,8,7,4,5,1,2,3],
    [2,6,5,4,7,1,3,8,9],
    [7,8,9,6,3,2,5,1,4],
    [4,1,3,5,9,8,6,7,2]],
    [[5,3,4,6,7,8,9,1,2],
    [6,7,2,1,9,5,3,4,8],
    [1,9,8,3,4,2,5,6,7],
    [8,5,9,7,6,1,4,2,3],
    [4,2,6,8,5,3,7,9,1],
    [7,1,3,9,2,4,8,5,6],
    [9,6,1,5,3,7,2,8,4],
    [2,8,7,4,1,9,6,3,5],
    [3,4,5,2,8,6,1,7,9]],
    [[3,8,7,4,5,6,1,2,9],
    [6,1,4,2,9,7,5,3,8],
    [2,5,9,1,8,3,6,7,4],
    [9,6,2,8,4,5,3,1,7],
    [1,3,5,9,7,2,8,4,6],
    [7,4,8,6,3,1,2,9,5],
    [8,2,1,7,6,9,4,5,3],
    [4,9,3,5,1,8,7,6,2],
    [5,7,6,3,2,4,9,8,1]]
]).


numaraSpatiiGoaleLinie([],R):- R = 0.
numaraSpatiiGoaleLinie([A|T],R):-
        A > 9,
        numaraSpatiiGoaleLinie(T,R1),
        R is R1 + 1,!.
numaraSpatiiGoaleLinie([_|T],R1):-
        numaraSpatiiGoaleLinie(T,R1),!.

alegeVarianta(X):-
        tabele(R),
        length(R,Y),
        random(0,Y,S),
        nth0(S,R,X),!.

startS(S):-
        alegeVarianta(X),
        retract(stareCurenta(_)),
        assert(stareCurenta(X)),
        retract(status(_)),
        assert(status(pornit)),
        creareJoc(S).
stopS():-
        retract(status(_)),
        assert(status(pornit)).

afisare(T10):-
        stareCurenta([A,B,C,D,E,F,G,H,I]),
        scrieLinie(A,1,A1),
        scrieLinie(B,2,B1),
        scrieLinie(C,3,C1),
        scrieLinie(D,4,D1),
        scrieLinie(E,5,E1),
        scrieLinie(F,6,F1),
        scrieLinie(G,7,G1),
        scrieLinie(H,8,H1),
        scrieLinie(I,9,I1),
        atom_concat('=========||========||=========\n','',T1),
        atom_concat(T1,A1,T2),
        atom_concat(T2,B1,T3),
        atom_concat(T3,C1,T4),
        atom_concat(T4,D1,T5),
        atom_concat(T5,E1,T6),
        atom_concat(T6,F1,T7),
        atom_concat(T7,G1,T8),
        atom_concat(T8,H1,T9),
        atom_concat(T9,I1,T10),!.

scrieLinie([A,B,C,D,E,F,G,H,I],P,T20):-
            P=9,
            scrie(A,A1),
            scrie(B,B1),
            scrie(C,C1),
            scrie(D,D1),
            scrie(E,E1),
            scrie(F,F1),
            scrie(G,G1),
            scrie(H,H1),
            scrie(I,I1),
            atom_concat('| ',A1,T1),
            atom_concat(T1,' | ',T2),
            atom_concat(T2,B1,T3),
            atom_concat(T3,' | ',T4),
            atom_concat(T4,C1,T5),
            atom_concat(T5,' | ',T6),
            atom_concat(T6,D1,T7),
            atom_concat(T7,' | ',T9),
            atom_concat(T9,E1,T10),
            atom_concat(T10,' | ',T11),
            atom_concat(T11,F1,T12),
            atom_concat(T12,' | ',T13),
            atom_concat(T13,G1,T14),
            atom_concat(T14,' | ',T15),
            atom_concat(T15,H1,T16),
            atom_concat(T16,' | ',T17),
            atom_concat(T17,I1,T18),
            atom_concat(T18,' |\n',T19),
            atom_concat(T19,'=========||========||=========\n',T20),!.

scrieLinie([A,B,C,D,E,F,G,H,I],P,T21):-
            P=3,
            scrie(A,A1),
            scrie(B,B1),
            scrie(C,C1),
            scrie(D,D1),
            scrie(E,E1),
            scrie(F,F1),
            scrie(G,G1),
            scrie(H,H1),
            scrie(I,I1),
            atom_concat('| ',A1,T1),
            atom_concat(T1,' | ',T2),
            atom_concat(T2,B1,T3),
            atom_concat(T3,' | ',T4),
            atom_concat(T4,C1,T5),
            atom_concat(T5,' | ',T6),
            atom_concat(T6,D1,T7),
            atom_concat(T7,' | ',T9),
            atom_concat(T9,E1,T10),
            atom_concat(T10,' | ',T11),
            atom_concat(T11,F1,T12),
            atom_concat(T12,' | ',T13),
            atom_concat(T13,G1,T14),
            atom_concat(T14,' | ',T15),
            atom_concat(T15,H1,T16),
            atom_concat(T16,' | ',T17),
            atom_concat(T17,I1,T18),
            atom_concat(T18,' |\n',T19),
            atom_concat(T19,'=========||========||=========\n',T20),
            atom_concat(T20,'=========||========||=========\n',T21),!.

scrieLinie([A,B,C,D,E,F,G,H,I],P,T21):-
            P=6,
            scrie(A,A1),
            scrie(B,B1),
            scrie(C,C1),
            scrie(D,D1),
            scrie(E,E1),
            scrie(F,F1),
            scrie(G,G1),
            scrie(H,H1),
            scrie(I,I1),
            atom_concat('| ',A1,T1),
            atom_concat(T1,' | ',T2),
            atom_concat(T2,B1,T3),
            atom_concat(T3,' | ',T4),
            atom_concat(T4,C1,T5),
            atom_concat(T5,' | ',T6),
            atom_concat(T6,D1,T7),
            atom_concat(T7,' | ',T9),
            atom_concat(T9,E1,T10),
            atom_concat(T10,' | ',T11),
            atom_concat(T11,F1,T12),
            atom_concat(T12,' | ',T13),
            atom_concat(T13,G1,T14),
            atom_concat(T14,' | ',T15),
            atom_concat(T15,H1,T16),
            atom_concat(T16,' | ',T17),
            atom_concat(T17,I1,T18),
            atom_concat(T18,' |\n',T19),
            atom_concat(T19,'=========||========||=========\n',T20),
            atom_concat(T20,'=========||========||=========\n',T21),!.

scrieLinie([A,B,C,D,E,F,G,H,I],_,T20):-
            scrie(A,A1),
            scrie(B,B1),
            scrie(C,C1),
            scrie(D,D1),
            scrie(E,E1),
            scrie(F,F1),
            scrie(G,G1),
            scrie(H,H1),
            scrie(I,I1),
            atom_concat('| ',A1,T1),
            atom_concat(T1,' | ',T2),
            atom_concat(T2,B1,T3),
            atom_concat(T3,' | ',T4),
            atom_concat(T4,C1,T5),
            atom_concat(T5,' | ',T6),
            atom_concat(T6,D1,T7),
            atom_concat(T7,' | ',T9),
            atom_concat(T9,E1,T10),
            atom_concat(T10,' | ',T11),
            atom_concat(T11,F1,T12),
            atom_concat(T12,' | ',T13),
            atom_concat(T13,G1,T14),
            atom_concat(T14,' | ',T15),
            atom_concat(T15,H1,T16),
            atom_concat(T16,' | ',T17),
            atom_concat(T17,I1,T18),
            atom_concat(T18,' |\n',T19),
            atom_concat(T19,'=========||========||=========\n',T20),!.


eliminarePozitie(I):-
        status(pornit),
        stareCurenta(X),
        random(0,9,A),
        random(0,9,B),
        nth0(A,X,T1),
        nth0(B,T1,T2),
        T2 < 10,
        substituire(T1,T2,I,X,R),
        retract(stareCurenta(_)),
        assert(stareCurenta(R)),!.


substituire(_,_,_,[],[]).
substituire(T1,T2,I,[L|T],[RL|R]):-
        egale(T1,L),
        substituireInLinie(T2,I,L,RL),
        substituire(T1,T2,I,T,R),!.
substituire(T1,T2,I,[X|T],[X|R]):-
        substituire(T1,T2,I,T,R),!.

substituireInLinie(_,_,[],[]).
substituireInLinie(T2,I,[X|T],[I|T]):-
        T2 =:= X,!.
substituireInLinie(T2,I,[X|T],[X|R]):-
        substituireInLinie(T2,I,T,R),!.

egale(X,X).

distrugereStare(60):-!.
distrugereStare(X):-
        eliminarePozitie(X),
        I is X +1,
        distrugereStare(I),!.
distrugereStare(X):-
        I is X +1,
        distrugereStare(I),!.

creareJoc(X):-
        distrugereStare(10),
        afisare(X).

scrie(X,T2):-
        X < 10 ->
        atom_concat(' ',X,T1),
        atom_concat(T1,' ',T2),!;
        atom_concat(X,'',T2),!.

sudoku(_,_,X):-status(oprit),atom_concat('Jocul nu a inceput','',X),!.

sudoku(X,Y,Scriere3):-
        stareCurenta(S),
        modifica(X,Y,S,R),
        verifica(0,R),nl,
        retract(stareCurenta(_)),
        assert(stareCurenta(R)),
        afisare(Scriere),
        numaraSpatiiGoale(R,Rez),
        decizie(Rez,Scriere2),
        atom_concat(Scriere,Scriere2,Scriere3),!.

sudoku(_,_,X):-atom_concat('Ai incalcat regulile!\n','',X),!.

decizie(X,S):-
        X = 0 ->
        atom_concat('Joc finalizat','',S),
        adaugaEnergie(5,_),!;
        X > 0 ->
        atom_concat('Continua','',S),!.

modifica(_,_,[],[]).
modifica(X,Y,[L|T],[L1|R]):-
        modifica(X,Y,T,R),
        modificaLinie(X,Y,L,L1),!.

modificaLinie(_,_,[],[]).
modificaLinie(X,Y,[X|T],[Y|T]).
modificaLinie(X,Y,[L|T],[L|R]):-
        modificaLinie(X,Y,T,R),!.

verifica(9,_).
verifica(I,[L|T]):-
        creareLinieColoana(I,[L|T],LL),
        creareLiniePatrat(I,[L|T],LLL),
        verificaLinie(L),
        verificaLinie(LL),
        verificaLinie(LLL),
        I1 is I + 1,
        verifica(I1,[L|T]),!.



verificaLinie([A,B,C,D,E,F,G,H,I]):-
                A=\=B,A=\=C,A=\=D,
                A=\=E,A=\=F,A=\=G,
                A=\=H,A=\=I,B=\=C,
                B=\=D,B=\=E,B=\=F,
                B=\=G,B=\=H,B=\=I,
                C=\=D,C=\=E,C=\=F,
                C=\=G,C=\=H,C=\=I,
                D=\=E,D=\=F,D=\=G,
                D=\=H,D=\=I,E=\=F,
                E=\=G,E=\=H,E=\=I,
                F=\=G,F=\=H,F=\=I,
                G=\=H,G=\=I,H=\=I,!.

creareLinieColoana(_,[],[]).
creareLinieColoana(I,[L|T],[R|RR]):-
               creareLinieColoana(I,T,RR),
               nth0(I,L,R),!. 

creareLiniePatrat(0,M,R):-
                M = [
                [A,B,C,_,_,_,_,_,_],
                [D,E,F,_,_,_,_,_,_],
                [G,H,I,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_]
                ],
                R = [A,B,C,D,E,F,G,H,I],!.

creareLiniePatrat(1,M,R):-
                M = [
                [_,_,_,A,B,C,_,_,_],
                [_,_,_,D,E,F,_,_,_],
                [_,_,_,G,H,I,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_]
                ],
                R = [A,B,C,D,E,F,G,H,I],!.

creareLiniePatrat(2,M,R):-
                M = [
                [_,_,_,_,_,_,A,B,C],
                [_,_,_,_,_,_,D,E,F],
                [_,_,_,_,_,_,G,H,I],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_]
                ],
                R = [A,B,C,D,E,F,G,H,I],!.

creareLiniePatrat(3,M,R):-
                M = [
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [A,B,C,_,_,_,_,_,_],
                [D,E,F,_,_,_,_,_,_],
                [G,H,I,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_]
                ],
                R = [A,B,C,D,E,F,G,H,I],!.

creareLiniePatrat(4,M,R):-
                M = [
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,A,B,C,_,_,_],
                [_,_,_,D,E,F,_,_,_],
                [_,_,_,G,H,I,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_]
                ],
                R = [A,B,C,D,E,F,G,H,I],!.
creareLiniePatrat(5,M,R):-
                M = [
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,A,B,C],
                [_,_,_,_,_,_,D,E,F],
                [_,_,_,_,_,_,G,H,I],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_]
                ],
                R = [A,B,C,D,E,F,G,H,I],!.

creareLiniePatrat(6,M,R):-
                M = [
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [A,B,C,_,_,_,_,_,_],
                [D,E,F,_,_,_,_,_,_],
                [G,H,I,_,_,_,_,_,_]
                ],
                R = [A,B,C,D,E,F,G,H,I],!.
creareLiniePatrat(7,M,R):-
                M = [
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,A,B,C,_,_,_],
                [_,_,_,D,E,F,_,_,_],
                [_,_,_,G,H,I,_,_,_]
                ],
                R = [A,B,C,D,E,F,G,H,I],!.

creareLiniePatrat(8,M,R):-
                M = [
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,_,A,B,C],
                [_,_,_,_,_,_,D,E,F],
                [_,_,_,_,_,_,G,H,I]
                ],
                R = [A,B,C,D,E,F,G,H,I],!.

verificare():-stareCurenta(R),verifica(0,R).


numaraSpatiiGoale([],R):- R is 0.
numaraSpatiiGoale([L|T],R):-
        numaraSpatiiGoale(T, R1),
        numaraSpatiiGoaleLinie(L,X),
        R is R1 + X.

