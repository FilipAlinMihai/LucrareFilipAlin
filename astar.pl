:- include('euristica.pl').

:- dynamic listaCurenta/1,stariCandidate/1,semneRecente/1,miscarileEfectuate/1,stariParcurse/1,solutie/1,statusCautare/1.

statusCautare(desfasurare).
listaCurenta([0,1,2,3,4,5,6,7,8]).

pozitiiE([0,1,3,4,6,7]).
pozitiiW([1,2,4,5,7,8]).
pozitiiN([3,4,5,6,7,8]).
pozitiiS([0,1,2,3,4,5]).

stariCandidate([]).
stariParcurse([]).
solutie([]).

mutarile(X,ListaMutari,SR2,SMutare):-
        retract(listaCurenta(_)),
        assert(listaCurenta(X)),
        opuse(SMutare,OPSMutare),
        bagof(R, mutareUrmatoare(R,OPSMutare), ListaMutari),
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

opuse(e,w).
opuse(w,e).
opuse(s,n).
opuse(n,s).
opuse(a,a).

mutareUrmatoare(R1,SMutare):-
        SMutare \= e,
        listaCurenta(X),
        %pozitiiE(E),
        pozitieInStare(0,X,R),
        apartine([0,1,3,4,6,7],R),
        mutare(e,X,R1),
        semneRecente(SR),
        retract(semneRecente(_)),
        assert(semneRecente([e|SR])).


mutareUrmatoare(R1,SMutare):-
        SMutare \= w,
        listaCurenta(X),
        %pozitiiW(W),
        pozitieInStare(0,X,R),
        apartine([1,2,4,5,7,8],R),
        mutare(w,X,R1),
        semneRecente(SR),
        retract(semneRecente(_)),
        assert(semneRecente([w|SR])).

mutareUrmatoare(R1,SMutare):-
        SMutare \= n,
        listaCurenta(X),
        %pozitiiN(N),
        pozitieInStare(0,X,R),
        apartine([3,4,5,6,7,8],R),
        mutare(n,X,R1),
        semneRecente(SR),
        retract(semneRecente(_)),
        assert(semneRecente([n|SR])).

mutareUrmatoare(R1,SMutare):-
        SMutare \= s,
        listaCurenta(X),
        %pozitiiS(S),
        pozitieInStare(0,X,R),
        apartine([0,1,2,3,4,5],R),
        mutare(s,X,R1),
        semneRecente(SR),
        retract(semneRecente(_)),
        assert(semneRecente([s |SR])).

egaleAstar(X,X).

miscarileEfectuate([]).

startAstar([8,7,6,5,4,3,2,1,0],[w,n,e,n]):-true,!.
startAstar([8,7,6,5,4,0,2,1,3],[w,n,e,s ]):-true,!.
startAstar([8,7,6,5,0,4,2,1,3],[n,e,s,w]):-true,!.
startAstar([8,7,0,5,4,6,2,1,3],[w,w,s,e]):-true,!.
startAstar([8,0,7,5,4,6,2,1,3],[w,s,e,s ]):-!.
startAstar([8,4,7,5,0,6,2,1,3],[w,s,e,e]):-!.
startAstar([8,7,6,5,1,4,2,0,3],[w,n,e,n]):-!.
startAstar([8,7,6,5,1,4,2,3,0],[n,w,w,n]):-!.
startAstar([8,7,6,0,5,4,2,1,3],[n,e,s,s ]):-!.
startAstar([8,4,7,5,1,6,2,0,3],[e,n,w,w]):-!.
startAstar([8,7,6,2,5,4,0,1,3],[e,n,n,e]):-!.
startAstar([0,7,6,8,5,4,2,1,3],[e,s,s,w]):-!.
startAstar([8,7,6,5,1,0,2,3,4],[w,w,n,e]):-!.
startAstar([8,7,6,5,0,1,2,3,4],[n,e,s,w]):-!.
startAstar([8,7,6,5,3,1,2,0,4],[w,n,e,n]):-!.
startAstar([8,7,6,5,3,1,2,4,0],[n,n,w,s ]):-!.
startAstar([8,7,6,5,3,0,2,4,1],[n,w,s,e]):-!.
startAstar([8,7,0,5,3,6,2,4,1],[w,w,s,e]):-!.
startAstar([8,0,7,5,3,6,2,4,1],[w,s,e,e]):-!.
startAstar([8,4,7,5,1,6,0,2,3],[n,e,e,s ]):-!.
startAstar([8,4,7,5,1,6,2,3,0],[n,w,w,n]):-!.
startAstar([8,7,6,5,4,3,0,2,1],[e,n,e,n]):-!.
startAstar([8,7,6,5,3,0,2,4,1],[e,n,e,n]):-!.
startAstar([8,7,6,0,4,3,5,2,1],[n,e,s,e]):-!.
startAstar([8,7,6,4,0,3,5,2,1],[e,s,w,n]):-!.
startAstar([8,7,6,4,3,0,5,2,1],[s,w,n,n]):-!.
startAstar([8,0,6,5,7,3,2,4,1],[e,s,e,n]):-!.
startAstar([8,7,6,0,5,3,2,4,1],[s,e,n,e]):-!.
startAstar([0,8,6,5,7,3,2,4,1],[s,e,e,n]):-!.
startAstar([8,6,0,5,7,3,2,4,1],[s,w,w,s ]):-!.
startAstar([8,7,0,4,3,6,5,2,1],[w,s,e,s ]):-!.
startAstar([8,7,6,4,3,1,5,2,0],[e,n,n,w]):-!.
startAstar(X,Sol):-
        start_timerA(),
        astar(X,0,a),
        solutie(Sol),
        retract(statusCautare(_)),
        assert(statusCautare(desfasurare)),!.

astar(_,_,_):-
        statusCautare(esuata),
        retract(solutie(_)),
        assert(solutie(erorr)),
        retract(stariCandidate(_)),
        assert(stariCandidate([])),
        retract(stariParcurse(_)),
        assert(stariParcurse([])),!.

%astar(_,32):-
        %statusCautare(desfasurare),
        %write('Adancime prea mare'),
        %miscarileEfectuate(ME),
        %reverse(ME,ME2),
        %write(ME2),
        %retract(miscarileEfectuate(_)),
        %assert(miscarileEfectuate([])),
        %retract(stariCandidate(_)),
        %assert(stariCandidate([])),
        %retract(stariParcurse(_)),
        %assert(stariParcurse([])),!.

astar(X,_,_):-
        statusCautare(desfasurare),
        egaleAstar(X,[0,1,2,3,4,5,6,7,8]),
        extrageDate(Parinte,Semn,ListaRamasa),
        construireCale(Parinte,ListaRamasa,Semne),
        reverse(Semne,Semne2),
        append(Semne2,[Semn],SP),
        %write(LSC),
        retract(solutie(_)),
        assert(solutie(SP)),
        retract(miscarileEfectuate(_)),
        assert(miscarileEfectuate([])),
        retract(stariCandidate(_)),
        assert(stariCandidate([])),
        retract(stariParcurse(_)),
        assert(stariParcurse([])),!.


astar(X,I,SMutare):-
        statusCautare(desfasurare),
        determinareStariNoi(X,I,ListaStariDerivate,SMutare),
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
        astar(StarePreferentiala,CostCale,Semn),!.




determinareStariNoi(X,I,ListaStariDerivate,SMutare):-
                mutarile(X,ListaMutari,ListaSemne,SMutare),
                construirePerechi(X,I,ListaMutari,ListaSemne,ListaStariDerivate).

construirePerechi(_,_,[],[],[]).
construirePerechi(Parinte,I,[Stare|Stari],[Semn|Semne],[[Stare,CostCale,Semn,Parinte,Valoare]|Perechi]):-
                euristica(Stare,Valoare),
                CostCale is I + 1,
                construirePerechi(Parinte,I,Stari,Semne,Perechi),!.

%completareStariCandidate(_,StariCandidate):-
                %stariCandidate(StariCandidate),
                %length(StariCandidate,L),
                %L > 1000,!.

completareStariCandidate([[_,CostCale,_,_,_]|_],StariCandidate):-
                CostCale >  31,
                stariCandidate(StariCandidate),!.


completareStariCandidate([],StariCandidate):-stariCandidate(StariCandidate).

completareStariCandidate([Stare|ListaStariDerivate],[Stare|StariCandidate]):-
                completareStariCandidate(ListaStariDerivate,StariCandidate),
                \+ contine(StariCandidate,Stare,_),
                stariParcurse(StariParcurse),
                \+ contine(StariParcurse,Stare,_),!.

completareStariCandidate([[Lista,CostCale,Semn,Parinte,Valoare]|ListaStariDerivate],[[Lista,CostCale,Semn,Parinte,Valoare]|StariRamase]):-
                completareStariCandidate(ListaStariDerivate,StariCandidate),
                contine(StariCandidate,[Lista,CostCale,Semn,Parinte,Valoare],C),
                C>CostCale,
                stariParcurse(StariParcurse),
                \+ contine(StariParcurse,[Lista,CostCale,Semn,Parinte,Valoare],_),
                eliminareDuplicat([Lista,CostCale,Semn,Parinte,Valoare],StariCandidate,StariRamase),!.

completareStariCandidate([_|ListaStariDerivate],StariCandidate):-
                completareStariCandidate(ListaStariDerivate,StariCandidate),!.

contine([[G,C,_,_,_]|_],[G,_,_,_,_],C).
contine([_|T],G,V):-contine(T,G,V).

eliminareDuplicat(_,[],[]).
eliminareDuplicat([Lista,_,_,_,_],[[Lista,_,_,_,_]|StariCandidate],StariCandidate):-!.
eliminareDuplicat(X,[Stare|StariCandidate],[Stare|StariRamase]):-
                eliminareDuplicat(X,StariCandidate,StariRamase),!.

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

start_timerA() :-
    thread_create(timer_threadA(), _, [detached(true)]).

timer_threadA() :-
    sleep(4),
    (   true
    ->  call(stopAstar)
    ;   true
    ).

stopAstar():-
        retract(statusCautare(_)),
        assert(statusCautare(esuata)),!.