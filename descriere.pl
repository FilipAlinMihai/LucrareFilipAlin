descrie(sliding,X):-
    atom_concat('Mută pozițiile în ordine crescătoare \n','Doar 0 are dreptul de a se mișca\n', X1),
    atom_concat(X1, 'Direcțiile de deplasare sunt: l-stânga, r-dreapta, u-sus și d-jos\n',X),!.

descrie(xsi0,X):-atom_concat('','Câștigă acest joc de x și 0 împotriva calculatorului!\n', X),!.

descrie(sudoku,X):-atom_concat('','Rezolvă această problemă conform regulilor clasice de sudoku!
Nu trebuie să existe duplicate pe linii coloane sau în pătratele de 3X3 delimitate\n', X),!.

descrie(hunter,X):-atom_concat('','Tabla de joc este umplută de pioni în 7 poziții din 9.
Pe poziția marcata cu k se află un cal ce se mițcă în modul specific jocului de șah.\n
Încearcă să capturezi toți pionii în 7 mișcări.
Selectează pozițiia pe care dorești să se deplaseze calul.
Fiecare mutare fie e validă sau invalidă este contorizată\n', X),!.

descrie(dilema,X):-atom_concat('','Tu și prietenul tău ați fost prinși în timpul unui jaf minor!\n
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
Când ai luat decizia finală execută comanda Decizie cu unul din argumentele recunoaște sau neagă.', X),!.

descrie(foarfecahartiepiatra,X):-
        atom_concat('','Joacă foarfecă hârtie piatră împotriva calculatorului!\n
Câștigă cel mai bun din trei runde!\n', X),!.

descrie(scrisoareLitera1,X):-
    litera1(R5),
    atom_concat('Prima literă a parolei este ',R5,X).

descrie(scrisoareLitera5,X):-
    litera5(R5),
    atom_concat('Ultima literă a parolei este ',R5,X).

descrie(carteLitera2,X):-
    litera2(R5),
    atom_concat('A doua literă a parolei este ',R5,X).

descrie(carteLitera3,X):-
    litera3(R5),
    atom_concat('A treia literă a parolei este ',R5,X).

descrie(carteLitera4,X):-
    litera4(R5),
    atom_concat('A patra literă a parolei este ',R5,X).

descrie(ghicitoare,X):-
    ghicitoareCurenta(Val),
    atom_concat(Val,'\n',X).
    

descrie(bilet,X):-
    atom_concat('','Ieșirea e încuiată iar cheia se află în Birou.\n',X).
    
descrie(lanterna,X):-
    atom_concat('','Foloseștio pentru a lumina camerele inacesibile\n',X).
   
descrie(mar,X):-
    atom_concat('','Un Măr.Consumăl pentr a primi energie\n',X).
    
descrie(biscuit,X):-
    atom_concat('','Un biscuit.Consumăl pentr a primi energie\n',X).
    

% Este descrisa camera in care se afla jucatorul si imprejurimile
% acesteia
descrie(biblioteca,X):-
    atom_concat('Te afli în bibliotecă. \nLa Nord se află Biroul \n',
    'Ușa de la intrarea în birou are un lacăt!\n',T1),
    atom_concat(T1,'Lacătul are un cod format din 5 litere\n',T2),
    atom_concat(T2,'La est e bucătăria\n',T4),
    atom_concat(T4,'La vest e camera de zi\n',T5),
    atom_concat(T5,'La sud e holul\n',T6),
    atom_concat(T6,'Poți juca un joc: sliding 8\n',T3),
    atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul sliding\n',X).

descrie(hol,X):-
    atom_concat('Te afli în Holul principal. \nLa nord se află biblioteca\n', 
    'La sud este ieșirea\n',T1),
    atom_concat(T1,'La vest este camera Dianei\n',T2),
    atom_concat(T2,'La est este camera lui Mihai\n',X).
    
descrie(cameraE,X):-
    atom_concat('Te afli în camera lui Mihai. \nLa est este camera lui Andrei\n',
    'La vest se află holul.
La sud este camera de oaspeti.
Poți juca un joc de foarfecă hârtie piatră împotriva calculatorului\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul foarfecahartiepiatra\n',X).
    

descrie(cameraEE,X):-
    atom_concat('Te afli în camera lui Andrei. \nLa nord este camera lui Bogdan\n',
    'La vest se află camera lui Mihai\n
Poți juca Sudoku\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul sudoku.\n',X).

descrie(cameraNE,X):-
    atom_concat('Te afli în camera lui Bogdan.\nLa vest se afla bucătăria\n',
    'La sud se află camera lui Andrei\n
Rezolvă dilema prizonierilor\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul dilema\n',X).

descrie(bucatarie,X):-
    atom_concat('Te afli în bucătărie.\nLa vest este biblioteca\n',
    'La est se află camera lui Bogdan\n',X).

descrie(cameraW,X):-
    atom_concat('Te afli în camera Dianei.\n La est se afla holul principal\n',
    'Te afli în camera Dianei. La est se află holul principal\n',T1),
    atom_concat(T1,'La sud se află Atelierul\n',T2),
    atom_concat(T2,'La vest se află camera Mariei\n',X).

descrie(cameraWW,X):-
    atom_concat('','Te afli în camera Mariei. \nLa est este camera Dianei.\n
Poți juca hunter.\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul hunter.\n',X).

descrie(cameraNW,X):-
    atom_concat('Te afli în camera de zi. \nLa est se află biblioteca\n',
    'Acesta porțiune a hărții nu este clară!\n',T1),
    atom_concat(T1,'Ai posibilitatea de a merge în 3 camere necunoscute la nord, vest și sud\n', T2),
    atom_concat(T2, 'Ai mare grijă camerele acestea pot fi periculoase!\n
Poți juca x și 0 !\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul xsi0.\n',X).
    

descrie(debara,X):-
    atom_concat('','Te afli in debara. \nLa sud se afla camera de zi\n',X).

descrie(cameraCapcana1,X):-
    atom_concat('','Te afli într-o camera periculoasa plina de capcane.\nViata ta e in pericol. \nÎntoarcete repede în camera de zi\n',X).

descrie(cameraCapcana2,X):-
    atom_concat('','Te afli într-o camera periculoasa plina de capcane.\nViata ta e in pericol. \nÎntoarcete repede în camera de zi\n',X).

descrie(birou,X):-
    atom_concat('','Te afli în birou !, \nLa sud se află biblioteca\n',X).

descrie(iesire,X):-
    atom_concat('','Felicitări ai finalizat jocul!!\n',X).

descrie(cameraES,X):-
    atom_concat('Te afli în camera de oaspeti.\n','La nord este camera lui Mihai\n',X).
descrie(cameraWS,X):-
    atom_concat('Te afli în Atelier.\n','La nord este camera Dianei\n',X).

textStart(Textinitial):- atom_concat('','
                           Te-ai trezit pe podeaua unei camere.\n
                           Nu îți amintești unde ești sau cum ai ajuns aici.\n
                           Te îndrepți spre o ușă ce pare a fi ieșirea.\n
                           Ușa e încuiată și nu poți evada.\n
                           Singura ta șansă e cheia ce poate descuia această ușă.\n
                           Trebuie să explorezi camerele casei pentru a regăsi libertatea.\n
                            ',Textinitial).

pozitie_incorecta1(Text):-atom_concat('','Nu te afli in bibliotecă!\n',Text). 
pozitie_incorecta2(Text):-atom_concat('','Nu te afli în camera corectă!\n',Text). 
text_clasament(Text):-atom_concat("Dacă dorești să fi inclus în \nclasamentul oficial introdu un nume.",'',Text).

comenziScurtatura(R):-atom_concat('','
                        **Incepere joc
                            comanda: Joc argument: jocul dorit
                        **Selectare nivel de dificultate
                            comanda: Nivel argument: nivel dorit
                        **Plasarea unui obiect in inventar
                            comanda: Pastreaza argument: obiect dorit
                        **Renuntarea la un obiect din inventar
                            comanda: Arunca argument: obiect dorit
                        **Inspecteaza obiect descoperit
                            comanda: Inspecteaza argument: obiect dorit
                        **Consumarea unui obiect pentru energie
                            comanda: Mananca argument: obiect dorit
                        **Completarea codului pentru acces in Birou
                            comanda: Cod argument: codul de 5 litere
                        **Salvarea jocului curent
                            comanda: Salveaza argument: nume fisier
                        **Incarcarea unui joc anterior
                            comanda: Incarca argument:  nume fisier
                        **Clasamentul jucatorilor pentru un anumit nivel
                            comanda: Clasament argument: nivel dorit
                        **Decizia pentru jocul dilema prizonierilor
                            comanda: Decizie argument: recunoaste / neaga in functie de hotararea luata
                        **Mutare pentru jocul sudoku 
                            comanda: Sudoku argument1: pozitia argument2: valoarea noua
                        **Raspuns la ghicitoare pentr deschiderea seifului
                            comanda: Ghicitoare argument: raspuns
                         **Pentru jocul de foarfeca-hartie-piatra impotriva calculatorului
                            comanda: Foarfecahartiepiatra argument: foarfeca, hartie sau piatra
                        **Comenzi ce nu necesita argumente
                            Inventar -- Listarea inventaruiui 
                            Energie  -- Afisarea energiei curente
                            Viata    -- Afisarea starii de sanatate
                            Restart  -- Resetarea datelor jocului
                            Optiuni  -- Listarea fisierelor cu jocuri salvate 
                            Ajutor   -- Ajutor pentru jocul sliding 8
                            Parola   -- Afisarea literelor din parola descoperite',R).