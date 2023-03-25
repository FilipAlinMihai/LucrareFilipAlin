scrieObiecte([],'').
scrieObiecte([L|T],Y):-
    atom_concat('--------------------------\n',L,T1),
    atom_concat(T1,'\n',T2),
    scrieObiecte(T,T3),
    atom_concat(T2,T3,Y).

inventar_curent(Obiecte):-bagof(Y,locatieObiect(Y,jucator),Obiecte),!.
inventar_curent([]).

inventar(R1):-
    inventar_curent(Obiecte),
    scrieObiecte(Obiecte,RO),
    atom_concat('',RO,R1).

inventar(X):-atom_concat('','------------------------\n',X).

% Prin aceasta metoda jucatorul are posibilitatea de a pastra obiecte in
% rucsacul personal pentru a le folosi mai tarziu
pastreaza(cheie,R1):-
    locatieObiect(seif,jucator),
    raspunsGhicitoare(cheie),
    retract(locatieObiect(cheie,seif)),
    assert(locatieObiect(cheie,jucator)),
    atom_concat('Cheia e la tine!','\n',R1),!.

pastreaza(cheie,R1):-
    locatieObiect(seif,jucator),
    atom_concat('Mai intai raspunde la ghicitoare!','\n',R1),!.

pastreaza(Y,X):-
    locatieObiect(Y,jucator),
    atom_concat('Il avem deja !\n','',X),!.

pastreaza(Y,R1):-
    locatieObiect(Y,X),
    locatieJucator(X),
    inventar_curent(Obiecte),
    length(Obiecte,NumarInventar),
    NumarInventar < 6,
    retract(locatieObiect(Y, X)),
    assert(locatieObiect(Y, jucator)),
    atom_concat('Obiectul a fost plasat in inventar!','\n',R1),!.

pastreaza(Y,R1):-
    locatieObiect(Y,X),
    locatieJucator(X),
    inventar_curent(Obiecte),
    length(Obiecte,NumarInventar),
    NumarInventar > 5,
    atom_concat('Inventarul este plin!','\n',R1),!.


pastreaza(Y,X):-
    locatieObiect(Y,_),
    atom_concat('Actiune imposibila. Nu vad obiectul : ',Y,X),!.

renunta(Y,R):-
    locatieObiect(Y,jucator),
    locatieJucator(X),
    retract(locatieObiect(Y,_)),
    assert(locatieObiect(Y,X)),
    atom_concat('Obiectul a fost aruncat!','\n',R),!.

renunta(_,R):-
    atom_concat('Acest obiect nu este in inventar!','\n',R),!.
