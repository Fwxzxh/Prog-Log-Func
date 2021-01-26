% cal.pl

mainCal :-
    write('Year: '), read(Year),
    getStart(1970, Year, 5, Day2Start),
    printCal(Year, Day2Start, 1).

leap(Year) :-
    0 is mod(Year, 4), not(0 is mod(Year, 100)), !;
    0 is mod(Year, 400).

getStart(ActYear, DestYear, Cont, Day2Start) :- 
    ActYear >= DestYear, 
    Day2Start is Cont mod 7, !.
getStart(ActYear, DestYear, Cont, Day2Start) :-
    leap(ActYear),
    ActYear1 is ActYear + 1,
    Cont1 is Cont + 2,
    getStart(ActYear1, DestYear, Cont1, Day2Start1),
    Day2Start is Day2Start1, !.
getStart(ActYear, DestYear, Cont, Day2Start) :-
    ActYear1 is ActYear + 1,
    Cont1 is Cont + 1,
    getStart(ActYear1, DestYear, Cont1, Day2Start1),
    Day2Start is Day2Start1, !.

printCal(_, _, 13) :- !.
printCal(ActYear, Day2Start, ActMonth) :-
    printMonth(ActYear, Day2Start, ActMonth, NextDay2Start), nl,
    ActMonth1 is ActMonth + 1,
    Day2Start1 is NextDay2Start,
    printCal(ActYear, Day2Start1, ActMonth1), !.

printMonth(ActYear, Day2Start, ActMonth, NextDay2Start) :-
    getMonthName(ActMonth, Month),
    write(' '), nl,
    format('~`-t~35| ~n', []),
    format('~t ~w ~t~35|~n', [Month]),
    format('~`-t~35| ~n', []),
    printDaysNames(), 
    write(' '), tab(1),
    printDays(ActYear, Day2Start, ActMonth, NextDay2Start1), 
    NextDay2Start is NextDay2Start1, !.

printDaysNames() :-
    
    format('  ~t~w ~w ~w ~w ~w ~w ~w~t~32|~n', [
        %'sun ', 'mon ', 'tue ', 'wed ', 'thu ', 'fri ', 'sat '
        ' D  ', ' L  ', ' M  ', ' M  ', ' J  ', ' V  ', ' S  '
    ]), !.

printSpaces(Dest, Cont) :- Cont = Dest, !.
printSpaces(Dest, Cont) :-
    write('  '), tab(3),
    Cont1 is Cont + 1,
    printSpaces(Dest, Cont1), !.

printDays(_, Day2Start, Act, NextDay2Start) :-
    (Act = 1 ; Act = 3 ; Act = 5 ; Act = 7 ; Act = 8 ;
    Act = 10 ; Act = 12),
    printSpaces(Day2Start, 1),
    printUntil(1, 31, Day2Start, NextDay2Start1), 
    NextDay2Start is NextDay2Start1, !.
printDays(_, Day2Start, Act, NextDay2Start) :-
    not(Act = 2),
    printSpaces(Day2Start, 1),
    printUntil(1, 30, Day2Start, NextDay2Start1),
    NextDay2Start is NextDay2Start1, !.
printDays(ActYear, Day2Start, _, NextDay2Start) :-
    leap(ActYear),
    printSpaces(Day2Start, 1),
    printUntil(1, 29, Day2Start, NextDay2Start1),
    NextDay2Start is NextDay2Start1, !.
printDays(_, Day2Start, _, NextDay2Start) :-
    printSpaces(Day2Start, 1),
    printUntil(1, 28, Day2Start, NextDay2Start1),
    NextDay2Start is NextDay2Start1, !.

printUntil(ActN, DestN, Cont, Finish) :- 
    ActN > DestN, 
    Finish is Cont, !.
printUntil(ActN, DestN, Cont, Finish) :-
    ActN1 is ActN + 1,
    Cont1 is Cont + 1,
    Cont1 =< 7,
    writeNumber(ActN),
    printUntil(ActN1, DestN, Cont1, Finish1), 
    Finish is Finish1, !.
printUntil(ActN, DestN, _, Finish) :-
    ActN1 is ActN + 1,
    Cont1 is 1,
    writeNumber(ActN), nl, 
    write(' '), tab(1),
    printUntil(ActN1, DestN, Cont1, Finish1),
    Finish is Finish1, !.

writeNumber(Number) :-
    Number < 10,
    write(' '), write(Number), tab(3), !.
writeNumber(Number) :-
    write(Number), tab(3), !.

getMonthName(MonthNumber, 'Enero') :- MonthNumber = 1, !.
getMonthName(MonthNumber, 'Febrero') :- MonthNumber = 2, !.
getMonthName(MonthNumber, 'Marzo') :- MonthNumber = 3, !.
getMonthName(MonthNumber, 'Abril') :- MonthNumber = 4, !.
getMonthName(MonthNumber, 'Mayo') :- MonthNumber = 5, !.
getMonthName(MonthNumber, 'Junio') :- MonthNumber = 6, !.
getMonthName(MonthNumber, 'Julio') :- MonthNumber = 7, !.
getMonthName(MonthNumber, 'Agosto') :- MonthNumber = 8, !.
getMonthName(MonthNumber, 'Septiembre') :- MonthNumber = 9, !.
getMonthName(MonthNumber, 'Octubre') :- MonthNumber = 10, !.
getMonthName(MonthNumber, 'Noviembre') :- MonthNumber = 11, !.
getMonthName(_, 'Diciembre') :- !.
