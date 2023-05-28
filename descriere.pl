descrie(sliding,X):-
    atom_concat('Mută pozițiile în ordine crescătoare \n','Doar 0 are dreptul de a se mișca\n', X1),
    atom_concat(X1, 'Direcțiile de deplasare sunt: L-stânga, R-dreapta,U-sus și D-jos\n',X),!.

descrie(xsi0,X):-atom_concat('','Câștigă acest joc de x și 0 împotriva calculatorului!\n
Utilizează butoanele numerotate.
Tu ai prima mutare.\n', X),!.

descrie(sudoku,X):-atom_concat('','Rezolvă această problemă conform regulilor clasice de sudoku!
Nu trebuie să existe duplicate pe linii coloane sau în pătratele de 3X3 delimitate\n', X),!.

descrie(hunter,X):-atom_concat('','Tabla de joc este umplută de pioni în 7 poziții din 9.
Pe poziția marcata cu k se află un cal ce se mițcă în modul specific jocului de șah.\n
Încearcă să capturezi toți pionii în 7 mișcări.
Selectează pozițiia pe care dorești să se deplaseze calul.
Fiecare mutare fie e validă sau invalidă este contorizată\n', X),!.

descrie(dilema,X):-atom_concat('','Doi infractori au fost prinși în timpul unui jaf minor!
Amândoi pot fi condamnați la un an de închisoare. Ei sunt interogați în camere separate. 
Procurorii îi suspectează de comiterea unei serii întregi de jafuri dar nu au suficiente dovezi.
Procurorii cer fiecărui suspect o mărturisire scrisă.
Fiecare suspect are posibilitatea de a declara că prietenul său a comis restul jafurilor de unul singur.
O altă variantă este accea de a declara că nu știe nimic despre restul furturilor.
Dacă suspectul își acuză complicele este posibil să primească o reducere a sentinței pentru cooperare.
Dacă amândoi negagă acuzațiile judecătorul nu îi poate condamna la mai mult de un an de închisoare.
Ambii suspecți primesc aceași ofertă.
Daca unul dintre suspecti nu coopereaza dar este trădat de complicele său acesta primește o pedeapsă mult mai lungă.
Dacă ambii suspecți se acuză reciproc procurorii vor ști că au fost complici și astfel sentința se împarte.
Ce decizie ai lua în locul unui deținut în aceste condiții?
Când ai luat decizia finală execută comanda Decizie cu unul din argumentele recunoaste sau neaga.', X),!.

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

descrie(bandaj,X):-
    atom_concat('','Un bandaj medical.\nPoate fi utilizat pentru tratarea ranilor.\n',X).
    
descrie(lanterna,X):-
    atom_concat('','Foloseștio pentru a lumina camerele inacesibile\n',X).
   
descrie(mar,X):-
    atom_concat('','Un Măr.Consumăl pentr a primi energie\n',X).
    
descrie(biscuit,X):-
    atom_concat('','Un biscuit.Consumăl pentr a primi energie\n',X).

% Este descrisa camera in care se afla jucatorul si imprejurimile
% acesteia
descrieCamera(1,biblioteca,X):-
    atom_concat('Te afli în bibliotecă. \n
La Nord se află Biroul \n',
    'Ușa de la intrarea în birou are un lacăt!\n',T1),
    atom_concat(T1,'Lacătul are un cod format din 5 litere\n',T2),
    atom_concat(T2,'La est e bucătăria\n',T4),
    atom_concat(T4,'La vest e camera de zi\n',T5),
    atom_concat(T5,'La sud e holul\n\n',T6),
    atom_concat(T6,'Poți juca un joc: sliding 8\n',T3),
    atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul sliding\n',X).

descrieCamera(1,hol,X):-
    atom_concat('Te afli în Holul principal. \n
La nord se află biblioteca\n', 
    'La sud este ieșirea\n',T1),
    atom_concat(T1,'La vest este camera Dianei\n',T2),
    atom_concat(T2,'La est este camera lui Mihai\n',X).
    
descrieCamera(1,cameraE,X):-
    atom_concat('Te afli în camera lui Mihai. \n
La est este camera lui Andrei\n',
    'La vest se află holul.
La sud este camera de oaspeti.
La nord este cameraY.\n
Poți juca un joc de foarfecă hârtie piatră împotriva calculatorului.\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul foarfecahartiepiatra.
După start utilizează comanda Foarfecahartiepiatra cu unul din argumentele:
        *piatra
        *foarfeca
        *hartie
Jocul are trei runde. Pentru fiecare rundă poți modifica alegerea.\n',X).
    

descrieCamera(1,cameraEE,X):-
    atom_concat('Te afli în camera lui Andrei.\n
La nord este camera lui Bogdan\n',
    'La vest se află camera lui Mihai\n
Poți juca Sudoku\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul sudoku.\n',X).

descrieCamera(1,cameraNE,X):-
    atom_concat('Te afli în camera lui Bogdan.\n
La vest se afla bucătăria\n',
    'La sud se află camera lui Andrei\n
Rezolvă dilema prizonierilor\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul dilema\n',X).

descrieCamera(1,bucatarie,X):-
    atom_concat('Te afli în bucătărie.\n
La vest este biblioteca\n',
    'La est se află camera lui Bogdan\nLa nord se află cameraX\n',X).

descrieCamera(1,cameraNN,X):-
    atom_concat('Te afli în cameraX.\n
La sud este bucataria.\n',
    '',X).

descrieCamera(1,cameraEN,X):-
    atom_concat('Te afli în cameraY.\n
La sud este camera lui Mihai.\n',
    '',X).

descrieCamera(1,cameraW,X):-
    atom_concat('Te afli în camera Dianei.\n',
    '\nLa est se afla holul principal\n',T1),
    atom_concat(T1,'La sud se află Atelierul\n',T2),
    atom_concat(T2,'La vest se află camera Mariei\n',X).

descrieCamera(1,cameraWW,X):-
    atom_concat('','Te afli în camera Mariei. \n
La est este camera Dianei.\n
Poți juca hunter.\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul hunter.\n',X).

descrieCamera(1,cameraNW,X):-
    atom_concat('Te afli în camera de zi. \n
La est se află biblioteca\n',
    'Acesta porțiune a hărții nu este clară!\n',T1),
    atom_concat(T1,'Ai posibilitatea de a merge în 3 camere necunoscute la nord, vest și sud\n', T2),
    atom_concat(T2, 'Ai mare grijă camerele acestea pot fi periculoase!\n
Poți juca x și 0 !\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul xsi0.
Utilizează butoanele numerotate.
Tu ai prima mutare.\n',X).
    

descrieCamera(1,debara,X):-
    atom_concat('','Te afli in debara.\n
Ai o singură opțiune de deplasare. Întoarce-te în camera de zi\n',X).

descrieCamera(1,cameraCapcana1,X):-
    atom_concat('','Te afli într-o camera periculoasa plina de capcane.\n
Viata ta e in pericol. \nÎntoarcete repede în camera de zi\n',X).

descrieCamera(1,cameraCapcana2,X):-
    atom_concat('','Te afli într-o camera periculoasa plina de capcane.\n
Viata ta e in pericol. \nÎntoarcete repede în camera de zi\n',X).

descrieCamera(1,birou,X):-
    atom_concat('','Te afli în birou ! \n
La sud se află biblioteca\n',X).

descrieCamera(1,iesire,X):-
    atom_concat('','Felicitări ai finalizat jocul!!\n',X).

descrieCamera(1,cameraES,X):-
    atom_concat('Te afli în camera de oaspeti.\n','\nLa nord este camera lui Mihai\n',X).
descrieCamera(1,cameraWS,X):-
    atom_concat('Te afli în Atelier.\n','\nLa nord este camera Dianei\n',X).

%Descriere harta 2 
descrieCamera(2,hol,X):-
    atom_concat('Te afli în Holul principal. \n
La nord se află camera lui Mihai\n', 
    'La sud este ieșirea\n',X).

descrieCamera(2,cameraE,X):-
    atom_concat('Te afli în camera lui Mihai. \n
La est este camera lui Andrei\n',
    'La sud se află holul.
La vest este camera de oaspeti.
La nord este cameraX.\n
Poți juca un joc de foarfecă hârtie piatră împotriva calculatorului.\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul foarfecahartiepiatra.
După start utilizează comanda Foarfecahartiepiatra cu unul din argumentele:
        *piatra
        *foarfeca
        *hartie
Jocul are trei runde. Pentru fiecare rundă poți modifica alegerea.\n',X).

descrieCamera(2,cameraEE,X):-
    atom_concat('Te afli în camera lui Andrei. \n
La nord este camera lui Bogdan\n',
    'La vest se află camera lui Mihai\n
Poți juca Sudoku\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul sudoku.\n',X).  

descrieCamera(2,cameraES,X):-
    atom_concat('Te afli în camera de oaspeti.\n','\nLa est se afla camera lui Mihai.
La vest se afla atelierul.\n',X).

descrieCamera(2,debara,X):-
    atom_concat('','Te afli in debara. \n
Ai o singură opțiune de deplasare. Întoarce-te în camera de zi\n',X).

descrieCamera(2,cameraCapcana1,X):-
    atom_concat('','Te afli într-o camera periculoasa plina de capcane.\n
Viata ta e in pericol. \nÎntoarcete repede în camera de zi\n',X).

descrieCamera(2,cameraCapcana2,X):-
    atom_concat('','Te afli într-o camera periculoasa plina de capcane.\n
Viata ta e in pericol. \nÎntoarcete repede în camera de zi\n',X).

descrieCamera(2,cameraNW,X):-
    atom_concat('Te afli în camera de zi. \n
La est se află biblioteca\n',
    'Acesta porțiune a hărții nu este clară!\n',T1),
    atom_concat(T1,'Ai posibilitatea de a merge în 3 camere necunoscute la nord, vest și sud\n', T2),
    atom_concat(T2, 'Ai mare grijă camerele acestea pot fi periculoase!\n
Poți juca x și 0 !\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul xsi0.
Utilizează butoanele numerotate.
Tu ai prima mutare.\n',X).

descrieCamera(2,cameraNE,X):-
    atom_concat('Te afli în camera lui Bogdan.\n
La vest se afla bucătăria\n',
    'La sud se află camera lui Andrei\n
Rezolvă dilema prizonierilor\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul dilema.\n',X).

descrieCamera(2,birou,X):-
    atom_concat('','Te afli în birou !, \n
La sud se află biblioteca.\n',X).

descrieCamera(2,biblioteca,X):-
    atom_concat('Te afli în bibliotecă. \n
La Nord se află Biroul \n',
    'Ușa de la intrarea în birou are un lacăt!\n',T1),
    atom_concat(T1,'Lacătul are un cod format din 5 litere\n',T2),
    atom_concat(T2,'La est e bucătăria\n',T4),
    atom_concat(T4,'La vest e camera de zi\n',T5),
    atom_concat(T5,'La sud e cameraY\n\n',T6),
    atom_concat(T6,'Poți juca un joc: sliding 8\n',T3),
    atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul sliding\n',X).

descrieCamera(2,cameraNN,X):-
    atom_concat('Te afli în cameraX.\n
La sud este camera lui Mihai.\n',
    'La nord este bucataria.\n',X).

descrieCamera(2,cameraEN,X):-
    atom_concat('Te afli în cameraY.\n
La sud este Atelierul.\n',
    'La nord este biblioteca.\n',X).

descrieCamera(2,bucatarie,X):-
    atom_concat('Te afli în bucătărie.\n
La vest este biblioteca\n',
    'La est se află camera lui Bogdan\nLa sud se află cameraX\n',X).

descrieCamera(2,cameraWS,X):-
    atom_concat('Te afli în Atelier.\n','\nLa nord este cameraY.
La vest se afla camera Dianei.\nLa est se afla camera de oaspeti.\n',X).

descrieCamera(2,cameraW,X):-
    atom_concat('Te afli în camera Dianei.\n',
    '\nLa est se afla atelierul.\n',T1),
    atom_concat(T1,'La nord se află camera Mariei\n',X).

descrieCamera(2,cameraWW,X):-
    atom_concat('','Te afli în camera Mariei. \n
La sud este camera Dianei.\n
Poți juca hunter.\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul hunter.\n',X).

%DESCRIERE HARTA 3
descrieCamera(3,hol,X):-
    atom_concat('Te afli în Holul principal. \n
La nord se află camera lui Andrei\n', 
    'La sud este ieșirea\n',X).

descrieCamera(3,cameraE,X):-
    atom_concat('Te afli în camera lui Mihai. \n
La est este camera lui Andrei\n',
    'La nord este camera de oaspeti.\n
Poți juca un joc de foarfecă hârtie piatră împotriva calculatorului.\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul foarfecahartiepiatra.
După start utilizează comanda Foarfecahartiepiatra cu unul din argumentele:
        *piatra
        *foarfeca
        *hartie
Jocul are trei runde. Pentru fiecare rundă poți modifica alegerea.\n',X).

descrieCamera(3,cameraEE,X):-
    atom_concat('Te afli în camera lui Andrei. \n
La nord este camera lui Bogdan\n',
    'La vest se află camera lui Mihai.
La sud se află holul principal.\n
Poți juca Sudoku\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul sudoku.\n',X).  

descrieCamera(3,cameraES,X):-
    atom_concat('Te afli în camera de oaspeti.\n','\nLa vest se afla cameraY.
La nord se afla biblioteca.
La sud se afla camera lui Mihai.\n',X).

descrieCamera(3,debara,X):-
    atom_concat('','Te afli in debara. \n
Ai o singură opțiune de deplasare. Întoarce-te în camera de zi.\n',X).

descrieCamera(3,cameraCapcana1,X):-
    atom_concat('','Te afli într-o camera periculoasa plina de capcane.\n
Viata ta e in pericol. \nÎntoarcete repede în camera de zi\n',X).

descrieCamera(3,cameraCapcana2,X):-
    atom_concat('','Te afli într-o camera periculoasa plina de capcane.\n
Viata ta e in pericol. \nÎntoarcete repede în camera de zi\n',X).

descrieCamera(3,cameraNW,X):-
    atom_concat('Te afli în camera de zi. \n
La est se află bucataria\n',
    'Acesta porțiune a hărții nu este clară!\n',T1),
    atom_concat(T1,'Ai posibilitatea de a merge în 3 camere necunoscute la nord, vest și sud\n', T2),
    atom_concat(T2, 'Ai mare grijă camerele acestea pot fi periculoase!\n
Poți juca x și 0 !\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul xsi0.
Utilizează butoanele numerotate.
Tu ai prima mutare.\n',X).

descrieCamera(3,cameraNE,X):-
    atom_concat('Te afli în camera lui Bogdan.\n
La vest se afla biblioteca.\n',
    'La sud se află cameraX.\n
Rezolvă dilema prizonierilor\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul dilema.\n',X).

descrieCamera(3,birou,X):-
    atom_concat('','Te afli în birou !, \n
La sud se află biblioteca.\n',X).

descrieCamera(3,biblioteca,X):-
    atom_concat('Te afli în bibliotecă. \n
La Nord se află Biroul!\n',
    'Ușa de la intrarea în birou are un lacăt!\n',T1),
    atom_concat(T1,'Lacătul are un cod format din 5 litere.\n',T2),
    atom_concat(T2,'La vest e bucătăria.\n',T4),
    atom_concat(T4,'La est e camera lui Bogdan.\n',T5),
    atom_concat(T5,'La sud e camera de oaspeti.\n\n',T6),
    atom_concat(T6,'Poți juca un joc: sliding 8.\n',T3),
    atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul sliding.\n',X).

descrieCamera(3,cameraNN,X):-
    atom_concat('Te afli în cameraX.\n
La sud este camera lui Andrei.\n',
    'La nord este camera lui Bogdan.\n',X).

descrieCamera(3,cameraEN,X):-
    atom_concat('Te afli în cameraY.\n
La sud este camera Mariei.\n',
    'La nord este bucataria.
La est este camera de oaspeti.\n',X).

descrieCamera(3,bucatarie,X):-
    atom_concat('Te afli în bucătărie.\n
La est este biblioteca\n',
    'La vest se află camera de zi.\nLa sud se află cameraY\n',X).

descrieCamera(3,cameraWS,X):-
    atom_concat('Te afli în Atelier.\n','\nLa est este camera Mariei.\n',X).

descrieCamera(3,cameraW,X):-
    atom_concat('Te afli în camera Dianei.\n','\nLa nord se află camera Mariei\n',X).

descrieCamera(3,cameraWW,X):-
    atom_concat('','Te afli în camera Mariei. \n
La sud este camera Dianei.
La vest este atelierul.
La nord este Y.
Poți juca hunter.\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul hunter.\n',X).

%DESCRIERE HARTA 3
descrieCamera(4,cameraNE,X):-
    atom_concat('Te afli în camera lui Bogdan.\n
La vest se afla bucataria.\n',
    'La sud se află lui Andrei.\n
Rezolvă dilema prizonierilor.\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul dilema.\n',X).

descrieCamera(4,cameraWW,X):-
    atom_concat('','Te afli în camera Mariei. \n
La sud este camera Dianei.\n
Poți juca hunter.\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul hunter.\n',X).

descrieCamera(4,cameraW,X):-
    atom_concat('Te afli în camera Dianei.\n','\nLa nord se află camera Mariei.
La est este holul de pornire.\n',X).

descrieCamera(4,bucatarie,X):-
    atom_concat('Te afli în bucătărie.\n
La vest este biblioteca.\n',
    'La est se află camera lui Bogdan.\nLa sud se află camera lui Mihai\n',X).

descrieCamera(4,biblioteca,X):-
    atom_concat('Te afli în bibliotecă. \n
La nord se află Biroul \n',
    'Ușa de la intrarea în birou are un lacăt!\n',T1),
    atom_concat(T1,'Lacătul are un cod format din 5 litere\n',T2),
    atom_concat(T2,'La est e bucătăria\n',T4),
    atom_concat(T4,'La vest e camera de zi\n',T5),
    atom_concat(T5,'La sud e cameraX\n\n',T6),
    atom_concat(T6,'Poți juca un joc: sliding 8\n',T3),
    atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul sliding\n',X).

descrieCamera(4,debara,X):-
    atom_concat('','Te afli in debara. \n
Ai o singură opțiune de deplasare. Întoarce-te în camera de zi.\n',X).

descrieCamera(4,cameraCapcana1,X):-
    atom_concat('','Te afli într-o camera periculoasa plina de capcane.\n
Viata ta e in pericol. \nÎntoarcete repede în camera de zi\n',X).

descrieCamera(4,cameraCapcana2,X):-
    atom_concat('','Te afli într-o camera periculoasa plina de capcane.\n
Viata ta e in pericol. \nÎntoarcete repede în camera de zi\n',X).

descrieCamera(4,cameraES,X):-
    atom_concat('Te afli în camera de oaspeti.\n','\nLa nord se afla camera lui Andrei.\n',X).


descrieCamera(4,cameraE,X):-
    atom_concat('Te afli în camera lui Mihai. \n
La est este camera lui Andrei\n',
    'La nord este bucataria.
La sun este cameraY.\n
Poți juca un joc de foarfecă hârtie piatră împotriva calculatorului.\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul foarfecahartiepiatra.
După start utilizează comanda Foarfecahartiepiatra cu unul din argumentele:
        *piatra
        *foarfeca
        *hartie
Jocul are trei runde. Pentru fiecare rundă poți modifica alegerea.\n',X).

descrieCamera(4,cameraEE,X):-
    atom_concat('Te afli în camera lui Andrei. \n
La nord este camera lui Bogdan\n',
    'La vest se află camera lui Mihai.
La sud se află camera de oaspeti.\n
Poți juca Sudoku\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul sudoku.\n',X).  

descrieCamera(4,cameraEN,X):-
    atom_concat('Te afli în cameraY.\n',
    '\nLa nord este camera lui Mihai.\n',X).

descrieCamera(4,cameraWS,X):-
    atom_concat('Te afli în Atelier.\n','\nLa vest este holul de pornire.
La nord se afla cameraX\n',X).

descrieCamera(4,birou,X):-
    atom_concat('','Te afli în birou !, \nLa sud se află biblioteca.\n',X).

descrieCamera(4,cameraNN,X):-
    atom_concat('Te afli în cameraX.\n
La sud este Atelierul.\n',
    'La nord este biblioteca.\n',X).

descrieCamera(4,cameraNW,X):-
    atom_concat('Te afli în camera de zi. \n
La est se află biblioteca.\n',
    'Acesta porțiune a hărții nu este clară!\n',T1),
    atom_concat(T1,'Ai posibilitatea de a merge în 3 camere necunoscute la nord, vest și sud\n', T2),
    atom_concat(T2, 'Ai mare grijă camerele acestea pot fi periculoase!\n
Poți juca x și 0 !\n',T3),
atom_concat(T3,'Începe jocul prin comanda Joc cu argumentul xsi0.
Utilizează butoanele numerotate.
Tu ai prima mutare.\n',X).

descrieCamera(4,hol,X):-
    atom_concat('Te afli în Holul principal. \n
La vest se află camera Dianei.
La est se afla Atelierul.\n', 
    'La sud este ieșirea\n',X).


textStart(Textinitial):- atom_concat('','
                           Te-ai trezit într-o casă necunoscută.
                           Nu îți amintești unde ești sau cum ai ajuns aici.
                           Te îndrepți spre o ușă ce pare a fi ieșirea.
                           Ușa e încuiată și nu poți evada.
                           Singura ta șansă e cheia ce poate descuia această ușă.
                           Trebuie să explorezi camerele casei pentru a regăsi libertatea.
                           Pentru a te mișca utilizează:
                              *Butonul N - direcția Nord.
                              *Butonul S - direcția Sud.
                              *Butonul E - direcția Est.
                              *Butonul W - direcția Vest.
                           Ai grijă de energi și sănătatea ta.
                           Alege dificultatea dorită (usor, mediu, dificil, imposibil).
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
                        **In cazul in care lanterna ramane fara energie 
                            comanda: Repara argument: lanterna
                        **Comenzi ce nu necesita argumente
                            Inventar -- Listarea inventaruiui 
                            Energie  -- Afisarea energiei curente
                            Viata    -- Afisarea starii de sanatate
                            Restart  -- Resetarea datelor jocului
                            Optiuni  -- Listarea fisierelor cu jocuri salvate 
                            Ajutor   -- Ajutor pentru jocul sliding 8
                            Parola   -- Afisarea literelor din parola descoperite
                            Locatie  -- Examinarea imprejurimilor jucatorului
                            Bandajare-- Utilizarea unui bandaj pentru crestere nivelului de viata',R).