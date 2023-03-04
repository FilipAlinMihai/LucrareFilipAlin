%Jucatorul este captiv intr-o casa parasita . El isi doreste sa evadeze
%Usa de la intrare este incuiata
%
%Aceste date vor fi modificate pe parcursul jocului
%Pentru ca povestea sa progreseze avem nevoie de modificarea lor

% pentru realizarea mini jocurilor utilizam fisiere externe integrate cu
% ajutorul modulelor

:- module(joc1,[
              dificultate/1,
              incepeJoc/2,
              n/1,s /1,e/1,w/1,
              mananca/2,
              pastreaza/2,
              l/1,r/1,u/1,d/1,
              scrie_cod/2,
              energie/1,
              harta/0,
              mutare/2,
              stopJoc/1,
              inventar/1,
              raspunde_la_Ghicitoare/2,
              inspecteaza/2,
              decizie/3,
              adaugaEnergie/2,
              scadeEnergie/0,
              seJoaca/1,
              mutaCal/2,
              ajutor/1,
              viata/1,
              nivelSelectat/1,
              alege/2,
              restart/1]).


:- use_module(sliding).
:- use_module(xsi0).
:- use_module(castigare).
:- use_module(piatrafoarfecahartie).
:- use_module(sudoku).

:- include('literenoi.pl').
:- include('dilema_prizonierilor.pl').
:- include('hunter.pl').
:- include('descriere.pl').

:- dynamic locatieJucator/1,
    locatieObiect/2,
    viata/1,
    cod_birou/1,
    codReal/1,
    raspunsGhicitoare/1,
    amInceput/1,
    stare/1,
    seJoaca/1,
    jocSliding/1,
    jocXsi0/1,
    jocDilema/1,
    jocHunter/1,
    nivelSelectat/1,
    jocFoarfecahartiepiatra/1,
    jocSudoku/1.

jocSliding(disponibil).
jocXsi0(disponibil).
jocDilema(disponibil).
jocHunter(disponibil).
jocFoarfecahartiepiatra(disponibil).
jocSudoku(disponibil).

nivelSelectat(null).

seJoaca(momentanNimic).

locatieJucator(hol). %Se stabileste locatia de pornire a jucatorului
                        %Aceasta se modifica pe parcur in  functie de mutarile jucatorului

%Sunt stabilite rutele de legatura intre camere.
legatura(n,hol,biblioteca).
legatura(w,hol,cameraW).
legatura(e,hol,cameraE).
legatura(s,hol,iesire).

legatura(e,cameraE,cameraEE).
legatura(w,cameraE,hol).

legatura(w,cameraEE,cameraE).
legatura(n,cameraEE,cameraNE).

%In birou se poate intra cu un cod gasit prin explorarea camerelor
legatura(n,biblioteca,birou):-cod_birou(X),codReal(Y),egale(X,Y).
legatura(n,biblioteca,birou):-
    write(''),nl,fail.
legatura(s,biblioteca,hol).
legatura(e,biblioteca,bucatarie).
legatura(w,biblioteca,cameraNW).

legatura(e,bucatarie,cameraNE).
legatura(w,bucatarie,biblioteca).

legatura(e,cameraNW,biblioteca).
legatura(s,cameraNW,cameraCapcana1).
legatura(n,cameraNW,debara).
legatura(w,cameraNW,cameraCapcana2).

legatura(s,debara,cameraNW).

legatura(n,cameraCapcana1,cameraNW).

legatura(s,cameraNE,cameraEE).
legatura(w,cameraNE,bucatarie).

legatura(e,cameraCapcana2,cameraNW).

legatura(w,cameraW,cameraWW).
legatura(e,cameraW,hol).

legatura(e,cameraWW,cameraW).

legatura(s,birou,biblioteca).

cod_birou(aaaaa).

%jucatorul introduce codul de la lacatul biroului
scrie_cod(X,R):-
    codReal(X1),
    egale(X,X1),
    locatieJucator(biblioteca),
    cod_birou(Y),
    retract(cod_birou(Y)),
    assert(cod_birou(X)),
    atom_concat('','Cod corect',R),!.

scrie_cod(_,R):-
    atom_concat('','Cod incorect',R),!.

egale(X,X).

%Se stabileste locatia obiectelor cu care jucatorul poate interactiona
% Locatia obiectelor poate fi modificata o data ce jucatorul
% interactioneaza cu ele

locatieObiect(carteLitera3,cameraE).
locatieObiect(scrisoareLitera1,cameraEE).
locatieObiect(ghicitoare,cameraW).
locatieObiect(cheie,seif).
locatieObiect(seif,birou).
locatieObiect(carteLitera2,cameraWW).
locatieObiect(bilet,hol).
locatieObiect(lanterna,bucatarie).
locatieObiect(mar,cameraEE).
locatieObiect(biscuit,bucatarie).
locatieObiect(scrisoareLitera5,debara).
locatieObiect(carteLitera4,cameraNE).

% In aceste camere se afla capcane . Daca jucatorul intra aici el va
% pierde o portiune din viata
cameraCapcana(cameraCapcana1).
cameraCapcana(cameraCapcana2).

%Sunt descrise obiectele ce pot fi mancate
%Prin consumarea lor se obtin puncte de energie
comestibil(biscuit).
comestibil(mar).

% Camerele acestea nu sunt luminate . Initial jucatorul nu va putea
% prelua obiecte de aici. Pentru a interactiona xu obiectele din aceste
% camere el are nevoie de o lanterna.
cameraIntunecata(cameraWW).
cameraIntunecata(cameraW).
cameraIntunecata(cameraNE).

%Jucatorul porneste la drum cu un total de 20 de puncte de energie
%Acest total se va modifica in functie de actiunile jucatorului
% energieJucator(40).

energie(X):-
    energieJucator(X),
    write(''),
    write(''),nl.

scadeEnergie():-
    energieJucator(X),
    Y is X-1,
    retract(energieJucator(X)),
    assert(energieJucator(Y)).

%prin acasta functie jucatorul va putea analiza camera in care se afla
%vor fi prezentate obiectele cu care el poate interactiona


cerceteazaCamera(R1):-
    locatieJucator(X),
    bagof(Y,locatieObiect(Y,X),Obiecte),
    scrieObiecte(Obiecte,RO),
    atom_concat('',RO,R1).
    

cerceteazaCamera(R1):-
    atom_concat('---------------------------------\n',
    'Acestea au fost obiectele gasite',R1).

scrieObiecte([],'').
scrieObiecte([L|T],Y):-
    atom_concat('--------------------------\n',L,T1),
    atom_concat(T1,'\n',T2),
    scrieObiecte(T,T3),
    atom_concat(T2,T3,Y).

inventar(R1):-
    bagof(Y,locatieObiect(Y,jucator),Obiecte),
    scrieObiecte(Obiecte,RO),
    atom_concat('',RO,R1).

inventar(X):-atom_concat('','------------------------\n',X).


raspunsGhicitoare(aaaaaaaaa).

raspunde_la_Ghicitoare(X,R):-
    retract(raspunsGhicitoare(_)),
    assert(raspunsGhicitoare(X)),
    egale(cheie,X),
    atom_concat('','Raspuns corect',R),!.

raspunde_la_Ghicitoare(_,R):-
    atom_concat('','Raspuns incorectcorect',R),!.

% Prin aceasta metoda jucatorul are posibilitatea de a pastra obiecte in
% rucsacul personal pentru a le folosi mai tarziu
pastreaza(cheie,R1):-
    locatieObiect(seif,jucator),
    raspunsGhicitoare(cheie),
    retract(locatieObiect(cheie,seif)),
    assert(locatieObiect(cheie,jucator)),
    atom_concat('Cheia e la tine!','\n',R1),!.

pastreaza(cheie,R1):-
    locatieObiect(seif,jucator),
    atom_concat('Mai intai raspunde la ghicitoare!','\n',R1),!.

pastreaza(Y,R1):-
    locatieObiect(Y,X),
    locatieJucator(X),
    retract(locatieObiect(Y, X)),
    assert(locatieObiect(Y, jucator)),
    atom_concat('Obiectul a fost plasat in inventar!','\n',R1),!.

pastreaza(Y,X):-
    locatieObiect(Y,jucator),
    atom_concat('Il avem deja !\n','',X),!.

pastreaza(Y,X):-
    locatieObiect(Y,_),
    atom_concat('Actiune imposibila. Nu vad obiectul : ',Y,X),!.

% Dupa consumarea unui obiect comestibil jucatorul primeste 5 puncte de
% energie
mananca(X,R):-
    comestibil(X),
    locatieObiect(X,jucator),
    adaugaEnergie(5,Z),
    retract(locatieObiect(X,jucator)),
    assert(locatieObiect(X,pierdut)),
    atom_concat('Nivelul curent de energie este : ',Z,R),!.

mananca(_,R):-atom_concat('Acest obiect nu este comestibil','',R),!.

% Sitautia sanatatii jucatorului se modifica in functie de pericolele pe
% care le intalneste
viata(100).
scadeViata():-
    viata(X),
    Y is X-50,
    retract(viata(X)),
    assert(viata(Y)).

%Jucatorul va verifica in ce conditie se afla
verificaConditie():-
    viata(X),
    energieJucator(Y),
    write('Conditia ta : '),
    write(X),nl,
    write('Puncte de energie disponibile:'),
    write(Y),nl.

%Directiile in care jucatorul se poate misca
n(T1):- mutaJucator(n,T1).

s(T1):- mutaJucator(s,T1).

e(T1):- mutaJucator(e,T1).

w(T1):- mutaJucator(w,T1).

% acestea Sunt nivelele de dificultate dintr care jucatorul poate alege
nivel(usor,50).
nivel(mediu,40).
nivel(dificil,10).
nivel(imposibil,5).

%Se incepe jocul dupa selectarea nivelului de dificultate
amInceput(nu).

comunicaNivel(X):-
    retract(nivelCurent(_)),
    assert(nivelCurent(X)).

%jucatorul introduce nivelul dorit
dificultate(X):-
    nivel(X,Y),
    amInceput(nu),
    retract(energieJucator(_)),
    assert(energieJucator(Y)),
    retract(amInceput(nu)),
    assert(amInceput(da)),
    comunicaNivel(X),
    write(''),
    write(''),
    generareCuvant(C1),
    retract(codReal(_)),
    assert(codReal(C1)),
    retract(nivelSelectat(_)),
    assert(nivelSelectat(X)),!.

codReal(aaaaa).

mutaJucator(_,R):-
    amInceput(nu),
    atom_concat('Nu ai selectat nivelul de dificultate!\n','Utilizeaza comanda dificultate(nivel).\n',T1),
    atom_concat(T1,'Ai patru optoini: usor, mediu, dificil, imposibil\n',R),!.

% Daca jucatorul e mort el nu se mai poate deplasa intre camere
mutaJucator(_,R):-
    viata(0),
    atom_concat('','Ai murit!!!!',R).
    

% Jucatorul a ramas fara energie si acum e prea epuizat pentru a circula
% intre camere . Problema poate fi rezolvata prin consumarea unor
% alimente.
mutaJucator(_,R):-
    energieJucator(0),
    atom_concat('','Esti epuizat!!!!',R).

% Atunci cand deplasarea intre camere este realizata jucatorul consuma
% energie . Pentru fiecare deplasare reusita este scazut un punct de
% energie.

mutaJucator(X,R):-
    amInceput(da),
    locatieJucator(L),
    cameraIntunecata(Z),
    locatieObiect(lanterna,jucator),
    legatura(X,L,Z),
    scadeEnergie(),
    retract(locatieJucator(L)),
    assert(locatieJucator(Z)),
    descrie(Z,H),
    cerceteazaCamera(T1),
    atom_concat(H,T1,R),!.


mutaJucator(X,R):-
    amInceput(da),
    locatieJucator(L),
    legatura(X,L,Z),
    cameraIntunecata(Z),
    atom_concat('Este prea intuneric in aceasta camera\n','Ai nevoie de o lanterna\n',R).

mutaJucator(X,R):-
    amInceput(da),
    locatieJucator(L),
    legatura(X,L,iesire),
    locatieObiect(cheie,jucator),
    scadeEnergie(),
    retract(locatieJucator(L)),
    assert(locatieJucator(iesire)),
    atom_concat('','Joc Finalizat !! Felicitari !!!!\n',R).

mutaJucator(X,R):-
    amInceput(da),
    locatieJucator(L),
    legatura(X,L,iesire),
    locatieObiect(cheie,seif),
    atom_concat('','Ai nevoie de cheie pentru a evada\n',R).


mutaJucator(X,R):-
    amInceput(da),
    locatieJucator(L),
    legatura(X,L,cameraCapcana1),
    retract(locatieJucator(L)),
    assert(locatieJucator(cameraCapcana1)),
    descrie(cameraCapcana1,Z),
    cerceteazaCamera(T1),
    scadeViata(),
    atom_concat(Z,T1,R),!.

mutaJucator(X,R):-
    amInceput(da),
    locatieJucator(L),
    legatura(X,L,cameraCapcana2),
    scadeEnergie(),
    retract(locatieJucator(L)),
    assert(locatieJucator(cameraCapcana2)),
    descrie(cameraCapcana2,Z),
    cerceteazaCamera(T1),
    scadeViata(),
    atom_concat(Z,T1,R),!.

mutaJucator(X,R):-
    amInceput(da),
    locatieJucator(L),
    legatura(X,L,Z),
    scadeEnergie(),
    retract(locatieJucator(L)),
    assert(locatieJucator(Z)),
    descrie(Z,H),
    cerceteazaCamera(T1),
    atom_concat(H,T1,R),!.

mutaJucator(_,R):-
        atom_concat('','In directia aceasta nu se afla nimic!\n',R).

inspecteaza(X,R1):-
    locatieObiect(X,jucator),
    descrie(X,R1).

inspecteaza(_,X):-atom_concat('','Nu ai acest obiect in rucsac!\n',X).

harta():-locatieJucator(X),descrie(X,_),!.

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
    assert(jocSliding(jucat)),!.

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
    retract(jocXsi0(_)),
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
    startS(S),
    atom_concat(X,S,X1),
    retract(seJoaca(_)),
    assert(seJoaca(sudoku)),
    retract(jocSudoku(_)),
    assert(jocSudoku(jucat)),!.


% Jocul este restrictionat unei singure camere
incepeJoc(sliding,X):-atom_concat('','Nu te aflii in biblioteca!', X).
incepeJoc(xsi0,X):-atom_concat('','Nu te aflii in camera de zi!', X).
incepeJoc(dilema,X):-atom_concat('','Nu te aflii in camera lui Bogdan!', X).
incepeJoc(hunter,X):-atom_concat('','Nu te aflii in camera Mariei!', X).
incepeJoc(foarfecahartiepiatra,X):-atom_concat('Nu te afli in camera lui Mihai','!', X).
incepeJoc(sudoku,X):-atom_concat('Nu te afli in camera lui Andrei','!', X).

stopJoc(sliding):-stop().
stopJoc(xsi0):-stopx().
stopJoc(dilema):-stopD().
stopJoc(hunter):-stopH().
stopJoc(foarfecahartiepiatra):-stopJ().
stopJoc(sudoku):-stopS().

%adaugaEnergie(Y,X,Z):- Z is Y + X,
    %retract(energieJucator(Y)),
    %assert(energieJucator(Z)).


restart(X):-
        retract(jocSliding(_)),
        assert(jocSliding(disponibil)),
        retract(jocXsi0(_)),
        assert(jocXsi0(disponibil)),
        retract(jocDilema(_)),
        assert(jocDilema(disponibil)),
        retract(jocHunter(_)),
        assert(jocHunter(disponibil)),
        retract(jocSudoku(_)),
        assert(jocSudoku(disponibil)),
        retract(jocFoarfecahartiepiatra(_)),
        assert(jocFoarfecahartiepiatra(disponibil)),
        retract(nivelSelectat(_)),
        assert(nivelSelectat(null)),
        retract(seJoaca(_)),
        assert(seJoaca(momentanNimic)),
        retract(locatieJucator(_)),
        assert(locatieJucator(hol)),
        retract(cod_birou(_)),
        assert(cod_birou(aaaaa)),
        retract(locatieObiect(scrisoareLitera1,_)),
        assert(locatieObiect(scrisoareLitera1,cameraEE)),
        retract(locatieObiect(ghicitoare,_)),
        assert(locatieObiect(ghicitoare,cameraW)),
        retract(locatieObiect(cheie,_)),
        assert(locatieObiect(cheie,seif)),
        retract(locatieObiect(seif,_)),
        assert(locatieObiect(seif,birou)),
        retract(locatieObiect(carteLitera2,_)),
        assert(locatieObiect(carteLitera2,cameraWW)),
        retract(locatieObiect(bilet,_)),
        assert(locatieObiect(bilet,hol)),
        retract(locatieObiect(lanterna,_)),
        assert(locatieObiect(lanterna,bucatarie)),
        retract(locatieObiect(mar,_)),
        assert(locatieObiect(mar,cameraEE)),
        retract(locatieObiect(biscuit,_)),
        assert(locatieObiect(biscuit,bucatarie)),
        retract(locatieObiect(scrisoareLitera5,_)),
        assert(locatieObiect(scrisoareLitera5,debara)),
        retract(locatieObiect(carteLitera4,_)),
        assert(locatieObiect(carteLitera4,cameraNE)),
        retract(energieJucator(_)),
        assert(energieJucator(0)),
        retract(raspunsGhicitoare(_)),
        assert(raspunsGhicitoare(aaaaaaaaa)),
        retract(viata(_)),
        assert(viata(100)),
        retract(amInceput(_)),
        assert(amInceput(nu)),
        retract(codReal(_)),
        assert(codReal(aaaaa)),
        atom_concat('
                           Evadeaza din captivitate.\n
                           Da dovada de gandire logica.\n
                           Demonstreaza aptitudinile tale de strateg.\n
                            ','',X),!.