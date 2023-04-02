descrie(sliding,X):-
    atom_concat('Muta pozitiile in ordine crescatoare \n','Doar 0 are dreptul de a se misca\n', X1),
    atom_concat(X1, 'Directiile de deplasare sunt: l-stanga, r-dreapta, u-sus si d-jos\n',X),!.

descrie(xsi0,X):-atom_concat('','Castiga acest joc de x si 0 impotriva calculatorului!\n', X),!.

descrie(sudoku,X):-atom_concat('','Rezolva aceasta problema conform regulilor clasice de sudoku!
Nu trebuie sa existe duplicate pe linii coloane sau in patratele de 3X3 delimitate\n', X),!.

descrie(hunter,X):-atom_concat('','Tabla de joc este umpluta de pioni in 7 pozitii din 9.
Pe pozitia marcata cu k se afla un cal ce se misca in modul specific jocului de sah.\n
Incearca sa capturezi toti pionii in 7 miscari.
Selecteaza pozitiia pe care doresti sa se deplaseze calul.
Fiecare mutare fie ea valida sau invalida este contorizata\n', X),!.

descrie(dilema,X):-atom_concat('','Tu si prietenul tau ati fost prinsi in timpul unui jaf minor!\n
Amandoi puteti fi condamnati la un an de inchisoare. Sunteti interogati in camere separate. \n
Procurorii va suspecteaza de comiterea unei serii intregi de jafuri dar nu au suficiente dovezi.\n
Ei iti cer o marturisire scrisa. \n
Ai posibilitatea de a declara ca prietenul a comis restul jafurilor.\n
O alta varianta este acea de a declara ca nu sti nimic despre restul furturilor\n
Daca marturisesti este posibil sa primesti o reducere a sentintei\n
Daca amandoi negati acuzatiile procurorii nu va pot condamna la mai mult de un an de inchisoare\n
Cel mai probabil si prietenul tau a primit aceiasi oferta\n
Daca prietenul tau declara ca tui ai comis jafurile vei primi o sentint mult mai lunga\n
Daca amandoi va acuzati reciproc procurorii vor sti ca ati fost complici si astfel sentinta se imparte\n
Cand ai luat decizia finala executa comanda decizie cu unul din argumentele recunoaste sau neaga', X),!.

descrie(foarfecahartiepiatra,X):-
        atom_concat('','Joaca foarfeca hartie piatra impotriva calculatorului!\n
Castiga cel mai bun din trei runde\n', X),!.

descrie(scrisoareLitera1,X):-
    litera1(R5),
    atom_concat('Prima litera a parolei este ',R5,X).

descrie(scrisoareLitera5,X):-
    litera5(R5),
    atom_concat('Ultima litera a parolei este ',R5,X).

descrie(carteLitera2,X):-
    litera2(R5),
    atom_concat('A doua litera a parolei este ',R5,X).

descrie(carteLitera3,X):-
    litera3(R5),
    atom_concat('A treia litera a parolei este ',R5,X).

descrie(carteLitera4,X):-
    litera4(R5),
    atom_concat('A patra litera a parolei este ',R5,X).

descrie(ghicitoare,X):-
    atom_concat('Desi nu sunt diamant pe inel ma pui.\n',
    'Cand vremea mea vine usi descui.\n',X).
    

descrie(bilet,X):-
    atom_concat('','Iesirea e incuiata iar cheia se afla in Birou.\n',X).
    
descrie(lanterna,X):-
    atom_concat('','Folosestio pentru a lumina camerele inacesibile\n',X).
   
descrie(mar,X):-
    atom_concat('','Un Mar.Consumal pentr a primi energie\n',X).
    
descrie(biscuit,X):-
    atom_concat('','Un biscuit.Consumal pentr a primi energie\n',X).
    

% Este descrisa camera in care se afla jucatorul si imprejurimile
% acesteia
descrie(biblioteca,X):-
    atom_concat('Te afli in biblioteca. La Nord se afla Biroul \n',
    'Usa de la intrarea in birou are un lacat!\n',T1),
    atom_concat(T1,'Lacatul are un cod format din 5 litere\n',T2),
    atom_concat(T2,'Poti juca un joc: sliding 8\n',T3),
    atom_concat(T3,'Incepe jocul prin comanda Joc cu argumentul sliding\n',T31),
    atom_concat(T31,'La est e bucataria\n',T4),
    atom_concat(T4,'La vest e camera de zi\n',T5),
    atom_concat(T5,'La sud e holul\n',X).

descrie(hol,X):-
    atom_concat('Te afli in Holul principal. La nord se afla biblioteca\n', 
    'La sud este iesirea\n',T1),
    atom_concat(T1,'La vest este camera Dianei\n',T2),
    atom_concat(T2,'La est este camera lui Mihai\n',X).
    
descrie(cameraE,X):-
    atom_concat('Te afli in camera camera lui Mihai. La est este camera lui Andrei\n',
    'La vest se afla holul.
La sud este camera X.
Poti juca un joc de foarfeca hartie piatra impotriva calculatorului\n',T3),
atom_concat(T3,'Incepe jocul prin comanda Joc cu argumentul foarfecahartiepiatra\n',X).
    

descrie(cameraEE,X):-
    atom_concat('Te afli in camera lui Andrei. La nord este camera lui Bogdan\n',
    'La vest se afla camera lui Mihai\n
Poti juca Sudoku\n',T3),
atom_concat(T3,'Incepe jocul prin comanda Joc cu argumentul sudoku.\n',X).

descrie(cameraNE,X):-
    atom_concat('Te afli in camera lui Bogdan. La vest se afla bucataria\n',
    'La sud se afla camera lui Andrei\n
Rezolva dilema prizonierilor\n',T3),
atom_concat(T3,'Incepe jocul prin comanda Joc cu argumentul dilema\n',X).

descrie(bucatarie,X):-
    atom_concat('Te afli in bucatarie. La vest este biblioteca\n',
    'La est se afla camera lui Bogdan\n',X).

descrie(cameraW,X):-
    atom_concat('Te afli in camera Dianei. La est se afla holul principal\n',
    'Te afli in camera Dianei. La est se afla holul principal\n',T1),
    atom_concat(T1,'La sud se afla camera Y\n',T2),
    atom_concat(T2,'La vest se afla camera Mariei\n',X).

descrie(cameraWW,X):-
    atom_concat('','Te afli in camera Mariei. La est este camera Dianei.\n
Poti juca hunter.\n',T3),
atom_concat(T3,'Incepe jocul prin comanda Joc cu argumentul hunter.\n',X).

descrie(cameraNW,X):-
    atom_concat('Te afli in camera de zi. La est se afla biblioteca\n',
    'Acesta portiune a hartii nu este clara!\n',T1),
    atom_concat(T1,'Ai posibilitatea de a merge in 3 camere necunoscute la nord, vest si sud\n', T2),
    atom_concat(T2, 'Ai mare grija camerele acestea pot fi periculoase!\n
Poti juca x si 0 !\n',T3),
atom_concat(T3,'Incepe jocul prin comanda Joc cu argumentul xsi0.\n',X).
    

descrie(debara,X):-
    atom_concat('','Te afli in debara. La sud se afla camera de zi\n',X).

descrie(cameraCapcana1,X):-
    atom_concat('','Te afli in cameraCapcana1. Intoarcete repede la nord in camera de zi\n',X).

descrie(cameraCapcana2,X):-
    atom_concat('','Te afli in cameraCapcana2. Intoarcete repede la est in camera de zi\n',X).

descrie(birou,X):-
    atom_concat('','Te afli in birou !, La sud se afla biblioteca\n',X).

descrie(iesire,X):-
    atom_concat('','Felicitari ai finalizat jocul\n',X).

descrie(cameraES,X):-
    atom_concat('Te afli in camera X.\n','La nord este camera lui Mihai\n',X).
descrie(cameraWS,X):-
    atom_concat('Te afli in camera Y.\n','La nord este camera Dianei\n',X).