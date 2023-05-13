%Incepe un mini joc logic
incepeJoc(sliding,X):-
    jocSliding(jucat),
    atom_concat('','Ai jucat acest joc deja',X),!.

incepeJoc(sliding,X):-
    locatieJucator(biblioteca),
    descrie(sliding,Y),
    nivelSelectat(Dif),
    start(Dif),
    arata(Z),
    atom_concat(Y,Z,X),
    retract(seJoaca(_)),
    assert(seJoaca(sliding)),
    retract(jocSliding(_)),
    assert(jocSliding(jucat)),
    determinareSecunde1(NumarSecunde),
    start_timer(NumarSecunde,stop),
    get_time(Ora),
    Secunde is NumarSecunde,
    MomentFinalizare is Ora + Secunde,
    retract(timpSliding(_)),
    assert(timpSliding(MomentFinalizare)),!.

incepeJoc(xsi0,X):-
    jocXsi0(jucat),
    atom_concat('','Ai jucat acest joc deja',X),!.

incepeJoc(xsi0,X):-
    locatieJucator(cameraNW),
    descrie(xsi0,Y),
    startx(),
    aratax(Z),
    atom_concat(Y,Z,X),
    retract(seJoaca(_)),
    assert(seJoaca(xsi0)),
    retract(jocXsi0(disponibil)),
    assert(jocXsi0(jucat)),!.

incepeJoc(dilema,X):-
    jocDilema(jucat),
    atom_concat('','Ai jucat acest joc deja',X),!.

incepeJoc(dilema,Y):-
    locatieJucator(cameraNE),
    descrie(dilema,Y),
    startD(),
    retract(seJoaca(_)),
    assert(seJoaca(dilema)),
    retract(jocDilema(_)),
    assert(jocDilema(jucat)),!.

incepeJoc(hunter,X):-
    jocHunter(jucat),
    atom_concat('','Ai jucat acest joc deja',X),!.

incepeJoc(hunter,X):-
    locatieJucator(cameraWW),
    descrie(hunter,Y),
    determinareSecunde3(NumarSecunde),
    get_time(Ora),
    start_timer(NumarSecunde,stopH),
    Secunde is NumarSecunde,
    MomentFinalizare is Ora + Secunde,
    retract(timpHunter(_)),
    assert(timpHunter(MomentFinalizare)),
    startH(),
    arataH(Z),
    atom_concat(Y,Z,X),
    retract(seJoaca(_)),
    assert(seJoaca(hunter)),
    retract(jocHunter(_)),
    assert(jocHunter(jucat)),!.

incepeJoc(foarfecahartiepiatra,X):-
    jocFoarfecahartiepiatra(jucat),
    atom_concat('','Ai jucat acest joc deja',X),!.


incepeJoc(foarfecahartiepiatra,X):-
    locatieJucator(cameraE),
    descrie(foarfecahartiepiatra,X),
    startJ(),
    retract(seJoaca(_)),
    assert(seJoaca(foarfecahartiepiatra)),
    retract(jocFoarfecahartiepiatra(_)),
    assert(jocFoarfecahartiepiatra(jucat)),!.

incepeJoc(sudoku,X):-
    jocSudoku(jucat),
    atom_concat('','Ai jucat acest joc deja',X),!.


incepeJoc(sudoku,X1):-
    locatieJucator(cameraEE),
    descrie(sudoku,X),
    determinaNumarInlocuiri(NR),
    determinareSecunde2(NumarSecunde),
    get_time(Ora),
    start_timer(NumarSecunde,stopS),
    Secunde is NumarSecunde,
    MomentFinalizare is Ora + Secunde,
    retract(timpSudoku(_)),
    assert(timpSudoku(MomentFinalizare)),
    startS(S,NR),
    atom_concat(X,S,X1),
    retract(seJoaca(_)),
    assert(seJoaca(sudoku)),
    retract(jocSudoku(_)),
    assert(jocSudoku(jucat)),!.


% Jocul este restrictionat unei singure camere
incepeJoc(sliding,X):-atom_concat('','Nu te aflii în bibliotecă!', X).
incepeJoc(xsi0,X):-atom_concat('','Nu te aflii în camera de zi!', X).
incepeJoc(dilema,X):-atom_concat('','Nu te aflii în camera lui Bogdan!', X).
incepeJoc(hunter,X):-atom_concat('','Nu te aflii în camera Mariei!', X).
incepeJoc(foarfecahartiepiatra,X):-atom_concat('Nu te afli în camera lui Mihai','!', X).
incepeJoc(sudoku,X):-atom_concat('Nu te afli în camera lui Andrei','!', X).

stopJoc(sliding):-stop().
stopJoc(xsi0):-stopx().
stopJoc(dilema):-stopD().
stopJoc(hunter):-stopH().
stopJoc(foarfecahartiepiatra):-stopJ().
stopJoc(sudoku):-stopS().

determinaNumarInlocuiri(NR):-
        nivelSelectat(usor)->
        NR = 38,!;
        nivelSelectat(mediu)->
        NR = 44,!;
        nivelSelectat(dificil)->
        NR = 49,!;
        nivelSelectat(imposibil)->
        NR = 51,!.

determinareSecunde2(NumarSecunde):-
            nivelSelectat(usor)->
            NumarSecunde = 730,!;
            nivelSelectat(mediu)->
            NumarSecunde = 715,!;
            nivelSelectat(dificil)->
            NumarSecunde = 700,!;
            nivelSelectat(imposibil)->
            NumarSecunde = 675,!.


determinareSecunde1(NumarSecunde):-
            nivelSelectat(usor)->
            NumarSecunde = 250,!;
            nivelSelectat(mediu)->
            NumarSecunde = 120,!;
            nivelSelectat(dificil)->
            NumarSecunde = 100,!;
            nivelSelectat(imposibil)->
            NumarSecunde = 60,!.

determinareSecunde3(NumarSecunde):-
            nivelSelectat(usor)->
            NumarSecunde = 35,!;
            nivelSelectat(mediu)->
            NumarSecunde = 28,!;
            nivelSelectat(dificil)->
            NumarSecunde = 20,!;
            nivelSelectat(imposibil)->
            NumarSecunde = 17,!.