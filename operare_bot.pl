:- module(operare_bot, [raspuns/1,
                        procesareText/1,
                        numarPotriviri/1]).

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
    %numarPotriviri(Np),
    %write(Np),
    raspunsNegativ(),
    retract(numarPotriviri(_)),
    assert(numarPotriviri(0)),!;
    raspunsNegativ(),
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

raspunsNegativ():-
        numarPotriviri(Np),
        Np = 0 ->
        retractall(raspuns(_)),
        assert(raspuns('Din nefericire nu am un raspuns la aceasta intrebare.')),!;
        true,!.

intrebare([cum, pot, juca, nou, comanda, comenzi, control,start, porni, pornire,
 porneste, regula, joc,mini, provocare, logic, argument ],
' Pentru inceperea unui joc se va utiliza:
     comanda: Joc cu argumentul: jocul dorit').

intrebare([cum,pot,  comanda, comenzi, control,dificultate,dificultatea, nivel,
 greutate,usurinta, intensitate, argument ],
'Pentru selectarea nivelului de dificultate se utilizeaza:
    comanda: Nivel cu argumentul : nivel dorit
    sunt disponibile 4 optiuni: usor, mediu, dificil si imposibil.').

intrebare([cum,pot, comanda, comenzi, control, argument,inventar,obiect,
pastreaza,pastrez,ridica, pastra, plasa, colecta, colecteaza ],
'Pentru plasarea unui obiect in inventar se utilizeaza:
    comanda: Pastreaza cu argumentul: obiect dorit').

intrebare([cum, pot, comanda, comenzi, control, argument,inventar,obiect,
inspecteaza,inspecta, analizare, analiza, analizat, inspectie, descriere ],
'Inspecteaza un obiect descoperit cu comanda
    comanda: Inspecteaza cu argumentul: obiect dorit').

intrebare([cum, pot, comanda, comenzi, control, argument,cod,scriere,scrie, introdu,
introducere, introduce, completa,completare, completeaza ],
'Completarea codului pentru acces in Birou
    comanda: Cod cu argumentul: codul de 5 litere').

intrebare([cum,mutare,muta, pot, comanda, comenzi, control, argument,completare, 
sudoku, joc,mutare, juca, argumente ],
'Mutarile pentru jocul sudoku sunt realizate cu :
    comanda: Sudoku cu argument1: pozitia si argument2: valoarea noua').

intrebare([cum, pot, comanda, comenzi, control, argument, repara, lanterna,
 fara, energie, ramane, consum ,consumata, consumare, liminat, utilizare,baterie,a ],
'In cazul in care lanterna ramane fara energie se utilizeaza: 
    comanda: Repara cu argumentul: lanterna
Este necesara si o baterie.').

intrebare([cum, pot, comanda, comenzi, control, argument,arunca, aruncare, renunta,
 inlaturare, golire, goli, eliberare,elibera,spatiu,inventar],
'Exista o limita de 6 obiecte pe care jucatorul le poate cara la un moment dat.
Pentru renuntarea la un obiect din inventar se utilizeaza:
    comanda: Arunca cu argumentul: obiect dorit').

intrebare([poveste,plot,continut,despre,descriere,descriemi,
descrie,descri, povesteste,jocul,explica,spunemi,scop,scopul,care,tinta],
'Ești captiv în casa X. Ușa de la ieșire este încuiată.
Poți cerceta casa dar fiecare tranziție între camere te costă energie. 
Vei găsi obiecte, aceste pot fi folosite pentru a câștiga energie sau pentru alte activități.
Pentru navigare utilizează butoanele N S E V. 
Accesul în unele canere este restricționat.
Trebuie sa evadezi.').

intrebare([pot,miscare, circulare, tranzitie, cum, 
traversare, traversez, misc, mutare, mut,
 traversez, parcurg, parcurgere],
'Pentru navigare utilizează butoanele N S E V. 
Accesul în unele canere este restricționat.').

intrebare([mini, jocuri, probleme , logice , provocari, puncte, extra ,recompense,
ce, jocuri, sunt, disponibile, lista, disponibil],
'Vei avea posibilitatea de a juca mini jocuri. Daca reusesti sa castigi vei primi recompense. 
Sunt disponibile jocurile: x si 0, sudoku, sliding, foarfeca hartie piatra, hunter si dilema.
Mini jocurile nu produc niciodata aceasi varianta a jocului. ').

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
 continuare,optiuni, pastrace, intrerupere, intrerupe,salvez],
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

intrebare([arunca, inventar,inventarul, plin, obiecte, limita, maxim, numar, pastreaza, pastrare, pastreze],
'In camerele casei sunt distribuite in mod aleator obiecte.
Ele sunt obiecte comestibile, unelte utile precum lanterna sau bandaje sau 
obiecte ce contin indicii precum litere ale unor parole.
Exista o limita de obiecte pe care jucatorul le poate cara la un moment dat.
Daca inventarul este plin jucatorul poate scapa de obiectele mai putin importante prin comanda arunca.').


intrebare([obiecte, gasite, obiect, mananca, consuma, comestibile,unelte , pastreaza, mar, bisciut],
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

intrebare([cum, pot , vedea, mesajele, anterioare,sa, revin, 
reveni, la , inainte, inapoi, raspuns, anterior, mesaj, raspunsul, intoarcere, tranzitie],
' Doua butoane Inainte si Inapoi perrmit circularea intre ultimele trei mesaje afisate pe ecran.').


intrebare([ce,se, intampla, am,de, ramas,fara, punct, energie,daca, raman, voi,
 ramane, puncte, epuizat, nu, mai, pot,naviga,circula],
'În cazul în care utilizatorul rămâne fără puncte de energie el nu mai poate naviga harta.
În acest caz el poate consuma obiecte comestibile din inventar pentru energie.
Pentru prevenirea acestei situații este recomandată câștigarea mini jocurilor.
Acestea acordă recompense precum punctele de energie.').

intrebare([nu, ma, pot, misca, naviga, harta,blocat, este, permisa,interzisa,restrictie, incerc],
'Exista mai multe motive pentru care utilizatorul nu poate naviga harta.
Este posibil ca utilizatorul sa nu fi selectat un nivel de dificultate.
O alta posibilitate este epuizarea punctelor de energie sau viata.').

intrebare([cum, pot , restabili, sanatatea, viata, imbunatati,utiliza,
utilizez, bandaje,bandaja, am, gasit, ce , face, aplic, aplica  ],
' In cazul in care a fost decoperit un bandaj el poate fi utilizat pentru a imbunatati starea de sanatate a jucatorului.
    Bandajul nu apare in fiecare runda. Frecventa cu care acesta apare este determinata de nivlul de dificultate ales.').

intrebare([harta, arata, ce, utilizare, rol, cum, pot, poate, utilizat, harti  ],
'Butonul harta prezinta jucatorului o harta a partilor din casa pe care lea vizitat in jocul curent.
    Harta jocului poate sa difere. ').

intrebare([cum, pot, vedea, cate, litere, am,strans, adunat, colectat, parte, parola, din, ale, parolei ],
' Prin comanda Parola Jucatorul poate vedea literele parole pe care lea descoperit.
     Spre exemplu daca au fost gasite literele 2 si 5 si aceste sunt T si G comanda parola va afisa *T**G.').

intrebare([cum, pot, cheie,seif, preiau, prelua, pastra, accesa, ghicitoare, raspunde, raspuns ],
'Pentru A prelua cheia din seif trebuie sa raspunzi corect la o ghicitoare gasita in camerele casei. 
     Scrie raspunsul cu comanda ghicitoare si raspunsul ca argument. ').

intrebare([rol, scop, functionalitatea, scopul, rolul, utilizare, intrebuintare,utoilizate, buton ,butoanele, interfata ],
'Butoanele numerotate de la 1 la 9 sunt pentru jocul de x si 0 impotriva calculatorului. 
Pentru navigare utilizează butoanele N S E V. 
Butoanele U D R L controleaza jocul sliding.').

intrebare([comenzi, nu, necesita, argumente, nevoie, functioneaza, fara, argument],
'Comenzi ce nu necesita argumente
    Inventar -- Listarea inventaruiui 
    Energie  -- Afisarea energiei curente
    Viata    -- Afisarea starii de sanatate
    Restart  -- Resetarea datelor jocului
    Optiuni  -- Listarea fisierelor cu jocuri salvate 
    Ajutor   -- Ajutor pentru jocul sliding 8
    Parola   -- Afisarea literelor din parola descoperite
    Locatie  -- Examinarea imprejurimilor jucatorului
    Bandajare-- Utilizarea unui bandaj pentru crestere nivelului de viata').

intrebare([hunter,joc,jocul,joaca],
'Tabla de joc este umplută de pioni în 7 poziții din 9.
Pe poziția marcata cu k se află un cal ce se mițcă în modul specific jocului de șah.
Încearcă să capturezi toți pionii în 7 mișcări.
Selectează pozițiia pe care dorești să se deplaseze calul.
Fiecare mutare fie e validă sau invalidă este contorizată.
Jocul este cronometrat.').

intrebare([dilema, prizonierilor,prizonierului,joc,jocul,joaca],
'Tu și prietenul tău ați fost prinși în timpul unui jaf minor!\n
Amandoi puteți fi condamnați la un an de închisoare. Sunteți interogați în camere separate. \n
Procurorii va suspectează de comiterea unei serii întregi de jafuri dar nu au suficiente dovezi.\n
Ei iți cer o marturisire scrisă. \n
Ai posibilitatea de a declara că prietenul tău a comis restul jafurilor.\n
O altă variantă este acea de a declara că nu ști nimic despre restul furturilor.\n
Dacă mărturisești este posibil să primești o reducere a sentinței.\n
Dacă amândoi negați acuzațiile judecătorul nu vă poate condamna la mai mult de un an de închisoare.\n
Cel mai probabil și prietenul tau a primit aceiași ofertă.\n
Dacă prietenul tău declara că tui ai comis jafurile vei primi o sentință mult mai lungă.\n
Dacă amandoi vă acuzați reciproc procurorii vor ști că ați fost complici și astfel sentința se împarte.\n
Când ai luat decizia finală execută comanda Decizie cu unul din argumentele recunoaște sau neagă.').

intrebare([foarfecahartiepiatra,foarfeca,hartie,piatra,joc,jocul,joaca],
'Se joaca trei runde de foarfeca hartie piatra.
Jucatorul poate sa isi modiifce alegerea inaintea orcarei dintre cele 3 runde.
La final daca jucatorul a castigat el primeste un punct de energie.').

intrebare([sudoku,joc,jocul,joaca],
'Rezolvă această problemă conform regulilor clasice de sudoku!
Nu trebuie să existe duplicate pe linii coloane sau în pătratele de 3X3 delimitate.
Pozitiile ocupate de numere mai mari ca 9 trebuie completate.
Completarea unei pozitii se face prin introducerea acesteia ca Argument1 si a valorii noi ca Argument2. 
Jocul este cronometrat.\n').

intrebare([xsi0 , x, si,0,o,jocul,joc,joaca],
'Se respecta regulile clasice ale jocului de x si 0.
Captureaza 3 pozitii consecutive pe linie coloana sau diagonala.
Utilizatorul are prima mutare si joaca cu X.
Dupa fiecare mutare a utilizatorului calculatorul raspunde cu o mutare proprie.
Mutarile alterneaza pana cand una din parti a castigat sau sa ajuns la remiza.
Acest joc ofera o recompensa importanta. ').

intrebare([sliding,puzzle,8,jocul,joc,joaca],
'Pozitiile de la 0 la 8 trebuie ordonate crescator.
Starea tinta este [0,1,2,3,4,5,6,7,8].
Exista o restrictie. Doar cifra 0 poate face schimb de pozitii cu vecinii sai. 
Jocul este controlat prin butoanele D, R, L și U astfel: 
    R mută poziția 0 la dreapta, 
    L mută poziția 0 la stânga, 
    U mută poziția 0 pe coloană pe rândul superior și
    D mută poziția 0 pe coloană pe rândul inferior
Jocul este cronometrat.').