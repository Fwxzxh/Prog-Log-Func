%--------------------------------------------------------------
%ProgSem04.pl
%Tarea: Jorge David Elihu Mejia Castro
%Predicados principales: mainNumero
%--------------------------------------------------------------

unidades(48) :- write('Cero').
unidades(49) :- write('Uno').
unidades(50) :- write('Dos').
unidades(51) :- write('Tres').
unidades(52) :- write('Cuatro').
unidades(53) :- write('Cinco').
unidades(54) :- write('Seis').
unidades(55) :- write('Siete').
unidades(56) :- write('Ocho').
unidades(57) :- write('Nueve').

%[1*]
decenas(48) :- write('Diez').
decenas(49) :- write('Once').
decenas(50) :- write('Doce').
decenas(51) :- write('Trece').
decenas(52) :- write('Catorce').
decenas(53) :- write('Quince').
decenas(54) :- write('Dieciseis').
decenas(55) :- write('Dieciete').
decenas(56) :- write('Dieciocho').
decenas(57) :- write('Diecinueve').

%[2*]
decenas2(48) :- write('Veinte').
decenas2(49) :- write('Veitiuno').
decenas2(50) :- write('Veintidos').
decenas2(51) :- write('Veintitres').
decenas2(52) :- write('Veinticuatro').
decenas2(53) :- write('Veinticinco').
decenas2(54) :- write('Veintiseis').
decenas2(55) :- write('Veintisiete').
decenas2(56) :- write('Veintiocho').
decenas2(57) :- write('Veintinueve').

mainNumero :-
    write('Escribe el numero '), read(N),nl,
    aNumero(N).

aNumero(Numero) :-
    name(Numero, R), R=[Head|Tail],
    length(R,Digitos), clasificar(Digitos,Head,Tail). 

clasificar(1,Head,_) :- unidades(Head).

clasificar(2,49,Tail) :- Tail=[Head|_],decenas(Head).

clasificar(2,50,Tail) :- Tail=[Head|_],decenas2(Head).

      %treinta
clasificar(2,51,Tail) :- Tail=[Head|_], Head=48, write('Treinta').
clasificar(2,51,Tail) :- write('Treinta y '), Tail=[Head|_], clasificar(1,Head,_).

clasificar(2,52,Tail) :- Tail=[Head|_], Head=48, write('Cuarenta').
clasificar(2,52,Tail) :- write('Cuarenta y '), Tail=[Head|_], clasificar(1,Head,_).

clasificar(2,53,Tail) :- Tail=[Head|_], Head=48, write('Cincuenta').
clasificar(2,53,Tail) :- write('Cincuenta y '), Tail=[Head|_], clasificar(1,Head,_).

clasificar(2,54,Tail) :- Tail=[Head|_], Head=48, write('Sesenta').
clasificar(2,54,Tail) :- write('Sesenta y '), Tail=[Head|_], clasificar(1,Head,_).

clasificar(2,55,Tail) :- Tail=[Head|_], Head=48, write('Sesenta').
clasificar(2,55,Tail) :- write('Setenta y '), Tail=[Head|_], clasificar(1,Head,_).

clasificar(2,56,Tail) :- Tail=[Head|_], Head=48, write('Ochenta').
clasificar(2,56,Tail) :- write('Ochenta y '), Tail=[Head|_], clasificar(1,Head,_).

clasificar(2,57,Tail) :- Tail=[Head|_], Head=48, write('Noventa').
clasificar(2,57,Tail) :- write('Noventa y '), Tail=[Head|_], clasificar(1,Head,_).

      %Cientos  ----------------------------------------------------------------
clasificar(3,48,Tail) :- Tail=[Decenas|Unidades],clasificar(2,Decenas,Unidades).

clasificar(3,49,Tail) :- Tail=[48|Unidades],
    Unidades=[48], write('Cien').
clasificar(3,49,Tail) :- Tail=[Decenas|Unidades], Decenas>48,
    write('Ciento '), clasificar(2,Decenas,Unidades).

clasificar(3,50,Tail) :- Tail=[48|Unidades],
    Unidades=[48], write('Docientos').
clasificar(3,50,Tail) :- Tail=[Decenas|Unidades], Decenas>48,
    write('Docientos '), clasificar(2,Decenas,Unidades).

clasificar(3,51,Tail) :- Tail=[48|Unidades],
    Unidades=[48], write('Trecientos').
clasificar(3,51,Tail) :- Tail=[Decenas|Unidades], Decenas>48,
    write('Trecientos '), clasificar(2,Decenas,Unidades).

clasificar(3,52,Tail) :- Tail=[48|Unidades],
    Unidades=[48], write('Cuatrocientos').
clasificar(3,52,Tail) :- Tail=[Decenas|Unidades], Decenas>48,
    write('Cuatrocientos '), clasificar(2,Decenas,Unidades).

clasificar(3,53,Tail) :- Tail=[48|Unidades],
    Unidades=[48], write('Quinientos').
clasificar(3,53,Tail) :- Tail=[Decenas|Unidades], Decenas>48,
    write('Quinientos '), clasificar(2,Decenas,Unidades).

clasificar(3,54,Tail) :- Tail=[48|Unidades],
    Unidades=[48], write('Seicientos').
clasificar(3,54,Tail) :- Tail=[Decenas|Unidades], Decenas>48,
    write('Seicientos '), clasificar(2,Decenas,Unidades).

clasificar(3,55,Tail) :- Tail=[48|Unidades],
    Unidades=[48], write('Setecientos').
clasificar(3,55,Tail) :- Tail=[Decenas|Unidades], Decenas>48,
    write('Setecientos '), clasificar(2,Decenas,Unidades).

clasificar(3,56,Tail) :- Tail=[48|Unidades],
    Unidades=[48], write('Ochocientos').
clasificar(3,56,Tail) :- Tail=[Decenas|Unidades], Decenas>48,
    write('Ochocientos '), clasificar(2,Decenas,Unidades).

clasificar(3,57,Tail) :- Tail=[48|Unidades],
    Unidades=[48], write('Novecientos').
clasificar(3,57,Tail) :- Tail=[Decenas|Unidades], Decenas>48,
    write('Novecientos '), clasificar(2,Decenas,Unidades).

      % Miles  ----------------------------------------------------------------
clasificar(4,48,Tail) :- Tail=[Centenas|Decenas], clasificar(3,Centenas,Decenas).

clasificar(4,49,Tail) :- Tail=[48|[48,48]], write('Mil').

clasificar(4,49,Tail) :- Tail=[Centenas|Decenas], write('Mil '), 
    clasificar(3,Centenas,Decenas).
clasificar(4,Umillar,Tail) :- Tail=[Centenas|T1],
    unidades(Umillar), write(' Mil '), clasificar(3,Centenas,T1).

     %decenas Millar ----------------------------------------------------------------
clasificar(5,48,Tail) :- Tail=[Centenas|Decenas], clasificar(4,Centenas,Decenas).

clasificar(5,49,Tail) :- Tail=[48|[48,48,48]], clasificar(2,49,[48]),
    write(' Mil').
clasificar(5,Dmillar,Tail) :- Tail=[Umillar|T1], T1=[Centenas|T2],
    clasificar(2,Dmillar, [Umillar]), 
    write(' Mil '), clasificar(3,Centenas,T2).

     %Centenas Millar ----------------------------------------------------------------
clasificar(6,48,Tail) :- Tail=[Dmillar|Resto], clasificar(5,Dmillar,Resto).

clasificar(6,49,Tail) :- Tail=[48|[48,48,48,48]], clasificar(3,49,[48,48]),
    write(' Mil').
clasificar(6,Cmillar,Tail) :- Tail=[Dmillar|T1], T1=[Umillar|T2], T2=[Centenas|T3],
    clasificar(3,Cmillar, [Dmillar,Umillar]), 
    write(' Mil '), clasificar(3,Centenas,T3).

      %Unidades Millón ----------------------------------------------------------------    
clasificar(7,48,Tail) :- Tail=[Cmillar|Resto], clasificar(6,Cmillar,Resto).

clasificar(7,49,Tail) :- Tail=[48|[48,48,48,48,48]],
    write('Un Millon').
clasificar(7,49,Tail) :- Tail=[Cmillar|T1], write('Un Millon '),
    clasificar(6,Cmillar,T1).
clasificar(7,Umillon,Tail) :- Tail=[Cmillar|T1],
    unidades(Umillon),
    write(' Millones '), clasificar(6,Cmillar,T1).

      %Decenas Millón ----------------------------------------------------------------    
clasificar(8,48,Tail) :- Tail=[Umillar|Resto], clasificar(7,Umillar,Resto).

clasificar(8,49,Tail) :- Tail=[48|[48,48,48,48,48,48]], clasificar(2,49,[48,48]),
    write(' Millones').
clasificar(8,Dmillon,Tail) :- Tail=[Umillar|T1], T1=[Cmillar|T2],
    clasificar(2,Dmillon,[Umillar]),
    write(' Millones '), clasificar(6,Cmillar,T2).

      %Centenas Millón ----------------------------------------------------------------    ""
clasificar(9,48,Tail) :- Tail=[Dmillar|Resto], clasificar(8,Dmillar,Resto).

clasificar(9,49,Tail) :- Tail=[48|[48,48,48,48,48,48]], clasificar(3,49,[48,48,48]),
    write(' Millones').
clasificar(9,Cmillon,Tail) :- Tail=[Dmillon|T1], T1=[Umillon|T2], T2=[Cmillar|T3],
    clasificar(3,Cmillon,[Dmillon,Umillon]),
    write(' Millones '), clasificar(6,Cmillar,T3).
