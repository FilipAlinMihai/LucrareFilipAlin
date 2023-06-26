restart(X):-
        golire(),
        stop(),
        stopJ(),
        retract(ajutor2(_)),
        assert(ajutor2(disponibil)),
        retract(statusCautare(_)),
        assert(statusCautare(desfasurare)),
        alegeIntrebare(),
        fireExecutie(Fire),
        stop_timer(Fire),
        retract(camereLibere(_)),
        assert(camereLibere([hol,biblioteca,cameraE,
        cameraES,cameraEE,debara,bucatarie,
        cameraNW,cameraW,cameraWW,cameraWS,
        cameraNE,cameraEN,cameraNN])),
        retract(listaLanterna(_)),
        assert(listaLanterna([hol,biblioteca,cameraE,cameraES,
        cameraEE,debara,bucatarie,
        cameraNW, cameraNN])),
        retract(jocSliding(_)),
        assert(jocSliding(disponibil)),
        retract(jocXsi0(_)),
        assert(jocXsi0(disponibil)),
        retract(jocDilema(_)),
        assert(jocDilema(disponibil)),
        retract(jocHunter(_)),
        assert(jocHunter(disponibil)),
        retract(jocSudoku(_)),
        assert(jocSudoku(disponibil)),
        retract(jocFoarfecahartiepiatra(_)),
        assert(jocFoarfecahartiepiatra(disponibil)),
        retract(nivelSelectat(_)),
        assert(nivelSelectat(null)),
        retract(seJoaca(_)),
        assert(seJoaca(momentanNimic)),
        retract(locatieJucator(_)),
        assert(locatieJucator(hol)),
        retract(cod_birou(_)),
        assert(cod_birou(aaaaa)),
        retract(locatieObiect(carteLitera3,_)),
        assert(locatieObiect(carteLitera3,cameraE)),
        retract(locatieObiect(scrisoareLitera1,_)),
        assert(locatieObiect(scrisoareLitera1,cameraEE)),
        retract(locatieObiect(ghicitoare,_)),
        assert(locatieObiect(ghicitoare,cameraW)),
        retract(locatieObiect(cheie,_)),
        assert(locatieObiect(cheie,seif)),
        retract(locatieObiect(seif,_)),
        assert(locatieObiect(seif,birou)),
        retract(locatieObiect(carteLitera2,_)),
        assert(locatieObiect(carteLitera2,cameraWW)),
        retract(locatieObiect(bilet,_)),
        assert(locatieObiect(bilet,hol)),
        retract(locatieObiect(lanterna,_)),
        assert(locatieObiect(lanterna,bucatarie)),
        retract(locatieObiect(mar,_)),
        assert(locatieObiect(mar,cameraEE)),
        retract(locatieObiect(biscuit,_)),
        assert(locatieObiect(biscuit,bucatarie)),
        retract(locatieObiect(scrisoareLitera5,_)),
        assert(locatieObiect(scrisoareLitera5,debara)),
        retract(locatieObiect(carteLitera4,_)),
        assert(locatieObiect(carteLitera4,cameraNE)),
        retract(locatieObiect(bandaj,_)),
        assert(locatieObiect(bandaj,neplasat)),
        retract(energieJucator(_)),
        assert(energieJucator(0)),
        retract(raspunsGhicitoare(_)),
        assert(raspunsGhicitoare(aaaaaaaaa)),
        retract(viata(_)),
        assert(viata(100)),
        retract(amInceput(_)),
        assert(amInceput(nu)),
        retract(codReal(_)),
        assert(codReal(aaaaa)),
        retract(mutariRamase(_)),
        assert(mutariRamase(7)),
        retract(avemLit1(_)),
        assert(avemLit1('8')),
        retract(avemLit2(_)),
        assert(avemLit2('8')),
        retract(avemLit3(_)),
        assert(avemLit3('8')),
        retract(avemLit4(_)),
        assert(avemLit4('8')),
        retract(avemLit5(_)),
        assert(avemLit5('8')),
        retract(victorieMarcata(_)),
        assert(victorieMarcata(nu)),
        atom_concat('                          
                           Te-ai trezit într-o casă necunoscută.
                           Nu îți amintești unde ești sau cum ai ajuns aici.
                           Te îndrepți spre o ușă ce pare a fi ieșirea.
                           Ușa e încuiată și nu poți evada.
                           Singura ta șansă e cheia ce poate descuia această ușă.
                           Trebuie să explorezi camerele casei pentru a regăsi libertatea.
                           Pentru a te mișca utilizează:
                              *Butonul N - direcția Nord.
                              *Butonul S - direcția Sud.
                              *Butonul E - direcția Est.
                              *Butonul W - direcția Vest.
                           Ai grijă de energia și sănătatea ta.
                           Alege dificultatea dorită (ușor, mediu, dificil, imposibil).
                            ','',X),!.