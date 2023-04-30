:- module(operare_bot, [raspuns/1,
                        procesareText/1]).

:- dynamic numarPotriviri/1,
            raspuns/1.

numarPotriviri(0).
raspuns('Din nefericire nu am un raspuns la aceasta intrebare.').

procesareText(Text):-
    downcase_atom(Text, LowercaseAtom),    
    atom_string(LowercaseAtom, LowercaseString),
    split_string(LowercaseString, " ", "", Cuvinte),
    calcul(Cuvinte). 

apartineBot([G|_],G).
apartineBot([_|T],G):-apartineBot(T,G),!.


scor([],_,0).
scor([X|T],Y,R1):-
        scor(T,Y,R),
        atom_string(X1, X),
        apartineBot(Y,X1),
        R1 is R + 1,!.
scor([_|T],Y,R):-
        scor(T,Y,R),!.

calcul(Cuvinte):-
    calcul_aux(Cuvinte) ->
    numarPotriviri(Np),
    write(Np),
    retract(numarPotriviri(_)),
    assert(numarPotriviri(0)),!;
    retract(numarPotriviri(_)),
    assert(numarPotriviri(0)),!.

calcul_aux(Cuvinte) :-
    findall((CuvinteCheie, Raspuns), intrebare(CuvinteCheie, Raspuns), Perechi),
    iterare(Perechi, Cuvinte).

iterare([], _).
iterare([(CuvinteCheie, Raspuns)|Rest], Cuvinte) :-
    scor(Cuvinte, CuvinteCheie, Scor),
    numarPotriviri(NP),
    (Scor > NP ->
        retractall(numarPotriviri(NP)),
        assert(numarPotriviri(Scor)),
        retractall(raspuns(_)),
        assert(raspuns(Raspuns))
    ;
        true
    ),
    iterare(Rest, Cuvinte).

intrebare([comanda, comenzi, control,start, porni, pornire,
 porneste, regula, joc,mini, provocare, logic, argument ],
' Pentru inceperea unui joc se va utiliza:
     comanda: Joc cu argumentul: jocul dorit').

intrebare([comanda, comenzi, control,dificultate, nivel,
 greutate,usurinta, intensitate, argument ],
'Pentru selectarea nivelului de dificultate se utilizeaza:
    comanda: Nivel cu argumentul : nivel dorit
    sunt disponibile 4 optiuni: usor, mediu, dificil si imposibil.').

intrebare([comanda, comenzi, control, argument,inventar,obiect,
pastreaza,ridica, pastra, plasa, colecta, colecteaza ],
'Pentru plasarea unui obiect in inventar se utilizeaza:
    comanda: Pastreaza cu argumentul: obiect dorit').

intrebare([comanda, comenzi, control, argument,inventar,obiect,
inspecteaza,inspecta, analizare, analiza, analizat, inspectie, descriere ],
'Inspecteaza un obiect descoperit cu comanda
    comanda: Inspecteaza cu argumentul: obiect dorit').

intrebare([comanda, comenzi, control, argument,cod,scriere,scrie, introdu,
introducere, completa,completare, completeaza ],
'Completarea codului pentru acces in Birou
    comanda: Cod cu argumentul: codul de 5 litere').

intrebare([comanda, comenzi, control, argument,completare, 
sudoku, joc,mutare, juca, argumente ],
'Mutare pentru jocul sudoku cu ajutoul:
    comanda: Sudoku cu argument1: pozitia si argument2: valoarea noua').

intrebare([comanda, comenzi, control, argument, repara, lanterna,
 fara, energie, ramane, consum ,consumata, consumare, liminat, utilizare,baterie,a ],
'In cazul in care lanterna ramane fara energie se utilizeaza: 
    comanda: Repara cu argumentul: lanterna
Este necesara si o baterie.').

intrebare([comanda, comenzi, control, argument,arunca, aruncare, renunta,
 inlaturare, golire, goli, eliberare,elibera,spatiu,inventar],
'Pentru renuntarea la un obiect din inventar se utilizeaza:
    comanda: Arunca cu argumentul: obiect dorit').

intrebare([poveste,plot,continut,despre,descriere,descriemi,
descrie,descri, povesteste,jocul,explica,spunemi,scop,scopul,care,tinta],
'Ești captiv în casa X. Ușa de la ieșire este încuiată.
Poți cerceta casa dar fiecare tranziție între camere te costă energie. 
Vei găsi obiecte, aceste pot fi folosite pentru a câștiga energie sau pentru alte activități.
Pentru navigare utilizează butoanele N S E V. 
Accesul în unele canere este restricționat.
Trebuie sa evadezi.').

intrebare([miscare, circulare, tranzitie, cum, 
traversare, traversez, misc, mutare, mut,
 traversez, parcurg, parcurgere],
'Pentru navigare utilizează butoanele N S E V. 
Accesul în unele canere este restricționat.').

intrebare([mini, jocuri, probleme , logice , provocari, puncte, extra ,recompense],
'Vei avea posibilitatea de a juca mini jocuri. Daca reusesti sa castigi vei primi recompense. ').

intrebare([capcane, pericol, primejdie, pierdere, pierd, capcana, vitalitate],
'Unele camere sunt periculoase. Ele contin capcane si pot pune in pericol viata jucatorului.
Prin comanda viata poti vedea care este starea ta curenta.').

intrebare([dificultate,dificultatea, stabilire , stabilita, aleasa, 
nivel, nivele, dicil, selectez, selectare, alege, alegere],
'Initial jucatorul trebuie sa selecteze dificultatea. Exista 4 nivele disponibile usor mediu dificil si imposibil. 
Dificultatea e selectata prin comanda nivel cu un argument, acesta fiind nivelul ales.').

intrebare([restart, reincepe, reincepere, incepere, incercare, nou, noua , am, pierdut, murit, rejucare, rejuca],
'Cu ajutorul comenzii restart jucatorul poate reseta toate elementele jocului ce au fost modificate la starea initiala.').

intrebare([salvare, retinere, mentine, salveaza, salva, incarcare,
 continuare,optiuni, pastrace, intrerupere, intrerupe],
'Utilizatorul are posibilitatea de a salva progresul realizat prin comanda salveaza.
Aceasta retine intr-un fisier (al carui nume este introdus ca argument) toate datele rundei curente.
Pentru a incarca un joc salvat  jucatorul utilizeaza comanda incarca urmata de numele fisierului dorit.
Prin comanda optiuni sunt prezentate variantele jocului ce au fost salvate si pot fi incarcate.').

intrebare([clasament, concurs, competitie, ordine, ordonare,rezultate, castigare, castigator],
' Este creat cate un clasament pentru fiecare nivel de dificultate.
Dupa ce jocul a fost finalizat cu succes jucatorul introduce numele cu care va aparea in clasament.
Clasamentul se bazeaza pe numarul de puncte de energie cu care jucatorul a terminat jocul.
Cu cat numarul este mai mare cu atat jucatorul va fi mai sus in clasament.').

intrebare([limita, timp,restrictie,limitare, cronometru, cronometrat, cronometrate,
 finalifate,finalizeaza, finalizez, finalizare],
'Trei dintre mini jocurile disponibile sunt cronometrate.
Ele trebuie sa fie rezolvate intr-un numar prestabilit de secunde.
Dupa curgerea timpului jocurile nu mai accepta mutari.
La fiecare mutare noua se va specifica cate secunde au mai ramas pana la inchiderea jocului.
Timpul pus la dispoziti jucatorului e calculat in functie de joc si de nivelul de dificultate ales.').

intrebare([arunca, inventar, plin, obiecte, limita, maxim, numar, pastreaza, pastrare, pastreze],
'In camerele casei sunt distribuite in mod aleator obiecte.
Ele sunt obiecte comestibile, unelte utile precum lanterna sau bandaje sau 
obiecte ce contin indicii precum litere ale unor parole.
Exista o limita de obiecte pe care jucatorul le poate cara la un moment dat.
Daca inventarul este plin jucatorul poate scapa de obiectele mai putin importante prin comanda arunca.').


intrebare([obiecte, gasite, obiect, mananca, consuma, comestibile,unelte  ],
'Obiectele sunt plasate in inventar cu comanda pastreaza. 
Obiectele comestibile pot fi consumate prin comanda mananca. ').

intrebare([mini, joc , problema, logica, reguli, provocare  ],
'Atunci cand se doreste inceperea unui joc se utilizeaza comanda joc urmata de jocul respectiv ca argument. 
Imediat dupa inceperea unui joc vor fi prezentate si regulile si restrictiile acestuia. ').

intrebare([harta, camere, parcure, parcurs, investigate, camera ],
'Butonul harta prezinta jucatorului o harta a partilor din casa pe care lea vizitat in jocul curent.').

intrebare([intuneric, intunecat, intunecata, bezna,
 lumina, lanterna, sursa , lumineaza ],
'Unele camere nu sunt luminate suficient pentru a permite circularea.
In cazul acestor camere este necesara o sursa de lumina precum o lanterna.
Dupa un anumit numar de utilizari lanterna ramane fara energie si nu mai poate fi  utilizata.
In acest caz este necesara repararea lanternei. Pentru reparare este necesara o baterie noua.').

intrebare([inainte, inapoi, raspuns, anterior, mesaj, raspunsul, intoarcere, tranzitie],
' Doua butoane Inainte si Inapoi perrmit circularea intre ultimele trei mesaje afisate pe ecran.').


intrebare([ce,se, intampla, am,de, ramas,fara, punct, energie,daca, raman, voi,
 ramane, puncte, epuizat, nu, mai, pot,naviga,circula],
'În cazul în care utilizatorul rămâne fără puncte de energie el nu mai poate naviga harta.
În acest caz el poate consuma obiecte comestibile din inventar pentru energie.
Pentru prevenirea acestei situații este recomandată câștigarea mini jocurilor.
Acestea acordă recompense precum punctele de energie.').

intrebare([aaa,bbb],
'Gresit').

intrebare([aaa,bbb,ccc],
'Corect').