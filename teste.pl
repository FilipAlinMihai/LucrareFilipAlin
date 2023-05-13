:- use_module(joc1).
:- use_module(operare_bot).
:- include('minimax.pl').
:- include('astar.pl').
:- include('literenoi.pl').

:- dynamic contor/1.

contor(0).

teste():-
        contorizare(0),
        teste_aux(),
        contor(NR),
        write("Din totalul de 16 teste uintare au fost trecute: "),
        write(NR),!.

teste():-
        contor(NR),
        write("Din totalul de 16 teste uintare au fost trecute: "),
        write(NR),
        contorizare(0),!.

teste_aux():-
        restart(_),
        test1(),
        contorizare(1),
        restart(_),
        test2(),
        contorizare(2),
        restart(_),
        test3(),
        contorizare(3),
        restart(_),
        test4(),
        contorizare(4),
        restart(_),
        test5(),
        contorizare(5),
        restart(_),
        test6(),
        contorizare(6),
        restart(_),
        test7(),
        contorizare(7),
        restart(_),
        test8(),
        contorizare(8),
        restart(_),
        test9(),
        contorizare(9),
        restart(_),
        test10(),
        contorizare(10),
        restart(_),
        test11(),
        contorizare(11),
        restart(_),
        test12(),
        contorizare(12),
        test13(),
        contorizare(13),
        restart(_),
        test14(),
        contorizare(14),
        restart(_),
        test15(),
        contorizare(15),
        restart(_),
        test16(),
        contorizare(16),!.

test1():-
        dificultate(mediu,_),
        energie(X),
        egale(X,40),!.
test2():-
        dificultate(usor,_),
        energie(X),
        egale(X,50),!.
test3():-
        dificultate(dificil,_),
        energie(X),
        egale(X,10),!.
test4():-
        dificultate(imposibil,_),
        energie(X),
        egale(X,5),!.
test5():-
        dificultate(mediu,_),
        amInceput(da),!.
test6():-
        dificultate(mediu,_),
        numarPlanCasa(NR),
        verificareTest6(NR),!.
test7():-
        dificultate(mediu,_),
        numarPlanCasa(NR),
        verificareTest7(NR),!.
test8():-
        descrieCamera(1,hol,X),
        egale(X,'Te afli în Holul principal. \nLa nord se află biblioteca\nLa sud este ieșirea\nLa vest este camera Dianei\nLa est este camera lui Mihai\n'),
        descrieCamera(2,hol,X1),
        egale(X1,'Te afli în Holul principal. \nLa nord se află camera lui Mihai\nLa sud este ieșirea\n'),
        descrieCamera(3,hol,X2),
        egale(X2,'Te afli în Holul principal. \nLa nord se află camera lui Andrei\nLa sud este ieșirea\n'),
        descrieCamera(4,hol,X3),
        egale(X3,'Te afli în Holul principal. \nLa vest se află camera Dianei.
La est se afla Atelierul.\nLa sud este ieșirea\n'),!.

test9():-
        dificultate(mediu,_),
        scadeEnergie(),
        scadeEnergie(),
        scadeEnergie(),
        energie(X),
        egale(X,37),
        adaugaEnergie(5,_),
        energie(X1),
        egale(X1,42),!.

test10():-
        dificultate(mediu,_),
        retract(locatieObiect(mar,_)),
        assert(locatieObiect(mar,jucator)),
        mananca(mar, R),
        egale(R,'Nivelul curent de energie este : 45'),!.

test11():-
        minimax([2,1,1,1,1,1,1,1,1],R1),
        egale(R1,[2,1,1,1,0,1,1,1,1]),
        minimax([2,1,1,1,0,1,2,1,1],R2),
        egale(R2,[2,1,1,0,0,1,2,1,1]),
        minimax([2,1,1,0,0,1,2,1,2],R3),
        egale(R3,[2,1,1,0,0,0,2,1,2]),
        minimax_secund([1,1,0,1,2,1,1,1,0],R4),
        egale(R4,[1,1,0,1,2,2,1,1,0]),
        minimax_secund([1,1,0,1,0,1,1,1,2],R5),
        egale(R5,[1,1,0,1,0,1,2,1,2]),!.

test12():-
        startAstar([3,1,0,4,7,2,6,8,5],Sol),
        egale(Sol,[s,s,w,n,w,n]),
        startAstar([3,7,1,0,4,2,6,8,5],Sol1),
        egale(Sol1,[e,n,e,s,s,w,n,w,n]),
        startAstar([3,1,2,6,0,7,8,4,5],Sol3),
        egale(Sol3,[s,w,n,e,e,s,w,n,w,n]),!.

test13():-
        procesareText('cum selectez nivelul de dificultate'),
        raspuns(R),
        egale(R,'Pentru selectarea nivelului de dificultate se utilizeaza:
    comanda: Nivel cu argumentul : nivel dorit
    sunt disponibile 4 optiuni: usor, mediu, dificil si imposibil.'),
        procesareText('ce se intampla daca raman fara puncte de energie'),
        raspuns(R1),
        egale(R1,'În cazul în care utilizatorul rămâne fără puncte de energie el nu mai poate naviga harta.
În acest caz el poate consuma obiecte comestibile din inventar pentru energie.
Pentru prevenirea acestei situații este recomandată câștigarea mini jocurilor.
Acestea acordă recompense precum punctele de energie.'),
        procesareText('cum pot juca un mini joc'),
        raspuns(R2),
        egale(R2,' Pentru inceperea unui joc se va utiliza:
     comanda: Joc cu argumentul: jocul dorit'),
        procesareText('nu ma pot misca'),
        raspuns(R3),
        egale(R3,'Exista mai multe motive pentru care utilizatorul nu poate naviga harta.
Este posibil ca utilizatorul sa nu fi selectat un nivel de dificultate.
O alta posibilitate este epuizarea punctelor de energie sau viata.'),!.

test14():-
        generareLitere(),
        litera1(A),
        litera2(B),
        litera3(C),
        litera4(D),
        litera5(E),
        generareLitere(),
        litera1(A1),
        litera2(B1),
        litera3(C1),
        litera4(D1),
        litera5(E1),
        verificareParole(A,B,C,D,E,A1,B1,C1,D1,E1),!.

test15():-
        retract(locatieJucator(_)),
        assert(locatieJucator(cameraNW)),
        jocXsi0(disponibil),
        incepeJoc(xsi0,X),
        X \= 'Ai jucat acest joc deja',
        stopJoc(xsi0),
        jocXsi0(jucat),!.

test16():-
        euristica([0,1,2,3,4,5,6,7,8],R),
        euristica([3,1,2,4,7,5,6,0,8],R1),
        euristica([3,7,1,0,4,2,6,8,5],R2),
        euristica([3,1,2,4,0,5,6,7,8],R3),
        euristica([3,1,2,6,0,7,8,4,5],R4),
        euristica([3,1,0,4,7,2,6,8,5],R5),
        euristica([8,7,6,5,4,3,2,1,0],R6),
        R = 0,
        R1 < R2,
        R3 < R4,
        R5 < R6,!.

verificareTest6(NR):-
        NR = 1 ->
        legatura(1,n,hol,biblioteca),
        legatura(1,w,hol,cameraW),
        legatura(1,e,hol,cameraE),
        legatura(1,s,hol,iesire),!;
        NR = 2 ->
        legatura(2,n,hol,cameraE),
        legatura(2,s,hol,iesire),!;
        NR = 3 ->
        legatura(3,n,hol,cameraEE),
        legatura(3,s,hol,iesire),!;
        NR = 4 ->
        legatura(4,e,hol,cameraWS),
        legatura(4,w,hol,cameraW),!;
        false,!.

verificareTest7(NR):-
        NR = 1 ->
        mutaJucator(n,_),
        locatieJucator(biblioteca),
        mutaJucator(e,_),
        locatieJucator(bucatarie),!;
        NR = 2 ->
        mutaJucator(n,_),
        locatieJucator(cameraE),
        mutaJucator(e,_),
        locatieJucator(cameraEE),!;
        NR = 3 ->
        mutaJucator(n,_),
        locatieJucator(cameraEE),
        mutaJucator(w,_),
        locatieJucator(cameraE),!;
        NR = 4 ->
        mutaJucator(e,_),
        locatieJucator(cameraWS),
        mutaJucator(w,_),
        locatieJucator(hol),
        mutaJucator(w,_),
        locatieJucator(hol),!;
        false,!.

egale(X,X).

contorizare(N):-
        retract(contor(_)),
        assert(contor(N)),!.

verificareParole(A,B,C,D,E,A1,B1,C1,D1,E1):-
        A \= A1;
        B \= B1;
        C \= C1;
        D \= D1;
        E \= E1,!.