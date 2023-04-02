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
stop_timer([L|T]):-
        thread_property(L, status(running)),
        thread_signal(L, abort),
        stop_timer(T),!.
stop_timer([_|T]):-
        stop_timer(T),!.

timer_thread(Time, Action) :-
    sleep(Time),
    (   timer_thread_active
    ->  call(Action)
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