:- dynamic timp/1.

timp(0).

start_timer(Time,Actiune) :-
thread_create(timer_thread(Time,Actiune), _, [detached(true)]).

timer_thread(Time,Actiune) :-
    sleep(Time),
    call(Actiune).

timpRamas(Timpramas):-
        timp(MomentFinalizare),
        get_time(Ora),
        Timpramas is MomentFinalizare - Ora,
        stamp_date_time(Timpramas, _, 'local').