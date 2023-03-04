
:- module(castigare, [adaugaEnergie/2,energieJucator/1]).

:- dynamic energieJucator/1.

energieJucator(40).

adaugaEnergie(X,Z):-
    energieJucator(Y),
    Z is Y + X,
    retract(energieJucator(Y)),
    assert(energieJucator(Z)).

