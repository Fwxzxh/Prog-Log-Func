
f(X,Y) :- Y is exp(-(X*X / 2)) / sqrt(2*pi), !.

getIntegral(_,_,N,Act,0) :- Act >= N, !.
getIntegral(A,B,N,Act,R) :-
    L is (B - A) / N,
    A1 is A + (L * Act),
    f(A1,Y1),
    Area1 is L * Y1,
    Act1 is Act + 1,
    getIntegral(A,B,N,Act1,R1),
    R is Area1 + R1.

main :-
    printTitle(),
    format('~0+~w~t~3| | ~0+~t~d~t~4+ | ~0+~t~d~t~4+ | ~0+~t~d~t~4+ | ~0+~t~d~t~4+ | ~0+~t~d~t~4+ | ~0+~t~d~t~4+ | ~0+~t~d~t~4+ | ~0+~t~d~t~4+ | ~0+~t~d~t~4+ | ~0+~t~d~t~4+', 
        ['',0,1,2,3,4,5,6,7,8,9]), nl,
    loopRow(0.0), !.

printTitle() :-
    format('+~`-t~72|+ ~n', []),
    format('|~tNormal Distribution~t~72||~n', []),
    format('+~`-t~72|+ ~n', []).

loopRow(R) :- R >= 4, !.
loopRow(R) :-
    R < 4,
    format('~1f~t~3|', R),
    loopCol(R, 0),
    nl,
    R1 is R + 0.1,
    loopRow(R1).

loopCol(_, N) :- N > 9, !.
loopCol(R, N) :-
    N =< 9,
    X is R + (N/100),
    getIntegral(0,X,1000,0,R1),
    format(' | ~2f~t~3|', R1),
    N1 is N + 1,
    loopCol(R, N1).
