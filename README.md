# LucrareFilipAlin

** Aplicația este pornită prin rularea fișierului interfata.pl și mai ampoi prin executarea clauzei run. în   SWI-Prolog. În acest moment interfața jocului apare pe ecranul utilizatorului. **

** Pentru funcționarea corectă a aplicației (mai precis a funcțiilor de salvare și încărcare și a clasamentelor) trebuie realizată una din variantele următoare:**

** I Directorul LucrareFilipAlin ar trebui plasat în working_directory-ul SWI-Prolog. Spre exemplu "c:/Users/Vlad/Documents/Prolog/LucrareFilipAlin" . Calea spre  working_directory-ul SWI-Prolog poate să difere de la utilizator la utilizator. Pentru a afla această cale se poate utiliza working_directory(CurrentDir, '.'). direct în SWI-Prolog. CurrentDir va indica locația unde trebuie plasat directorul LucrareFilipAlin.**

**II O altă variantă este modificarea working_directory-ului SWI-Prolog cu comanda cd(LocațieNouă). direct în SWI_Prolog. LocațieNouă este o locație nouă preferată de utilizator de forma 'c:/users/vlad/documents/prolog/licenta-alin-filip00-2023/proiect' și directorul LucrareFilipAlin se regăsește în directorul proiect. **

Aplicația conține un joc bazat pe text ce include o serie de elemente și concepte din teoria jocurilor.
Sunt inmplementate mini jocuri din diverse categori ce dau recompente pentru jocul principal. 
Jocul plasează utilizatorul într-o casă în care singrura cale de ieșire este încuiată.
Astfel apare obiectivul principal al jocului și anume evadarea.
Înainte de orice acțiune utilizatorul trebuie să aleagă un nivel de dificultate.
Pentru a face jocul mai competitiv există puncte de energie și la fiecare deplasare este pierdut câte un punct. Numărul de puncte de start este decis de jucător prin selectarea nuvelului de dificultate dorit. 