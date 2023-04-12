:- dynamic  ghicitoareCurenta/1,
            raspunsCurent/1,
            numarGhicitoare/1.

ghicitoareCurenta('').
raspunsCurent('').
numarGhicitoare(0).

riddle(1,'Deși nu sunt diamant pe inel mă pui.\nCând vremea mea vine uși descui.\n',
            ['cheie','Cheie']).
riddle(2,'Tatal lui Mihai are patru copii Andrei, Bogdan, Maria si ....',
            ['Mihai','mihai']).
riddle(3,'Iti apartine tie dar prieteni tai il folosesc de fiecare data cand va iantalniti.',
            ['numele','Numele']).
riddle(4,'Domnul si doamna Popescu au sase fice. Fiecare fica are cate un frate. Cate persoane sunt in familia Popescu',
            ['9','noua','Noua']).
riddle(5,'Ce are 6 fete toate diferite, are touazeci si unu de ochi dar nu poate vedea',
            ['Zar','zar']).
riddle(6,'Am orase dar nu am case am paduri dar nu am copaci, am rauri dar nu am pesti. Ce sunt?',
            ['Harta']).
riddle(7,'Cu cat e mai mult cu atat e mai greu de vazut. Ce e?',
            ['Intuneric','intuneric']).
riddle(8,'Ce poate trece prin sticla fara sa o sparga?',
            ['lumina']).
riddle(9,'Ce e la finalul unui CURCUBEU',
            ['litera U']).

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