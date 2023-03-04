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


regiulile('Esti captiv in casa X. Usa de la iesire este incuiata. 
Din fericire ai gasit o harta a casei. Aceasta nu este foarte clara in unele parti.
Poti cerceta casa dar fiecare tranzitie intre camere te costa energie. 
Vei gasi obiecte aceste pot fi folosite pentru a castiga energie sau pentru alte activitati. 
Accesul in unele canere este restrictionat. 
Cel mai probail cheia se afla in birou dar acest aste blocat de un lacat. 
Lacatul are o parola de cinci litere. Este posibil sa gasesti parola in camerele casei. 
Atunci cand ai aflat toate literele parolei traverseaza harta pana in biblioteca.
Aici poti utiliza comanda scrie cod urmata de literele descoperite ca argument. 
Vei avea posibilitatea de a juca mini jocuri. Daca reusesti sa castigi vei primi recompense. 
Pentru navigare utilizeaza butoanele N S E V. 
Unele camere sunt periculoase. Ele contin capcane si pot pune in pericol viata jucatorului.
Prin comanda viata poti vedea care este starea ta curenta.
Butoanele numerotate de la 1 la 9 sunt pentru jocul de x si 0 impotriva calculatorului. 
Initial jucatorul trebuie sa selecteze dificultatea. Exista 4 nivele disponibile usor mediu dificil si imposibil. 
Obiectele sunt plasate in inventar cu comanda pastreaza. 
Pentru a afla nivelul de energie exista comanda energie iar pentru listarea inventarului inventar. 
Obiectele comestibile pot fi consumate prin comanda mananca 
Atunci cand dorest sa incepi un joc utilizeaza incepeJoc urmat de jocul respectiv. 
Imediat dupa inceperea unui joc vor fi prezentate si regulile si restrictiile acestuia. 
Prima caseta de input este pentru comenzi iar cea de a doua pentru eventualele argumente ale acestora. 
Comenzile energie, viata si inventar nu necesita un argument anume. 
Pentru A pastra cheia din seif trebuie sa raspunzi corect la o ghicitoare gasita in camerele casei. 
Scrie raspunsul cu comanda ghicitoare si raspunsul ca argument. 
Pentru a determina continutul unor obiecte precum cartile sau biletele
poate fi utilizata comanda inspecteaza urmata de obiectul ce trebuie evaluat.

                            ').

reguli():-
    new(F, dialog),
    new(W,  window('Jocuri', size(1000, -5))), 
    regiulile(Reg), 
    new(Text, text(Reg)),  
    send(Text, font, font(times, bold, 17)),
    send(Text, colour, orange),
    send(F, display, Text, point(100, 50)),
    send(F, background, black),
    send(F, above, W),
    send(F, open),!.

run:-
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
    send(E, append, new(InputText, text_item(input, 'Comanda'))),
    send(E, append, new(Argument, text_item(input, 'Argument1'))),
    send(E, append, new(Argument2, text_item(input, 'Argument2'))),
    send(InputText, left, Argument),
    %send(E ,display, text(''),point(200, 10)),
    send(E, append, new(_,button(executor, message(@prolog, executor, InputText?selection, Argument?selection,Argument2?selection, F2)))),
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

executor(X,A1,A2,F):-
        X = dificultate ->
        dificultate(A1),
        atom_concat("Ai selectat nivelul de dificultate : ", A1,R),
        modificareTextPrezentat(F,R)
        ,!;
        X = energie ->
        energie(R1),
        atom_concat("Energia ta : ", R1,R2),
        modificareTextPrezentat(F,R2)
        ,!;
        X = inventar -> 
        inventar(R4),
        modificareTextPrezentat(F,R4),
        !;
        X = decizie -> 
        decizie(A1,R8,R9),
        aduagaPuncte(R9,R10),
        atom_concat(R8,R10,R11),
        modificareTextPrezentat(F,R11),
        !;
        X = pastreaza ->
        pastreaza(A1,R12),
        modificareTextPrezentat(F,R12),
        !;
        X = incepeJoc ->
        incepeJoc(A1,R3),
        modificareTextPrezentat(F,R3),
        !;
        X = mananca ->
        mananca(A1,R31),
        modificareTextPrezentat(F,R31),
        !;
        X = foarfecahartiepiatra ->
        alege(A1,R),
        modificareTextPrezentat(F,R),
        !;
        X = inspecteaza ->
        inspecteaza(A1,R3),
        modificareTextPrezentat(F,R3),
        !;
        X = sudoku ->
        atom_number(A1, A11),
        atom_number(A2, A21),
        sudoku(A11,A21,R),
        modificareTextPrezentat(F,R),
        !;
        X = viata ->
        viata(R31),
        atom_concat('Situatia sanatatii curente: ',R31,R312),
        modificareTextPrezentat(F,R312),
        !;
        X = ajutor,nivelSelectat(imposibil) ->
        atom_concat('Pentru nivelul imposibil nu exista ajutor!\n','',R),
        modificareTextPrezentat(F,R),
        !;
        X = ajutor,ajutor2(disponibil) ->
        ajutor(R23),
        modificareTextPrezentat(F,R23),
        retract(ajutor2(_)),
        assert(ajutor2(indisponibil)),
        !;
        X = ajutor,ajutor2(indisponibil) ->
        atom_concat('Ai utilizat indiciul disponibil!\n','',R),
        modificareTextPrezentat(F,R),
        !;
        X = restart ->
        restart(R),
        retract(ajutor2(_)),
        assert(ajutor2(disponibil)),
        modificareTextPrezentat(F,R),
        !;
        X = scriecod ->
        scrie_cod(A1,R20),
        modificareTextPrezentat(F,R20),!;
        X = ghicitoare ->
        raspunde_la_Ghicitoare(A1,R21),
        modificareTextPrezentat(F,R21)
        ,!;
        atom_concat('Comanda inexistenta!\n','',R),
        modificareTextPrezentat(F,R),!.

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


