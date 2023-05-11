:- use_module(joc1).
:- include('minimax.pl').

teste():-
        restart(_),
        test1(),
        restart(_),
        test2(),
        restart(_),
        test3(),
        restart(_),
        test4(),
        restart(_),
        test5(),
        restart(_),
        test6(),
        restart(_),
        test7(),
        restart(_),
        test8(),
        restart(_),
        test9(),
        restart(_),
        test10(),
        restart(_),
        test11(),!.

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

apartine([G|_],G).
apartine([_|T],G):-apartine(T,G).
