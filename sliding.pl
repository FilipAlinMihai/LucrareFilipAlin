:- module(sliding, [start/1,arata/1,stop/0,r/1,l/1,u/1,d/1,ajutor/1]).

:- include('astar.pl').

:- use_module(aleatoare).
:- use_module(castigare).
:- dynamic lista/1,status/1.

status(oprit).

lista([]).

dificultateRidicata(dificil).
dificultateRidicata(imposibil).

start(Dif):-
    generarenumarMutari(Dif,Mutari),
    generareStareNoua(Mutari,R),
    lista(X),
    retract(lista(X)),
    assert(lista(R)),
    status(H),
    retract(status(H)),
    assert(status(pornit)).

generarenumarMutari(X,R):-
      X = usor ->
      R is 17,!;
      X = mediu ->
      R is 18,!;
      X = dificil->
      R is 19,!;
      X = imposibil ->
      R is 21,!.

stop():-
    status(H),
    retract(status(H)),
    assert(status(oprit)).

ajutor(R):-
      lista(L),
      startAstar(L,[X,Y,Z,O|_]),
      scrieDirectie(X,S1),
      scrieDirectie(Y,S2),
      scrieDirectie(Z,S3),
      scrieDirectie(O,S4),
      atom_concat('Realizeaza mutarile: ',S1,T1),
      atom_concat(T1,S2,T2),
      atom_concat(T2,S3,T3),
      atom_concat(T3,S4,R),!.

ajutor(R):-
      lista(L),
      startAstar(L,[X,Y,Z|_]),
      scrieDirectie(X,S1),
      scrieDirectie(Y,S2),
      scrieDirectie(Z,S3),
      atom_concat('Realizeaza mutarile: ',S1,T1),
      atom_concat(T1,S2,T2),
      atom_concat(T2,S3,R),!.

ajutor(R):-
      lista(L),
      startAstar(L,[X,Y|_]),
      scrieDirectie(X,S1),
      scrieDirectie(Y,S2),
      atom_concat('Realizeaza mutarile: ',S1,T1),
      atom_concat(T1,S2,R),!.

ajutor(R):-
      lista(L),
      startAstar(L,[X|_]),
      scrieDirectie(X,S1),
      atom_concat('Realizeaza mutarile: ',S1,R),!.


scrieDirectie(X,R):-
      X = n ->
      atom_concat('','U  ',R);
      X = s ->
      atom_concat('','D  ',R);
      X = e ->
      atom_concat('','R  ',R);
      X = w ->
      atom_concat('','L  ',R).


victorie([0,1,2,3,4,5,6,7,8]).

pozitiiE1([1,2,4,5,7,8]).
pozitiiW1([2,3,5,6,8,9]).
pozitiiN1([4,5,6,7,8,9]).
pozitiiS1([1,2,3,4,5,6]).

afisare([],R):-atom_concat('','',R).

afisare([X,Y,Z|T],R):-
    atom_concat('| ',X,T1),
    atom_concat(T1,' | ',T2),
    atom_concat(T2,Y,T3),
    atom_concat(T3,' | ',T4),
    atom_concat(T4,Z,T5),
    atom_concat(T5,' |\n',T6),
    atom_concat(T6,'=======\n',T7),
    afisare(T,T8),
    atom_concat(T7,T8,R).

arata(R):-
    lista(X),
    afisare(X,Y),
    atom_concat('Pentru rezolvarea problemei vei primii 5 puncte de energi.\n=======\n', Y,R),!.

r(T1):-status(oprit),
   atom_concat('','Jocul nu a inceput',T1),!.
r(T1):-lista(X),
   pozitie(X,R),
   pozitiiE1(Z),
   apartine(Z,R),
   muta(e,T1),!.

l(T1):-status(oprit),
   atom_concat('','Jocul nu a inceput',T1),!.
l(T1):-lista(X),
   pozitie(X,R),
   pozitiiW1(Z),
   apartine(Z,R),
   muta(w,T1),!.

d(T1):-status(oprit),
   atom_concat('','Jocul nu a inceput',T1),!.
d(T1):-lista(X),
   pozitie(X,R),
   pozitiiS1(Z),
   apartine(Z,R),
   muta(s,T1),!.

u(T1):-status(oprit),
   atom_concat('','Jocul nu a inceput',T1),!.
u(T1):-lista(X),
   pozitie(X,R),
   pozitiiN1(Z),
   apartine(Z,R),
   muta(n,T1),!.


verifica():-
    lista(X),
    victorie(X),
    write('Ai castigat'),
    adaugaEnergie(5,_),
    stop(),nl,!.
verifica():-write('').

muta(M,T1):-
    lista(X),
    mutare(M,X,R),
    retract(lista(X)),
    assert(lista(R)),
    arata(T1),
    verifica(),!.

%mutare(e,[],[]).
%mutare(e,[0|[Y|T]],[Y|[0|R]]):-mutare(e,T,R).
%mutare(e,[X|T],[X|R]):-mutare(e,T,R).


%mutare(w,[],[]).
%mutare(w,[Y|[0|T]],[0|[Y|R]]):-mutare(w,T,R).
%mutare(w,[X|T],[X|R]):-mutare(w,T,R).

%mutare(s,[],[]).
%mutare(s,[0|[Y,Z,V|T]],[V,Y,Z|[0|R]]):-mutare(s,T,R).
%mutare(s,[X|T],[X|R]):-mutare(s,T,R).

%mutare(n,[],[]).
%mutare(n,[Y,Z,V|[0|T]],[0|[Z,V,Y|R]]):-mutare(n,T,R).
%mutare(n,[X|T],[X|R]):-mutare(n,T,R).

%apartine([G|_],G).
%apartine([_|T],G):-apartine(T,G).

pozitie([0|_],1).
pozitie([_|T],R):-
    pozitie(T,R1),
    R is R1+1.











