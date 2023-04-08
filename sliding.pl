%:- module(sliding, [start/1,arata/1,stop/0,r/1,l/1,u/1,d/1,ajutor/1]).

:- include('astar.pl').


:- use_module(aleatoare).
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
      atom_concat('Realizează mutările: ',S1,T1),
      atom_concat(T1,S2,T2),
      atom_concat(T2,S3,T3),
      atom_concat(T3,S4,R),!.

ajutor(R):-
      lista(L),
      startAstar(L,[X,Y,Z|_]),
      scrieDirectie(X,S1),
      scrieDirectie(Y,S2),
      scrieDirectie(Z,S3),
      atom_concat('Realizează mutările: ',S1,T1),
      atom_concat(T1,S2,T2),
      atom_concat(T2,S3,R),!.

ajutor(R):-
      lista(L),
      startAstar(L,[X,Y|_]),
      scrieDirectie(X,S1),
      scrieDirectie(Y,S2),
      atom_concat('Realizează mutările: ',S1,T1),
      atom_concat(T1,S2,R),!.

ajutor(R):-
      lista(L),
      startAstar(L,[X|_]),
      scrieDirectie(X,S1),
      atom_concat('Realizează mutările: ',S1,R),!.


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
   atom_concat('','Jocul nu a început!\nSau timplu a expirat!\nAi o singură încercare!\n',T1),!.
r(T11):-lista(X),
   pozitie(X,R),
   pozitiiE1(Z),
   apartine(Z,R),
   muta(e,T1),
   timpRamas(sliding,TimpRamas),
   format(atom(Rotunjire), '~2f', [TimpRamas]),
   atom_concat('Au mai rămas ',Rotunjire,T01),
   atom_concat(T01,' secunde!\n',T02),
   atom_concat(T02,T1,T11),!.

l(T1):-status(oprit),
   atom_concat('','Jocul nu a început!\nSau timplu a expirat!\nAi o singură încercare!\n',T1),!.
l(T11):-lista(X),
   pozitie(X,R),
   pozitiiW1(Z),
   apartine(Z,R),
   muta(w,T1),
   timpRamas(sliding,TimpRamas),
   format(atom(Rotunjire), '~2f', [TimpRamas]),
   atom_concat('Au mai rămas ',Rotunjire,T01),
   atom_concat(T01,' secunde!\n',T02),
   atom_concat(T02,T1,T11),!.

d(T1):-status(oprit),
   atom_concat('','Jocul nu a început!\nSau timplu a expirat!\nAi o singură încercare!\n',T1),!.
d(T11):-lista(X),
   pozitie(X,R),
   pozitiiS1(Z),
   apartine(Z,R),
   muta(s,T1),
   timpRamas(sliding,TimpRamas),
   format(atom(Rotunjire), '~2f', [TimpRamas]),
   atom_concat('Au mai rămas ',Rotunjire,T01),
   atom_concat(T01,' secunde!\n',T02),
   atom_concat(T02,T1,T11),!.

u(T1):-status(oprit),
   atom_concat('','Jocul nu a început!\nSau timplu a expirat!\nAi o singură încercare!\n',T1),!.
u(T11):-lista(X),
   pozitie(X,R),
   pozitiiN1(Z),
   apartine(Z,R),
   muta(n,T1),
   timpRamas(sliding,TimpRamas),
   format(atom(Rotunjire), '~2f', [TimpRamas]),
   atom_concat('Au mai rămas ',Rotunjire,T01),
   atom_concat(T01,' secunde!\n',T02),
   atom_concat(T02,T1,T11),!.


verifica():-
    lista(X),
    victorie(X),
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

pozitie([0|_],1).
pozitie([_|T],R):-
    pozitie(T,R1),
    R is R1+1.