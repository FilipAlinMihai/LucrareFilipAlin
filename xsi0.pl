:-module(xsi0,[mutare/2,aratax/1,startx/0,stopx/0,mutare0/1,nivelCurent/1,camerePericol/1]).


:- include('minimax.pl').

:- dynamic stare/1,status/1,nivelCurent/1,camerePericol/1.

camerePericol([]).

nivelCurent(null).

stare([1,1,1,1,1,1,1,1,1]).

status(oprit).

startx():-
    stare(X),
    retract(stare(X)),
    assert(stare([1,1,1,1,1,1,1,1,1])),
    status(H),
    retract(status(H)),
    assert(status(pornit)).

stopx():-
    status(H),
    retract(status(H)),
    assert(status(oprit)).

mutare(_,X):-status(oprit),
    atom_concat('','Jocul nu a început.',X),!.

mutare(_,X):-castigatorX(),atom_concat('','Joc finalizat: X a câștigat deja.',X).
mutare(_,X):-castigator0(),atom_concat('','Joc finalizat: 0 a câștigat deja.',X).

mutare(P,R):-
    stare(X),
    elementN(X,P,1,Rez),
    Rez =\= 1,
    atom_concat('','Poziție Ocupată!!',R),!.

mutare(P,T3):-
    stare(X),
    numaraLibere(X,Z),
    Z =:= 1,
    adauga(P,2,X,R),
    retract(stare(X)),
    assert(stare(R)),
    castigatorX(),
    aratax(T1),
    atom_concat(T1,'Ai câștigat. Evită direcțiile vest și sud.\n',T2),
    atom_concat(T2,'La nord este camera pe care trebuie să o cercetezi.\n',T3),!.

mutare(P,T3):-
    stare(X),
    numaraLibere(X,Z),
    Z =:= 0,
    adauga(P,2,X,R),
    retract(stare(X)),
    assert(stare(R)),
    aratax(T1),
    camerePericol([Directie|_]),
    scrieRecompensaEgalitate(Directie,T31),
    atom_concat(T1,T31,T3),!.


mutare(P,T3):-
    stare(X),
    numaraLibere(X,Z),
    Z =\= 0,
    adauga(P,2,X,R),
    retract(stare(X)),
    assert(stare(R)),
    castigatorX(),
    nivelCurent(Nivel),
    mutare0(Nivel),
    aratax(T1),
    camerePericol([Directie1,Directie2]),
    scrieRecompensaVictorie(Directie1,Directie2,T31),
    atom_concat(T1,T31,T3),!.



mutare(P,T2):-
    stare(X),
    numaraLibere(X,Z),
    Z =\= 0,
    adauga(P,2,X,R),
    retract(stare(X)),
    assert(stare(R)),
    nivelCurent(Nivel),
    mutare0(Nivel),
    aratax(T1),
    castigator0(),
    atom_concat(T1,'Jocul a fost câștigat de calculator!\n',T2),!;
    aratax(T1),
    atom_concat(T1,'Joc în desfășurare!\n',T2),!.

scrieRecompensaEgalitate(Directie,T31):-
    Directie = w ->
    atom_concat('','Egalitate.La vest se afla o camera periculoasa.\nEvita aceasta directie!!\n',T31),!;
    Directie = s ->
    atom_concat('','Egalitate.La sud se afla o camera periculoasa.\nEvita aceasta directie!!\n',T31),!;
    Directie = n ->
    atom_concat('','Egalitate.La nord se afla o camera periculoasa.\nEvita aceasta directie!!\n',T31),!.

scrieRecompensaVictorie(Directie1,Directie2,T31):-
    Directie1 = w, Directie2 = n ->
    atom_concat('Ai câștigat. Evită direcțiile vest și nord.\n',
    'La sud este camera pe care trebuie să o cercetezi.\n',T31),!;
    Directie1 = s, Directie2 = w ->
    atom_concat('Ai câștigat. Evită direcțiile vest și sud.\n',
    'La nord este camera pe care trebuie să o cercetezi.\n',T31),!;
    Directie1 = n, Directie2 = s ->
    atom_concat('Ai câștigat. Evită direcțiile sud și nord.\n',
    'La vest este camera pe care trebuie să o cercetezi.\n',T31),!.

verificare():-castigatorX(),!.
verificare():-castigator0(),!.

primele(_,I,O):- I=<0, O=[].
primele(_,[],[]).
primele([X|T],I,[X|O]):-
    I>0,
    I1 is I-1,
    primele(T,I1,O).


taie(X,I,R):-
    primele(X,I,O),
    append(O, R, X).

adauga(P,E,X,R):-
    P1 is P-1,
    primele(X,P1,O),
    taie(X,P,L),
    append(O,[E],R1),
    append(R1,L,R).


elementN([X|_],I,L,X):-L=:=I,!.
elementN([_|T],I,L,R):-
    L1 is L+1,
    elementN(T,I,L1,R).


pozitiiX([],_,[]).
pozitiiX([X|T],I,[I|O]):-
    X =:= 2,
    I1 is I+1,
    pozitiiX(T,I1,O).
pozitiiX([_|T],I,O):-
    I1 is I+1,
    pozitiiX(T,I1,O),!.


pozitii0([],_,[]).
pozitii0([X|T],I,[I|O]):-
    X =:= 0,
    I1 is I+1,
    pozitii0(T,I1,O),!.
pozitii0([_|T],I,O):-
    I1 is I+1,
    pozitii0(T,I1,O),!.

castigatorX():-
    stare(X),
    pozitiiX(X,1,R)
    ,victorii(V)
    ,compara(V,R),nl,!.

castigator0():-
    stare(X),
    pozitii0(X,1,R)
    ,victorii(V)
    ,compara(V,R),nl,!.


apartine([G|_],G).
apartine([_|T],G):-apartine(T,G).


aratax(R):-
    stare(X),
    afisare(X,Y),
    atom_concat('=======\n', Y,R).

afisare([],R):-atom_concat('','',R).
afisare([X,Y,Z|T],R):-
    scrie(X,R1),
    scrie(Y,R2),
    scrie(Z,R3),
    atom_concat('| ',R1,T1),
    atom_concat(T1,' | ',T2),
    atom_concat(T2,R2,T3),
    atom_concat(T3,' | ',T4),
    atom_concat(T4,R3,T5),
    atom_concat(T5,' |\n',T6),
    atom_concat(T6,'=======\n',T7),
    afisare(T,T8),
    atom_concat(T7,T8,R).

scrie(0,X):-atom_concat('','0',X),!.
scrie(1,X):-atom_concat('','  ',X),!.
scrie(2,X):-atom_concat('','X',X),!.

mutare0(usor):-
    stare(X),
    adauga0(X,R),
    retract(stare(X)),
    assert(stare(R)),!.

mutare0(_):-
    stare(X),
    minimax(-100,200,[0,desfasurare,X],[_,_,R],_),
    retract(stare(X)),
    assert(stare(R)),!.

pozitiiLibere([],10,[]).
pozitiiLibere([1|T],R,[R|Y]):-pozitiiLibere(T,R1,Y),R is R1-1,!.
pozitiiLibere([_|T],R,Y):-pozitiiLibere(T,R1,Y),R is R1-1,!.

alegePozitieAleatoare(X,RR):-
         length(X,R),
         random(0,R,S),
         nth0(S,X,RR).

modificaPozitieSpecificata(_,[],_,[]).
modificaPozitieSpecificata(P,[_|T],I,[0|R]):-
        P =:= I,
        I1 is I + 1,
        modificaPozitieSpecificata(P,T,I1,R),!.
modificaPozitieSpecificata(P,[X|T],I,[X|R]):-
        I1 is I + 1,
        modificaPozitieSpecificata(P,T,I1,R),!.

adauga0(X,R):-
        pozitiiLibere(X,_,PozitiiLibere),
        alegePozitieAleatoare(PozitiiLibere,P),
        modificaPozitieSpecificata(P,X,1,R),!.


mmix():- minimax(-100,200,[0,desfasurare,[2,1,1,1,1,1,1,1,1]],C,_),
        write(C),nl.


numaraLibere([],0).
numaraLibere([1|T],R):-numaraLibere(T,R1),R is R1+1,!.
numaraLibere([_|T],R):-numaraLibere(T,R),!.

numaraLiberex():-
    stare(X),
    numaraLibere(X,R),
    write('Sunt libere x pozitii'),
    write(R).

