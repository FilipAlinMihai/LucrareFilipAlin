reguli2(1,
"Initial jucatorul trebuie sa selecteze dificultatea. 
Exista 4 nivele disponibile usor mediu dificil si imposibil. 
Selectare nivel de dificultate
    comanda: Nivel argument: nivel dorit").

reguli2(2,
"Poți cerceta casa dar fiecare tranziție între camere te costă energie. 
Vei găsi obiecte, aceste pot fi folosite pentru a câștiga energie sau pentru alte activități. 
Pentru navigare utilizează butoanele N S E V. 
Accesul în unele canere este restricționat. ").

reguli2(3,
"Pentru fiecare nivel sunt oferite un numar fix de puncte.
Fiecare deplasare intre camere costa un punct.
În cazul în care utilizatorul rămâne fără puncte de energie el nu mai poate naviga harta.
În acest caz el poate consuma obiecte comestibile din inventar pentru energie.
Pentru prevenirea acestei situații este recomandată câștigarea mini jocurilor.
Acestea acordă recompense precum punctele de energie.
Clasamentul se bazeaza pe numarul de puncte de energie cu care jucatorul a terminat jocul.").

reguli2(4,
"Vei avea posibilitatea de a juca mini jocuri. Daca reusesti sa castigi vei primi recompense. 
Sunt disponibile jocurile: x si 0, sudoku, sliding, foarfeca hartie piatra, hunter si dilema.
Mini jocurile nu produc niciodata aceasi varianta a jocului. 
Trei dintre mini jocurile disponibile sunt cronometrate.
Ele trebuie sa fie rezolvate intr-un numar prestabilit de secunde.
Dupa curgerea timpului jocurile nu mai accepta mutari.
La fiecare mutare noua se va specifica cate secunde au mai ramas pana la inchiderea jocului.
Timpul pus la dispoziti jucatorului e calculat in functie de joc si de nivelul de dificultate ales.").

reguli2(5,
"Vei găsi obiecte, aceste pot fi folosite pentru a câștiga energie sau pentru alte activități.
Obiectele sunt plasate in inventar cu comanda pastreaza. 
Obiectele comestibile pot fi consumate prin comanda mananca. 
Exista o limita de 6 obiecte pe care jucatorul le poate cara la un moment dat.
").

reguli2(6,
"ste creat cate un clasament pentru fiecare nivel de dificultate.
Dupa ce jocul a fost finalizat cu succes jucatorul introduce numele cu care va aparea in clasament.
Clasamentul se bazeaza pe numarul de puncte de energie cu care jucatorul a terminat jocul.
Cu cat numarul este mai mare cu atat jucatorul va fi mai sus in clasament.").

reguli2(7,
"Pentru A prelua cheia din seif trebuie sa raspunzi corect la o ghicitoare gasita in camerele casei. 
sScrie raspunsul cu comanda ghicitoare si raspunsul ca argument. ").

reguli2(8,
"Utilizatorul are posibilitatea de a salva progresul realizat prin comanda salveaza.
Aceasta retine intr-un fisier (al carui nume este introdus ca argument) toate datele rundei curente.
Pentru a incarca un joc salvat  jucatorul utilizeaza comanda incarca urmata de numele fisierului dorit.
Prin comanda optiuni sunt prezentate variantele jocului ce au fost salvate si pot fi incarcate.").

reguli2(9,
" Cu ajutorul comenzii restart jucatorul poate reseta 
toate elementele jocului ce au fost modificate la starea initiala.").

reguli2(10,
"Ești captiv în casa X. Ușa de la ieșire este încuiată. 
     Din fericire ai gâșit o hartă a casei. Aceasta nu este foarte clară în unele părți.
Poți cerceta casa dar fiecare tranziție între camere te costă energie. 
     Vei găsi obiecte, aceste pot fi folosite pentru a câștiga energie sau pentru alte activități. 
     Pentru navigare utilizează butoanele N S E V. 
     Accesul în unele canere este restricționat. 
Cel mai probail cheia de la ieșire se află în birou dar acesta este blocat de un lacăt. 
     Lacătul are o parolă de cinci litere. Este posibil să găsești parola în camerele casei. 
     Atunci cand ai aflat toate literele parolei traverseaza harta pana in biblioteca.
     Aici poti utiliza comanda Cod urmata de literele descoperite ca argument.").

reguli2(11,
"               **Incepere joc
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
                    comanda: Repara argument: lanterna").

reguli2(12,
"           **Comenzi ce nu necesită argumente
                    Inventar -- Listarea inventaruiui 
                    Energie  -- Afișarea energiei curente
                    Viata    -- Afișarea stării de sănătate
                    Restart  -- Resetarea datelor jocului
                    Optiuni  -- Listarea fișierelor cu jocuri salvate 
                    Ajutor   -- Ajutor pentru jocul sliding 8
                    Parola   -- Afișarea literelor din parolă descoperite
                    Locatie  -- Examinarea împrejurimilor jucătorului
                    Bandajare-- Utilizarea unui bandaj pentru creșterea nivelului de viață").

reguli2(13,
"Unele camere nu sunt luminate suficient pentru a permite circularea.
In cazul acestor camere este necesara o sursa de lumina precum o lanterna.
Dupa un anumit numar de utilizari lanterna ramane fara energie si nu mai poate fi  utilizata.
In cazul in care lanterna ramane fara energie se utilizeaza: 
    comanda: Repara cu argumentul: lanterna
Este necesara si o baterie.").

reguli2(14,
"Punctele de viata pot fi pierdute in unele camere periculoase.
Epuizarea tuturor aceste puncte duce la pierderea jocului.
In cazul in care a fost decoperit un bandaj el poate fi utilizat pentru
a imbunatati starea de sanatate a jucatorului. Bandajul nu apare in fiecare runda.
Frecventa cu care acesta apare este determinata de nivlul de dificultate ales.").

reguli2(15,
"Butoanele numerotate de la 1 la 9 sunt pentru jocul de x si 0 impotriva calculatorului. 
Pentru navigare utilizează butoanele N S E V. 
Butoanele U D R L controleaza jocul sliding.").

reguli2(16,
"Unele camere sunt periculoase. Ele contin capcane si pot pune in pericol viata jucatorului.
Prin comanda viata poti vedea care este starea ta curenta.").

reguli2(17,
"Trei dintre mini jocurile disponibile sunt cronometrate.
Ele trebuie sa fie rezolvate intr-un numar prestabilit de secunde.
Dupa curgerea timpului jocurile nu mai accepta mutari.
La fiecare mutare noua se va specifica cate secunde au mai ramas pana la inchiderea jocului.
Timpul pus la dispoziti jucatorului e calculat in functie de joc si de nivelul de dificultate ales.").

reguli2(18,
"Butonul harta prezinta jucatorului o harta a partilor din casa pe care lea vizitat in jocul curent.
Harta jocului poate sa difere.
Exista patru variante diferite pentru harta jocului.
Jucatorul nu este implicat in procesul de alegere a hartii.").