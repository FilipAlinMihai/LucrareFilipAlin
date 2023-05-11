:- include('euristica.pl').

:- dynamic listaCurenta/1,stariCandidate/1,semneRecente/1,miscarileEfectuate/1,stariParcurse/1,solutie/1.

listaCurenta([0,1,2,3,4,5,6,7,8]).

pozitiiE([0,1,3,4,6,7]).
pozitiiW([1,2,4,5,7,8]).
pozitiiN([3,4,5,6,7,8]).
pozitiiS([0,1,2,3,4,5]).

stariCandidate([]).
stariParcurse([]).
solutie([]).

mutarile(X,ListaMutari,SR2):-
        retract(listaCurenta(_)),
        assert(listaCurenta(X)),
        bagof(R, mutareUrmatoare(R), ListaMutari),
        semneRecente(SR),
        reverse(SR,SR2),
        retract(semneRecente(_)),
        assert(semneRecente([])).

apartine([G|_],G).
apartine([_|T],G):-apartine(T,G).

mutare(e,[],[]).
mutare(e,[0|[Y|T]],[Y|[0|R]]):-mutare(e,T,R),!.
mutare(e,[X|T],[X|R]):-mutare(e,T,R),!.

mutare(w,[],[]).
mutare(w,[Y|[0|T]],[0|[Y|R]]):-mutare(w,T,R),!.
mutare(w,[X|T],[X|R]):-mutare(w,T,R),!.

mutare(s,[],[]).
mutare(s,[0|[Y,Z,V|T]],[V,Y,Z|[0|R]]):-mutare(s,T,R),!.
mutare(s,[X|T],[X|R]):-mutare(s,T,R),!.

mutare(n,[],[]).
mutare(n,[Y,Z,V|[0|T]],[0|[Z,V,Y|R]]):-mutare(n,T,R),!.
mutare(n,[X|T],[X|R]):-mutare(n,T,R),!.

semneRecente([]).

mutareUrmatoare(R1):-
        listaCurenta(X),
        pozitiiE(E),
        pozitieInStare(0,X,R),
        apartine(E,R),
        mutare(e,X,R1),
        semneRecente(SR),
        retract(semneRecente(_)),
        assert(semneRecente([e|SR])).


mutareUrmatoare(R1):-
        listaCurenta(X),
        pozitiiW(W),
        pozitieInStare(0,X,R),
        apartine(W,R),
        mutare(w,X,R1),
        semneRecente(SR),
        retract(semneRecente(_)),
        assert(semneRecente([w|SR])).

mutareUrmatoare(R1):-
        listaCurenta(X),
        pozitiiN(N),
        pozitieInStare(0,X,R),
        apartine(N,R),
        mutare(n,X,R1),
        semneRecente(SR),
        retract(semneRecente(_)),
        assert(semneRecente([n|SR])).

mutareUrmatoare(R1):-
        listaCurenta(X),
        pozitiiS(S),
        pozitieInStare(0,X,R),
        apartine(S,R),
        mutare(s,X,R1),
        semneRecente(SR),
        retract(semneRecente(_)),
        assert(semneRecente([s |SR])).

egaleAstar(X,X).

miscarileEfectuate([]).

startAstar(X,Sol):-astar(X,0),solutie(Sol).


astar(_,32):-write('Adancime prea mare'),
        miscarileEfectuate(ME),
        reverse(ME,ME2),
        write(ME2),
        retract(miscarileEfectuate(_)),
        assert(miscarileEfectuate([])),
        retract(stariCandidate(_)),
        assert(stariCandidate([])),
        retract(stariParcurse(_)),
        assert(stariParcurse([])),!.

astar(X,_):-
        egaleAstar(X,[0,1,2,3,4,5,6,7,8]),
        extrageDate(Parinte,Semn,ListaRamasa),
        construireCale(Parinte,ListaRamasa,Semne),
        reverse(Semne,Semne2),
        append(Semne2,[Semn],SP),
        %write(SP),
        retract(solutie(_)),
        assert(solutie(SP)),
        retract(miscarileEfectuate(_)),
        assert(miscarileEfectuate([])),
        retract(stariCandidate(_)),
        assert(stariCandidate([])),
        retract(stariParcurse(_)),
        assert(stariParcurse([])),!.


astar(X,I):-
        determinareStariNoi(X,I,ListaStariDerivate),
        completareStariCandidate(ListaStariDerivate,StariCandidate),
        predsort(comparator,StariCandidate,[[StarePreferentiala,CostCale,Semn,Parinte,ValoarePreferentiala]|_]),
        miscarileEfectuate(ME),
        retract(miscarileEfectuate(_)),
        assert(miscarileEfectuate([Semn|ME])),
        eliminareDuplicat([StarePreferentiala,CostCale,Semn,Parinte,ValoarePreferentiala],StariCandidate,StariRamase),
        retract(stariCandidate(_)),
        assert(stariCandidate(StariRamase)),
        stariParcurse(SP),
        retract(stariParcurse(_)),
        assert(stariParcurse([[StarePreferentiala,CostCale,Semn,Parinte,ValoarePreferentiala]|SP])),
        astar(StarePreferentiala,CostCale),!.




determinareStariNoi(X,I,ListaStariDerivate):-
                mutarile(X,ListaMutari,ListaSemne),
                construirePerechi(X,I,ListaMutari,ListaSemne,ListaStariDerivate).

construirePerechi(_,_,[],[],[]).
construirePerechi(Parinte,I,[Stare|Stari],[Semn|Semne],[[Stare,CostCale,Semn,Parinte,Valoare]|Perechi]):-
                euristica(Stare,Valoare),
                CostCale is I+1,
                construirePerechi(Parinte,I,Stari,Semne,Perechi),!.

completareStariCandidate([[_,CostCale,_,_,_]|ListaStariDerivate],StariCandidate):-
                CostCale >  31,
                completareStariCandidate(ListaStariDerivate,StariCandidate),!.


completareStariCandidate([],StariCandidate):-stariCandidate(StariCandidate).
completareStariCandidate([Stare|ListaStariDerivate],[Stare|StariCandidate]):-
                completareStariCandidate(ListaStariDerivate,StariCandidate),
                \+ contine(StariCandidate,Stare,_),
                stariParcurse(StariParcurse),
                \+ contine(StariParcurse,Stare,_),!.

completareStariCandidate([[Lista,CostCale,Semn,Parinte,Valoare]|ListaStariDerivate],[[Lista,CostCale,Semn,Parinte,Valoare]|StariRamase]):-
                completareStariCandidate(ListaStariDerivate,StariCandidate),
                contine(StariCandidate,[Lista,CostCale,Semn,Parinte,Valoare],C),
                stariParcurse(StariParcurse),
                \+ contine(StariParcurse,[Lista,CostCale,Semn,Parinte,Valoare],_),
                C>CostCale,
                eliminareDuplicat([Lista,CostCale,Semn,Parinte,Valoare],StariCandidate,StariRamase),!.

completareStariCandidate([_|ListaStariDerivate],StariCandidate):-
                completareStariCandidate(ListaStariDerivate,StariCandidate),!.

contine([[G,C,_,_,_]|_],[G,_,_,_,_],C).
contine([_|T],G,V):-contine(T,G,V).

eliminareDuplicat(_,[],[]).
eliminareDuplicat([Lista,CostCale,Semn,Parinte,Valoare],[[Lista,_,_,_,_]|StariCandidate],StariRamase):-
                eliminareDuplicat([Lista,CostCale,Semn,Parinte,Valoare],StariCandidate,StariRamase),!.
eliminareDuplicat([Lista,CostCale,Semn,Parinte,Valoare],[Stare|StariCandidate],[Stare|StariRamase]):-
                eliminareDuplicat([Lista,CostCale,Semn,Parinte,Valoare],StariCandidate,StariRamase),!.

construireCale(_,[],[]).
construireCale(ParintePrimit,[[ParintePrimit,_,Semn,Parinte,_]|StariRamase],[Semn|Semne]):-
                        construireCale(Parinte,StariRamase,Semne),!.
construireCale(ParintePrimit,[[_,_,_,_,_]|StariRamase],Semne):-
                        construireCale(ParintePrimit,StariRamase,Semne),!.
extrageDate(Parinte,Semn,ListaRamasa):-
        stariParcurse([[[0,1,2,3,4,5,6,7,8],_,Semn,Parinte,_]|ListaRamasa]).


comparator(X,[_,CostCale1,_,_,Valoare1],[_,CostCale2,_,_,Valoare2]):-
        CostCale1+Valoare1 > CostCale2+Valoare2->
        X = >;
        X = < .