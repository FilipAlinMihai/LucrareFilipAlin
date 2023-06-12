:- dynamic  ghicitoareCurenta/1,
            raspunsCurent/1,
            numarGhicitoare/1.

ghicitoareCurenta('').
raspunsCurent('').
numarGhicitoare(0).

riddle(1,'Deși nu sunt diamant pe inel mă pui.\nCând vremea mea vine uși descui.\n',
            ['cheie','Cheie']).
riddle(2,'Tatăl lui Mihai are patru copii Andrei, Bogdan, Maria și ....',
            ['Mihai','mihai']).
riddle(3,'Iti apartine tie dar prieteni tai il folosesc de fiecare data cand va iantalniti.',
            ['numele','Numele']).
riddle(4,'Domnul și doamna Popescu au șase fice. Fiecare fică are câte un frate. Câte persoane sunt în familia Popescu',
            ['9','noua','Noua']).
riddle(5,'Ce are 6 fețe toate diferite, are douazeci și unu de ochi dar nu poate vedea',
            ['Zar','zar']).
riddle(6,'Am orașe dar nu am case am păduri dar nu am copaci, am rauri dar nu am pești. Ce sunt?',
            ['Harta','harta']).
riddle(7,'Cu cât e mai mult cu atat e mai greu de văzut. Ce e?',
            ['Intuneric','intuneric']).
riddle(8,'Ce poate trece prin sticlă fără să o spargă?',
            ['lumina']).
riddle(9,'Ce e la finalul unui CURCUBEU',
            ['U','u']).

alegeIntrebare():-
        random(1,10,X),
        stabilireIntrebare(X),!.

stabilireIntrebare(X):-
        riddle(X,A,B),
        retract(ghicitoareCurenta(_)),
        assert(ghicitoareCurenta(A)),
        retract(raspunsCurent(_)),
        assert(raspunsCurent(B)),
        retract(numarGhicitoare(_)),
        assert(numarGhicitoare(X)),!.