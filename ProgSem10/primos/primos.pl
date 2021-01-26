%--------------------------------------------------------------
%primos.pl
%Tarea: Jorge David Elihu Mejia Castro
%Predicados principales: allPrimes(Numero primo, P)
%--------------------------------------------------------------

mainPrimos :-
    write("Ingrese hasta que número desea conocer sus primos: "),
    read(P), allPrimes(P,L), print(L).

print([]) :- !.
print(L) :-
    L = [H|T], write(H),write("\n"),
    print(T).

allPrimes(N, Primes) :-
    numlist(2, N, Numlist),
    Stop is round(sqrt(N)),
    allPrimes(Numlist, Stop, Primes).

allPrimes([N|Numlist], Stop, [N|Primes]):-
    exclude(is_multiple(N), Numlist, MPrimes),
    (N =< Stop -> allPrimes(MPrimes, Stop, Primes) ; Primes=MPrimes).

is_multiple(N, I):-
    I mod N =:= 0.
