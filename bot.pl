:- use_module(library(pce)).
:- use_module(library(pce_style_item)).
:- include('operare_bot.pl').

main :-
    new(E, dialog('Raspuns')),
    new(D, dialog('Fereastra Chat')),
    new(Window, window('Long Input Example')),
    send(Window, size, size(700, -1)),
    send(D, below, Window),
    send(E, scrollbars, both),
    send(D, append, new(Intrebare, text_item(in, 'Intrebare')),right),

    send(D, append, button(ok, message(@prolog, print_raspuns, Intrebare?selection,E))),
    new(Text2, text('Raspuns dat de carte sistem *******************
Aici ***************************
Aici ***************************
Aici ***************************
Aici ***************************
Aici ***************************')),
    send(Text2, font, font(times, bold, 17)),
    send(Text2, colour, orange),
    send(E, display, Text2, point(50, 20)), 

    send(D, background, black),
    send(E, background, black),
    send(E, above, D),
    send(D, open).

print_raspuns(R,F) :-
        send(F, clear),     
        procesareText(R),
        raspuns(Rez),
        new(T,text(Rez)),
        send(T, colour, orange),
        send(T, font, font(times, bold, 17)),
        send(F, display, T, point(50, 20)).