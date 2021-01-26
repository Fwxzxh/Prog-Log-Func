%--------------------------------------------------------------
%ProgSem08.pl
%Tarea: Jorge David Elihu Mejia Castro
%Predicados principales: mainFactorial, mainFprimos, mainPascal
%--------------------------------------------------------------

% Dado un entero positivo, indica cuantos dígitos 0,1,2,...,9 contiene su factorial.
% ¿Cuál es el primer factorial que contiene todos
% name('123456789',R).
%R = [49, 50, 51, 52, 53, 54, 55, 56, 57].

mainFactorial :-
     write("Ingrese un número positivo: "), read(N),
     factorial(N,Salida),
     write("El factorial de "), write(N), write(" es: "), write(Salida), write("\n"),
     name(Salida, L), msort(L,Lsort), pack(Lsort,X), desc(X).

factorial(N, F):- N<2, F=1.
factorial(N, F):-
     M is N-1,
     factorial(M,T),
     F is N*T.

desc([]):- !.
desc(Numero) :-
     Numero=[Head|Tail],
     dname(Head),
     desc(Tail).

pack([],[]).
pack([X|Xs],[Z|Zs]) :- transfer(X,Xs,Ys,Z), pack(Ys,Zs).

transfer(X,[],[],[X]).
transfer(X,[Y|Ys],[Y|Ys],[X]) :- X \= Y.
transfer(X,[X|Xs],Ys,[X|Zs]) :- transfer(X,Xs,Ys,Zs).

dname(Lista) :- Lista=[Head|_], Head=48, length(Lista,X),
     write("hay "), write(X), write(" ceros"), write("\n").
dname(Lista) :- Lista=[Head|_], Head=49, length(Lista,X),
     write("hay "), write(X), write(" unos"), write("\n").
dname(Lista) :- Lista=[Head|_], Head=50, length(Lista,X),
     write("hay "), write(X), write(" dos"), write("\n").
dname(Lista) :- Lista=[Head|_], Head=51, length(Lista,X),
     write("hay "), write(X), write(" tres"), write("\n").
dname(Lista) :- Lista=[Head|_], Head=52, length(Lista,X),
     write("hay "), write(X), write(" cuatros"), write("\n").
dname(Lista) :- Lista=[Head|_], Head=53, length(Lista,X),
     write("hay "), write(X), write(" cincos"), write("\n").
dname(Lista) :- Lista=[Head|_], Head=54, length(Lista,X),
     write("hay "), write(X), write(" seis"), write("\n").
dname(Lista) :- Lista=[Head|_], Head=55, length(Lista,X),
     write("hay "), write(X), write(" sietes"), write("\n").
dname(Lista) :- Lista=[Head|_], Head=56, length(Lista,X),
     write("hay "), write(X), write(" ochos"), write("\n").
dname(Lista) :- Lista=[Head|_], Head=57, length(Lista,X),
     write("hay "), write(X), write(" nueves"), write("\n").

msort(List, Sorted) :- sort(0, @=<, List,  Sorted).

mainFprimos :-
     write("ingrese el valor primo: "), read(N),
     fprimos(N, L), write("los factores primos son: "), pFactors(L).

pFactors([]) :- !.
pFactors([N]) :- write(N).
pFactors(L) :-
     L = [H|T], write(H), write(" * "), pFactors(T).

fprimos(N, L) :-
    findall(D, primeFact(N, D), L).

primeFact(N, D) :-
    findPFact(N, 2, D).

findPFact(N, D, D) :-
    0 is N mod D.
findPFact(N, D, R) :-
    D < N,
    (0 is N mod D -> (N1 is N/D, findPFact(N1, D, R))
    ; (D1 is D + 1, findPFact(N, D1, R))).


mainPascal :-
     write("Ingrese el número del renglón que desea: "), read(N),
     pascal(N,L),write(L).


pascal(1,[1]) :- ! .
pascal(2,[1,1]) :- !.
pascal(N, L) :- Ant is N - 1,
                   pascal(Ant,L2),
                   sumC(L2,R),
                   append([1|R],[1],L), !.

sumC([X,Y],[Z]) :- Z is X + Y.
sumC([X,Y|L], Z):- H is X + Y,
                    sumC([Y|L],L2),
                    Z = [H|L2].
