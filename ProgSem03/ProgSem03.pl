%--------------------------------------------------------------
%ProgSem03.pl
%Tarea: Semana 03
%Predicados principales: mezcla
%--------------------------------------------------------------

mezcla :-
	write('lista a ordernar: '), read(Entrada),
	merge_sort(Entrada,Salida),
	write('lista inicial'), write(Entrada),
	write('lista final'), write(Salida).


even_odd([], [], []).
even_odd([H|T], [H|E], O) :-
    0 is H mod 2,
    even_odd(T, E, O).

even_odd([H|T], E, [H|O]) :-
    1 is H mod 2,
    even_odd(T, E, O).


divide(L,L1,L2):-even_odd(L,L1,L2).

merge_sort([],[]) :- !.     % empty list is already sorted
merge_sort([X],[X]) :-!.   % single element list is already sorted

merge_sort(List,Sorted) :-
	List=[_,_|_], divide(List,L1,L2),     % list with at least two elements is divided into two parts
		merge_sort(L1,Sorted1),merge_sort(L2,Sorted2),  % then each part is sorted
		merge(Sorted1,Sorted2,Sorted).                  % and sorted parts are merged

merge([],L,L).
merge(L,[],L):-L\=[].

merge([X|T1],[Y|T2],[X|T]):-X=<Y,merge(T1,[Y|T2],T).
merge([X|T1],[Y|T2],[Y|T]):-X>Y,merge([X|T1],T2,T).
