:- module(aleatoare,[generareStareNoua/2]).

:- dynamic  stareAnteriara/1.

stareAnteriara(t).

apartine([G|_],G).
apartine([_|T],G):-apartine(T,G).

pozitieInStare(X,[X|_],0).
pozitieInStare(X,[_|T],R):- pozitieInStare(X,T,R1), R is R1 + 1,!.


mutare(e,[],[]).
mutare(e,[0|[Y|T]],[Y|[0|R]]):-mutare(e,T,R),!.
mutare(e,[X|T],[X|R]):-mutare(e,T,R),!.

mutare(w,[],[]).
mutare(w,[Y|[0|T]],[0|[Y|R]]):-mutare(w,T,R),!.
mutare(w,[X|T],[X|R]):-mutare(w,T,R),!.

mutare(s,[],[]).
mutare(s,[0|[Y,Z,V|T]],[V,Y,Z|[0|R]]):-mutare(s,T,R),!.
mutare(s,[X|T],[X|R]):-mutare(s,T,R),!.

mutare(n,[],[]).
mutare(n,[Y,Z,V|[0|T]],[0|[Z,V,Y|R]]):-mutare(n,T,R),!.
mutare(n,[X|T],[X|R]):-mutare(n,T,R),!.

muatriPermise(1,[e,s ]).
muatriPermise(2,[e,w,s ]).
muatriPermise(3,[w,s ]).
muatriPermise(4,[e,n,s ]).
muatriPermise(5,[e,w,n,s ]).
muatriPermise(6,[w,n,s ]).
muatriPermise(7,[e,n]).
muatriPermise(8,[e,w,n ]).
muatriPermise(9,[w,n ]).

generareDirectie(P,R):-
        P = 0 ->
        random(0,2,Y),
        muatriPermise(1,T),
        nth0(Y,T,R),!;
        P = 1 ->
        random(0,3,Y),
        muatriPermise(2,T),
        nth0(Y,T,R),!;
        P = 2 ->
        random(0,2,Y),
        muatriPermise(3,T),
        nth0(Y,T,R),!;
        P = 3 ->
        random(0,3,Y),
        muatriPermise(4,T),
        nth0(Y,T,R),!;
        P = 4 ->
        random(0,4,Y),
        muatriPermise(5,T),
        nth0(Y,T,R),!;
        P = 5 ->
        random(0,3,Y),
        muatriPermise(6,T),
        nth0(Y,T,R),!;
        P = 6 ->
        random(0,2,Y),
        muatriPermise(7,T),
        nth0(Y,T,R),!;
        P = 7 ->
        random(0,3,Y),
        muatriPermise(8,T),
        nth0(Y,T,R),!;
        P = 8 ->
        random(0,2,Y),
        muatriPermise(9,T),
        nth0(Y,T,R),!.

opuse(e,w).
opuse(w,e).
opuse(s,n).
opuse(n,s).

generareDirectie2(P,R):-
        repeat,
        generareDirectie(P,R),
        stareAnteriara(E),
        \+ opuse(R,E),!.


generareStareNoua(I,[0,1,2,3,4,5,6,7,8]):-I < 1,!.
generareStareNoua(I,Stare2):-
        I1 is I-1,
        generareStareNoua(I1,Stare),
        pozitieInStare(0,Stare,P),
        generareDirectie2(P,R),
        retract(stareAnteriara(_)),
        assert(stareAnteriara(R)),
        efectuareMutare(R,Stare,Stare2),!.
        
efectuareMutare(M,Stare,Stare2):-
        mutare(M,Stare,Stare2),!.
        
generare8():-generareStareNoua(8,Stare),write(Stare).