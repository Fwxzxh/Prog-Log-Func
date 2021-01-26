%----------------------------------------------
% ejem02.pl
% tareas: sem02.pl
% Predicados principales:
%   mainHola
%   mainFact
%   mainFibo - 0, 1, 1, 2, 3, 5, 8, 13, 21, ...
%   socrates
%   3n + 1: si el valor es par, se toma su mitad
%           en otro caso se toma 3n+1
%           se termina al llegar a 1
%   n = 5: 5, 16, 8, 4, 2, 1 - Longitud = 6
%   mainPi: 4(1 - 1/3 + 1/5 - ...)
%   mainFiboIter: -1, 1, 0, 1, 1, 2, ...
%   mainExp: e^x = 1 + x + x^2/2! + x^3/3! + ...
%   mainSin: sin x = x - x^3/3! + x^5/5! - ...
%   mainCos: cos x = 1 - x^2/2! + x^4/4! - ...
%   mainPrimoRango: Indicar los primos en [Inf,Sup]
%----------------------------------------------

mainHola :-
  write('Instituto Tecnologico de Queretaro'), nl,
  write('ISC'), nl,
  write('Programacion Logica'), nl.

mainFact :-
  write('N: '), read(N),
  factorial(N,F),
  write('Factorial = '), write(F), nl.

factorial(0,1) :- !.
factorial(N,F) :-
  N1 is N-1, factorial(N1,F1), F is N*F1.

mainFibo :-
  write('Numero de termino: '), read(N),
  fibonacci(N,F),
  write('El termino es: '), write(F), nl.

fibonacci(0,0) :- !.
fibonacci(1,1) :- !.
fibonacci(N,F) :-
  N1 is N-1, fibonacci(N1,F1),
  N2 is N-2, fibonacci(N2,F2),
  F is F1+F2.

humano(socrates).
mortal(X) :- humano(X).

main3n :-
  write('3n+1, valor inicial: '), read(N),
  longitud3n(N,L),
  write('Longitud: '), write(L), nl.

longitud3n(1,1) :- !.
longitud3n(N,L) :-
  R is N mod 2, R = 0, !,
  N1 is N div 2, longitud3n(N1,L1), L is L1+1.
longitud3n(N,L) :-
  N1 is 3*N+1, longitud3n(N1,L1), L is L1+1.

mainPi :-
  write('Cuantos terminos? '), read(N),
  suma(1,N,1,1,X), R is 4*X,
  write('Pi: '), write(R), nl.

suma(Act,Lim,_,_,0) :-
  Act > Lim, !.
suma(Act,Lim,Den,Signo,X) :-
  Act1 is Act+1, Den1 is Den+2, Signo1 is -Signo,
  suma(Act1,Lim,Den1,Signo1,X1),
  X is X1 + Signo/Den.

mainPrimo :-
  write('Valor a verificar: '), read(N),
  esPrimo(N,R),
  write('Es primo? '), write(R), nl.

esPrimo(N,true) :-
  cuentaDivisores(N,1,X), X = 2, !.
esPrimo(_,false).

cuentaDivisores(N,Act,0) :-
  Act > N, !.
cuentaDivisores(N,Act,X) :-
  R is N mod Act, R = 0, !,
  Act1 is Act+1, cuentaDivisores(N,Act1,X1), X is X1+1.
cuentaDivisores(N,Act,X) :-
  Act1 is Act+1, cuentaDivisores(N,Act1,X).

primo(N) :-
  cuentaDivisores(N,1,X), X = 2.

longitud([],0) :- !.
longitud([_ | Resto],L) :-
  longitud(Resto,L1), L is L1+1.

agregaFinal(X,[],[X]) :- !.
agregaFinal(X,[Y | Resto],[Y | Otros]) :-
  agregaFinal(X,Resto,Otros).

% Teorema fundamental de la aritmetica
% Todo entero mayor a 1 puede expresarse como producto de
% numeros primos, por ejemplo, 100 = 2*2*5*5

factoresPrimos(1,_,[]) :- !.
factoresPrimos(N,P,[P | Resto]) :-
  R is N mod P, R = 0, !, N1 is N div P,
  factoresPrimos(N1,P,Resto).
factoresPrimos(N,P,Lista) :-
  sigPrimo(P,Q), factoresPrimos(N,Q,Lista).

sigPrimo(P,Q) :-
  Q is P+1, primo(Q), !.
sigPrimo(P,Q) :-
  P1 is P+1, sigPrimo(P1,Q).

% Area bajo la curva

mainArea :-
%  write('f(x) = sin(x)'), nl,
  write('f(x) = exp(-x*x/2) / sqrt(2*pi)'), nl,
  write('Limite inferior: '), read(A),
  write('Limite superior: '), read(B),
  N is 12500, Base is (B-A)/N,
  area(0,N,A,Base,Area),
  write('El area es: '), format('~4f',Area), nl.

% f(X,Y) :- Y is sin(X).
f(X,Y) :- Y is exp(-X*X/2)/sqrt(2*pi()).

area(I,N,_,_,0) :-
  I = N, !.
area(I,N,Inferior,Base,Area) :-
  I1 is I+1, area(I1,N,Inferior,Base,Area1),
  X is Inferior+I*Base, f(X,Y),
  Area is Area1 + Base*Y.

mainConversion :-
  write('Conversion Fahrenheit a Celsius'), nl,
  write('Limite: '), read(N),
  itera(0,N).

itera(Act,Lim) :-
  Act > Lim, !.
itera(Act,Lim) :-
  write(Act), Res is (Act-32)/1.8,
  write(' '), format('~1f',Res), nl,
  Act1 is Act+2, itera(Act1,Lim).

mainTabla :-
  write('Tabla de multiplicar'), nl,
  renglon(1,10).

renglon(I,N) :-
  I>N, !.
renglon(I,N) :-
  columna(I,1,10), nl,
  I1 is I+1,
  renglon(I1,N).

columna(_,J,N) :-
  J>N, !.
columna(I,J,N) :-
  P is I*J, espacios(P), write(P), write(' '),
  J1 is J+1, columna(I,J1,N).

espacios(P) :-
  P > 99, !.
espacios(P) :-
  P > 9, !, write(' ').
espacios(_) :-
  write('  ').
