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
    retract(numarPotriviri(_)),
    assert(numarPotriviri(0)),!;
    retract(numarPotriviri(_)),
    assert(numarPotriviri(0)),!.

calcul_aux(Cuvinte):-
        intrebare(CuvinteCheie,Raspuns),
        numarPotriviri(NP),
        scor(Cuvinte,CuvinteCheie,Scor),
        Scor > NP ->
        retract(numarPotriviri(_)),
        assert(numarPotriviri(Scor)),
        retract(raspuns(_)),
        assert(raspuns(Raspuns)).


intrebare([poveste,plot,continut,despre,descriere,descriemi,
descrie,descri, povesteste,jocul,explica,spunemi],
'Ești captiv în casa X. Ușa de la ieșire este încuiată.
Poți cerceta casa dar fiecare tranziție între camere te costă energie. 
Vei găsi obiecte, aceste pot fi folosite pentru a câștiga energie sau pentru alte activități.
Pentru navigare utilizează butoanele N S E V. 
Accesul în unele canere este restricționat.').

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

intrebare([limita, timp,restrictie,limitare, cronometru, finalizare],
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