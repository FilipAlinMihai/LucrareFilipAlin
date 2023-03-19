:- use_module(library(dcg/basics)).
:- use_module(joc1).
:- use_module(library(pce)).
:- use_module(sudoku).

:- dynamic mesajCurent/1,
           mesajAnterior/1,
           ajutor2/1,
           mesajAnteriorAnterior/1,
           mesajAfisat/1.

ajutor2(disponibil).

mesajAfisat(curent).
mesajCurent(****).
mesajAnterior(****).
mesajAnteriorAnterior(****).

:- include('reguli.pl').
:- include('executor.pl').

reguli():-
    new(F, dialog),
    new(W,  window('Jocuri', size(1000, -5))), 
    regiulile(Reg), 
    new(Text, text(Reg)),  
    send(Text, font, font(times, bold, 17)),
    send(Text, colour, orange),
    send(F, display, Text, point(100, 50)),
    send(F, background, black),
    send(F, scrollbars, both),
    send(F, above, W),
    send(F, open),!.

run:-
    restart(_),
    new(D, dialog),
    new(F, dialog),
    new(E, dialog),
    new(G, dialog),
    new(H, dialog),
    new(I, dialog),
    new(F2, dialog),
    send(D, background, black),
    send(F, background, black),
    send(E, background, black),
    send(G, background, black),
    send(H, background, black),
    send(I, background, black),
    send(F2, background, black),
    new(W,  window('Jocuri', size(1100, -5))),                    
    atom_concat('','
                           Evadeaza din captivitate.\n
                           Da dovada de gandire logica.\n
                           Demonstreaza aptitudinile tale de strateg.\n
                           Evadeaza din captivitate.\n
                           Da dovada de gandire logica.\n
                           Demonstreaza aptitudinile tale de strateg.\n
                            ',Textinitial),
    new(Text2, text(Textinitial)),
    seteazaMesajCurent(Textinitial),
    seteazaMesajAnterior(Textinitial),
    send(Text2, font, font(times, bold, 17)),
    send(Text2, colour, orange),
    send(F2, display, Text2, point(200, 50)),   
    send(F, alignment, center),
    send(F, scrollbars, both),
    send(F, size, size(425,250)),
    send(F2, scrollbars, both),
    send(F2, size, size(425,250)),
    send(E, append, new(InputText, text_item(input, 'Comanda')),right),
    send(E, append, new(Argument, text_item(input, 'Argument1')),right),
    send(E, append, new(Argument2, text_item(input, 'Argument2')),right),
    send(InputText, width,20),
    send(Argument, width,20),
    send(Argument2, width,20),
    send(InputText, left, Argument),
    %send(E ,display, text(''),point(200, 10)),
    send(E, append, new(_,button(executor, message(@prolog, taiere, InputText?selection, Argument?selection,Argument2?selection, F2)))),
    send(E, append, new(_,button(inapoi, message(@prolog, inapoi, F2)))),
    send(E, append, new(_,button(inainte, message(@prolog, inainte, F2)))),
    send(E, append, new(_,button(zoom, message(@prolog, zoom)))),
    send(E, append, new(_,button(reguli, message(@prolog, reguli)))),
    send(D, append, new(B1,button(n, message(@prolog, navigare, n, F2)))),
    send(D, append, new(B6,button(s, message(@prolog, navigare, s, F2)))),
    send(D, append, new(B7,button(e, message(@prolog, navigare, e, F2)))),
    send(D, append, new(B8,button(w, message(@prolog, navigare, w, F2)))),
    send(D, append, new(B2,button(u, message(@prolog, mutareSliding, u, F2)))),
    send(D, append, new(B3,button(d, message(@prolog, mutareSliding, d, F2)))),
    send(D, append, new(B4,button(r, message(@prolog, mutareSliding, r, F2)))),
    send(D, append, new(B5,button(l, message(@prolog, mutareSliding, l, F2)))),
    send(B2, below, B1),
    send(B3, below, B6),
    send(B4, below, B7),
    send(B5, below, B8),
    send(H, append, new(_,button(1, message(@prolog, mutareInterfata, 1,F2)))),
    send(H, append, new(_,button(2, message(@prolog, mutareInterfata, 2,F2)))),
    send(H, append, new(_,button(3, message(@prolog, mutareInterfata, 3,F2)))),
    send(H, append, new(_,button(4, message(@prolog, mutareInterfata, 4,F2)))),
    send(H, append, new(_,button(5, message(@prolog, mutareInterfata, 5,F2)))),
    send(I, append, new(_,button(6, message(@prolog, mutareInterfata, 6,F2)))),
    send(I, append, new(_,button(7, message(@prolog, mutareInterfata, 7,F2)))),
    send(I, append, new(_,button(8, message(@prolog, mutareInterfata, 8,F2)))),
    send(I, append, new(_,button(9, message(@prolog, mutareInterfata, 9,F2)))),
    send(F2, above, W),
    send(F2, gap, size(0, 0)),
    send(H, above, I),
    send(D, left, H),
    send(I, below, E),
    send(F2, above, D),
    send(G, below, I),
    send(F2, size, size(300, 400)),
    send(F2, open),
    !.

taiere(X,A1,A2,F):-
        trim(X, X1),
        trim(A1, A11),
        trim(A2, A22),
        executor(X1,A11,A22,F),!.

mutareInterfata(X,F):-
        seJoaca(Joc),
        Joc = xsi0 ->
        mutare(X,R),
        modificareTextPrezentat(F,R),!;
        mutaCal(X,R2),
        modificareTextPrezentat(F,R2),!.

navigare(X,F):-
        X = n ->
        n(R),
        modificareTextPrezentat(F,R),!;
        X = s ->
        s(R),
        modificareTextPrezentat(F,R),!;
        X = e ->
        e(R),
        modificareTextPrezentat(F,R),!;
        X = w ->
        w(R),
        modificareTextPrezentat(F,R),!.


mutareSliding(X,F):-
        X = u,
        u(R1),
        modificareTextPrezentat(F,R1),!;
        X = d,
        d(R1),
        modificareTextPrezentat(F,R1),!;
        X = l,
        l(R1),
        modificareTextPrezentat(F,R1),!;
        X = r,
        r(R1),
        modificareTextPrezentat(F,R1),!.        


aduagaPuncte(X,Y):-
        X = 0 ->
        adaugaEnergie(4,_),
        atom_concat('','Ai primit 4 puncte de energie!\n',Y),!;
        X = 1 ->
        adaugaEnergie(2,_),
        atom_concat('','Ai primit 2 puncte de energie!\n',Y),!;
        X = 3 ->
        adaugaEnergie(1,_),
        atom_concat('','Ai primit 1 punct de energie!\n',Y),!;
        X = 6 ->
        scadeEnergie(),
        atom_concat('','Ai pierdut 1 punct de energie!\n',Y),!.


seteazaMesajCurent(X):-
                retract(mesajCurent(_)),
                assert(mesajCurent(X)).

seteazaMesajAnterior(X):-
                mesajAnterior(R),
                retract(mesajAnteriorAnterior(_)),
                assert(mesajAnteriorAnterior(R)),
                retract(mesajAnterior(_)),
                assert(mesajAnterior(X)).

inoireMesaj(Nou):-
        mesajCurent(X),
        seteazaMesajAnterior(X),
        seteazaMesajCurent(Nou),
        retract(mesajAfisat(_)),
        assert(mesajAfisat(curent)).


inainte(F):-
        mesajAfisat(A),
        A = curent ->
        mesajCurent(R),
        modificareTextPrezentat2(F,R),!;
        mesajAfisat(A),
        A = anterior ->
        mesajCurent(R),
        modificareTextPrezentat2(F,R),
        retract(mesajAfisat(_)),
        assert(mesajAfisat(curent)),!;
        mesajAfisat(A),
        A = anterioranterior ->
        mesajAnterior(R),
        modificareTextPrezentat2(F,R),
        retract(mesajAfisat(_)),
        assert(mesajAfisat(anterior)),!.

inapoi(F):-
        mesajAfisat(A),
        A = curent ->
        mesajAnterior(R),
        modificareTextPrezentat2(F,R),
        retract(mesajAfisat(_)),
        assert(mesajAfisat(anterior)),!;
        mesajAfisat(A),
        A = anterior ->
        mesajAnteriorAnterior(R),
        modificareTextPrezentat2(F,R),
        retract(mesajAfisat(_)),
        assert(mesajAfisat(anterioranterior)),!;
        mesajAfisat(A),
        A = anterioranterior ->
        mesajAnteriorAnterior(R),
        modificareTextPrezentat2(F,R),!.


modificareTextPrezentat(F,R):-
        send(F, clear),
        new(T,text(R)),
        send(T, colour, orange),
        send(T, font, font(times, bold, 17)),
        send(F, display, T, point(200, 50)),
        inoireMesaj(R).

modificareTextPrezentat2(F,R):-
        send(F, clear),
        new(T,text(R)),
        send(T, colour, orange),
        send(T, font, font(times, bold, 17)),
        send(F, display, T, point(200, 50)).

zoom():-
        mesajCurent(M),
        new(W2,  window('Zoom', size(800, -1))),
        new(F, dialog),
        new(T, text(M)),
        send(T, colour, orange),
        send(T, font, font(times, bold, 18)),
        send(F, above, W2),
        send(F, scrollbars, both),
        send(F, background, black),
        send(F, display, T, point(100, 50)),
        send(F, open).

 ecransudoku(R3):-
        new(W2,  window('Sudoku', size(1100, -1))),
        new(E, dialog),
        new(F, dialog),
        new(T, text(R3)),
        send(E, append, new(Argument, text_item(input, 'Argument1')),right),
        send(E, append, new(Argument2, text_item(input, 'Argument2')),right),
        send(E, append, new(A,button(executor, message(@prolog, plaseaza, Argument?selection,Argument2?selection, F)))),
        send(E, append, new(B,button(inapoi, message(@prolog, inapoi, F)))),
        send(E, append, new(_,button(inainte, message(@prolog, inainte, F)))),
        send(E, append, new(_,button(tabla, message(@prolog, tabla, F)))),
        send(Argument, width,20),
        send(Argument2, width,20),
        send(T, colour, orange),
        send(F, size, size(900,600)),
        send(T, font, font(times, bold, 18)),
        send(F, above, W2),
        send(E, below, F),
        send(F, scrollbars, both),
        send(F, background, black),
        send(E, background, black),
        send(A, size, size(100, 50)), % set the size of button A to be 100 pixels wide and 50 pixels tall
        send(B, size, size(100, 50)), 
        send(A, center_x, E?center_x),
        send(B, center_x, E?center_x),
        send(F, display, T, point(100, 5)),
        send(F, open).

tabla(F):-
        afisare(R),
        modificareTextPrezentat(F,R),!.


plaseaza(A1,A2,F):-
        atom_number(A1, A11),
        atom_number(A2, A21),
        sudoku(A11,A21,R),
        modificareTextPrezentat(F,R),!.

scriefisiere([],'').
scriefisiere([X|T],S):-
        scriefisiere(T,S1),
        atom_concat(X,'\n',S2),
        atom_concat(S2,S1,S),!.
        
apartine(G,[G|_]).
apartine(G,[_|T]):-apartine(G,T).

trim(Text, SisCuratat) :-
    atom_codes(Text, CoduriTextIntrare),
    trim_aux(CoduriTextIntrare, Curatare1),
    reverse(Curatare1, Curatare11),
    trim_aux(Curatare11, Curatare2),
    reverse(Curatare2, CoduriTextFinal),
    atom_codes(SisCuratat, CoduriTextFinal).

trim_aux([], []).
trim_aux([X|T], CuvantCurat) :-
    is_space(X),
    trim_aux(T, CuvantCurat),!.
trim_aux([X|T], [X|CuvantCurat]) :- 
     trim_aux(T, CuvantCurat),!.