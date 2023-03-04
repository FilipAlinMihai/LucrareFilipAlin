:- use_module(library(random)).


:- dynamic litera1/1,
    litera2/1,
    litera3/1,
    litera4/1,
    litera5/1.

random_letter(Letter) :-
    random_between(65, 90, ASCII), % generate a random number between 65 and 90
    char_code(Letter, ASCII). % convert the ASCII code to a letter

litera1(a).
litera2(b).
litera3(c).
litera4(d).
litera5(e).

generareLitere():-
    random_letter(A),
    random_letter(B),
    random_letter(C),
    random_letter(D),
    random_letter(E),
    litera1(A1),
    litera2(B1),
    litera3(C1),
    litera4(D1),
    litera5(E1),
    retract(litera1(A1)),
    assert(litera1(A)),
    retract(litera2(B1)),
    assert(litera2(B)),
    retract(litera3(C1)),
    assert(litera3(C)),
    retract(litera4(D1)),
    assert(litera4(D)),
    retract(litera5(E1)),
    assert(litera5(E)).

generareCuvant(X):-
    generareLitere(),
    litera1(A),
    litera2(B),
    litera3(C),
    litera4(D),
    litera5(E),
    create_word([A,B,C,D,E],X).

create_word(Letters, Word) :-
    atomic_list_concat(Letters, Word).
