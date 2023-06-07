:- use_module(castigare).

:- dynamic stareH/1,statusH/1,mutariRamase/1.

stareH([2,1,1,1,3,1,1,1,1]).

mutariRamase(7).

statusH(oprit).

startH():-
    retract(statusH(_)),
    stareNoua(),
    assert(statusH(pornit)).

stopH():-
    retract(statusH(_)),
    assert(statusH(oprit)).


arataH(R):-
    stareH(X),
    afisareH(X,T1),
    timpRamas(hunter,TimpRamas),
    format(atom(Rotunjire), '~2f', [TimpRamas]),
    atom_concat('Au mai rămas ',Rotunjire,T01),
    atom_concat(T01,' secunde!\n',T001),
    atom_concat(T001,'\n------------\n',T02),
    atom_concat(T02,T1,R),!.

afisareH([],R1):-atom_concat('','',R1).
afisareH([X,Y,Z|T],R8):-
        scrieHunter(X,T1),
        scrieHunter(Y,T2),
        scrieHunter(Z,T3),
        atom_concat('| ',T1,R1),
        atom_concat(R1,' | ',R2),
        atom_concat(R2,T2,R3),
        atom_concat(R3,' | ',R4),
        atom_concat(R4,T3,R5),
        atom_concat(R5,' |\n------------\n',R6),
        afisareH(T,R7),
        atom_concat(R6,R7,R8),!.


scrieHunter(X,R1):-
        X = 1 ->
        atom_concat('p','',R1),!;
        X = 3 ->
        atom_concat('a','',R1),!;
        atom_concat('k','',R1),!.


mutariLegale(1,[6,8]).
mutariLegale(2,[7,9]).
mutariLegale(3,[4,8]).
mutariLegale(4,[3,9]).
mutariLegale(5,[]).
mutariLegale(6,[1,7]).
mutariLegale(7,[2,6]).
mutariLegale(8,[1,3]).
mutariLegale(9,[2,4]).

pozitieCal([2|_],1).
pozitieCal([_|T],R):-
    pozitieCal(T,R1),
    R is R1+1,!.

finalizat():-
    stareH(X),
    \+ member(1,X),!.


mutaCal(_,R1):-
    statusH(oprit),
    atom_concat('Jocul nu a început!\nSau timpul a expirat!\n','',R1),!.


mutaCal(_,R1):-
    finalizat(),
    atom_concat('Ai câștigat jocul. Ai primit 3 puncte de energie\n','',R1),!.


mutaCal(_,R1):-
    mutariRamase(X),
    X<1,
    atom_concat('Ai rămas fără mutări\n','',R1),!.

mutaCal(X,Raspuns):-
    stareH(S),
    pozitieCal(S,R),
    mutariLegale(R,R1),
    apartineHunter(R1,X),
    elementNH(S,X,1,Rez),
    Rez =:= 1,
    transforma1(S,S1),
    transforma2(S1,X,1,S2),
    scadeMutare(),
    retract(stareH(S)),
    assert(stareH(S2)),
    verificareFinal(Raspuns),!.

mutaCal(_,R1):-
    arataH(R2),
    atom_concat('Mutare invalidă!\n',R2,R1),
    scadeMutare(),!.

verificareFinal(Raspuns):-
    \+ finalizat() ->
    arataH(Raspuns),!;
    adaugaEnergie(3,_),
    Raspuns = 'Ai câștigat jocul. Ai primit 3 puncte de energie\n',!.

apartineHunter([G|_],G).
apartineHunter([_|T],G):-apartineHunter(T,G),!.

elementNH([X|_],I,L,X):-L=:=I,!.
elementNH([_|T],I,L,R):-
    L1 is L+1,
    elementNH(T,I,L1,R),!.

scadeMutare():-
    mutariRamase(X),
    X1 is X-1,
    retract(mutariRamase(X)),
    assert(mutariRamase(X1)),!.

transforma1([],[]).
transforma1([L|T],[3|T]):-L =:= 2,!.
transforma1([L|T],[L|R]):-transforma1(T,R),!.

transforma2([],_,_,[]).
transforma2([_|T],X,I,[2|T]):-I =:= X,!.
transforma2([L|T],X,I,[L|R]):-I1 is I+1,transforma2(T,X,I1,R),!.

stareNoua():-
    numarNou(A),
    construire(A,1,R),
    retract(stareH(_)),
    assert(stareH(R)),!.

construire(_,10,[]).
construire(A,5,[3|T]):-
        I1 is 6,
        construire(A,I1,T),!.
construire(A,I,[2|T]):- 
        A =:= I,
        I1 is I +1, 
        construire(A,I1,T),!.
construire(A,I,[1|T]):-
        I1 is I +1,
        construire(A,I1,T),!.


numarNou(A):-
    random(1,10,A),
    repeat,
    A =\= 5,!.