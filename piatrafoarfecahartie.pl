:- module(piatrafoarfecahartie,[startJ/0,stopJ/0,alege/2]).
:- use_module(castigare).
:- dynamic status/1,scor/2,runda/1.

status(oprit).
runda(0).
scor(0,0).

castiga(piatra,foarfeca).
castiga(foarfeca,hartie).
castiga(hartie,piatra).
egalitate(hartie,hartie).
egalitate(foarfeca,foarfeca).
egalitate(piatra,piatra).

startJ():-
        retract(runda(_)),
        assert(runda(0)),
        retract(status(_)),
        assert(status(pornit)),
        retract(scor(_,_)),
        assert(scor(0,0)).

stopJ():-
        retract(status(_)),
        assert(status(oprit)).

alege(X,Z2):-
    status(pornit),
    runda(Runda),
    Runda1 is Runda + 1,
    retract(runda(_)),
    assert(runda(Runda1)),
    alegereSistem(R),
    comparare(X,R,Z,T,L),
    scor(Jucator,Sistem),
    T1 is Jucator + T,
    L1 is Sistem + L,
    retract(scor(_,_)),
    assert(scor(T1,L1)),
    verifica(V),
    atom_concat(Z,V,Z2),!.

alege(_,Z):-
    atom_concat('Jocul nu a inceput\n','',Z),!.


alegereSistem(R):-
        random(1,4,X),
        interpretareAlegereSistem(X,R),!.

interpretareAlegereSistem(1,piatra).
interpretareAlegereSistem(2,hartie).
interpretareAlegereSistem(3,foarfeca).      

comparare(X,Y,Z1,T,L):-
        castiga(X,Y) ->
        atom_concat('Ai castigat runda, sistemul a ales: ',Y,Z),
        atom_concat(Z,'\n',Z1),
        T is 1,
        L is 0,!;
        castiga(Y,X) ->
        atom_concat('Ai pierdut runda, sistemul a ales: ',Y,Z),
        atom_concat(Z,'\n',Z1),
        T is 0,
        L is 1,!;
        egalitate(X,Y)->
        atom_concat('Egalitate, sistemul a ales: ',Y,Z),
        atom_concat(Z,'\n',Z1),
        T is 0,
        L is 0,!.

verifica(X):-
        runda(R),
        scor(A,B),
        R = 3, A =< B ->
        atom_concat('Ai pierdut jocul!\n',A,X1),
        atom_concat(X1,B,X),
        stopJ(),!;
        runda(R),
        scor(A,B),
        R = 3, A > B ->
        atom_concat('Ai castigat jocul!\nAi primit un punct de energie!\n',A,X1),
        atom_concat(X1,' : ',X2),
        atom_concat(X2,B,X),
        adaugaEnergie(1,_),
        stopJ(),!;
        runda(R),
        scor(A,B),
        atom_concat('Joc in desfasurare!\n','Runda ',X1),
        atom_concat(X1,R,X2),
        atom_concat(X2,'\nScor jucator ',X3),
        atom_concat(X3,A,X4),
        atom_concat(X4,'\nScor calculator ',X5),
        atom_concat(X5,B,X),!.

