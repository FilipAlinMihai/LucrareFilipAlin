:- dynamic satre/1.

calculare(neaga,neaga,1).
calculare(neaga,recunoaste,6).
calculare(recunoaste,recunoaste,3).
calculare(recunoaste,neaga,0).

decizieSistem(0,neaga).
decizieSistem(1,recunoaste).

stare(oprit).

startD():-
    retract(stare(_)),
    assert(stare(pornit)).

stopD():-
    retract(stare(_)),
    assert(stare(oprit)).

decizie(recunoaste,R1,X):-
    stare(pornit),
    coin(R),
    decizieSistem(R,L),
    calculare(recunoaste,L,X),
    afisareSentinta(X,R1),
    stopD(),!.

decizie(neaga,R1,X):-
    stare(pornit),
    coin(R),
    decizieSistem(R,L),
    calculare(neaga,L,X),
    afisareSentinta(X,R1),
    stopD(),!.

decizie(_,R,_):-atom_concat('','Jocul nu a inceput!\n',R).

coin(R):-random(0,2,R).

afisareSentinta(0,R):-atom_concat('Esti liber\n','',R),!.
afisareSentinta(X,R):-
    atom_concat('Ai fost condamnat la ',X,T1),
    atom_concat(T1 , ' ani de inchisoare\n', R),!.