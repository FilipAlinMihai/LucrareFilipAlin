clasament(Nivel,Energie,Nume):-
        Nivel = usor ->
        procesareUsor(Energie,Nume),!;
        Nivel = mediu ->
        procesareMediu(Energie,Nume),!;
        Nivel = dificil ->
        procesareDificil(Energie,Nume),!;
        Nivel = imposibil ->
        procesareImposibil(Energie,Nume),!.


procesareMediu(Energie,Nume):-
        citireMediu(Clasament),
        eliminate_spaces(Nume, Nume2),
        sortate(Clasament,[Energie,Nume2],ClasamentNou),
        tell('C:\\Users\\lenovo\\Documents\\Prolog\\LucrareFilipAlin\\clasament\\ClasamentNivelMediu.txt'),
        scriere(ClasamentNou),
        told.

procesareUsor(Energie,Nume):-
        citireUsor(Clasament),
        eliminate_spaces(Nume, Nume2),
        sortate(Clasament,[Energie,Nume2],ClasamentNou),
        tell('C:\\Users\\lenovo\\Documents\\Prolog\\LucrareFilipAlin\\clasament\\ClasamentNivelUsor.txt'),
        scriere(ClasamentNou),
        told.

procesareDificil(Energie,Nume):-
        citireDificil(Clasament),
        eliminate_spaces(Nume, Nume2),
        sortate(Clasament,[Energie,Nume2],ClasamentNou),
        tell('C:\\Users\\lenovo\\Documents\\Prolog\\LucrareFilipAlin\\clasament\\ClasamentNivelDificil.txt'),
        scriere(ClasamentNou),
        told.

procesareImposibil(Energie,Nume):-
        citireImposibil(Clasament),
        eliminate_spaces(Nume, Nume2),
        sortate(Clasament,[Energie,Nume2],ClasamentNou),
        tell('C:\\Users\\lenovo\\Documents\\Prolog\\LucrareFilipAlin\\clasament\\ClasamentNivelImposibil.txt'),
        scriere(ClasamentNou),
        told.

eliminate_spaces(Proposition, NewProposition) :-
    atom_chars(Proposition, Chars),
    findall(C, (member(C, Chars), C \= ' '), CleanChars),
    atomic_list_concat(CleanChars, NewProposition).

scriere([]).
scriere([end_of_file|_]).
scriere([[P,N]|T]):-
        write(P),write('.\n'),
        string_lower(N,N1),
        write(N1),write('.\n'),
        scriere(T),!.

citireMediu(Clasament):-
        open('C:\\Users\\lenovo\\Documents\\Prolog\\LucrareFilipAlin\\clasament\\ClasamentNivelMediu.txt', read, Str),
        citeste(Str,Clasament),
        close(Str).

citireUsor(Clasament):-
        open('C:\\Users\\lenovo\\Documents\\Prolog\\LucrareFilipAlin\\clasament\\ClasamentNivelUsor.txt', read, Str),
        citeste(Str,Clasament),
        close(Str).

citireDificil(Clasament):-
        open('C:\\Users\\lenovo\\Documents\\Prolog\\LucrareFilipAlin\\clasament\\ClasamentNivelDificil.txt', read, Str),
        citeste(Str,Clasament),
        close(Str).

citireImposibil(Clasament):-
        open('C:\\Users\\lenovo\\Documents\\Prolog\\LucrareFilipAlin\\clasament\\ClasamentNivelImposibil.txt', read, Str),
        citeste(Str,Clasament),
        close(Str).

citeste(Continut,[]) :-
    at_end_of_stream(Continut),!.

citeste(Continut,[X|T]) :-
    \+ at_end_of_stream(Continut),
    read(Continut,X),
    citeste(Continut,T),!.

comparator2(X,[Y,_],[Z,_]):-
        Y < Z->
        X = >;
        X = < .

sortate(Clasament,[Energie,Nume],L):-
         stergeEOF(Clasament,ClasamentCurat), 
         perechi(ClasamentCurat,Perechi),
         predsort(comparator2,[[Energie,Nume]|Perechi],L),!.

stergeEOF([],[]).
stergeEOF([end_of_file|_],[]).
stergeEOF([L|T],[L|R]):-stergeEOF(T,R),!.

afisareClasament(Nivel,R):-
        Nivel = usor ->
        citireUsor(Clasament),
        stergeEOF(Clasament,Clasament1),
        scriereClasament(Clasament1,R1),
        atom_concat('Clasament Nivel Ușor:\n',R1,R),!;
        Nivel = mediu ->
        citireMediu(Clasament),
        stergeEOF(Clasament,Clasament1),
        scriereClasament(Clasament1,R1),
        atom_concat('Clasament Nivel Mediu:\n',R1,R),!;
        Nivel = dificil ->
        citireDificil(Clasament),
        stergeEOF(Clasament,Clasament1),
        scriereClasament(Clasament1,R1),
        atom_concat('Clasament Nivel Dificil:\n',R1,R),!;
        Nivel = imposibil ->
        citireImposibil(Clasament),
        stergeEOF(Clasament,Clasament1),
        scriereClasament(Clasament1,R1),
        atom_concat('Clasament Nivel Imposibil:\n',R1,R),!.

scriereClasament([],'').
scriereClasament([L,M|T],R):-
        scriereClasament(T,R1),
        atom_concat(L,"---",R01),
        string_upper(M,M1),
        atom_concat(R01,M1,R02),
        atom_concat(R02,"\n",RR),
        atom_concat(RR,R1,R),!.        

perechi([],[]).
perechi([X,Y|T],[[X,Y]|Perechi]):-
                perechi(T,Perechi).