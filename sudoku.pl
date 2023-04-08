%:- module(sudoku,[startS/2,stopS/0,sudoku/3,afisare/1]).

:- include('varianteSudoku.pl').

:- dynamic stareCurenta/1,statusSudoku/1,vieti/1.

stareCurenta([]).

statusSudoku(oprit).

vieti(4).

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

startS(S,Z):-
        alegeVarianta(X),
        retract(stareCurenta(_)),
        assert(stareCurenta(X)),
        retract(statusSudoku(_)),
        assert(statusSudoku(pornit)),
        creareJoc(S,Z),
        retract(vieti(_)),
        assert(vieti(4)).
stopS():-
        retract(statusSudoku(_)),
        assert(statusSudoku(oprit)).

afisareSudoku(T10):-
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
        timpRamas(sudoku,TimpRamas),
        format(atom(Rotunjire), '~2f', [TimpRamas]),
        atom_concat('Au mai ramas ',Rotunjire,T01),
        atom_concat(T01,' secunde!\n',T02),
        atom_concat(T02,'=========||========||=========\n',T1),
        atom_concat(T1,A1,T2),
        atom_concat(T2,B1,T3),
        atom_concat(T3,C1,T4),
        atom_concat(T4,D1,T5),
        atom_concat(T5,E1,T6),
        atom_concat(T6,F1,T7),
        atom_concat(T7,G1,T8),
        atom_concat(T8,H1,T9),
        atom_concat(T9,I1,T10),!.

scrieLinie([A,B,C,D,E,F,G,H,I],P,T21):-
            apartineS(P,[6,3]),
            scrieS(A,A1),
            scrieS(B,B1),
            scrieS(C,C1),
            scrieS(D,D1),
            scrieS(E,E1),
            scrieS(F,F1),
            scrieS(G,G1),
            scrieS(H,H1),
            scrieS(I,I1),
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
            scrieS(A,A1),
            scrieS(B,B1),
            scrieS(C,C1),
            scrieS(D,D1),
            scrieS(E,E1),
            scrieS(F,F1),
            scrieS(G,G1),
            scrieS(H,H1),
            scrieS(I,I1),
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
        statusSudoku(pornit),
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
        egaleS(T1,L),
        substituireInLinie(T2,I,L,RL),
        substituire(T1,T2,I,T,R),!.
substituire(T1,T2,I,[X|T],[X|R]):-
        substituire(T1,T2,I,T,R),!.

substituireInLinie(_,_,[],[]).
substituireInLinie(T2,I,[X|T],[I|T]):-
        T2 =:= X,!.
substituireInLinie(T2,I,[X|T],[X|R]):-
        substituireInLinie(T2,I,T,R),!.

egaleS(X,X).

distrugereStare(Z,Z):-!.
distrugereStare(X,Z):-
        eliminarePozitie(X),
        I is X +1,
        distrugereStare(I,Z),!.
distrugereStare(X,Z):-
        distrugereStare(X,Z),!.

creareJoc(X,Z):-
        distrugereStare(10,Z),
        afisareSudoku(X).

scrieS(X,T2):-
        X < 10 ->
        atom_concat(' ',X,T1),
        atom_concat(T1,' ',T2),!;
        atom_concat(X,'',T2),!.

sudoku(_,_,X):- vieti(V), V<1,atom_concat('Ai comis prea multe greșeli','',X),!.
sudoku(_,_,X):-statusSudoku(oprit),atom_concat('Jocul nu a început!\nSau timplu a expirat!\nAi o singură încercare!\n','',X),!.
sudoku(A,_,X):-
        statusSudoku(pornit),
        A < 10,
        atom_concat('Acaeasta poziție nu poate fi modificată!','',X),!.
sudoku(_,B,X):-
        statusSudoku(pornit),
        B > 9,
        atom_concat('Valoarea introdusă nu este corectă','',X),!.

sudoku(X,Y,Scriere3):-
        stareCurenta(S),
        modifica(X,Y,S,R),
        verifica(0,R,R),nl,
        %write(R),
        retract(stareCurenta(_)),
        assert(stareCurenta(R)),
        afisareSudoku(Scriere),
        numaraSpatiiGoale(R,Rez),
        decizie(Rez,Scriere2),
        atom_concat(Scriere,Scriere2,Scriere3),!.

sudoku(_,_,X):-
        atom_concat('Ai încălcat regulile!\n','',X),
        vieti(V),
        V1 is V - 1,
        retract(vieti(_)),
        assert(vieti(V1)),!.

decizie(X,S):-
        X = 0 ->
        atom_concat('Joc finalizat!!','',S),
        adaugaEnergie(5,_),!;
        X > 0 ->
        atom_concat('Continuă!!','',S),!.

modifica(_,_,[],[]).
modifica(X,Y,[L|T],[L1|R]):-
        modifica(X,Y,T,R),
        modificaLinie(X,Y,L,L1),!.

modificaLinie(_,_,[],[]).
modificaLinie(X,Y,[X|T],[Y|T]).
modificaLinie(X,Y,[L|T],[L|R]):-
        modificaLinie(X,Y,T,R),!.

verifica(9,_,_).
verifica(I,[L|T],Stare):-
        creareLinieColoana(I,Stare,LL),
        creareLiniePatrat(I,Stare,LLL),
        verificaLinie(L),
        verificaLinie(LL),
        verificaLinie(LLL),
        I1 is I + 1,
        verifica(I1,T,Stare),!.



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

apartineS(G,[G|_]).
apartineS(G,[_|T]):-apartineS(G,T).