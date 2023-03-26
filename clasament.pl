clasament(Nivel,Energie):-
        Nivel = usor ->
        procesareUsor(Energie),!;
        Nivel = mediu ->
        procesareMediu(Energie),!;
        Nivel = dificil ->
        procesareDificil(Energie),!;
        Nivel = imposibil ->
        procesareImposibil(Energie),!.


procesareMediu(Energie):-
        citireMediu(Clasament),
        sortate(Clasament,Energie,ClasamentNou),
        tell('C:\\Users\\lenovo\\Documents\\Prolog\\LucrareFilipAlin\\clasament\\ClasamentNivelMediu.txt'),
        scriere(ClasamentNou),
        told.

procesareUsor(Energie):-
        citireUsor(Clasament),
        sortate(Clasament,Energie,ClasamentNou),
        tell('C:\\Users\\lenovo\\Documents\\Prolog\\LucrareFilipAlin\\clasament\\ClasamentNivelUsor.txt'),
        scriere(ClasamentNou),
        told.

procesareDificil(Energie):-
        citireDificil(Clasament),
        sortate(Clasament,Energie,ClasamentNou),
        tell('C:\\Users\\lenovo\\Documents\\Prolog\\LucrareFilipAlin\\clasament\\ClasamentNivelDificil.txt'),
        scriere(ClasamentNou),
        told.

procesareImposibil(Energie):-
        citireImposibil(Clasament),
        sortate(Clasament,Energie,ClasamentNou),
        tell('C:\\Users\\lenovo\\Documents\\Prolog\\LucrareFilipAlin\\clasament\\ClasamentNivelImposibil.txt'),
        scriere(ClasamentNou),
        told.

scriere([]).
scriere([end_of_file|_]).
scriere([L|T]):-
        write(L),write('.\n'),
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

comparator2(X,Y,Z):-
        Y < Z->
        X = >;
        X = < .

sortate(Clasament,Energie,L):-
         stergeEOF(Clasament,ClasamentCurat), 
         predsort(comparator2,[Energie|ClasamentCurat],L),!.

stergeEOF([],[]).
stergeEOF([end_of_file|_],[]).
stergeEOF([L|T],[L|R]):-stergeEOF(T,R),!.

afisareClasament(Nivel,R):-
        Nivel = usor ->
        citireUsor(Clasament),
        scriereClasament(Clasament,R1),
        atom_concat('Clasament Nivel Usor:\n',R1,R),!;
        Nivel = mediu ->
        citireMediu(Clasament),
        scriereClasament(Clasament,R1),
        atom_concat('Clasament Nivel Mediu:\n',R1,R),!;
        Nivel = dificil ->
        citireDificil(Clasament),
        scriereClasament(Clasament,R1),
        atom_concat('Clasament Nivel Dificil:\n',R1,R),!;
        Nivel = imposibil ->
        citireImposibil(Clasament),
        scriereClasament(Clasament,R1),
        atom_concat('Clasament Nivel Imposibil:\n',R1,R),!.

scriereClasament([],'').
scriereClasament([L|T],R):-
        scriereClasament(T,R1),
        atom_concat(L,"\n",RR),
        atom_concat(RR,R1,R),!.        