:- module(operare_bot, [raspuns/1,
                        procesareText/1,
                        numarPotriviri/1]).

:- dynamic numarPotriviri/1,
            raspuns/1.

numarPotriviri(0).
raspuns('Din nefericire nu am un răspuns la această întrebare.').

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
        assert(raspuns('Din nefericire nu am un răspuns la această întrebare.')),!;
        true,!.

intrebare([cum, pot, juca, nou, comanda, comenzi, control,start, porni, pornire,
 porneste, regula, joc,mini, provocare, logic, argument ],
'Pentru începerea unui joc se va utiliza:
     comanda: Joc cu argumentul: jocul dorit
Jocurile pot fi jucate doar în anumite camere.
Atunci când utilizatorul se află într-o asemena camera el este anunțat.
Este indicat și jocul disponibil.').

intrebare([cum,pot,  comanda, comenzi, control,dificultate,dificultatea, nivel,
 greutate,usurinta, intensitate, argument ],
'Pentru selectarea nivelului de dificultate se utilizează:
    comanda: Nivel cu argumentul : nivel dorit
    sunt disponibile 4 opțiuni: usor, mediu, dificil și imposibil.').

intrebare([cum,pot, comanda, comenzi, control, argument,inventar,obiect,
pastreaza,pastrez,ridica, pastra, plasa, colecta, colecteaza ],
'Pentru plasarea unui obiect în inventar se utilizează:
    comanda: Pastreaza cu argumentul: obiect dorit').

intrebare([cum, pot, comanda, comenzi, control, argument,inventar,obiect,
inspecteaza,inspecta, analizare, analiza, analizat, inspectie, descriere ],
'Inspectează un obiect descoperit cu comanda
    comanda: Inspecteaza cu argumentul: obiect dorit').

intrebare([cum, pot, comanda, comenzi, control, argument,cod,scriere,scrie, introdu,
introducere, introduce, completa,completare, completeaza ],
'Completarea codului pentru acces în Birou
    comanda: Cod cu argumentul: codul de 5 litere').

intrebare([cum,mutare,muta, pot, comanda, comenzi, control, argument,completare, 
sudoku, joc,mutare, juca, argumente ],
'Mutările pentru jocul sudoku sunt realizate cu :
    comanda: Sudoku cu argument1: poziția și argument2: valoarea nouă').

intrebare([cum, pot, comanda, comenzi, control, argument, repara, lanterna,
 fara, energie, ramane, consum ,consumata, consumare, liminat, utilizare,baterie,a ],
'În cazul în care lanterna rămâne fără energie se utilizează: 
    comanda: Repara cu argumentul: lanterna
Este necesara și o baterie.').

intrebare([cum, pot, comanda, comenzi, control, argument,arunca, aruncare, renunta,
 inlaturare, golire, goli, eliberare,elibera,spatiu,inventar],
'Există o limită de 6 obiecte pe care jucătorul le poate căra la un moment dat.
Pentru renunțarea la un obiect din inventar se utilizează:
    comanda: Arunca cu argumentul: obiect dorit').

intrebare([poveste,plot,continut,despre,descriere,descriemi,
descrie,descri, povesteste,jocul,explica,spunemi,scop,scopul,care,tinta],
'Ești captiv în casa X. Ușa de la ieșire este încuiată.
Poți cerceta casa dar fiecare tranziție între camere te costă energie. 
Vei găsi obiecte, aceste pot fi folosite pentru a câștiga energie sau pentru alte activități.
Pentru navigare utilizează butoanele N S E V. 
Accesul în unele canere este restricționat.
Trebuie să evadezi.').

intrebare([pot,miscare, circulare, tranzitie, cum, 
traversare, traversez, misc, mutare, mut,
 traversez, parcurg, parcurgere],
'Pentru navigare utilizează butoanele N S E V. 
Accesul în unele canere este restricționat.').

intrebare([mini, jocuri, probleme , logice , provocari, puncte, extra ,recompense,
ce, jocuri, sunt, disponibile, lista, disponibil],
'Vei avea posibilitatea de a juca mini jocuri. Dacă reușești să câștigi vei primi recompense. 
Sunt disponibile jocurile: x si 0, sudoku, sliding, foarfeca hartie piatra, hunter și dilema.
Mini jocurile nu produc niciodată aceași variantă a jocului. ').

intrebare([capcane, pericol, primejdie, pierdere, pierd, capcana, vitalitate],
'Unele camere sunt periculoase. Ele conțin capcane și pot pune în pericol viața jucătorului.
Prin comanda viața poți vedea care este starea ta curentă.').

intrebare([dificultate,dificultatea, stabilire , stabilita, aleasa, 
nivel, nivele, dicil, selectez, selectare, alege, alegere],
'Inițial jucătorul trebuie să selecteze dificultatea.
Există 4 nivele disponibile usor, mediu, dificil și imposibil. 
Dificultatea e selectată prin comanda nivel cu un argument, acesta fiind nivelul ales.').

intrebare([restart, reincepe, reincepere, incepere, incercare, nou, noua , am, pierdut, murit, rejucare, rejuca],
'Cu ajutorul comenzii restart jucătorul poate reseta toate elementele jocului
 ce au fost modificate, la starea inițială.').

intrebare([salvare, retinere, mentine, salveaza, salva, incarcare,
 continuare,optiuni, pastrace, intrerupere, intrerupe,salvez],
'Utilizatorul are posibilitatea de a salva progresul realizat prin comanda salvează.
Aceasta reține într-un fișier (al cărui nume este introdus ca argument) toate datele rundei curente.
Pentru a încărca un joc salvat  jucăorul utilizează comanda incarca urmată de numele fișierului dorit.
Prin comanda opțiuni sunt prezentate variantele jocului ce au fost salvate și pot fi încărcate.').

intrebare([clasament, concurs, competitie, ordine, ordonare,rezultate, castigare, castigator],
'Este creat cate un clasament pentru fiecare nivel de dificultate.
După ce jocul a fost finalizat cu succes jucătorul introduce numele cu care va apărea în clasament.
Clasamentul se bazează pe numărul de puncte de energie cu care jucatorul a terminat jocul.
Cu cât numărul este mai mare cu atat jucătorul va fi mai sus în clasament.').

intrebare([limita, timp,restrictie,limitare, cronometru, cronometrat, cronometrate,
 finalifate,finalizeaza, finalizez, finalizare],
'Trei dintre mini jocurile disponibile sunt cronometrate.
Ele trebuie să fie rezolvate într-un număr prestabilit de secunde.
După scurgerea timpului jocurile nu mai accepta mutări.
La fiecare mutare nouă se va specifica câte secunde au mai rămas până la închiderea jocului.
Timpul pus la dispoziți jucătorului e calculat în funcție de joc și de nivelul de dificultate ales.').

intrebare([arunca, inventar,inventarul, plin, obiecte, limita, maxim, numar, pastreaza, pastrare, pastreze],
'În camerele casei sunt distribuite în mod aleator obiecte.
Ele sunt obiecte comestibile, unelte utile precum lanterna sau bandaje sau 
obiecte ce conțin indicii precum litere ale unor parole.
Există o limită de obiecte pe care jucătorul le poate căra la un moment dat.
Dacă inventarul este plin jucătorul poate scăpa de obiectele mai puțin importante prin comanda arunca.').


intrebare([obiecte, gasite, obiect, mananca, consuma, comestibile,unelte , pastreaza, mar, bisciut],
'Obiectele sunt plasate în inventar cu comanda pastreaza. 
Obiectele comestibile pot fi consumate prin comanda mananca. ').

intrebare([mini, joc , problema, logica, reguli, provocare  ],
'Atunci când se dorește începerea unui joc se utilizează comanda joc urmată de jocul respectiv ca argument. 
Imediat după începerea unui joc vor fi prezentate și regulile și restricțiile acestuia. ').

intrebare([harta, camere, parcure, parcurs, investigate, camera ],
'Butonul harta prezintă jucătorului o hartă a părților din casă pe care lea vizitat în jocul curent.').

intrebare([intuneric, intunecat, intunecata, bezna,
 lumina, lanterna, sursa , lumineaza ],
'Unele camere nu sunt luminate suficient pentru a permite circularea.
În cazul acestor camere este necesară o sursă de lumină precum o lanternă.
După un anumit număr de utilizări lanterna rămâne fără energie și nu mai poate fi  utilizată.
În acest caz este necesară repararea lanternei. Pentru reparare este necesară o baterie nouă.').

intrebare([cum, pot , vedea, mesajele, anterioare,sa, revin, 
reveni, la , inainte, inapoi, raspuns, anterior, mesaj, raspunsul, intoarcere, tranzitie],
'Două butoane Inainte și Inapoi permit circularea între ultimele trei mesaje afișate pe ecran.').


intrebare([ce,se, intampla, am,de, ramas,fara, punct, energie,daca, raman, voi,
 ramane, puncte, epuizat, nu, mai, pot,naviga,circula],
'În cazul în care utilizatorul rămâne fără puncte de energie el nu mai poate naviga harta.
În acest caz el poate consuma obiecte comestibile din inventar pentru energie.
Pentru prevenirea acestei situații este recomandată câștigarea mini jocurilor.
Acestea acordă recompense precum punctele de energie.').

intrebare([nu, ma, pot, misca, naviga, harta,blocat, este, permisa,interzisa,restrictie, incerc],
'Există mai multe motive pentru care utilizatorul nu poate naviga harta.
Este posibil ca utilizatorul să nu fi selectat un nivel de dificultate.
O altă posibilitate este epuizarea punctelor de energie sau viață.').

intrebare([cum, pot , restabili, sanatatea, viata, imbunatati,utiliza,
utilizez, bandaje,bandaja,bandajare, am, gasit, ce , face, aplic, aplica ,bandaj ],
'Punctele de viață pot fi pierdute în unele camere periculoase.
Epuizarea tuturor acestor puncte duce la pierderea jocului.
În cazul în care a fost descoperit un bandaj el poate fi utilizat pentru
a îmbunătăți starea de sănătate a jucătorului. Bandajul nu apare în fiecare rundă.
Frecvența cu care acesta apare este determinată de nivlul de dificultate ales.').

intrebare([harta, arata, ce, utilizare, rol, cum, pot, poate, utilizat, harti  ],
'Butonul harta prezintă jucătorului o hartă a părților din casă pe care lea vizitat în jocul curent.
    Harta jocului poate să difere. ').

intrebare([cum, pot, vedea, cate, litere, am,strans, adunat, colectat, parte, parola, din, ale, parolei ],
'Prin comanda Parola Jucatorul poate vedea literele parole pe care lea descoperit.
     Spre exemplu dacă au fost găsite literele 2 și 5 și aceste sunt T și G comanda parola va afișa *T**G.').

intrebare([cum, pot, cheie,seif, preiau, prelua, pastra, accesa, ghicitoare, raspunde, raspuns ],
'Pentru A prelua cheia din seif trebuie să răspunzi corect la o ghicitoare găsită în camerele casei. 
     Scrie răspunsul cu comanda ghicitoare și răspunsul ca argument. ').

intrebare([rol, scop, functionalitatea, scopul, rolul, utilizare, intrebuintare,utoilizate, butoane, buton ,butoanele, interfata ],
'Butoanele numerotate de la 1 la 9 sunt pentru jocul de x si 0 împotriva calculatorului. 
Pentru navigare utilizează butoanele N S E V. 
Butoanele U D R L controleaza jocul sliding.').

intrebare([comenzi, nu, necesita, argumente, nevoie, functioneaza, fara, argument],
'Comenzi ce nu necesită argumente
    Inventar -- Listarea inventaruiui 
    Energie  -- Afișarea energiei curente
    Viata    -- Afișarea stării de sănătate
    Restart  -- Resetarea datelor jocului
    Optiuni  -- Listarea fișierelor cu jocuri salvate 
    Ajutor   -- Ajutor pentru jocul sliding 8
    Parola   -- Afișarea literelor din parolă descoperite
    Locatie  -- Examinarea împrejurimilor jucătorului
    Bandajare-- Utilizarea unui bandaj pentru creștere nivelului de viață').

intrebare([hunter,joc,jocul,joaca,joacă],
'Tabla de joc este umplută de pioni în 7 poziții din 9.
Pe poziția marcată cu k se află un cal ce se mișcă în modul specific jocului de șah.
Încearcă să capturezi toți pionii în 7 mișcări.
Selectează pozițiia pe care dorești să se deplaseze calul.
Fiecare mutare fie e validă sau invalidă este contorizată.
Jocul este cronometrat.').

intrebare([dilema, prizonierilor,prizonierului,joc,jocul,joaca,joacă],
'Doi infractori au fost prinși în timpul unui jaf minor!
Amândoi pot fi condamnați la un an de închisoare. Ei sunt interogați în camere separate. 
Procurorii îi suspectează de comiterea unei serii întregi de jafuri dar nu au suficiente dovezi.
Procurorii cer fiecărui suspect o mărturisire scrisă.
Fiecare suspect are posibilitatea de a declara că prietenul său a comis restul jafurilor de unul singur.
O altă variantă este accea de a declara că nu știe nimic despre restul furturilor.
Dacă suspectul își acuză complicele este posibil să primească o reducere a sentinței pentru cooperare.
Dacă amândoi negagă acuzațiile judecătorul nu îi poate condamna la mai mult de un an de închisoare.
Ambii suspecți primesc aceași ofertă.
Dacă unul dintre suspecți nu cooperează dar este trădat de complicele său acesta primește o pedeapsă mult mai lungă.
Dacă ambii suspecți se acuză reciproc procurorii vor ști că au fost complici și astfel sentința se împarte.
Ce decizie ai lua în locul unui deținut în aceste condiții?
Când ai luat decizia finală execută comanda Decizie cu unul din argumentele recunoaste sau neaga.').

intrebare([foarfecahartiepiatra,foarfeca,hartie,piatra,joc,jocul,joaca,joacă],
'Se joacă trei runde de foarfeca hartie piatra.
Jucătorul poate să își modiifce alegerea înaintea oricărei dintre cele 3 runde.
După start utilizează comanda Foarfecahartiepiatra cu unul din argumentele:
        *piatră
        *foarfecă
        *hârtie
La final dacă jucătorul a câștigat el primește un punct de energie.').

intrebare([sudoku,joc,jocul,joaca,joacă],
'Rezolvă această problemă conform regulilor clasice de sudoku!
Nu trebuie să existe duplicate pe linii coloane sau în pătratele de 3X3 delimitate.
Pozițiile ocupate de numere mai mari ca 9 trebuie completate.
Completarea unei poziții se face prin introducerea acesteia ca Argument1 și a valorii noi ca Argument2. 
Jocul este cronometrat.\n').

intrebare([xsi0 , x, si,0,o,jocul,joc,joaca,joacă],
'Se respectă regulile clasice ale jocului de x și 0.
Captureaza 3 poziții consecutive pe linie coloană sau diagonală.
Utilizatorul are prima mutare și joacă cu X.
După fiecare mutare a utilizatorului calculatorul răspunde cu o mutare proprie.
Mutările alternează până cand una din părți a câștigăt sau sa ajuns la remiză.
Acest joc oferă o recompensă importantă. ').

intrebare([sliding,puzzle,8,jocul,joc,joaca,joacă],
'Pozițiile de la 0 la 8 trebuie ordonate crescător.
Starea țintă este [0,1,2,3,4,5,6,7,8].
Există o restricție. Doar cifra 0 poate face schimb de poziții cu vecinii sai. 
Jocul este controlat prin butoanele D, R, L și U astfel: 
    R mută poziția 0 la dreapta, 
    L mută poziția 0 la stânga, 
    U mută poziția 0 pe coloană pe rândul superior și
    D mută poziția 0 pe coloană pe rândul inferior
Jocul este cronometrat.').

intrebare([nivel],
'Pentru selectarea nivelului de dificultate se utilizează:
    comanda: Nivel cu argumentul : nivel dorit
    sunt disponibile 4 opțiuni: usor, mediu, dificil si imposibil.
Nivelul de dificultate are un rol inportant în
    Determinarea dificultații minijocurilor.
    Determinarea punctelor de energie la start.').

intrebare([energie],
'Punctele de energie sunt vitale pentru continoarea jocului.
Fără acestea jucătorul nu pote circula prin camerele casei și nu poate finaliza jocul.
Fiecare tranziție costă un punct.
Se pot acumula puncte de energie prin câștigarea mini jocurilor.
Obiectele comestibile oferă și ele energie.').

intrebare([inventar],
'În camerele casei sunt distribuite în mod aleator obiecte.
Ele sunt obiecte comestibile, unelte utile precum lanterna sau bandaje sau 
obiecte ce conțin indicii precum litere ale unor parole.
Există o limită de obiecte pe care jucătorul le poate căra la un moment dat.
Dacă inventarul este plin jucătorul poate scăpa de obiectele mai puțin importante prin comanda arunca.
Pentru plasarea unui obiect în inventar se utilizează:
    comanda: Pastreaza cu argumentul: obiect dorit').

intrebare([incarca],
'Pentru a încărca un joc salvat  jucătorul utilizează comanda incarca urmată de numele fișierului dorit.
Prin comanda opțiuni sunt prezentate variantele jocului ce au fost salvate și pot fi încărcate.').

intrebare([decizie],
'Prin comanda decizie este luată decizia finală în cazul jocului dilema prizonierului.
Este utilizată comanda dilema cu unul din argumentele recunoaste sau neaga').

intrebare([ajutor],
'Sliding 8 este un  puzzle logic inclus în aplicație.
Dacă jucătorul rămâne blocat încercând să rezolve această problema el poate utiliza comanda ajutor.
Comanda ajutor este disponibilă doar pentru nivelele usor, mediu si dificil.
Această opțiune oferă primele 4 mutări pe care utilizatorul trebuie să le facă pentru a câștiga.').

intrebare([locatie],
'Cu ajutorul comenzii locatie poți inspecta împrejurimile.
Vei află ce camere pot fi explorate în continoare.
Ce obiecte se află în câmpul tău vizual.
Dar și ce jocuri sunt disponibile.').

intrebare([nu , am ,ai, selectat , nivelul, dificultate],
'Nivelul de dificultate trebuie ales la inceperea jocului.
El are un rol inportant în
**Determinarea dificultății minijocurilor.
**Determinarea punctelor de energie la start.
Pentru selectarea nivelului de dificultate se utilizează:
**comanda: Nivel cu argumentul : nivel dorit
**sunt disponibile 4 opțiuni: usor, mediu, dificil si imposibil.
').

intrebare([este, prea, intuneric, aceasta, camera, intunecata],
'Există câteva restricții de navigare.
În cazul camerelor ce nu sunt luminate corespunzator
    este necesară o lanternă pentru acces.
Lanterna are un număr limitat de utilizari și poate fi reparată cu ajutorul unei baterii.
').

intrebare([directia, aceasta, nu ,afla ,nimic],
'Încerci să navighezi înspre o direcție greșită.
În partea aceasta a camerei nu există nici o legătură cu o altă cameră.
Încearcă o altă variantă de navigare.
Utilizează comanda Locatie pentru a descoperi ce opțiuni ai.
').

intrebare([nu, acest, obiect ,inventar, rucsac],
'Pentru a realiza o acțiune asupra unui obiect el trebuie să se afle în inventar.
Astfel pentru comenzile mananca sau inspecteaza trebuie oferit
ca argument un obiect existent în inventar.
').

intrebare([acest, obiect, nu, este, comestibil],
'Doar câteva obiecte pot fi consumate pentru a obține puncte de energie.
Acestea sunt mărul și biscuitul.
').

intrebare([actiune, imosibila, nu, vad, obiectul],
'Penru a fi manipulat un obiect trebuie să se afle în câmpul vizual al jucătorului.
').

intrebare([cod, incorect, gresit],
'Codul introdus este incorect. 
Colectează toate literele parolei și încearcă iar.
').

intrebare([ai, murit],
'Ai pierdut jocul.
Utilizează comanda Restart pentru a începe o încercare nouă.
').

intrebare([ai, jucat , acest, mini, joc, deja],
'Pentru fiecare mini joc este disponibilă o singură încercare.
').