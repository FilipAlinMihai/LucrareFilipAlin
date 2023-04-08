:- dynamic 
        timpSudoku/1,
        timpSliding/1,
        timpHunter/1,
        fireExecutie/1.

timpSudoku(0).
timpSliding(0).
timpHunter(0).

fireExecutie([]).

start_timer(Timp, Actiune) :-
    thread_create(timer_thread(Timp, Actiune), IDFir, [detached(true)]),
    assert(timer_thread(IDFir)),
    fireExecutie(Lista),
    retract(fireExecutie(_)),
    assert(fireExecutie([IDFir|Lista])).

stop_timer([]).
stop_timer([X|T]):-
        (   thread_property(X, status(running))
    ->  thread_signal(X, abort),
        opresteFir(X),
        stop_timer(T)
    ;   (   thread_property(X, existence(true))
        ->  true % thread exists, but is not running
        ;   format('Firul de execuție ~w nu mai există .~n', [X])
        ),
        stop_timer(T)
    ),!.

timer_thread(Timp, Actiune) :-
    thread_self(IDFir),
    sleep(Timp),
    (   activ
    ->  call(Actiune),
    opresteFir(IDFir)
    ;   true
    ).

activ :-
    current_predicate(timer_thread/1),
    timer_thread(_).

timpRamas(Joc,Timpramas):-
        alegereTimp(Joc,MomentFinalizare),
        get_time(Ora),
        Timpramas is MomentFinalizare - Ora,
        stamp_date_time(Timpramas, _, 'local'),!.

eliminareFir(_,[],[]).
eliminareFir(ThreadId,[ThreadId|Lista],ListaNoua):-
        eliminareFir(ThreadId,Lista,ListaNoua),!.
eliminareFir(ThreadId,[L|Lista],[L|ListaNoua]):-
        eliminareFir(ThreadId,Lista,ListaNoua),!.

opresteFir(IDFir):-
        fireExecutie(Lista),
        eliminareFir(IDFir,Lista,ListaNoua),
        retract(fireExecutie(_)),
        assert(fireExecutie(ListaNoua)).

alegereTimp(Joc,MomentFinalizare):-
        Joc = sudoku->
        timpSudoku(MomentFinalizare),!;
        Joc = hunter->
        timpHunter(MomentFinalizare),!;
        Joc = sliding->
        timpSliding(MomentFinalizare),!.