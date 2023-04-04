:- dynamic timp/1,fireExecutie/1.
timp(0).

fireExecutie([]).

start_timer(Time, Action) :-
    thread_create(timer_thread(Time, Action), ThreadId, [detached(true)]),
    assert(timer_thread(ThreadId)),
    fireExecutie(Lista),
    retract(fireExecutie(_)),
    assert(fireExecutie([ThreadId|Lista])).

stop_timer([]).
stop_timer([Thread|Threads]):-
        (   thread_property(Thread, status(running))
    ->  thread_signal(Thread, abort),
        fireExecutie(Lista),
        eliminareFir(Thread,Lista,ListaNoua),
        retract(fireExecutie(_)),
        assert(fireExecutie(ListaNoua)),
        stop_timer(Threads)
    ;   (   thread_property(Thread, existence(true))
        ->  true % thread exists, but is not running
        ;   format('Thread ~w no longer exists.~n', [Thread])
        ),
        stop_timer(Threads)
    ),!.

timer_thread(Time, Action) :-
    thread_self(ThreadId),
    sleep(Time),
    (   timer_thread_active
    ->  call(Action),
    fireExecutie(Lista),
    eliminareFir(ThreadId,Lista,ListaNoua),
    retract(fireExecutie(_)),
    assert(fireExecutie(ListaNoua))
    ;   true
    ).

timer_thread_active :-
    current_predicate(timer_thread/1),
    timer_thread(_).

timpRamas(Timpramas):-
        timp(MomentFinalizare),
        get_time(Ora),
        Timpramas is MomentFinalizare - Ora,
        stamp_date_time(Timpramas, _, 'local').

eliminareFir(_,[],[]).
eliminareFir(ThreadId,[ThreadId|Lista],ListaNoua):-
        eliminareFir(ThreadId,Lista,ListaNoua),!.
eliminareFir(ThreadId,[L|Lista],[L|ListaNoua]):-
        eliminareFir(ThreadId,Lista,ListaNoua),!.