reguli2(1,
"Inițial jucătorul trebuie să selecteze dificultatea. 
Există 4 nivele disponibile usor mediu dificil și imposibil. 
Selectare nivel de dificultate
    comanda: Nivel argument: nivel dorit").

reguli2(2,
"Poți cerceta casa dar fiecare tranziție între camere te costă energie. 
Vei găsi obiecte, acestea pot fi folosite pentru a câștiga energie sau pentru alte activități. 
Pentru navigare utilizează butoanele N S E V. 
Accesul în unele canere este restricționat. ").

reguli2(3,
"Pentru fiecare nivel sunt oferite un numar fix de puncte.
Fiecare deplasare între camere costa un punct.
În cazul în care utilizatorul rămâne fără puncte de energie el nu mai poate naviga harta.
În acest caz el poate consuma obiecte comestibile din inventar pentru energie.
Pentru prevenirea acestei situații este recomandată câștigarea mini jocurilor.
Acestea acordă recompense precum punctele de energie.
Clasamentul se bazează pe numărul de puncte de energie cu care jucătorul a terminat jocul.").

reguli2(4,
"Vei avea posibilitatea de a juca mini jocuri. Dacă reusești să câștigi vei primi recompense. 
Sunt disponibile jocurile: x și 0, sudoku, sliding, foarfecă hârtie piatră, hunter și dilema.
Mini jocurile nu produc niciodată aceași variantă a jocului. 
Trei dintre mini jocurile disponibile sunt cronometrate.
Ele trebuie să fie rezolvate într-un număr prestabilit de secunde.
După scurgerea timpului jocurile nu mai acceptă mutări.
La fiecare mutare nouă se va specifica câte secunde au mai rămas până la închiderea jocului.
Timpul pus la dispoziți jucătorului e calculat în funcție de joc și de nivelul de dificultate ales.").

reguli2(5,
"Vei găsi obiecte, acestea pot fi folosite pentru a câștiga energie sau pentru alte activități.
Obiectele sunt plasate în inventar cu comanda Păstrează. 
Obiectele comestibile pot fi consumate prin comanda Mănâncă. 
Exista o limită de 6 obiecte pe care jucătorul le poate căra la un moment dat.
").

reguli2(6,
"Este creat cate un clasament pentru fiecare nivel de dificultate.
După ce jocul a fost finalizat cu succes jucătorul introduce numele cu care va apărea în clasament.
Clasamentul se bazează pe numărul de puncte de energie cu care jucătorul a terminat jocul.
Cu cât numărul este mai mare cu atât jucătorul va fi mai sus în clasament.").

reguli2(7,
"Pentru a prelua cheia din seif trebuie sa răspunzi corect la o ghicitoare găsita în camerele casei. 
scrie răspunsul cu comanda Ghicitoare și răspunsul ca argument. ").

reguli2(8,
"Utilizatorul are posibilitatea de a salva progresul realizat prin comanda Salvează.
Aceasta reține într-un fișier (al cărui nume este introdus ca argument) toate datele rundei curente.
Pentru a încărca un joc salvat  jucătorul utilizează comanda Încarcă urmată de numele fișierului dorit.
Prin comandă Opțiuni sunt prezentate variantele jocului ce au fost salvate și pot fi îcărcate.").

reguli2(9,
" Cu ajutorul comenzii restart jucatorul poate reseta 
toate elementele jocului ce au fost modificate la starea inițială.").

reguli2(10,
"Ești captiv în casa X. Ușa de la ieșire este încuiată. 
     Din fericire ai gâșit o hartă a casei. Aceasta nu este foarte clară în unele părți.
Poți cerceta casa dar fiecare tranziție între camere te costă energie. 
     Vei găsi obiecte, aceste pot fi folosite pentru a câștiga energie sau pentru alte activități. 
     Pentru navigare utilizează butoanele N S E V. 
     Accesul în unele canere este restricționat. 
Cel mai probail cheia de la ieșire se află în birou dar acesta este blocat de un lacăt. 
     Lacătul are o parolă de cinci litere. Este posibil să găsești parola în camerele casei. 
     Atunci cand ai aflat toate literele parolei traverseaza harta până în bibliotecă.
     Aici poti utiliza comanda Cod urmată de literele descoperite ca argument.").

reguli2(11,
"               **Începere joc
                    comanda: Joc argument: jocul dorit
                **Selectare nivel de dificultate
                    comanda: Nivel argument: nivel dorit
                **Plasarea unui obiect in inventar
                    comanda: Păstrează argument: obiect dorit
                **Renuntarea la un obiect din inventar
                    comanda: Aruncă argument: obiect dorit
                **Inspectează obiect descoperit
                    comanda: Inspectează argument: obiect dorit
                **Consumarea unui obiect pentru energie
                    comanda: Mănâncă argument: obiect dorit
                **Completarea codului pentru acces în Birou
                    comanda: Cod argument: codul de 5 litere
                **Salvarea jocului curent
                    comanda: Salvează argument: nume fisier
                **Încărcarea unui joc anterior
                    comanda: Încarcă argument:  nume fisier
                **Clasamentul jucătorilor pentru un anumit nivel
                    comanda: Clasament argument: nivel dorit
                **Decizia pentru jocul dilema prizonierilor
                    comanda: Decizie argument: recunoaste / neaga in functie de hotararea luata
                **Mutare pentru jocul sudoku 
                    comanda: Sudoku argument1: pozitia argument2: valoarea noua
                **Răspuns la ghicitoare pentr deschiderea seifului
                    comanda: Ghicitoare argument: raspuns
                **Pentru jocul de foarfeca-hartie-piatra împotriva calculatorului
                    comanda: Foarfecă-Hârtiepiatră argument: foarfecă, hârtie sau piatră
                **În cazul în care lanterna rămane făra energie 
                    comanda: Repară argument: lanterna").

reguli2(12,
"           **Comenzi ce nu necesită argumente
                    Inventar -- Listarea inventaruiui 
                    Energie  -- Afișarea energiei curente
                    Viață    -- Afișarea stării de sănătate
                    Restart  -- Resetarea datelor jocului
                    Opțiuni  -- Listarea fișierelor cu jocuri salvate 
                    Ajutor   -- Ajutor pentru jocul sliding 8
                    Parola   -- Afișarea literelor din parolă descoperite
                    Locație  -- Examinarea împrejurimilor jucătorului
                    Bandajare-- Utilizarea unui bandaj pentru creșterea nivelului de viață").

reguli2(13,
"Unele camere nu sunt luminate suficient pentru a permite circularea.
În cazul acestor camere este necesară o sursă de lumină precum o lanternă.
După un anumit număr de utilizări lanterna rămâne fără energie și nu mai poate fi  utilizată.
În cazul în care lanterna rămâne fără energie se utilizează: 
    comanda: Repară cu argumentul: lanterna
Este necesară și o baterie.").

reguli2(14,
"Punctele de viață pot fi pierdute în unele camere periculoase.
Epuizarea tuturor aceste puncte duce la pierderea jocului.
În cazul în care a fost decoperit un bandaj el poate fi utilizat pentru
a îmbunătăți starea de sănătate a jucătorului. Bandajul nu apare în fiecare rundă.
Frecvența cu care acesta apare este determinată de nivlul de dificultate ales.").

reguli2(15,
"Butoanele numerotate de la 1 la 9 sunt pentru jocul de x și 0 împotriva calculatorului. 
Pentru navigare utilizează butoanele N S E V. 
Butoanele U D R L controleaza jocul sliding.").

reguli2(16,
"Unele camere sunt periculoase. Ele conțin capcane și pot pune în pericol viața jucătorului.
Prin comanda Viață poți vedea care este starea ta curentă.").

reguli2(17,
"Trei dintre mini jocurile disponibile sunt cronometrate.
Ele trebuie să fie rezolvate într-un număr prestabilit de secunde.
După scurgerea timpului jocurile nu mai acceptă mutări.
La fiecare mutare nouă se va specifica câte secunde au mai rămas până la închiderea jocului.
Timpul pus la dispoziți jucătorului e calculat în funcție de joc și de nivelul de dificultate ales.").

reguli2(18,
"Butonul harta prezintă jucătorului o hartă a părților din casă pe care lea vizitat în jocul curent.
Harta jocului poate să difere.
Există patru variante diferite pentru harta jocului.
Jucătorul nu este implicat în procesul de alegere a hărții.").