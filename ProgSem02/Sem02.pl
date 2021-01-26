%----------------------------------------------
% Sem02.pl
% Predicados principales:
%   mainFiboIter: -1, 1, 0, 1, 1, 2, ...
%   mainExp: e^x = 1 + x + x^2/2! + x^3/3! + ...
%   mainSin: sin x = x - x^3/3! + x^5/5! - ...
%   mainCos: cos x = 1 - x^2/2! + x^4/4! - ...

mainFiboIter :- 
	write('Numero de termino: '), read(N),
	fibonacci(N,F),
	write('El termino es: '), write(F), nl.

fibonacci(0,0) :- !.
fibonacci(1,1) :- !.

fibonacci(N,F) :-
	N1 is N - 1, 
	N2 is N - 2,
	suma(N1,N2,C), fibonacci(N2,C).

suma(A,B,C) :-
	C is A + B.



	
