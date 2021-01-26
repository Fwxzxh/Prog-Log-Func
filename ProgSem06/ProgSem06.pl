%--------------------------------------------------------------
%ProgSem04.pl
%Tarea: Jorge David Elihu Mejia Castro
%Predicados principales:
%--------------------------------------------------------------

mainVerbos :-
  write('Ingrese un verbo a continuación '),read(N),
  write('El verbo ingresado es : '), write(N),
  verificarVerbo(N).

verificarVerbo(N) :-
  arrmaArray(N,_,_),
  verificarPrimeraP(N),
  verificarSegundaP(N).
  %verificarTerceraP(N),
  %verificarPrimeraPP(N),%plural
  %verificarSegundaPP(N),
  %verificarTerceraPP(N).

verificarPrimeraP(N) :-
  name(N,L), reverse(L,P), P=[_,_|Core],
  append([111],Core,Core1),
  reverse(Core1,CoreR),
  name(Vpp, CoreR),
  rectifica(Vpp,R,'Yo ',_,1).

verificarSegundaP(N) :-
  name(N,L), reverse(L,P), P=[_,_|Core],
  append([115],Core,Core1),
  reverse(Core1,CoreR),
  name(Vpp, CoreR),
  rectifica(Vpp,R,'Tu ',_,1).

rectifica(Palabra,R,_,N,L) :-
  L=0,N='y', 
  Palabra=R, arrmaArray(R,_,_).
rectifica(Palabra,R,_,N,L) :-
  L=0, N='n',
  write('Escriba la conjugación correcta: '), read(R), arrmaArray(R,_,_).
rectifica(Palabra,_,Pref,_,L) :-
  L=1,
  write(' La conjugación '), write(Pref), write(Palabra),
  write(' Es correcta? [y/n] '), read(N),
  rectifica(Palabra,_,_,N,0).

arrmaArray(N,_,R) :- append([N],[],R).
arrmaArray(N,[],R) :-
  arrmaArray(_,R,Q), write(Q).  

 Escritura ----
eVerboReg(Str) :-
  open('reg.txt',write,Str),
  tell('reg.txt'),
  eVerbo(str),
  close(str).

eVerboIreg(Str) :-
  open('irreg.txt',write,Str),
  tell('irreg.txt'),
  eVerbo(str),
  close(str).

eVerbo(Str) :-
  at_end_of_stream(Str), !.
eVerbo(Str) :-
  read(Str,[Verbo,Yo,Tu,Ella,Nos,Ust,Ellos]),
  write('['),write(Verbo),write(','),write(Yo),write(','),
  write(Tu),write(','),write(Ella),write(','),write(Nos),
  write(','),write(Ust),write(','),write(Ellos),write(']').

  % Lectura ----
verbosReg :-
  open('reg.txt',read,Str),
  lec_verbo(Str),
  close(Str).

verbosIrreg :-
  open('irreg.txt',read,Str),
  lec_verbo(Str),
  close(Str).

lec_verbo(Str) :-
  at_end_of_stream(Str), !.
lec_verbo(Str) :-
  read(Str,[Verbo,Yo,Tu,Ella,Nos,Ust,Ellos]),
  write('Verbo: '), write(Verbo), nl,
  write('Yo: '), write(Yo), nl,     % primera persona, oy
  write('Tu: '), write(Tu), nl,     % segunda persona s
  write('Ella/El: '), write(Ella), nl, % tercera pesona idk a o e
  write('Nosotros: '), write(Nos), nl, % primera pesona plural os
  write('Ustedes: '), write(Ust), nl,  % segunda persona plural an on
  write('Ellas/Ellos: '), write(Ellos), nl, %tercera persona plural an on
  nl,
  lec_verbo(Str).
