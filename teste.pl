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
        write("Din totalul de 21 teste uintare au fost trecute: "),
        write(NR),!.

teste():-
        contor(NR),
        write("Din totalul de 21 teste uintare au fost trecute: "),
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
        retract(statusCautare(_)),
        assert(statusCautare(desfasurare)),
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
        contorizare(16),
        restart(_),
        test17(),
        contorizare(17),
        restart(_),
        test18(),
        contorizare(18),
        restart(_),
        test19(),
        contorizare(19),
        restart(_),
        test20(),
        contorizare(20),
        restart(_),
        test21(),
        contorizare(21),
        restart(_),!.

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
        egale(X,20),!.
test4():-
        dificultate(imposibil,_),
        energie(X),
        egale(X,10),!.
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
        egale(X,'Te afli în Holul principal. \n
La nord se află biblioteca.\nLa sud este ieșirea.\nLa vest se află camera Dianei.\nLa est se află camera lui Mihai.\n'),
        descrieCamera(2,hol,X1),
        egale(X1,'Te afli în Holul principal. \n
La nord se află camera lui Mihai.\nLa sud este ieșirea.\n'),
        descrieCamera(3,hol,X2),
        egale(X2,'Te afli în Holul principal. \n
La nord se află camera lui Andrei.\nLa sud este ieșirea.\n'),
        descrieCamera(4,hol,X3),
        egale(X3,'Te afli în Holul principal. \n
La vest se află camera Dianei.
La est se află Atelierul.\nLa sud este ieșirea\n'),!.

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
        startAstar([3,1,2,6,0,7,8,4,5],Sol3),
        egale(Sol3,[s,w,n,e,e,s,w,n,w,n]),!.

test13():-
        procesareText('cum selectez nivelul de dificultate'),
        raspuns(R),
        egale(R,'Pentru selectarea nivelului de dificultate se utilizează:
    comanda: Nivel cu argumentul : nivel dorit
    sunt disponibile 4 opțiuni: ușor, mediu, dificil și imposibil.'),
        procesareText('ce se intampla daca raman fara puncte de energie'),
        raspuns(R1),
        egale(R1,'În cazul în care utilizatorul rămâne fără puncte de energie el nu mai poate naviga harta.
În acest caz el poate consuma obiecte comestibile din inventar pentru energie.
Pentru prevenirea acestei situații este recomandată câștigarea mini jocurilor.
Acestea acordă recompense precum punctele de energie.'),
        procesareText('cum pot juca un mini joc'),
        raspuns(R2),
        egale(R2,'Pentru începerea unui joc se va utiliza:
     comanda: Joc cu argumentul: jocul dorit
Jocurile pot fi jucate doar în anumite camere.
Atunci când utilizatorul se află într-o asemena camera el este anunțat.
Este indicat și jocul disponibil.'),
        procesareText('nu ma pot misca'),
        raspuns(R3),
        egale(R3,'Există mai multe motive pentru care utilizatorul nu poate naviga harta.
Este posibil ca utilizatorul să nu fi selectat un nivel de dificultate.
O altă posibilitate este epuizarea punctelor de energie sau viață.'),!.

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

test17():-
        incarca(salvare1),
        locatieJucator(biblioteca),
        energie(11),
        viata(50),
        locatieObiect(biscuit,jucator),
        locatieObiect(mar,cameraCapcana2),
        jocXsi0(disponibil),
        codReal('VAXFU'),
        numarPlanCasa(1),!.

test18():-
        retract(lista(_)),
        assert(lista([0,1,2,3,4,5,6,7,8])),
        energie(X),
        X1 is X+5,
        verifica(A1),
        egale('\nAi primit 5 puncte de energie!',A1),
        energie(X2),
        egale(X1,X2),!.

test19():-
        retract(stareH(_)),
        assert(stareH([2,3,3,3,3,3,3,3,3])),
        energie(X),
        X1 is X+3,
        verificareFinal(A1),
        egale('Ai câștigat jocul. Ai primit 3 puncte de energie\n',A1),
        energie(X2),
        egale(X1,X2),!.

test20():-
        energie(X),
        X1 is X+5,
        decizie(0,A1),
        decizie(5,A2),
        egale('Joc finalizat!!',A1),
        egale('Continuă!!',A2),
        energie(X2),
        egale(X1,X2),!.      

test21():-
        S = [
                [9,4,2,1,6,3,8,5,7],
                [5,3,6,2,8,7,9,4,1],
                [8,7,1,9,5,4,2,3,6],
                [3,2,7,8,1,9,4,6,5],
                [1,5,4,3,2,6,7,9,8],
                [6,9,8,7,4,5,1,2,3],
                [2,6,5,4,7,1,3,8,9],
                [7,8,9,6,3,2,5,1,4],
                [4,1,3,5,9,8,6,7,2]],
        R = [
                [9,1,2,1,6,3,8,5,7],
                [5,3,6,2,8,7,9,4,1],
                [8,7,1,9,5,4,2,3,6],
                [3,2,7,8,1,9,4,6,5],
                [1,5,4,3,2,6,7,9,8],
                [6,9,8,7,4,5,1,2,3],
                [2,6,5,4,7,1,3,8,9],
                [7,8,9,6,3,2,5,1,4],
                [4,1,3,5,9,8,6,7,2]],
        S2 =  [
                [5,3,4,6,7,8,9,1,2],
                [6,7,2,1,9,5,3,4,8],
                [1,9,8,3,4,2,5,6,7],
                [8,5,9,7,6,1,4,2,3],
                [4,2,6,8,5,3,7,9,1],
                [7,1,3,9,2,4,8,5,6],
                [9,6,1,5,3,7,2,8,4],
                [2,8,7,4,1,9,6,3,5],
                [3,4,5,2,8,6,1,7,9]],
        R2 = [
                [5,3,4,6,7,8,9,1,2],
                [6,7,2,1,9,5,3,4,8],
                [1,9,8,3,4,2,5,6,7],
                [8,5,9,7,6,1,4,2,3],
                [4,2,6,8,5,3,7,9,1],
                [7,1,3,9,2,4,8,5,6],
                [9,6,1,5,3,7,2,8,4],
                [2,8,7,4,1,9,6,3,5],
                [3,4,5,2,8,6,1,2,9]],
        verifica(0,S,S),
        \+ verifica(0,R,R),
        verifica(0,S2,S2),
        \+ verifica(0,R2,R2),!.        

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