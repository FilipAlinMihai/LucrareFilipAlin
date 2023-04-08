executor(X,A1,A2,F):-
        apartine(X,[nivel,dificultate,level]) ->
        dificultate(A1,Resp),
        atom_concat("Ai selectat nivelul de dificultate : ", A1,R1),
        atom_concat(R1,"\n",R2),
        atom_concat(R2,Resp,R),
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
        apartine(X,[pastreaza,ridica,colecteaza])  ->
        pastreaza(A1,R12),
        modificareTextPrezentat(F,R12),
        !;
        apartine(X,[joc,joaca,incepeJoc,incepejoc,play,incepe,start]) , A1 = sudoku ->
        incepeJoc(A1,R3),
        modificareTextPrezentat(F,R3),
        ecransudoku(R3),
        !;
        apartine(X,[joc,joaca,incepeJoc,incepejoc,play,incepe,start]) ->
        incepeJoc(A1,R3),
        modificareTextPrezentat(F,R3),
        !;
        apartine(X,[mananca,consuma])->
        mananca(A1,R31),
        modificareTextPrezentat(F,R31),
        !;
        X = foarfecahartiepiatra ->
        alege(A1,R),
        modificareTextPrezentat(F,R),
        !;
        apartine(X,[inspecteaza,citeste,analizeaza]) ->
        inspecteaza(A1,R3),
        modificareTextPrezentat(F,R3),
        !;
        apartine(X,[salveaza,salvare,save]) ->
        salveaza(A1),
        atom_concat("Joc salvat!\n",'',R),
        modificareTextPrezentat(F,R),
        !;
        apartine(X,[clasament,top,scor]) ->
        afisareClasament(A1,R),
        modificareTextPrezentat(F,R),
        !;
        X = incarca, incarca(A1)->
        locatieJucator(Juc),
        descrie(Juc,R1),
        atom_concat("Joc încărcat!\n",R1,R),
        modificareTextPrezentat(F,R),
        !;
        X = incarca, \+ incarca(A1) ->
        atom_concat("Această versiune nu a putut fi încărcată!\n",'',R),
        modificareTextPrezentat(F,R),
        !;
        X = optiuni ->
        directory_files('C:\\Users\\lenovo\\Documents\\Prolog\\LucrareFilipAlin\\salvari',[_,_|Fisiere]),
        scriefisiere(Fisiere,Scriere),
        atom_concat("Versiuni salvate!\n",Scriere,R),
        modificareTextPrezentat(F,R),
        !;
        X = sudoku->
        atom_number(A1, A11),
        atom_number(A2, A21),
        sudoku(A11,A21,R),
        modificareTextPrezentat(F,R),
        !;
        X = viata ->
        viata(R31),
        atom_concat('Situația sănătății curente: ',R31,R312),
        modificareTextPrezentat(F,R312),
        !;
        X = ajutor,nivelSelectat(imposibil) ->
        atom_concat('Pentru nivelul imposibil nu există ajutor!\n','',R),
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
        apartine(X,[restart,reset]) ->
        restart(R),
        retract(ajutor2(_)),
        assert(ajutor2(disponibil)),
        modificareTextPrezentat(F,R),
        !;
        apartine(X,[arunca,renunta,elibereaza,drop]) ->
        renunta(A1,R),
        modificareTextPrezentat(F,R),
        !;
        apartine(X,[scrieCod,cod,scriecod,codul]) ->
        scrie_cod(A1,R20),
        modificareTextPrezentat(F,R20),!;
        X = ghicitoare ->
        raspunde_la_Ghicitoare(A1,R21),
        modificareTextPrezentat(F,R21)
        ,!;
        X = parola ->
        afisareLitereDescoperite(R),
        modificareTextPrezentat(F,R)
        ,!;
        atom_concat('Comandă inexistentă!\n', X,R),
        modificareTextPrezentat(F,R),!.