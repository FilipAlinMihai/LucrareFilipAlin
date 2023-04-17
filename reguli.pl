regulile(X):-atom_concat('** Ești captiv în casa X. Ușa de la ieșire este încuiată. 
     Din fericire ai gâșit o hartă a casei. Aceasta nu este foarte clară în unele părți.
** Poți cerceta casa dar fiecare tranziție între camere te costă energie. 
     Vei găsi obiecte, aceste pot fi folosite pentru a câștiga energie sau pentru alte activități. 
     Pentru navigare utilizează butoanele N S E V. 
     Accesul în unele canere este restricționat. 
** Cel mai probail cheia de la ieșire se află în birou dar acesta este blocat de un lacăt. 
     Lacătul are o parolă de cinci litere. Este posibil să găsești parola în camerele casei. 
     Atunci cand ai aflat toate literele parolei traverseaza harta pana in biblioteca.
     Aici poti utiliza comanda Cod urmata de literele descoperite ca argument. 
** Vei avea posibilitatea de a juca mini jocuri. Daca reusesti sa castigi vei primi recompense. 
** Unele camere sunt periculoase. Ele contin capcane si pot pune in pericol viata jucatorului.
     Prin comanda viata poti vedea care este starea ta curenta.
** Butoanele numerotate de la 1 la 9 sunt pentru jocul de x si 0 impotriva calculatorului. 
** Initial jucatorul trebuie sa selecteze dificultatea. Exista 4 nivele disponibile usor mediu dificil si imposibil. 
     Dificultatea e selectata prin comanda nivel cu un argument, acesta fiind nivelul ales.
** Obiectele sunt plasate in inventar cu comanda pastreaza. 
     Obiectele comestibile pot fi consumate prin comanda mananca 
** Pentru a afla nivelul de energie exista comanda energie iar pentru listarea inventarului inventar. 
** Atunci cand se doreste inceperea unui joc se utilizeaza comanda joc urmata de jocul respectiv ca argument. 
     Imediat dupa inceperea unui joc vor fi prezentate si regulile si restrictiile acestuia. 
** Prima caseta select este pentru comenzi iar urmatoarele doua casete de input pentru eventualele argumente ale acestora. 
     Comenzile energie, viata si inventar nu necesita un argument anume. 
** Pentru A prelua cheia din seif trebuie sa raspunzi corect la o ghicitoare gasita in camerele casei. 
     Scrie raspunsul cu comanda ghicitoare si raspunsul ca argument. 
** Pentru a determina continutul unor obiecte precum cartile sau biletele
     poate fi utilizata comanda inspecteaza urmata de obiectul ce trebuie evaluat.
** Cu ajutorul comenzii restart jucatorul poate reseta toate elementele jocului ce au fost modificate la starea initiala.
     Utilizatorul are posibilitatea de a salva progresul realizat prin comanda salveaza.
     Aceasta retine intr-un fisier (al carui nume este introdus ca argument) toate datele rundei curente.
     Pentru a incarca un joc salvat  jucatorul utilizeaza comanda incarca urmata de numele fisierului dorit.
     Prin comanda optiuni sunt prezentate variantele jocului ce au fost salvate si pot fi incarcate.
** Jucatorul poate salva jocul cu un anumit nume.
     Utilizand acest nume el poate incarca jocul pentru a fi continuat mai tarziu.
     Prin comanda restart jocul este adus la setarile sale originale pentru o noua incercare.
** Este creat cate un clasament pentru fiecare nivel de dificultate.
     Dupa ce jocul a fost finalizat cu succes jucatorul introduce numele cu care va aparea in clasament.
     Clasamentul se bazeaza pe numarul de puncte de energie cu care jucatorul a terminat jocul.
     Cu cat numarul este mai mare cu atat jucatorul va fi mai sus in clasament.
** Trei dintre mini jocurile disponibile sunt cronometrate.
     Ele trebuie sa fie rezolvate intr-un numar prestabilit de secunde.
     Dupa curgerea timpului jocurile nu mai accepta mutari.
     La fiecare mutare noua se va specifica cate secunde au mai ramas pana la inchiderea jocului.
     Timpul pus la dispoziti jucatorului e calculat in functie de joc si de nivelul de dificultate ales.
** Exista o limita de obiecte pe care jucatorul le poate cara la un moment dat.
     Daca inventarul este plin jucatorul poate scapa de obiectele mai putin importante prin comanda arunca.
** Prin comanda Parola Jucatorul poate vedea literele parole pe care lea descoperit.
     Spre exemplu daca au fost gasite literele 2 si 5 si aceste sunt T si G comanda parola va afisa *T**G.
** Obiectele pe care jucatorul le intalneste sunt distribuite in mod aleator prin camerele casei.
** De fiecare data cand se incepe un joc nou obiectele sunt redistribuite si parolele sunt modificate.
** Mini jocurile nu produc niciodata aceasi varianta a jocului.
** Pentru jocul sliding 8 utilizeaza comanda ajutor daca ramai blocat.
     Aceasta iti va oferi primii 4 pasi pe care trenuiie sa ii faci pentru  a iesi din impas.
** Butonul harta prezinta jucatorului o harta a partilor din casa pe care lea vizitat in jocul curent.
** Prin butonul Zoom poate fi izolat mesajul curent intr-o fereastra separata pentru a fi analizat mai usor.
** Doua butoane Inainte si Inapoi perrmit circularea intre ultimele trei mesaje afisate pe ecran.
** Dupa un anumit numar de utilizari lanterna ramane fara energie si nu mai poate fi  utilizata.
     In acest caz este necesara repararea lanternei. Pentru reparare este necesara o baterie noua.
** In cazul in care a fost decoperit un bandaj el poate fi utilizat pentru a imbunatati starea de sanatate a jucatorului.
     Bandajul nu apare in fiecare runda. Frecventa cu care acesta apare este determinata de nivlul de dificultate ales.
                            ','\n',X).