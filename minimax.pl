
mutari([0, desfasurare, StareCurenta], [0, victorie, StareUrmatoare]) :-
    stariUrmatoare(0, StareCurenta, StareUrmatoare),
    stareVictorie(0, StareUrmatoare), !.

mutari([0, desfasurare, StareCurenta], [0, egalitate, StareUrmatoare]) :-
    stariUrmatoare(0, StareCurenta, StareUrmatoare),
    stareEgalitate(0,StareUrmatoare), !.

mutari([0, desfasurare, StareCurenta], [2, desfasurare, StareUrmatoare]) :-
    stariUrmatoare(0, StareCurenta, StareUrmatoare).

mutari([2, desfasurare, StareCurenta], [2, victorie, StareUrmatoare]) :-
    stariUrmatoare(2, StareCurenta, StareUrmatoare),
    stareVictorie(2, StareUrmatoare), !.

mutari([2, desfasurare, StareCurenta], [2, egalitate, StareUrmatoare]) :-
    stariUrmatoare(2, StareCurenta, StareUrmatoare),
    stareEgalitate(2,StareUrmatoare), !.

mutari([2, desfasurare, StareCurenta], [0, desfasurare, StareUrmatoare]) :-
    stariUrmatoare(2, StareCurenta, StareUrmatoare).

stareVictorie(P, X) :-
    P == 2,
    pozitii1(X,1,R)
    ,victorii(V)
    ,compara(V,R),!
    ;
    P == 0,
    pozitii2(X,1,R1)
    ,victorii(V1)
    ,compara(V1,R1),!.


stareEgalitate(_,X) :-
    numarare(X,R),R is 0.

pozitii1([],_,[]).
pozitii1([X|T],I,[I|O]):-
    X == 2,
    I1 is I+1,
    pozitii1(T,I1,O),!.
pozitii1([_|T],I,O):-
    I1 is I+1,
    pozitii1(T,I1,O),!.

pozitii2([],_,[]).
pozitii2([X|T],I,[I|O]):-
    X == 0,
    I1 is I+1,
    pozitii2(T,I1,O),!.
pozitii2([_|T],I,O):-
    I1 is I+1,
    pozitii2(T,I1,O),!.

victorii([[1,2,3],[4,5,6],[7,8,9],
        [1,4,7],[2,5,8],[3,6,9],
        [1,5,9],[3,5,7]]).

compara([],_):-false.
compara([X|T],L):-include(L,X);compara(T,L).

include(_,[]):-true.
include(X,[L|T]):-apartine(X,L),include(X,T).

numarare([],0).
numarare([1|T],R):-numarare(T,R1),R is R1+1,!.
numarare([_|T],R):-numarare(T,R),!.


stariUrmatoare(Jucator, [1|T], [Jucator|T]).
stariUrmatoare(Jucator, [X|T], [X|R]) :-
    stariUrmatoare(Jucator, T, R).


minimax(A,B,Pozitie, PozitieCastigatoare, Valoare) :-                  
    bagof(UrmatoareaPozitie, mutari(Pozitie, UrmatoareaPozitie), PozitiiUrmatoare),
    celMaiBun(A,B,PozitiiUrmatoare, PozitieCastigatoare, Valoare), !.

minimax(_,_,Pozitie, _, Valoare) :-                      
    evaluarePozitie(Pozitie, Valoare).


celMaiBun(A,B,[Pozitie], Pozitie, Valoare) :-
    minimax(A,B,Pozitie, _, Valoare), !.

celMaiBun(A,B,[[Pion,Status,Lista] | _], [Pion,Status,Lista], A) :-
    Pion =:= 0,
    A>B,!.

celMaiBun(A,B,[[Pion,Status,Lista] | _], [Pion,Status,Lista], B) :-
    Pion =:= 2,
    A>B,!.


celMaiBun(A,B,[[Pion,Status,Lista] | ListaPozitii], PozitieCastigatoare, ValoareCastigatoare) :-
    minimax(A,B,[Pion,Status,Lista], _, Valoare0),
    determinaModificari(Pion,A,B,Valoare0,ANou,BNou),
    celMaiBun(ANou,BNou,ListaPozitii, Pozitie1, Valoare1),
    maiBuna(Pion,[Pion,Status,Lista], Valoare0, Pozitie1, Valoare1, PozitieCastigatoare, ValoareCastigatoare),!.



determinaModificari(Pion,A,B,Valoare0,ANou,BNou):-
        Pion = 0 , Valoare0 > A ->
        ANou is Valoare0,
        BNou is B,!;
        Pion = 2 , Valoare0 < B ->
        ANou is A,
        BNou is Valoare0,!;
        ANou is A,
        BNou is B,!.

maiBuna(Pion,Pozitie0, Valoare0, _, Valoare1, Pozitie0, Valoare0) :-   
    Pion =:= 2,                        
    Valoare0 < Valoare1, !;
    Pion =:= 0,                        
    Valoare0 > Valoare1, !.                            

maiBuna(_,_, _, Pozitie1, Valoare1, Pozitie1, Valoare1).       


evaluarePozitie([0, victorie, _], 0).       
evaluarePozitie([2, victorie, _], 100).      
evaluarePozitie([_, egalitate, _], 50).
